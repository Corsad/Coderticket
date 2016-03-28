class EventsController < ApplicationController

	def new
		init
		@event = Event.new
		@event.ticket_types.build
	end

	def index
		params[:search] ? @events = Event.search(params[:search]).where("starts_at > ?", DateTime.now).where(published: true) : @events = Event.where("starts_at > ?", DateTime.now).where(published: true)
	end

	def create
		init
		@event = Event.create event_params
		@event.creater_id = current_user.id
		@event.venue_id = params[:venue_id]
		@event.category_id = params[:category_id]

		if @event.starts_at < @event.ends_at
			if @event.save
				flash[:success] = "Event is made"
				redirect_to root_path
			else
				flash.now[:error] = "Error: #{@event.errors.full_messages.to_sentence}"
				redirect_to new_event_path
			end
		else
			flash.now[:error] = "Event can't start after it end"
			redirect_to new_event_path
		end
	end

	def updateStatus
		@event = Event.find(params[:event_id])
		@event.toggle!(:published)
		@event.save
		redirect_to user_path(current_user.id)
	end

	def show
		@event = Event.find(params[:id])
	end

	private
	def event_params
		params.require(:event).permit(:name, :starts_at, :ends_at, :hero_image_url,	:extended_html_description, :venue_id, :category_id, ticket_types_attributes: [:name, :price, :max_quantity])
	end

	def init
		@venues = Venue.all
		@categories = Category.all
	end
end

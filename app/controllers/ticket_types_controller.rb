class TicketTypesController < ApplicationController
	def new
		@event = Event.find params[:event_id]
		@ticket_type = TicketType.new
	end

	def create
		@event = Event.find params[:event_id]
		@ticket_type = TicketType.create ticket_types_params
		@ticket_type.event_id = params[:event_id]
		if @ticket_type.save
			flash[:success] = "New Ticket type are made"
			redirect_to user_path(current_user)
		else
			flash.now[:error] = "Error: #{@ticket_type.errors.full_messages.to_sentence}"
			render 'new'
		end
	end

	private
	def ticket_types_params
		params.require(:ticket_type).permit(:name, :price, :max_quantity)
	end
end

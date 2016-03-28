class TicketsController < ApplicationController
	def new
		@event = Event.find(params[:event_id])
	end

	def create
		@event = Event.find(params[:event_id])

		@event.ticket_types.each_with_index do |type, index|
			if params[:type][index][:quantity].gsub(/\D/, '').to_i > 0
				if Ticket.where(owner: current_user, type: type).blank?
					@ticket = Ticket.new(owner: current_user, type: type, event: @event, quantity: params[:type][index][:quantity].gsub(/\D/, '').to_i)
					if !@ticket.save
						render 'new'
					end
				else
					@ticket = Ticket.find_by(owner: current_user, type: type)
					@ticket.update_attribute(:quantity, params[:type][index][:quantity].gsub(/\D/, '').to_i)
				end
			end
		end
		redirect_to root_path
	end

	def index
		@event = Event.find(params[:event_id])
		@tickets = Ticket.where(owner: current_user).where(event: @event)
	end

	private
	def findEvent(type)
		Event.find(type)
	end
end

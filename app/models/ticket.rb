class Ticket < ActiveRecord::Base
	belongs_to :owner, class_name: "User"
	belongs_to :type, class_name: "TicketType"
	belongs_to :event, class_name: "Event"
end

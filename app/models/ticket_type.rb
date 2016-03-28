class TicketType < ActiveRecord::Base
  belongs_to :event, class_name: 'Event'

	validates :name, presence: true
	validates :price, presence: true
	validates :max_quantity, presence: true

  def buyableTicket(amount)
  	max_quantity ? ((sold_amount + amount) > max_quantity || amount > 10  || amount < 1? false : true) : nil
  end
end

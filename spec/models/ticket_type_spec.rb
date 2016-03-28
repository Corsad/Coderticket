require 'rails_helper'

RSpec.describe TicketType, type: :model do
	let(:ticket) {ticket = TicketType.new}

	describe "Buy Ticket" do
		it "return nil if max_quantity isn't set" do
			expect(ticket.buyableTicket(1)).to be_nil
		end

		it "return false if there is not enough ticket left" do
			ticket.max_quantity = 2;
			expect(ticket.buyableTicket(3)).to be false
		end

		it "return false if user buy 0 ticket" do
			ticket.max_quantity = 2;
			expect(ticket.buyableTicket(0)).to be false
		end

		it "return false if user buy more than 10 tickets" do
			ticket.max_quantity = 25;
			expect(ticket.buyableTicket(11)).to be false
		end

		it "return true if user buy 5 tickets" do
			ticket.max_quantity = 25;
			expect(ticket.buyableTicket(5)).to be true
		end

	end
end

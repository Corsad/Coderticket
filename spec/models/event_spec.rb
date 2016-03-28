require 'rails_helper'

RSpec.describe Event, type: :model do
	let(:event) {event = Event.new}
	describe "#venue name" do
		it "return nil if there's no value" do
			expect(event.venue_name).to be_nil
		end

		it "return venue name if there is a value" do
			event.venue = Venue.new(name: "RMIT")
			expect(event.venue_name).to eq "RMIT"
		end
	end

	describe "#upcoming venue" do
		it "return nil if starts_at has no value" do
			expect(event.upcomming_events?).to be_nil
		end

		it "return false if start_at is in the past" do
			event.starts_at = 2.hours.ago
			expect(event.upcomming_events?).to be false
		end

		it "return true if start_at is in the past" do
			event.starts_at = DateTime.now + 2.hours
			expect(event.upcomming_events?).to be true
		end
	end
end

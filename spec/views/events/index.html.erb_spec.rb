require 'rails_helper'

RSpec.describe "events/index", type: :view do
	describe "events/index.html.erb" do
		it "displays all the events" do
			@venue = Venue.new
			@venue.save validate: false
			@category = Category.new
			@category.save validate: false

			@event1 = Event.new(name: "Test1", starts_at: DateTime.now + 2.hours, ends_at: DateTime.now + 4.hours, venue_id: @venue.id, hero_image_url: "asdf", extended_html_description: "fdsa", category_id: @category.id)
			@event2 = FactoryGirl.build(:event, :venue => @venue, :category => @category)
			@event1.save validation: false

			render
			expect(view).to render_template(:partial => "_card", :count => 2)

		end
	end
end

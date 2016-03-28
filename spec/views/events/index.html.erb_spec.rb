require 'rails_helper'

RSpec.describe "events/index", type: :view do
	describe "events/index.html.erb" do
		it "displays all the events" do
			@venue = Venue.new
			@venue.save validate: false
			@category = Category.new
			@category.save validate: false

			@event1 = FactoryGirl.build(:event)
			@event2 = FactoryGirl.build(:event)

			render
			expect(view).to render_template(:partial => "_event", :count => 2)
		end
	end
end

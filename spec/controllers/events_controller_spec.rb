require 'rails_helper'

RSpec.describe EventsController, type: :controller do
	describe "GET #Index" do
		it "responds successfully with an HTTP 200 status code" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "render index" do
			get :index
			expect(response).to render_template("index")
		end

		it "loads only events in future" do
			event1 = Event.new(starts_at: DateTime.now + 2.days)
			event2 = Event.new(starts_at: DateTime.now - 2.hours)
			event3 = Event.new(starts_at: DateTime.now + 10.days)

			event1.save validate: false
			event2.save validate: false
			event3.save validate: false

			get :index

			expect(assigns(:events)).to match_array([event1, event3])
		end
	end
end

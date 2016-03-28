require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	let(:user) {user = User.create(name: "Hellen", email: "Hellen@example.com", password: "asdf")}

	describe "GET #show" do
		it "renders the index template" do
			get :show, :id => user.id
			expect(response).to render_template("show")
		end
	end

	describe "GET #new" do
		it "renders the index template" do
			get :new
			expect(response).to render_template("new")
		end
	end
end

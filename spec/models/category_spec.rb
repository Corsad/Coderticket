require 'rails_helper'

RSpec.describe Category, type: :model do
	let(:category) { category = Category.new }

	context "validation" do
		it "checks nil name" do
			category.save
			expect(category.errors[:name]).to include "is not included in the list"
		end


		it "checks for presense of name" do
			category.name = "Music"
			category.save
			expect(category.name).to eq "Music"
		end
	end
end

class VenuesController < ApplicationController
	def new
		@venue = Venue.new
		@regions = Region.all
	end

	def create
		@venue = Venue.create venue_params
		if @venue.save
			flash[:success] = "Venue is made"
			redirect_to root_path
		else
			flash.now[:error] = "Error: #{@venue.errors.full_messages.to_sentence}"
			render 'new'
		end
	end

	private
	def venue_params
		params.require(:venue).permit(:name, :full_address, :region_id)
	end

end

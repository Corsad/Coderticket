class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.create user_params

		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "Registed Success"
			redirect_to root_path
		else
			flash.now[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
			render 'new'
		end
	end

	def show
		@events = Event.where(creater: current_user)
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end



end

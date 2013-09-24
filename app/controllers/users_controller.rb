class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.create(user_params)
		if @user.save
			redirect_to @user, notice: "Thank you for signing up for ribbit"
		else
			render :new
		end
	end


	private

	def user_params
		params.require(:user).permit!
	end

end
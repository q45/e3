class UsersController < ApplicationController

	def index
		@user = User.all
		@rib = Rib.new
	end



	def buddies
		if current_user
			@rib = Rib.new
			buddies_ids = current_user.followeds.map(&:id).push(current_user.id)
			@ribs = Rib.find_all_by_user_id buddies_ids
		else
			redirect_to root_url
		end
	end	
	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		@rib = Rib.new
		@relationship = Relationship.where(
				follower_id: current_user.id,
				followed_id: @user.id
			).first_or_initialize if current_user
	end

	def create
		@user = User.create(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to @user, notice: "Thank you for signing up for ribbit"
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to @user, notice: "profile updated"
		else
			render 'edit'
		end
	end


	private

	def user_params
		params.require(:user).permit!
	end

end

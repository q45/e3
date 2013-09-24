class RibsController < ApplicationController

	def index
		@ribs = Rib.all
		@rib = Rib.new
	end

	def create
		rib = Rib.new(rib_params)
		rib.user_id = current_user.id
			
			flash[:error] = "Your Rib was over 140 characters" unless rib.save
			redirect_to root_url
	end

	private

	def rib_params
		params.require(:rib).permit!
	end

end

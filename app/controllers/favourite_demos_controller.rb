class FavouriteDemosController < ApplicationController
	before_action :require_user, only: [:create, :destroy]

	def create
		@demo = Demo.find(params[:demo_id])
		if Favourite.create(favourited: @demo, user: current_user)
			redirect_to demo_path(@demo)
		else
			redirect_to demo_path(@demo)
		end
	end

	def destroy
		@demo = Demo.find(params[:id])
		Favourite.where(favourited: @demo, user: current_user).first.destroy
		redirect_to demo_path(@demo)
	end

	private

	# def set_demo
	# 	@demo = Demo.find(params[:demo_id] || params[:id])
	# end
end

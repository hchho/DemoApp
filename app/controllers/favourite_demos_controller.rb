class FavouriteDemosController < ApplicationController
	before_action :set_demo
	before_action :require_user, only: [:create, :destroy]

	def create
		if Favourite.create(favourited: @demo, user: current_user)
			redirect_to @demo
		else
			redirect_to @demo
		end
	end

	def destroy
		Favourite.where(favourited_id: @demo.id, user_id: current_user.id).first.destroy
		redirect_to @demo
	end

	private

	def set_demo
		@demo = Demo.find(params[:demo_id] || params[:id])
	end
end

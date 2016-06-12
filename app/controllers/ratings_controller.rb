class RatingsController < ApplicationController
	before_action :require_user, only: [:new, :create, :update]

	def new
	end

	def create
		@rating = Rating.build(rating_params)
		@demo = Demo.find_by(params[:id])
		@user = current_user
	end

	def update
		@demo = Demo.find(params[:id])
		@rating = @demo.rating
		if @rating.update(rating_params)
			redirect_to(:action => 'show', :id => @demo.id)
		else
			render @demo
		end
	end

	private

	def rating_params
		params.require(:subject).permit(:rating, :demo_id, :user_id)
	end
end
end

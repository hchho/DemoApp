class RatingsController < ApplicationController
	before_action :require_user, only: [:create, :update]
	after_action :update_demo_rating

	def create
		@rating = Rating.create(rating_params)
		if @rating.save 
			@demo = @rating.reviewed
			redirect_back_or(@demo)
		end
	end

	def update
	  @rating = Rating.find(params[:id])
	  if @rating.update_attributes(rating_params)
	  	@demo = @rating.reviewed
	    redirect_back_or(@demo)
	  end
	end

	private

	def rating_params
		params.require(:rating).permit(:value, :reviewer_id, :reviewed_id)
	end

	def update_demo_rating
		@rating = Rating.find(params[:id])
		@demo = @rating.reviewed
		@demo.update_average_rating
	end

end

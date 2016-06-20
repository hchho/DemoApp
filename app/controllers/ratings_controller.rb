class RatingsController < ApplicationController
	before_action :require_user, only: [:create, :update]

	def create
		@rating = Rating.create(rating_params)
		if @rating.save 
			render @demo
		end
	end

	def update
		if @rating.update(rating_params)
			redirect_to(:action => 'show', :id => @demo.id)
		else
			render @demo
		end
	end

	private

	def rating_params
		params.require(:subject).permit(:rating, :reviewer_id, :reviewed_id)
	end
end

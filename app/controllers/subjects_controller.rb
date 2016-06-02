class SubjectsController < ApplicationController
	before_action :require_user, only: [:show, :new]
	before_action :admin_user, only: [:edit, :update, :destroy]

	def new
		@topic = Subject.new
	end

	def create
		@topic = Subject.new(subject_params)
	end

	private

	def subject_pararms
		params.require(:subject).permit(:topic)
	end
end

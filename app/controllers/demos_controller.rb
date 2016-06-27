class DemosController < ApplicationController
	before_action :require_user, only: [:show, :new, :create, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update, :destroy]

	def index
		if (params[:order] == 'name')
			@demos = Demo.all.order(name: :desc)
		elsif (params[:order] == 'created')
			@demos = Demo.all.order(created_at: :desc)
		elsif (params[:order] == 'rating')
			@demos = Demo.all.order(rating_average: :desc)
		else
			@demos = Demo.all.order(created_at: :desc)
		end
		@user = User.first
	end

	def show
		@demo = Demo.find(params[:id])
		@user = @demo.user
		@topic = @demo.subject
		@rating = Rating.where(reviewer: current_user, reviewed: @demo).first || @rating = Rating.create(reviewer: current_user, reviewed: @demo)
	end

	def new
		@demo = Demo.new
		@subjects = Subject.all
	end

	def create
		@demo = current_user.demos.build(demo_params)
		@rating = Rating.create(reviewer: current_user, reviewed: @demo)
		if @demo.save
			redirect_to '/', alert: "Demo created successfully"
		else
			render 'new', alert: "Error creating demo"
		end
	end

	def edit
		@demo = Demo.find(params[:id])
	end

	def update
		@demo = Demo.find(params[:id])
		if @demo.update(demo_params)
			redirect_to(:action => 'show', :id => @demo.id)
		else
			render 'edit'
		end
	end

	def destroy
		@demo = Demo.find(params[:id]).destroy
		redirect_to '/'
	end

	private

	def demo_params
		params.require(:demo).permit(:name, :content, :materials, :subject_id, :created_at)
	end

	def correct_user
		@demo = current_user.demos.find_by(id: params[:id])
		redirect_to '/' if @demo.nil?
	end
end
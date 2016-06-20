class DemosController < ApplicationController
	before_action :require_user, only: [:show, :new, :create, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update, :destroy]

	def index
		@demos = Demo.all
		@user = User.first
	end

	def show
		@demo = Demo.find(params[:id])
		@user = User.find(@demo.user_id)
		@topic = Subject.find(@demo.subject_id)
		@ratings = @demo.ratings
	end

	def new
		@demo = Demo.new
		@subjects = Subject.all
	end

	def create
		@demo = current_user.demos.build(demo_params)
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
		params.require(:demo).permit(:name, :content, :materials, :subject_id)
	end

	def correct_user
		@demo = current_user.demos.find_by(id: params[:id])
		redirect_to '/' if @demo.nil?
	end

end
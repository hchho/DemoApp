class DemosController < ApplicationController
	def index
		@demos = Demo.all
		@user = User.first
	end

	def show
		@demo = Demo.find(params[:id])
	end

	def new
		@demo = Demo.new
	end

	def create
		@demo = Demo.new(demo_params)
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
		params.require(:demo).permit(:content, :materials)
	end
end
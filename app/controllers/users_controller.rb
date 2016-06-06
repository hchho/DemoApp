class UsersController < ApplicationController
	before_action :require_user, only: [:index, :show, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: :destroy

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to @user
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
		@demos = @user.demos
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id]).destroy
		redirect_to users_url
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :viewable)
	end

	def correct_user
    	@user = User.find(params[:id])
    	redirect_to '/' unless current_user?(@user)
  	end

	def admin_user
		redirect_to '/' unless current_user.admin?
	end
end

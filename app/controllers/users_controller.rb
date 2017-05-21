class UsersController < ApplicationController
	before_action :set_user!, only: [:show, :update, :destroy]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		session[:user_id] = @user.id
		redirect_to user_path(@user)
	end

	def show
		if !current_user
			redirect_to root_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
	end

	def set_user!
		@user = User.find_by_id(params[:id])
	end

end

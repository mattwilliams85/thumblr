class UsersController < ApplicationController
	before_filter :logged_in?, only: [:new]
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else 
			redirect_to "/"
		end
	end

	def show
		@user = User.find(params[:id])
	end

private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end

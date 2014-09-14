class UsersController < ApplicationController
	before_filter :logged_in?, only: [:new]
	
	def new
		@user ||= User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else 
			render "new"
		end
	end

	def show
		@user = User.find(params[:id])
		@avatar = has_avatar?
	end

	def edit
		@user = User.find(params[:id])
		@avatar = has_avatar?
	end

	def has_avatar?
		photos = []
		photos << Photo.where(:user_id => @user.id)
		photos.flatten.each do |photo|
			if photo.is_avatar
				@result = photo
				break
			else
				@result = nil
			end
		end
		@result
	end


private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end

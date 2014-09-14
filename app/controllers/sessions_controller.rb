class SessionsController < ApplicationController
	before_filter :logged_in?, only: [:new]
	
	def new
		logged_in?
		@user = User.new
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password].pop)
			session[:users_id] = user.id
			redirect_to user_path(user)
		else
			@user = User.new 
			@user.errors.add(:email, "or password is invalid.")
			render 'new'
		end
	end

	def destroy
		session[:users_id] = nil
		redirect_to root_path
	end

end
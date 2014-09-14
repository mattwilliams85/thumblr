class PhotosController < ApplicationController

	def new
		@photo = Photo.new
	end

	def create
		@user = User.find(params[:user_id])
		@photo = Photo.new(photo_params)
		@photo.update(:user_id => @user.id)
		@photo.update(:is_avatar => params[:photo][:is_avatar])
		if !params[:photo][:is_avatar]
			@photo.update(:is_avatar => true)
		end
		if @photo.save
			redirect_to user_path(@user)
		else 
			render "new"
		end
	end

	def edit
		@user = User.find(params[:user_id])
		@photo = Photo.find(params[:id])	
	end

	def update
		@photo = Photo.new
		@user = User.find(params[:user_id])
		Photo.update_all(:is_avatar => false)
		@avatar = Photo.new(photo_params)
		@avatar.update(:user_id => @user.id)
		@avatar.update(:is_avatar => params[:photo][:is_avatar])
		if !params[:photo][:is_avatar]
			@avatar.update(:is_avatar => true)
		end
		if @avatar.save
			redirect_to user_path(@user)
		else 
			render "edit"
		end
	end

	private
    def photo_params
      params.require(:photo).permit(:name, :photo, :user_id)
    end
end
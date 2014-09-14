class PhotosController < ApplicationController
	def new
		@photo = Photo.new
	end

	def create
		@user = User.find(params[:user_id])
		@photo = Photo.new(photo_params)
		sfd
		if @photo.save
			redirect_to user_path(@user)
		else 
			render "new"
		end
	end

	private
    def photo_params
      params.require(:photo).permit(:name, :photo, :user_id)
    end
end
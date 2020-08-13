class PicturesController < ApplicationController
    def create
        parameters = params.require(:picture).permit(:userId, :avatar)
        picture = Picture.create(parameters)
        redirect_to user_path(session[:user_id])
    end

    def change
        parameters = params.require(:picture).permit(:userId, :avatar)
        picture = Picture.find_by(userId: parameters[:userId])
        picture.avatar.attach(parameters[:avatar])
        redirect_to user_path(session[:user_id])
    end
    def update
        parameters = params.require(:picture).permit(:userId, :avatar)
        picture = Picture.find_by(userId: parameters[:userId])
        picture.avatar.attach(parameters[:avatar])
        redirect_to user_path(session[:user_id])
    end
end
class CvsController < ApplicationController
    def create
        parameters = params.require(:cv).permit(:userId, :avatar)
        cv = Cv.create(parameters)
        redirect_to user_path(session[:user_id])
    end

    def change
        parameters = params.require(:cv).permit(:userId, :avatar)
        cv = Cv.find_by(userId: parameters[:userId])
        cv.avatar.attach(parameters[:avatar])
        redirect_to user_path(session[:user_id])
    end
    def update
        parameters = params.require(:cv).permit(:userId, :avatar)
        cv = Cv.find_by(userId: parameters[:userId])
        cv.avatar.attach(parameters[:avatar])
        redirect_to user_path(session[:user_id])
    end
end
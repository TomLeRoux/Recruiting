class MessagesController < ApplicationController
    def create
        parameters = params.require(:message).permit(:content, :topicId, :owner, :userId)
        message = Message.create(parameters)
        redirect_to topic_path(message.topicId)
    end

    def destroy
        message = Message.find(params[:id])
        message.destroy
        redirect_to topic_path(message.topicId)
    end
end
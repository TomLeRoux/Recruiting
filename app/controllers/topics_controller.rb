class TopicsController < ApplicationController
    def index
        @topics = Topic.all
    end

    def show
        @topic = Topic.find_or_initialize_by(id: params[:id])
        if (@topic.title.nil?)
            redirect_to root_path
        end
        @messages = Message.where(topicId: params[:id]).sort_by(&:created_at)
        @newMessage = Message.new
        @user = User.find_or_initialize_by(id: session[:user_id])
    end

    def new
        @newTopic = Topic.new
    end

    def create
        parameters = params.require(:topic).permit(:title, :description)
        topic = Topic.create(parameters)
        redirect_to topic_path(topic.id)
    end

    def edit
        @topic = Topic.find_or_initialize_by(id: params[:id])
        if (@topic.title.nil?)
            redirect_to root_path
        end
    end

    def update
        @topic = Topic.find(params[:id])
        parameters = params.require(:topic).permit(:title, :description)
        @topic.update(parameters)
        redirect_to topic_path(@topic.id)
    end

    def destroy
        Message.destroy_by(topicId: params[:id])
        @topic = Topic.find(params[:id])
        @topic.destroy
        redirect_to topics_path
    end
end
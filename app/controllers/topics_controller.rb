class TopicsController < ApplicationController
    def show
        @topic = Topic.find(params[:id])
        @posts = @topic.posts.all
        @topics = @topic.topics.all
        if(Topic.find(@topic).topic)
            @parent = Topic.find(@topic).topic
        
        end
    end
end
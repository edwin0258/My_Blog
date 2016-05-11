class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    def new
        if current_user
            @post = Post.new
        else
            redirect_to root_url
        end
    end
    def show
        @post = Post.find(params[:id])
    end
    def edit
        if current_user
        @post = Post.find(params[:id])
        else
            redirect_to root_url
        end
    end
    def create
        if current_user
            @post = Post.new(post_params)
            
            if @post.save
                redirect_to root_url
            else
                render 'new'
            end
        else
            redirect_to root_url
        end
    end
    def destroy
        if current_user
            @post = Post.find(params[:id])
            
            @post.destroy
            redirect_to root_url
        else
            redirect_to root_url
        end
    end
    private
        def post_params
            params.require(:post).permit(:title,:text)
        end
end

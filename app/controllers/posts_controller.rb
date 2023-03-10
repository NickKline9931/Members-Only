class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index
        @posts = Post.all
        render :index
    end

    def new
        @post = Post.new
        render :new
    end

    def create 
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to root_path
    end

    private 
    def post_params
        params.require(:post).permit(:title, :body)
    end
end

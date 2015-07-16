class PostsController < ApplicationController
  def index
    @users = Post.all
    @newPost = Post.new
  end

  def new

  end

  def create
    post = Post.new(newPost_params)
    if post.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  private
    def newPost_params
      params.require(:post).permit(:name, :email, :message)
    end
end

class PostsController < ApplicationController

  def index
    indexOffset = if params[:page] != nil && params[:page] >= 0 then
      ((params[:page] - 1) * 100)
    else
      0
    end
    @posts = Post.order(created_at: :desc).offset(indexOffset).limit(100)
    @numOfPosts = @posts.count
    @newPost = Post.new
  end

  def create
    post = Post.new(newPost_params)
    if post.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def new

  end

  private
    def newPost_params
      return params.require(:post).permit(:name, :email, :message)
    end
end

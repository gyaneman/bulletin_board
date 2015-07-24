class PostsController < ApplicationController
  def index
    indexPage = params[:page]
    @posts = Post.order(created_at: :desc).offset(indexPage).limit(100)
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

  private
    def newPost_params
      return params.require(:post).permit(:name, :email, :message)
    end
end

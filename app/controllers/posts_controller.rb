class PostsController < ApplicationController
  def index
    @author = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @author= @post.author
    @comments = @post.comments
  end
end

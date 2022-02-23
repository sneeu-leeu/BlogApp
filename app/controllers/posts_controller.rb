class PostsController < ApplicationController
  def index
    @author = User.find(params[:user_id])
    @posts = @author.posts
  end

  def show
    @post = Post.find(params[:id])
    @author = @post.author
  end
end

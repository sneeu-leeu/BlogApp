class PostsController < ApplicationController
  def index
    @author = User.find(params[:user_id])
    @posts = @author.posts
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(@post.author_id)
    @comments = @post.comments
  end
end

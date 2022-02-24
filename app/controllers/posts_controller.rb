class PostsController < ApplicationController
  def index
    @author = User.find(params[:user_id])
    @posts = @author.posts
  end

  def show
    @post = Post.find(params[:id])
    @author = @post.author
  end

  def new
    @post = Post.new
  end

  def create
    new_post = current_user.posts.new(params.require(:post).permit(:title, :text))
    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to "/users/#{new_post.author.id}/posts/"
        else
          render :new
        end
      end
    end
  end
end

class PostsController < ApplicationController
  def index
    @author = User.find(params[:user_id])
    @posts = @author.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(@post.author_id)
  end

  def new
    @post = Post.new
  end

  def create
    new_post = current_user.posts.new(params.require(:post).permit(:title, :text))
    new_post.likes_counter = 0
    new_post.comments_counter = 0
    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to "/users/#{new_post.author.id}/posts/", notice: 'Post Saved Successfully'
        else
          render :new, alert: 'Sorry, something went wrong'
        end
      end
    end
  end
end

class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if current_user.likes.find_by(author_id: @post.author_id, post_id: @post.id)
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}"
    else
      new_like = current_user.likes.new
      new_like.post_id = @post.id
      if new_like.save
        redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'Likeds Successfully'
      else
        redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", alert: 'Sorry, Something Went Wrong'
      end
    end
  end
end

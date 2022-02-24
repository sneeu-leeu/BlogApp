class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    unless current_user.likes.find_by(post_id: @post.id)
      new_like = current_user.likes.new
      new_like.post_id = @post.id
      new_like.save
    end
    redirect_to "/users/#{@post.user_id}/posts/#{@post.id}"
  end
end

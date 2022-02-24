class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    unless current_user.likes.find_by(post_id: @post.id)
      @like = current_user.likes.build(post_id: @post.id)
      @like.save
    end
    redirect_to "/users/#{@post.user_id}/posts/#{@post.id}"
  end
end

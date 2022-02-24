class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if current_user.likes.find_by(user_id: @post.user_id, post_id: @post.id)
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}"
    else 
      new_like = current_user.likes.new
      new_like.post_id = @post.id
      if new_like.save
        redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", notice: "You liked this post"
      else
        redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", alert: 'Sorry something went wrong'
      end
    end

  end
end

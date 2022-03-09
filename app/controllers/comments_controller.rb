class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    new_comment = current_user.comments.new(
      text: comment_params,
      author_id: current_user.id,
      post_id: @post.id
    )
    new_comment.post_id = @post.id
    if new_comment.save
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'Comment created successfully'
    else
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", Alert: 'Something went wrong'
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    post = Post.find_by(id: @comment.post_id)
    post.comments_counter -= 1
    @comment.destroy!
    flash[:success] = 'Comment deleted'
    redirect_to user_post_path(current_user.id, post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end

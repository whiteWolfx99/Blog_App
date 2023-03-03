class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.create(comment_params)
    @comment.author = current_user

    if @comment.save
      redirect_to user_post_path(params[:user_id], post)
      flash[:notice] = 'success'
    else
      flash.now[:error] = 'Error'
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
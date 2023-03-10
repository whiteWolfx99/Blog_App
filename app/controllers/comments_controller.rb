class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.create(comment_params)
    current_user = User.find(params[:user_id])
    @comment.author = current_user

    if @comment.save
      redirect_to user_post_path(params[:user_id], post)
      flash[:notice] = 'success'
    else
      flash.now[:error] = 'Error'
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find_by!(id: params[:post_id])
    comment = Comment.find_by!(post_id: params[:post_id], id: params[:id])
    comment.destroy
    @post.decrement!(:commentsCounter)
    flash[:notice] = 'The comment was deleted'
    redirect_to user_post_path(@user, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

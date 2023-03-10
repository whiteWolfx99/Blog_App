class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    user = User.find(params[:user_id])
    like = Like.create(post:, author: user)

    if like.save
      redirect_to user_post_path(post.author, post), notice: 'liked!'
    else
      redirect_to user_post_path(post.author, post), alert: 'not liked.'
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    like = Like.find_by(post:, user:)

    if like.destroy
      redirect_to user_post_path(post.author, post), notice: 'unliked!'
    else
      redirect_to user_post_path(post.author, post), alert: 'not unliked.'
    end
  end
end

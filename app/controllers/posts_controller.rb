class PostsController < ApplicationController
  before_action :set_user, only: %i[index show]

  def index
    @posts = Post.where(author_id: @user)
  end

  def show
    @post = Post.find_by!(id: params[:id], author_id: @user.id)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end

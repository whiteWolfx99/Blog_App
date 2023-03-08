class PostsController < ApplicationController
  before_action :set_user, only: %i[index show]

  def index
    @posts = @user.posts.includes(:comments)
    @like = current_user.likes.new
  end

  def show
    @post = Post.find_by!(id: params[:id], author_id: @user.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to user_post_path(@post.author, @post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:new_post).permit(:title, :text)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end

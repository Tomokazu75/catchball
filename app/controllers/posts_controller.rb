class PostsController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    @comment = current_user.comments.new
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      # flash.now[:danger] = "投稿を作成できませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to posts_path, status: :see_other
  end

  def likes
    @posts = current_user.like_posts.includes(:user).order(created_at: :desc)
  end

  def today
    @posts = Post.where(start_time: DateTime.now.midnight..)
    @posts = @posts.where(start_time: ..DateTime.now.end_of_day).order(start_time: :asc)
  end

  def baseball
    @posts = Post.where(genre: "Baseball")
    @posts = @posts.where(start_time: DateTime.now.midnight..).order(start_time: :asc)
  end

  def basketball
    @posts = Post.where(genre: "Basketball")
    @posts = @posts.where(start_time: DateTime.now.midnight..).order(start_time: :asc)
  end

  def americanfootball
    @posts = Post.where(genre: "Americanfootball")
    @posts = @posts.where(start_time: DateTime.now.midnight..).order(start_time: :asc)
  end

  def soccer
    @posts = Post.where(genre: "Soccer")
    @posts = @posts.where(start_time: DateTime.now.midnight..).order(start_time: :asc)
  end

  def others
    @posts = Post.where(genre: "Others")
    @posts = @posts.where(start_time: DateTime.now.midnight..).order(start_time: :asc)
  end

  private

  def post_params
    params.require(:post).permit(:genre, :start_time, :location, :body)
  end
end

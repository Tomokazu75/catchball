class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: %i[edit update show destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to admin_post_path(@post)
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @post.destroy!
    redirect_to admin_posts_path, status: :see_other
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:genre, :body, :start_time, :location)
  end
end

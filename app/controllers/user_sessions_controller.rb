class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :destroy]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to posts_path, success: "ログインしました"
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other
  end
end
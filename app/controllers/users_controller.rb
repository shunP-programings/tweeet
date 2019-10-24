class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    pass = BCrypt::Password.create(params[:user][:pass])
    @user = User.new(uid: params[:user][:uid], pass: pass)
    if @user.save
      flash[:info] = "ユーザを登録完了しました。"
      redirect_to users_path
    else
      render new_user_path
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
end

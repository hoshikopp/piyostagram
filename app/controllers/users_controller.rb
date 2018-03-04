class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_path(@user.id),notice:'登録成功です！'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @nice_posts = @user.nice_posts
    @followed = @user.active_relationships
    @follower = @user.passive_relationships
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end

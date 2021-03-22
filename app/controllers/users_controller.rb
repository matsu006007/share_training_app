class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @tweets = @user.tweets.order("created_at DESC").page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id == @user.id
      render :edit
    else
      redirect_to tweets_path
    end
  end

end

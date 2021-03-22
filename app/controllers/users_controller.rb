class UsersController < ApplicationController
  before_action :Login_check

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

  private

  def Login_check
    unless user_signed_in?
      redirect_to root_path
    end
  end


end

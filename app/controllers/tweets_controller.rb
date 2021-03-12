class TweetsController < ApplicationController

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(10)

  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
       redirect_to tweets_path
    else
      @tweet =Tweet.new(tweet_params)
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @message = Message.new
    @messages = Message.includes(:tweet)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :content, :genre_id, :image).merge(user_id: current_user.id)
  end

end

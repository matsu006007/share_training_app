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
    @messages = @tweet.messages
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.destroy
      redirect_to user_path(@tweet.user_id)
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :content, :genre_id, :image).merge(user_id: current_user.id)
  end

end

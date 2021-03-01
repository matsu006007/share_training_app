class TweetsController < ApplicationController

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    redirect_to tweets_path
  end


  private

  def tweet_params
    params.require(:tweet).permit(:content, :genre_id).merge(user_id: current_user.id)
  end

end

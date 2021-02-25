class TweetsController < ApplicationController

  def index
    @tweets = Tweet.includes(:user)
  end

  def new
    @tweet = Tweet.new
  end

  def create
  end

end

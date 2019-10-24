class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def new
    @tweet = Tweet.new
  end

  def create
    user_id = User.find_by(uid: session[:login_uid]).id
    @tweet = Tweet.new(message: params[:tweet][:message], user_id: user_id)
    if @tweet.save
      redirect_to tweets_path
    else
      render new_tweet_path
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end
end

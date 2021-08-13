class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @tweet = Tweet.new
  end

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    redirect_to tweets_path
  end

  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end
end

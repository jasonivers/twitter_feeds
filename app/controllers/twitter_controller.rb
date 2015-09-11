class TwitterController < ApplicationController
  def index
  end
  def post
    if not params[:handle].blank?
      handle = params[:handle].sub(/^@/,'')
      tweets = []
      @tweets = Rails.cache.fetch(handle, expires_in: 5.minutes) {
        TwitterClients.with do |conn|
          tweets = conn.search("from:#{handle}").take(25).collect.to_a
        end
      }
    else
      redirect_to('/', notice: "You must pass a Twitter handle") and return
    end
    redirect_to "/", notice: "Couldn't find any tweets from #{params.fetch('handle', '')}" if @tweets.size == 0
  end
end

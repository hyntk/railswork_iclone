class FeedsController < ApplicationController
  def index
  end

  def new
    @feed = Feed.new
  end

  def create
    Feed.create(oarams[:feed])
    redirect_to "/feeds/new"
  end
end

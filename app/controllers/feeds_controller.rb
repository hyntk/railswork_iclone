class FeedsController < ApplicationController
  def index
  end

  def new
    @feed = Feed.new
  end
end

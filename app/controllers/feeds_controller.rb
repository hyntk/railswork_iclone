class FeedsController < ApplicationController
  before_action :set_feed, only: [:edit, :update, :destroy]
  def index
    @feeds = Feed.all
  end

  def new
    @feed = Feed.new
  end

  def create
    Feed.create(feed_params)
    redirect_to feeds_path,notice: "ブログを作成しました！"
  end

  def index
    @feeds = Feed.all
  end

  def edit
  end

  def update
    if @feed.update(feed_params)
      redirect_to feeds_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @feed.destroy
    redirect_to feeds_path, notice:"ブログを削除しました！"
  end

end

  private

  def feed_params
    params.require(:feed).permit(:image, :content)
  end

  def set_feed
    @feed = Feed.find(params[:id])
  end
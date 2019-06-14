class FeedsController < ApplicationController
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
    @feed = Feed.find(params[:id])
  end

  def update
    @feed = Feed.find(params[:id])
    if @feed.update(feed_params)
      redirect_to feeds_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end


  

end

  private

  def feed_params
    params.require(:feed).permit(:image, :content)
  end
class FeedsController < ApplicationController
  before_action :authenticate_user, only: [:index, :new]
  before_action :set_feed, only: [:edit, :update, :destroy]

  def index
    @feeds = Feed.all
  end

  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end

  def create
    @feed = current_user.feeds.new(feed_params)
    # @feed = Feed.new(feed_params)
    # @feed.user_id = current_user.id #現在ログインしているuserのidを、feedのuser_idカラムに挿入する
    if @feed.save
      PostMailer.contact_mail(@feed).deliver
      redirect_to feeds_path, notice: "ブログを作成しました！"
    else
      redirect_to new_feed_path
    end
  end

  def show
    @feed = Feed.find(params[:id])
    @favorite = current_user.favorites.find_by(feed_id: @feed.id)
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

  def confirm
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id #現在ログインしているuserのidを、blogのuser_idカラムに挿入する
    @user = @feed.user.name
  end

end

  private

  def feed_params
    params.require(:feed).permit(:image, :image_cache, :content)
  end

  def set_feed
    @feed = Feed.find(params[:id])
  end

  def authenticate_user

    unless logged_in?
      redirect_to sessions_new_path
    end
  end

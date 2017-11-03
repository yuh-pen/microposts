class FavoritesController < ApplicationController
  before_action :require_user_logged_in, only: [:create, :destroy]

  def create
    micropost = Micropost.find(params[:id])
    crrent_user.favorite(micropost)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to @micropost
  end

  def destroy
    micropost = Micropost.find(params[:id])
    current_user.unfavorite(micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to @micropost
  end
end

class NicesController < ApplicationController
  before_action :authenticate

  def create
    nice = current_user.nices.create(post_id:params[:post_id])
    redirect_to posts_url ,notice:"#{nice.post.user.name}さんの投稿にいいねしました！"
  end

  def destroy
    nice = current_user.nices.find_by(post_id:params[:post_id]).destroy
    redirect_to posts_url ,notice:"#{nice.post.user.name}さんの投稿のいいねを解除しました！"
  end
end

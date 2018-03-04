class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  add_flash_types :success, :info, :warning, :danger

  private

  def authenticate
    return if logged_in?
    redirect_to posts_path, alert: 'ログインしてください'
  end
end

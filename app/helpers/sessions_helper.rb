# frozen_string_literal: true

module SessionsHelper
  def logged_in_user
    return if logged_in?

    flash[:danger] = 'ログインしてください'
    redirect_to login_url, status: :see_other
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    puts Rails.env
    user = User.find_by(id: session[:user_id])
    @current_user ||= user if user&.authenticated?(session[:token])
  end
end

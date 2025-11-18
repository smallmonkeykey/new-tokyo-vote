# frozen_string_literal: true

module SessionsHelper
  def logged_in?
    !current_user.nil?
  end

  def current_user
    user = User.find_by(id: session[:user_id])
    @current_user ||= user if user&.authenticated?(session[:token])
  end
end

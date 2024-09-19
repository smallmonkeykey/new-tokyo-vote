# frozen_string_literal: true

module SessionsHelper
  def logged_in_user
    logger.debug("logged in userが呼ばれた")
    logger.debug(Rails.env)
    logger.debug(ENV['PGDATABASE'])
    logger.debug(ENV['PGUSER'])
    logger.debug(ENV['PGPASSWORD'])
    return if logged_in?

    flash[:danger] = 'ログインしてください'
    redirect_to login_url, status: :see_other
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    logger.debug(Rails.env)
    user = User.find_by(id: session[:user_id])
    @current_user ||= user if user&.authenticated?(session[:token])
  end
end

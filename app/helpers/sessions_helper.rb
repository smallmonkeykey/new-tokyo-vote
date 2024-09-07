# frozen_string_literal: true

module SessionsHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_admin
    return if current_user&.admin?

    flash[:alert] = '管理者のみアクセス可能です'
    redirect_to root_path
  end
end

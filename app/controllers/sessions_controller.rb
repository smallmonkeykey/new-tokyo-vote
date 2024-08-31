# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :logged_in_user, only: %i[new create]

  def new; end

  def create
    reset_session
    user = User.find_or_create_from_auth_hash!(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path, notice: 'ログインしました'
  end

  def destroy
    reset_session
    redirect_to login_path, status: :see_other, notice: 'ログアウトしました'
  end
end

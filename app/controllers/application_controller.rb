# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :logged_in_user

  def logged_in_user
    return if logged_in?

    flash[:danger] = 'ログインしてください'
    redirect_to login_url, status: :see_other
  end
end

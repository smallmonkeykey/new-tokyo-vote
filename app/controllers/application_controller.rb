# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :logged_in_user

  private

  def logged_in_user
    return if logged_in?

    flash[:danger] = 'ログインしてください'
    redirect_to login_url, status: :see_other
  end

  def check_event_status
    return unless @event

    case @event.status
    when 'preparing'
      render 'shared/preparing' and return
    when 'counting'
      render 'shared/counting' and return
    end
  end
end

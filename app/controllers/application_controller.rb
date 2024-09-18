# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :logged_in_user
end

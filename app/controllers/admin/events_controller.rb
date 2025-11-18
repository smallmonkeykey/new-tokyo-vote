# frozen_string_literal: true

module Admin
  class EventsController < ApplicationController
    include AdminHelper
    before_action :require_admin

    def index
      @events = Event.order(created_at: :desc)
    end
  end
end

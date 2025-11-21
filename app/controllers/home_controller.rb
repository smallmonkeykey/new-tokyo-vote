# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    latest = Event.order(id: :desc).first

    if latest.present?
      redirect_to event_path(latest)
    else
      render :index
    end
  end
end

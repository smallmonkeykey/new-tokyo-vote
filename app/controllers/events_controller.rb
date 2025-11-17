# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :check_event_status

  def show
    @event = Event.find(params[:id])
  end
end

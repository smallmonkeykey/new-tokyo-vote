# frozen_string_literal: true

module Admin
  class EventsController < ApplicationController
    include AdminHelper
    before_action :require_admin
    before_action :set_event, only: [:show, :update]

    def index
      @events = Event.order(created_at: :desc)
    end

    def show
      categories = %w[food drink lt]
      @rankings = {}

      categories.each do |category|
        votes = Vote.for_event(@event.id).for_category(category)

        @rankings[category] = {
          single: votes.ranking_by_single,
          total:  votes.ranking_by_total_votes
        }
      end
    end

    private
    def set_event
      @event = Event.find(params[:id])
    end
  end
end

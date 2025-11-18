# frozen_string_literal: true

module Admin
  class EventsController < ApplicationController
    include AdminHelper
    before_action :require_admin
    before_action :set_event, only: %i[show update]

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
          total: votes.ranking_by_total_votes
        }
      end
    end

    def update
      if @event.update(event_params)
        redirect_to admin_event_path(@event), notice: 'ステータスを更新しました'
      else
        flash.now[:alert] = 'ステータスの更新に失敗しました'
        render :show, status: :unprocessable_entity
      end
    end

    private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:status)
    end
  end
end

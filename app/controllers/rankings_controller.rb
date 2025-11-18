# frozen_string_literal: true

class RankingsController < ApplicationController
  before_action :set_event
  before_action :check_closed_event, only: [:index]

  def index
    @category = params[:category].presence || 'food'
    votes = Vote.for_event(@event.id).for_category(@category)

    @rankings = votes.ranking_by_single
    @rankings_total = votes.ranking_by_total_votes
    @comments = votes.fetch_comment
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def check_closed_event
    return if @event.closed?

    redirect_to event_path(@event), alert: 'このページは現在公開されていません。'
  end
end

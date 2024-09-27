# frozen_string_literal: true

class RankingsController < ApplicationController
  before_action :check_closing_time, only: [:index]
  def index
    @category = params[:category].presence || 'food'

    @rankings = Vote.ranking_by_single(@category)
    @rankings_total = Vote.ranking_by_total_votes(@category)
    @comments = Vote.fetch_comment(@category)
    # binding.pry
  end

  private

  def check_closing_time
    return unless Time.current < CLOSING_TIME

    redirect_to root_path, alert: 'このページは現在公開されていません。'
  end
end

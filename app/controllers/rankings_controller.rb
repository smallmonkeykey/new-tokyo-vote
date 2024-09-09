# frozen_string_literal: true

class RankingsController < ApplicationController
  before_action :check_publication_time, only: [:index]
  def index
    @category = params[:category].presence || 'food'

    @rankings = Vote.ranking_by_single(@category)
    @rankings_total = Vote.ranking_by_total_votes(@category)
    @comments = Vote.fetch_comment(@category)
  end

  private

  def check_publication_time
    publication_time = Time.new(2024, 9, 29, 19, 0o0, 0, '+09:00')

    return unless Time.current < publication_time

    redirect_to root_path, alert: 'このページは現在公開されていません。'
  end
end

# frozen_string_literal: true

class RankingsController < ApplicationController
  def index
    @category = params[:category].presence || 'food'

    @rankings = Vote.rankng_by_single(@category)
    @rankings_total = Vote.ranking_by_total_votes(@category)
  end
end

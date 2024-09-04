# frozen_string_literal: true

class RankingsController < ApplicationController
  def index
    @rankings = Vote.rankng_by_single('food')
    @rankings_total = Vote.ranking_by_total_votes('food')
  end
end

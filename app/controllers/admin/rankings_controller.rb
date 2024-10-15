# frozen_string_literal: true

class Admin::RankingsController < ApplicationController
  include AdminHelper
  before_action :require_admin

  def index
    categories = %w[food drink lt]
    @rankings = {}

    @rankings = categories.index_with do |category|
      {
        single: Vote.ranking_by_single(category),
        total: Vote.ranking_by_total_votes(category)
      }
    end
  end
end

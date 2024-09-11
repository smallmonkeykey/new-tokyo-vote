# frozen_string_literal: true

module RankingsHelper
  def after_closing_time?
    Time.current >= CLOSING_TIME
  end
end

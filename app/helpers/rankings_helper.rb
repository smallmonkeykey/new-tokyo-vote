# frozen_string_literal: true

module RankingsHelper
  def after_closing_time?
    current_time = Time.current
    closing_time = Time.new(2024, 9, 29, 19, 0, 0, '+09:00')
    current_time >= closing_time
  end
end

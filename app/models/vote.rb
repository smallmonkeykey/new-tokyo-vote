# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :entry

  validates :comment, length: { maximum: 300 }
end

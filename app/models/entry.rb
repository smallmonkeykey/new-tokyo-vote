# frozen_string_literal: true

class Entry < ApplicationRecord
  has_many :votes, dependent: :destroy

  belongs_to :user
  belongs_to :category
  validates :title, presence: true
  validates :description, length: { maximum: 300 }
end

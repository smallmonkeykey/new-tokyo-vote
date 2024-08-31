# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :nickname, :title, presence: true
end

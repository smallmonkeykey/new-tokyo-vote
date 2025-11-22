# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :entries, dependent: :destroy
  enum status: {
    preparing: 0,
    open: 1,
    counting: 2,
    closed: 3
  }
end

# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :entries, dependent: :destroy
end

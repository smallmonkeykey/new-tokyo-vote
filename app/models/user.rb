# frozen_string_literal: true

class User < ApplicationRecord
  has_many :entries, dependent: :destroy
end

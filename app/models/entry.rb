# frozen_string_literal: true

class Entry < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_one_attached :image

  belongs_to :user
  belongs_to :category
  belongs_to :event
  validates :title, presence: true
  validates :description, length: { maximum: 300 }
  validate :image_type

  private

  def image_type
    allowed_types = ['image/jpeg', 'image/png', 'image/gif']
    errors.add(:image, 'はjpeg,pngまたはgif形式でアップロードしてください') if image.attached? && !image.blob.content_type.in?(allowed_types)
  end
end

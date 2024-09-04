# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :entry

  validates :comment, length: { maximum: 300 }

  def self.rankng_by_single(category_name)
    joins(entry: :category)
    .where(categories: {category_name: category_name})
    .select('entries.id AS entry_id, COUNT(votes.id) AS votes_count, entries.title AS title, entries.nickname AS nickname')
    .group('entries.id')
    .order('votes_count DESC')
    .limit(3)
  end

  def self.ranking_by_total_votes(category_name)
    joins(entry: :category)
    .where(categories: {category_name: category_name})
    .select('entries.id AS entry_id, COUNT(votes.id) AS votes_count, GROUP_CONCAT(DISTINCT entries.title) AS titles, entries.nickname AS nickname')
    .group('entries.user_id')
    .order('votes_count DESC')
    .limit(3)
  end
end

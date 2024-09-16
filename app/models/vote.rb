# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :entry

  validates :comment, length: { maximum: 300 }

  def self.ranking_by_single(category_name)
    joins(entry: %i[category user])
      .where(categories: { category_name: })
      .select('entries.id AS entry_id, COUNT(votes.id) AS votes_count, entries.title AS title, users.name AS name')
      .group('entries.id')
      .order('votes_count DESC')
      .limit(3)
  end

  def self.ranking_by_total_votes(category_name)
    joins(entry: %i[category user])
      .where(categories: { category_name: })
      .select('entries.id AS entry_id, COUNT(votes.id) AS votes_count, GROUP_CONCAT(DISTINCT entries.title) AS titles, users.name AS name')
      .group('entries.user_id')
      .order('votes_count DESC')
      .limit(3)
  end

  def self.fetch_comment(category_name)
    joins(entry: %i[category user])
      .where(categories: { category_name: })
      .where.not(votes: { comment: [nil, ''] })
      .select('entries.id AS entry_id, users.name AS name, votes.comment AS comment')
      .order('entries.user_id')
  end
end

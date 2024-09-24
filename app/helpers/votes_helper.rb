# frozen_string_literal: true

module VotesHelper
  MAX_VOTES_PER_CATEGORY = 3

  def remaind_vote_count(category_name)
    votes_count = current_user.votes.joins(entry: :category).where(category: { category_name: }).count
    MAX_VOTES_PER_CATEGORY - votes_count
  end

  def voted_entries(category_name)
    votes = current_user.votes.includes(entry: :user).joins(entry: :category).where(category: { category_name: })
    votes.map do |vote|
      {
        title: vote.entry.title,
        user_name: vote.entry.user.name
      }
    end
  end
end

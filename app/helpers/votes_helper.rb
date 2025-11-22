# frozen_string_literal: true

module VotesHelper
  MAX_VOTES_PER_CATEGORY = 3

  def remind_vote_count(event, category_name)
    category = Category.find_by(category_name:)
    votes_count = current_user.votes
                              .joins(:entry)
                              .where(entries: { event_id: event.id, category_id: category.id })
                              .count
    MAX_VOTES_PER_CATEGORY - votes_count
  end

  def voted_entries(event, category_name)
    category = Category.find_by(category_name:)
    votes = current_user.votes
                        .joins(:entry)
                        .where(entries: { event_id: event.id, category_id: category.id })
                        .includes(entry: :user)

    votes.map do |vote|
      {
        title: vote.entry.title,
        user_name: vote.entry.user.name
      }
    end
  end
end

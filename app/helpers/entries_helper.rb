# frozen_string_literal: true

module EntriesHelper
  def user_entries_by_category(event, category_name)
    current_user.entries
                .joins(:category)
                .where(event_id: event.id)
                .where(categories: { category_name: })
  end
end

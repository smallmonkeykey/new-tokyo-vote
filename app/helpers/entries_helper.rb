# frozen_string_literal: true

module EntriesHelper
  def user_entries_by_category(category_name)
    current_user.entries.joins(:category).where(categories: { category_name: })
  end
end

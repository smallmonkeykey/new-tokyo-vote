class RemoveDefaultFromEntriesEventId < ActiveRecord::Migration[7.0]
  def change
    change_column_default :entries, :event_id, from: 1, to: nil
  end
end

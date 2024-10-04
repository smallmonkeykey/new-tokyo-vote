class RemoveNicknameAndImageFromEntries < ActiveRecord::Migration[7.0]
  def change
    remove_column :entries, :nickname, :string
    remove_column :entries, :image, :string
  end
end

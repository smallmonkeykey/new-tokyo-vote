class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :nickname
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end

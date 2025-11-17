class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end

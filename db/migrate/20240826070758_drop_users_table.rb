class DropUsersTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :users
  end

  def down
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name

      t.timestamps
    end
  end
end

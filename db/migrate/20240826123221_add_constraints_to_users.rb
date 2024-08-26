class AddConstraintsToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :provider, false
    change_column_null :users, :uid, false
    change_column_null :users, :name, false

    add_index :users, [:provider, :uid], unique: true
  end
end

class AddIndexesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :name
    add_index :users, :nickname
  end
end

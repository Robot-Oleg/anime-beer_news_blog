class AddDepthToComment < ActiveRecord::Migration[6.1]
  def change
    change_table :comments do |t|
      t.integer :depth, null: false, default: 0
    end
  end
end

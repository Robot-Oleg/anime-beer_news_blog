class AddMaskToBlogpost < ActiveRecord::Migration[6.1]
  def change
    add_column :blogposts, :mask, :integer, null: false, default: 0
  end
end

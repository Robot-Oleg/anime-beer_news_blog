class AddViewsToBlogpost < ActiveRecord::Migration[6.1]
  def change
    add_column :blogposts, :views_count, :integer, default: 0, null: false
  end
end

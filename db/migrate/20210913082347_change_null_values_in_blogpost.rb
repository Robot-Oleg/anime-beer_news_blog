class ChangeNullValuesInBlogpost < ActiveRecord::Migration[6.1]
  def up
    change_column :blogposts, :avg_rating, :decimal, null: true
    change_column :blogposts, :region_id, :bigint, null: true
  end

  def down
    change_column :blogposts, :avg_rating, :decimal, null: false
    change_column :blogposts, :region_id, :bigint, null: false
  end
end

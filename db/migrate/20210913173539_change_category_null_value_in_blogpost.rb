class ChangeCategoryNullValueInBlogpost < ActiveRecord::Migration[6.1]
  def up
    change_column :blogposts, :category_id, :bigint, null: true
  end

  def down
    change_column :blogposts, :category_id, :bigint, null: false
  end
end

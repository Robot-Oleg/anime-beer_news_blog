class AddIndexToTitleInBlogpost < ActiveRecord::Migration[6.1]
  def change
    add_index :blogposts, :title
  end
end

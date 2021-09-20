class DropBlogpostTags < ActiveRecord::Migration[6.1]
  def change
    drop_table :blogposts_tags
  end
end

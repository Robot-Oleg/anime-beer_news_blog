class AddBlogpostIdToCategory < ActiveRecord::Migration[6.1]
  def change
    change_table :categories do |t|
      t.bigint :blogpost_id
    end

    add_foreign_key :categories, :blogposts
  end
end

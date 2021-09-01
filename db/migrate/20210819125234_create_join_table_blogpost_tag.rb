class CreateJoinTableBlogpostTag < ActiveRecord::Migration[6.1]
  def change
    create_join_table :blogposts, :tags do |t|
    end
  end
end

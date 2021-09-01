class CreateJoinTableUserBlogpost < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :blogposts do |t|
      # t.index [:user_id, :blogpost_id]
      # t.index [:blogpost_id, :user_id]
    end
  end
end

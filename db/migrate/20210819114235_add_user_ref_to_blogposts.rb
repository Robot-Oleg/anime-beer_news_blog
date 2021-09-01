class AddUserRefToBlogposts < ActiveRecord::Migration[6.1]
  def change
    add_reference :blogposts, :user, null: false, foreign_key: true
  end
end

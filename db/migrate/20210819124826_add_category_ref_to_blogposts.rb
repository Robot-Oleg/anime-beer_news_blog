class AddCategoryRefToBlogposts < ActiveRecord::Migration[6.1]
  def change
    add_reference :blogposts, :category, null: false, foreign_key: true
  end
end

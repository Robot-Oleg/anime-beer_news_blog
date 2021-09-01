class AddRegionRefToBlogposts < ActiveRecord::Migration[6.1]
  def change
    add_reference :blogposts, :region, null: false, foreign_key: true
  end
end

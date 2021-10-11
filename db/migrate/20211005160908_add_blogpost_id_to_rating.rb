class AddBlogpostIdToRating < ActiveRecord::Migration[6.1]
  def change
    change_table :ratings do |t|
      t.references :blogpost, null: false, index: true, foreign_key: true
    end
  end
end

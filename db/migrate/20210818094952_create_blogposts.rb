class CreateBlogposts < ActiveRecord::Migration[6.1]
  def change
    create_table :blogposts do |t|
      t.string    :title, null:false
      t.string    :description
      t.string    :text, null:false
      t.string    :status, null: false
      t.boolean   :meangful, default: false
      t.decimal   :avg_rating, null: false

      t.timestamps
    end
  end
end

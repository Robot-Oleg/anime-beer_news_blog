class CreateRssBlogposts < ActiveRecord::Migration[6.1]
  def change
    create_table :rss_blogposts do |t|
      t.string :title, null: false
      t.string :description
      t.string :text, null: false
      t.string :link, null: false

      t.timestamps
    end
  end
end

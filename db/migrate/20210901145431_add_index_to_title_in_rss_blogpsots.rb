class AddIndexToTitleInRssBlogpsots < ActiveRecord::Migration[6.1]
  def change
    add_index :rss_blogposts, :title
  end
end

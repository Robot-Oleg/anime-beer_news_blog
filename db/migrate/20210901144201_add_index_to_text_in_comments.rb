class AddIndexToTextInComments < ActiveRecord::Migration[6.1]
  def change
    add_index :comments, :text
  end
end

class AddCommentableIdAndTypeToComments < ActiveRecord::Migration[6.1]
  def change
    change_table :comments do |t|
      t.string :commentable_type, null: false
      t.bigint :commentable_id, null: false
      t.index :commentable_id
      t.references :user, null: false, index: true, foreign_key: true
    end
  end
end

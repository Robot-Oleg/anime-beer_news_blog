class AddDepthToCommontatorComments < ActiveRecord::Migration[6.1]
  def change
    change_table :commontator_comments do |t|
      t.integer :depth, null: false, default: 0
    end
  end
end

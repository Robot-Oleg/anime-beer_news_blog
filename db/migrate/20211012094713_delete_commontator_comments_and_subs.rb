class DeleteCommontatorCommentsAndSubs < ActiveRecord::Migration[6.1]
  def change
    drop_table :commontator_comments, force: :cascade
    drop_table :commontator_subscriptions, force: :cascade
  end
end

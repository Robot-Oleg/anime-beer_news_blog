class DeleteCommontator < ActiveRecord::Migration[6.1]
  def change
    drop_table :commontator_threads, force: :cascade
  end
end

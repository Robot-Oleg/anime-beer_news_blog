class ChangeBlogpostStatusType < ActiveRecord::Migration[6.1]
  def change
    change_column :blogposts, :status, :integer, using: 'status::integer', null: false, default: 0
  end
end

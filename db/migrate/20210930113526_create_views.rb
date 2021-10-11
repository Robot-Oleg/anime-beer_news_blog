class CreateViews < ActiveRecord::Migration[6.1]
  def change
    create_table :views do |t|
      t.belongs_to :user
      t.belongs_to :blogpost
      t.timestamps
    end
  end
end

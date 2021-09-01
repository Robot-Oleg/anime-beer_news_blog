class AddIndexToNameInRegions < ActiveRecord::Migration[6.1]
  def change
    add_index :regions, :name
  end
end

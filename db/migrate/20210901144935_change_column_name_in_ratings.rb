class ChangeColumnNameInRatings < ActiveRecord::Migration[6.1]
  def change
    change_table :ratings do |t|
      t.rename :starts, :stars
    end
  end
end
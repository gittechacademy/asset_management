class AddTitleToBuysells < ActiveRecord::Migration[5.2]
  def change
    add_column :buysells, :buysell_id, :integer
  end
end

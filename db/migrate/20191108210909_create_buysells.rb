class CreateBuysells < ActiveRecord::Migration[5.2]
  def change
    create_table :buysells do |t|
      t.string :name

      t.timestamps
    end
  end
end

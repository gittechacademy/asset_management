class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :bland, foreign_key: true
      t.integer :number
      t.decimal :money
      t.integer :buying_and_selling

      t.timestamps
    end
  end
end

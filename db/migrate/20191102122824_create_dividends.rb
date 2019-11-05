class CreateDividends < ActiveRecord::Migration[5.2]
  def change
    create_table :dividends do |t|
      t.references :bland, foreign_key: true
      t.decimal :money
      t.string :month

      t.timestamps
    end
  end
end

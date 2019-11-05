class CreateBlands < ActiveRecord::Migration[5.2]
  def change
    create_table :blands do |t|
      t.references :user, foreign_key: true
      t.references :type_name, foreign_key: true
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end

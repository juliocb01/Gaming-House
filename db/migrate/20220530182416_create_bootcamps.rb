class CreateBootcamps < ActiveRecord::Migration[6.1]
  def change
    create_table :bootcamps do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.integer :pc_number
      t.string :name
      t.boolean :availability
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
  end
end

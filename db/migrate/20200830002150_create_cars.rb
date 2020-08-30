class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :color
      t.string :warranty
      t.integer :price
      t.string :body_style
      t.integer :milage

      t.timestamps
    end
  end
end

class AddExcolorToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :ex_color, :string
  end
end

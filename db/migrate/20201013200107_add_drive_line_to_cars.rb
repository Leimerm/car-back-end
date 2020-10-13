class AddDriveLineToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :drive_line, :string
  end
end

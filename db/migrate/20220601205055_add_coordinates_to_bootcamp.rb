class AddCoordinatesToBootcamp < ActiveRecord::Migration[6.1]
  def change
    add_column :bootcamps, :latitude, :float
    add_column :bootcamps, :longitude, :float
  end
end

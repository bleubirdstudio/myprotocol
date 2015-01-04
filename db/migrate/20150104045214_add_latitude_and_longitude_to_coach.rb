class AddLatitudeAndLongitudeToCoach < ActiveRecord::Migration
  def change
    add_column :coaches, :latitude, :float
    add_column :coaches, :longitude, :float
  end
end

class AddLatitudeAndLongitudeToGym < ActiveRecord::Migration
  def change
    add_column :gyms, :latitude, :float
    add_column :gyms, :longitude, :float
  end
end

class AddImageToGyms < ActiveRecord::Migration
  def change
    add_column :gyms, :image, :string
  end
end

class AddImageToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :image, :string
  end
end

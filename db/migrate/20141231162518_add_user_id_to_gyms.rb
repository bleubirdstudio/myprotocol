class AddUserIdToGyms < ActiveRecord::Migration
  def change
    add_column :gyms, :user_id, :integer
  end
end

class AddUserIdToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :user_id, :integer
  end
end

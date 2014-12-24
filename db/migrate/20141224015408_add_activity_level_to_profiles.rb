class AddActivityLevelToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :activity_level, :string
  end
end

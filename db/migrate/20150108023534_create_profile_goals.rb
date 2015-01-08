class CreateProfileGoals < ActiveRecord::Migration
  def change
    create_table :profile_goals do |t|
      t.integer :profile_id
      t.integer :goal_id

      t.timestamps
    end
  end
end

class CreateProfileRestrictions < ActiveRecord::Migration
  def change
    create_table :profile_restrictions do |t|
      t.integer :profile_id
      t.integer :restriction_id

      t.timestamps
    end
  end
end

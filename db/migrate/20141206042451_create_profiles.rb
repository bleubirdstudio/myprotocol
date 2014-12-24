class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :zipcode
      t.string :gender
      t.string :body_type
      t.date :birthday
      t.integer :height
      t.integer :weight
      t.integer :waist
      t.string :blood_type
      t.string :veggies_per_day

      t.timestamps
    end
  end
end

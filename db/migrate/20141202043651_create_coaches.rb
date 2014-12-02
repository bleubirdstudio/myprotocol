class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :business
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone_number
      t.text :certifications
      t.text :bio
      t.string :quote
      t.string :quoter
      t.string :shirt_size

      t.timestamps
    end
  end
end

class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title

      t.timestamps
    end
    Goal.create(title: 'Emotional Wellness')
    Goal.create(title: 'Joint and Bone Health')
    Goal.create(title: 'Athletic Performance')
    Goal.create(title: 'Immunity System')
    Goal.create(title: 'Mental Focus')
    Goal.create(title: 'Libido')
    Goal.create(title: 'Physical Appearance')
    Goal.create(title: 'Energy Levels')
  end
end

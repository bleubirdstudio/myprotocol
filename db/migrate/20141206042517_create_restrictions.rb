class CreateRestrictions < ActiveRecord::Migration
  def change
    create_table :restrictions do |t|
      t.string :title

      t.timestamps
    end
    %w(none vegan vegetarian berries nuts eggs pineapple pea hemp whey gelatin shellfish wheat soybeans fish caffeine rice).each do |title|
      Restriction.create(title: title)
    end
  end
end

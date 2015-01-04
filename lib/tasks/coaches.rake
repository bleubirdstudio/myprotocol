namespace :coaches do
  task with_addresses: :environment do
    csv = SmarterCSV.process('lib/tasks/addresses.csv')
    csv.each_with_index do |row, i|
      u = User.new(email: "testemail#{i}@test.com", password: 'tester123', password_confirmation: 'tester123')
      u.save
      if i%2 == 0
        c = Coach.new(street: row[:street], state: row[:state], city: row[:city], zip: row[:zip], phone_number: row[:phone], bio: 'Test Coach', shirt_size: 'S', business: 'test coach business', name: 'test coach', user: u)
        c.save
      else
        g = Gym.new(name: 'test coach', street: row[:street], state: row[:state], city: row[:city], zip: row[:zip], user: u)
        g.save
      end
    end
  end
end

puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name

locations = %w[ bakersfield bend chico elko fresno goldcountry hanford humbolt klamath losangeles medford mendocino ]
locations += %w[ merced modesto monterey oregoncoast redding reno roseburg sacramento slo santabarbara santamaria ]
locations += %w[ sfbay siskiyou stockton susanville ventura yubasutter ]
locations.each do |loc|
    puts "creating location for #{loc}"
    ClLocation.create({ name: loc })
end

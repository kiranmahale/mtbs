puts "\n---------- Creating User ----------\n"
User.create(email: 'admin@admin.com', password: 'Admin@123', admin: true)
User.create(email: 'test@test.com', password: 'Test@123')

puts "\n---------- Creating Movies ----------\n"
sample_image = File.open("app/assets/images/sample.jpg")
movie1 = Movie.create(name: 'Bahubali - the beginning', description: 'Katappa ne bahubali ko kyu mara', certificate: 'U/A', duration: 180, star_cast: 'Prabhas, Rana, Anushka Shetty', release_date: Date.today)
movie1.poster.attach(io: sample_image, filename: "sample1") rescue nil
movie2 = Movie.create(name: 'Bahubali - the conclusion', description: 'Last la scene kuch bhi tha', certificate: 'U/A', duration: 180, star_cast: 'Prabhas, Rana, Anushka Shetty', release_date: Date.today)
movie2.poster.attach(io: sample_image, filename: "sample2") rescue nil
movie3 = Movie.create(name: 'Dangal', description: 'Dangal test description', certificate: 'U/A', duration: 145, star_cast: 'Amir Khan', release_date: Date.today)
movie3.poster.attach(io: sample_image, filename: "sample3") rescue nil
movie4 = Movie.create(name: 'Tanhanj', description: 'Tanhaji test description', certificate: 'U/A', duration: 145, star_cast: 'Ajay Devgan, Kajol', release_date: Date.today)
movie4.poster.attach(io: sample_image, filename: "sample4") rescue nil

puts "\n---------- Creating Time slots ----------\n"
time_slot1 = TimeSlot.create(start_time: 12, end_time: 15)
time_slot2 = TimeSlot.create(start_time: 16, end_time: 19)
time_slot3 = TimeSlot.create(start_time: 20, end_time: 23)

puts "\n---------- Creating Screen ----------\n"
screen1 = Screen.create(name: 'Screen 1')
screen2 = Screen.create(name: 'Screen 2')
screen3 = Screen.create(name: 'Screen 3')
screen4 = Screen.create(name: 'Screen 4')

puts "\n---------- Creating Screening detail ----------\n"
ScreeningDetail.create(movie_id: movie1.id, screen_id: screen1.id, time_slot_id: time_slot1.id, screening_date: Date.today)
ScreeningDetail.create(movie_id: movie2.id, screen_id: screen2.id, time_slot_id: time_slot2.id, screening_date: Date.today)
ScreeningDetail.create(movie_id: movie3.id, screen_id: screen3.id, time_slot_id: time_slot3.id, screening_date: Date.today)
ScreeningDetail.create(movie_id: movie4.id, screen_id: screen4.id, time_slot_id: time_slot3.id, screening_date: Date.today)

puts "\n---------- Creating Seat template ----------\n"
seat_template = []
seat_template << SeatTemplate.create(seat_key: 'A', seat_type: 'Gold', price: 300).id
seat_template << SeatTemplate.create(seat_key: 'B', seat_type: 'Gold', price: 300).id
seat_template << SeatTemplate.create(seat_key: 'C', seat_type: 'Gold', price: 300).id
seat_template << SeatTemplate.create(seat_key: 'D', seat_type: 'Silver', price: 200).id
seat_template << SeatTemplate.create(seat_key: 'E', seat_type: 'Silver', price: 200).id
seat_template << SeatTemplate.create(seat_key: 'F', seat_type: 'Silver', price: 200).id
seat_template << SeatTemplate.create(seat_key: 'G', seat_type: 'Silver', price: 200).id
seat_template << SeatTemplate.create(seat_key: 'H', seat_type: 'Bronze', price: 150).id
seat_template << SeatTemplate.create(seat_key: 'I', seat_type: 'Bronze', price: 150).id
seat_template << SeatTemplate.create(seat_key: 'J', seat_type: 'Bronze', price: 150).id

puts "\n---------- Assign screen to seat template ----------\n"
screen1.seat_template_ids = seat_template
screen2.seat_template_ids = seat_template
screen3.seat_template_ids = seat_template
screen4.seat_template_ids = seat_template

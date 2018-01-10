namespace :dev do
	task fake_restaurant: :environment do
		Restaurant.destroy_all

		500.times do |i|
			Restaurant.create!(name: FFaker::Name.first_name,
					opening_hours: FFaker::Time.datetime,
					tel: FFaker::PhoneNumber.short_phone_number,
					address: FFaker::Address.street_address,
					description: FFaker::Lorem.paragraph,
					category: Category.all.sample,
					image: File.open(File.join(Rails.root, "/app/assets/images/seed/001.jpg"))
				)
		end
		puts "have created fake restaurants"
		puts "now you have #{Restaurant.count} restaurants data"
	end


	task fake_user: :environment do
		User.destroy_all
		User.create(email: "root@root.com", password: "123456", role: "admin", name: "Eric Admin")

		20.times do |i|
			User.create!(
					email: FFaker::Internet.email,
					password: "123456",
					name: FFaker::Name::unique.name
				)
		end
		puts "root admin and #{User.count} faker users have been created"
	end

	task fake_comment: :environment do
		Comment.destroy_all
		
		Restaurant.all.each do |restaurant|
			3.times do |j|
				restaurant.comments.create!(
					content: FFaker::Lorem.sentence,
					user: User.all.sample
					)
			end
		end
		puts "3 comments are created for each restaurant"
		puts "totally #{Comment.count} comments are created"
	end

	task fake_favourite: :environment do
		100.times do |i|
			Favourite.create!(
				user_id: User.all.sample.id,
				restaurant_id: Restaurant.all.sample.id
				)
		end
		puts "100 favourites are created"
	end


end
namespace :db do
	task populate: :environment do
		4.times do
			FactoryGirl.create :category
		end

		50.times do
			FactoryGirl.create :product
		end

		150.times do
			FactoryGirl.create :review
		end

		FactoryGirl.create :user
		FactoryGirl.create(:user, firstname: 'Mark', lastname: 'Kowalsky', email: 'test@example.com', password: 'password123', admin: true)
	end
end

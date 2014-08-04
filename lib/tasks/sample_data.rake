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
	end
end

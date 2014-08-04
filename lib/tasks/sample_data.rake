namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_categories
		make_products
		make_reviews
	end
end

def make_categories
	5.times do |n|
		name = Faker::Address.city
	end
end

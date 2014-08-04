namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_categories
		make_products
		make_reviews
	end
end

def make_categories
	5.times do
		name = Faker::Commerce.department
		Category.create!(name: name)
	end
end

def make_products
	50.times do
		title = Faker::Commerce.product_name
		description = Faker::Lorem.sentence
		price = Faker::Commerce.price
		category_id = rand(5)+1
		user_id = rand(20)+1
		Product.create!(title: title, description: description,
						price: price, category_id: category_id,
						user_id: user_id)
	end
end

def make_reviews
	150.times do
		content = Faker::Lorem.sentence
		rating = rand(5)+1
		product_id = rand(50)+1
		user_id = rand(20)+1
		Review.create!(content: content, rating: rating,
					   product_id: product_id, user_id: user_id)
	end
end

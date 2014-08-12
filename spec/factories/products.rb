# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    #title "MyString"
    #description "MyText"
    #price 1.5
	title { Faker::Commerce.product_name }
	description { Faker::Lorem.sentence }
	price { Faker::Commerce.price }
	category_id { rand(4)+1 }
	user_id { rand(20)+1 }
  end
end

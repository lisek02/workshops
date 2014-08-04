# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    #content "MyText"
    #rating 1
    content { Faker::Lorem.sentence }
	rating { rand(5)+1 }
	product_id { rand(50)+1 }
	user_id { rand(20)+1 }
  end
end

class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :title, presence: true
  validates :description, presence: true
  VALID_PRICE_REGEX = /\A\d+\.\d{1,2}\z/
  validates :price, presence: true, format: { with: VALID_PRICE_REGEX }
end

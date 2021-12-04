class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :seller
  has_many :product_sales
end

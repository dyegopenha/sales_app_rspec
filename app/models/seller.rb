class Seller < ApplicationRecord
    validates :name,  presence: true
    validates :email, presence: true
    validates :phone, presence: true
    validates :address, presence: true
	has_many :sales
end

class Category < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	has_many :restaurants, dependent: :destroy
end

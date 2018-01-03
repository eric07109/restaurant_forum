class Category < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	has_many :restaurants, dependent: :restrict_with_error
end

class Restaurant < ApplicationRecord
	mount_uploader :image, PhotoUploader
	validates_presence_of :name

	belongs_to :category, optional: true
	delegate :name, to: :category, prefix: true, allow_nil: true

	#Comment Implementation
	has_many :comments, dependent: :destroy

	#Favourite Implementation
	has_many :favourites, dependent: :destroy
	has_many :favourite_users, through: :favourites, source: :user

	#Like Implementation
	has_many :likes, dependent: :destroy
	has_many :liked_users, through: :likes, source: :user

	def is_favourite?(user)
		self.favourite_users.include?(user)
	end

	def is_liked?(user)
		self.liked_users.include?(user)
	end
end

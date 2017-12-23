class Restaurant < ApplicationRecord
	mount_uploader :image, PhotoUploader
	validates_presence_of :name

	belongs_to :category, optional: true
	delegate :name, to: :category, prefix: true, allow_nil: true

	has_many :comments
end

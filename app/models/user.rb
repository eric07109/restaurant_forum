class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :email

  #For Comment implementation
  has_many :comments, dependent: :restrict_with_error
  has_many :commented_restaurants, through: :comments, source: :restaurant

  #For Favourite Restaurant Implementation
  has_many :favourites, dependent: :destroy
  has_many :favourite_restaurants, through: :favourites, source: :restaurant

  #For Liked Restaurant Implementation
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  #Followships
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

  has_many :inverse_followships, class_name: "Followship", foreign_key: "following_id"
  has_many :followers, through: :inverse_followships, source: :user

  #Friendships
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  mount_uploader :avatar, UserAvatarUploader

  def admin?
  	self.role == "admin"
  end

  def following?(user)
    self.followings.include?(user)
  end

  def friend_of?(user)
    self.friends.include?(user)
  end


end

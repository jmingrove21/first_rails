class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :nullify
  has_many :likes
  has_many :like_posts, through: :likes, source: :post
  
  # following
  has_many :follows, dependent: :destroy
  has_many :followings, through: :follows, source: :target

  # follower
  has_many :received_follows, class_name: "Follow", foreign_key: :target_id, dependent: :destroy
  has_many :followers, through: :received_follows, source: :user

  mount_uploader :image, ImageUploader
end

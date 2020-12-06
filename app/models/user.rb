class User < ApplicationRecord
  has_many :followers_ref, foreign_key: :follower_id , class_name: "Friendship"
  has_many :followed, through: :followers_ref
  has_many :followed_ref, foreign_key: :followed_id, class_name: "Friendship"
  has_many :followers, through: :followed_ref

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_confirmation

  has_secure_password

  def user_name
    email.split('@').first
  end

  def self.user_exist?(user)
    User.where('lower(email) like ?', "%#{user.downcase}%").present?
  end
end

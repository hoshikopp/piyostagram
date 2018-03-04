class Post < ApplicationRecord
  belongs_to :user
  has_many :nices, dependent: :destroy
  has_many :nice_users, through: :nices, source: :user
  validates :content, length:{ maximum:1000 }
  mount_uploader :image, ImageUploader


  def created_by?(user)
    return false unless user
    user_id == user.id
  end

end

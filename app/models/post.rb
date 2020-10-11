class Post < ApplicationRecord
  belongs_to :user
  has_many :categories, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 800 }
end

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 800 }
end

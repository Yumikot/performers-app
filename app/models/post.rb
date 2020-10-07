class Post < ApplicationRecord
  belongs_to :user, optional: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 800 }
end

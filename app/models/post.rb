class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  #liked_usersによって投稿が誰にいいねされているのかを簡単に取得
  has_many :liked_users, through: :likes, source: :user
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 800 }
  def Post.search(search)
    Post.all
  end
end

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true 
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  #liked_postsによってuserがどの投稿をいいねしているのかを簡単に取得
  has_many :like_posts, through: :likes, source: :post
  mount_uploader :profile_image, ImageUploader
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end

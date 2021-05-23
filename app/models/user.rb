class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true 
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username="ゲスト"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end

  #liked_postsによってuserがどの投稿をいいねしているのかを簡単に取得
  has_many :like_posts, through: :likes, source: :post
  mount_uploader :profile_image, ImageUploader
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end

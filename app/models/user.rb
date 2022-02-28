class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  def load_recent_three_posts
    post.includes(:commenst).order(created_at: :desc).limit(3)
  end
end

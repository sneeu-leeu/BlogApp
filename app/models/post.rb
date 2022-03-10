class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def load_recent_five_comments
    comments.order(created_at: :desc).limit(5)
  end
end

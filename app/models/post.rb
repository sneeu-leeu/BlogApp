class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 } 

  def load_recent_five_comments
    comments.order('created_at Desc').limit(5)
  end

  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end

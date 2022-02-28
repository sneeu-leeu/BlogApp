class Post < ApplicationRecord

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def load_recent_five_comments
    comment.order(created_at: :desc).limit(5)
  end
end

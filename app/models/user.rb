class User < ApplicationRecord
  has_many :posts, class_name: "Post", foreign_key: "user_id"
  has_many :comments, class_name: "Comment", foreign_key: "post_id"
  has_many :likes, class_name: "Like", foreign_key: "post_id"

  def 
end

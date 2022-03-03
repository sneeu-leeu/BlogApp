require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    subject { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
    subject { Post.new(author_id: 1, title: 'post', text: 'text test') }
    subject { Comment.new(text: 'text test', author_id: 1, post_id: 1) }

    before { subject.save }

    it 'check if it increases the comments' do
      old_comments_counter = Post.find(1).comments_counter
      subject.update_comments_counter
      expect(Post.find(1).comments_counter).to eq(old_comments_counter + 1)
    end
  end
end

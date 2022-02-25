require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    subject { Comment.new(text: 'text test', user_id: 2, post_id: 1) }

    before { subject.save }

    it 'check if it increases the comments' do
      old_comments_counter = Post.find(1).comments_counter
      subject.update_comments_counter
      expect(Post.find(1).comments_counter).to eq(old_comments_counter + 1)
    end
  end
end

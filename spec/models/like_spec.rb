require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Like model' do
    subject { Like.new(author_id: 1, post_id: 1) }

    before { subject.save }

    it 'check if it increases the comments' do
      old_likes_counter = Post.find(1).likes_counter
      subject.update_likes_counter
      expect(Post.find(1).likes_counter).to eq(old_likes_counter + 1)
    end
  end
end
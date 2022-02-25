require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post model' do
    subject { Post.new(title: 'title test', text: 'text test', user_id: 1) }

    before { subject.save }

    it 'check if it increases the comments' do
      old_posts_counter = User.find(1).posts_counter
      subject.update_posts_counter
      expect(User.find(1).posts_counter).to eq(old_posts_counter + 1)
    end

    it 'check if the title is not blank' do
      subject.title = ''
      expect(subject).to_not be_valid
    end

    it 'check if the title is not exceeding 250 characters' do
      subject.title = 'test test test test test test test test test test test test test test test test
      test test test test test test test test test test test test test test test test test test test test
      test test test test test test test test test test test test test test test test test test test'
      expect(subject).to_not be_valid
    end
  end
end

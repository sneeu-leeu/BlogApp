require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    subject { User.new(name: 'test user', photo: 'avatar.png', bio: 'test bio', posts_counter: 0) }

    before { subject.save }

    it 'check if the name is not blank' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'check if the posts_counter numeric' do
      subject.posts_counter = 'hello'
      expect(subject).to_not be_valid
    end

    it 'check if the posts_counter greater than or equal to zero' do
      expect(subject.posts_counter).to be >= 0
    end
  end
end

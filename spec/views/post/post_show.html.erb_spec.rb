require 'rails_helper'

RSpec.describe 'post/post_show', type: :view do
  describe 'posts show page' do
    before(:each) do
      @user1 = User.create(name: 'Max', photo: 'verstappen.png', bio: 'Max Bio', posts_counter: 0,
                           email: 'maxverstappen@f1.com', password: 'redbull', confirmed_at: Time.now)

      @user2 = User.create(name: 'Lewis', photo: 'hamilton.png', bio: 'Lewis Bio', posts_counter: 0,
                           email: 'lewishamilton@f1.com', password: 'mercedes')

      visit root_path
      fill_in 'Email', with: 'maxverstappen@f1.com'
      fill_in 'Password', with: 'redbull'
      click_button 'Log in'

      @post1 = Post.create(title: 'Max Post', text: 'This is Max Post', comments_counter: 0, likes_counter: 0,
                           user: @user1)
      @post2 = Post.create(title: 'Lewis Post', text: 'This is Lewis Post', comments_counter: 0, likes_counter: 0,
                           user: @user1)
      @post3 = Post.create(title: 'Valtteri Post', text: 'This is Valtteri Post', comments_counter: 0,
                           likes_counter: 0, user: @user1)

      @comment1 = Comment.create(text: 'Hey Max', user: User.first, post: Post.first)
      @comment2 = Comment.create(text: 'Hey Again', user: User.first, post: Post.first)

      visit user_post_path(@user1, @post1)
    end

    it 'displays post title' do
      expect(page).to have_content('Max Post')
    end

    it 'displays the post author' do
      expect(page).to have_content('Max')
    end

    it 'displays the number of comments' do
      post = Post.first
      expect(page).to have_content(post.likes_counter)
    end

    it 'displays the post text' do
      expect(page).to have_content('This is Max Post')
    end

    it 'displays the author of each comment' do
      post = Post.first
      comment = post.comments.first
      expect(page).to have_content(comment.user.name)
    end

    it 'displays the comment of each commentor' do
      expect(page).to have_content('Hey Max')
      expect(page).to have_content('Hey Again')
    end
  end
end

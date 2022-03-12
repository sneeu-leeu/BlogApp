require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'Stephan', photo: 'icon.png', password: '123456789', email: 'Steph@yahoo.com',
                            confirmed_at: Time.now
      @user2 = User.create! name: 'User2', photo: 'icon.png', password: '123456', email: 'Steph@gmail.com',
                            confirmed_at: Time.now
      visit new_user_session_path
      fill_in 'Email', with: 'steph@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit root_path
    end

    it 'shows the username of other users' do
      expect(page).to have_content('Stephan')
      expect(page).to have_content('User2')
    end

    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(2)
    end

    it 'shows number of posts for each user' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'show users page when clicked' do
      click_on 'Stephan'
      expect(page).to have_current_path user_path(@user1)
    end
  end
end

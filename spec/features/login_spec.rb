require 'rails_helper'
RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }

  scenario 'displays email, password form fields, and log in button' do
    expect(page).to have_field('user[email]')
    expect(page).to have_field('user[password]')
    expect(page).to have_button('Log in')
  end

  context 'Sign in' do
    scenario 'Try to sign in with blank fields' do
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    scenario 'Try to sign with incorrect data' do
      within 'form' do
        fill_in 'Email', with: 'lewishamilton@f1.com'
        fill_in 'Password', with: '123'
      end

      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end
end

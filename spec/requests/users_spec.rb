require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:each) do
      get users_path
    end

    it 'should returns http 200 success' do
      expect(response).to have_http_status(200)
    end

    it 'displays the correct template' do
      expect(response).to render_template(:index)
    end

    it 'has the correct placeholder text' do
      expect(response.body).to include('Here you will find a list of all the users')
    end
  end

  describe 'GET #show' do
    before(:each) do
      get user_path(1)
    end

    it 'should have the correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'displays the correct template' do
      expect(response).to render_template(:show)
    end

    it 'displays the correct placeholder text' do
      # rubocop:todo Layout/LineLength
      expect(response.body).to include('Here you will find a specific user. The page will display user name, number of posts, bio and a summary of the posts')
      # rubocop:enable Layout/LineLength
    end
  end
end

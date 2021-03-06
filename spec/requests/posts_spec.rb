require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:each) do
      get user_posts_path(1)
    end

    it 'should return http 200 success' do
      expect(response).to have_http_status(200)
    end

    it 'displays the correct template' do
      expect(response).to render_template(:index)
    end

    it 'has the correct placeholder text' do
      # rubocop:todo Layout/LineLength
      expect(response.body).to include("Here you will find a users' posts in summary form with the comments showing under.")
      # rubocop:enable Layout/LineLength
    end
  end

  describe 'GET #show' do
    before(:each) do
      get user_post_path(1, 3)
    end

    it 'should have the correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'displays the correct template' do
      expect(response).to render_template(:show)
    end

    it 'displays the correct placeholder text' do
      # rubocop:todo Layout/LineLength
      expect(response.body).to include("Here you will find a users' specific post. The full post will be rendered with the full comment section under.")
      # rubocop:enable Layout/LineLength
    end
  end
end

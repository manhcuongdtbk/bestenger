require 'rails_helper'

RSpec.describe 'Users' do
  describe 'GET /index' do
    before do
      sign_in(create(:user))
    end

    it 'returns http success' do
      get '/users'

      expect(response).to have_http_status(:success)
    end
  end
end

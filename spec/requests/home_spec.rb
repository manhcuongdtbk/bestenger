require 'rails_helper'

RSpec.describe 'Homes' do
  describe 'GET /index' do
    context 'when user is not signed in' do
      it 'redirects to sign in page' do
        get '/'

        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is signed in' do
      before do
        sign_in(create(:user))
      end

      it 'returns http success' do
        get '/'

        expect(response).to have_http_status(:success)
      end
    end
  end
end

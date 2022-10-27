require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe 'GET #index' do
    subject { get :index }

    let(:articles) { create_list(:article, 5) }

    context 'when user sign in' do
      let(:user) { create(:user) }
      before { sign_in user }
      it 'return http status ok' do
        is_expected.to have_http_status(:ok)
        expect(assigns(:articles)).to match_array(articles)
      end
    end

    context 'when user not sign in' do
      it 'return http status found' do
        is_expected.to have_http_status(:found)
      end
    end
  end

end

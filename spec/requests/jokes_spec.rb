require 'rails_helper'

RSpec.describe 'Jokes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/jokes'
      expect(response).to have_http_status(:found)
    end
  end
end

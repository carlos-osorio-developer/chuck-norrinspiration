require 'rails_helper'

RSpec.describe 'Welcomes', type: :request do
  describe 'GET Homepage' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:found)
    end
  end
end

require 'rails_helper'

RSpec.feature 'Welcome', type: :feature do
  before :each do
    DatabaseCleaner.clean
    user = FactoryBot.create(:user)
    sign_in(user)
  end

  describe 'list of jokes' do
    it 'renders a list of jokes' do
      visit '/'
      click_link 'Get a new joke'
      find(:css, 'button.btn.btn-danger').click
      visit '/'
      click_link 'My Jokes', match: :first
      expect(page).to have_content('Joke #1')
    end
  end
end

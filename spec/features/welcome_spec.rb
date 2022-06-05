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

  describe 'click NewJoke button' do    
    it 'shows Chuck Norris joke' do
      visit '/'
      click_link 'Get a new joke'
      expect(page).to have_content('Chuck Norris')
    end

    it 'saves the joke if like button is clicked' do
      visit '/'
      click_link 'Get a new joke'
      find(:css, 'button.btn.btn-danger').click
      expect(Joke.all.count).to eq(1)
    end

    it 'saves the like if like button is clicked' do
      visit '/'
      click_link 'Get a new joke'
      find(:css, 'button.btn.btn-danger').click
      expect(Like.all.count).to eq(1)
    end
  end
end

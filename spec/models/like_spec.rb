require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'unique like' do
    let(:user) { FactoryBot.create(:user) }
    let(:joke) { FactoryBot.create(:joke) }
    it 'is valid with valid attributes' do
      expect(Like.new(user_id: user.id, joke_id: joke.id)).to be_valid
    end
  end
  context 'repeated like' do
    let(:like) { Like.create(user_id: 1, joke_id: 1) }
    it 'is invalid with repeated attributes' do
      expect(Like.new(user_id: 1, joke_id: 1)).to_not be_valid
    end
  end
end

require 'rails_helper'

RSpec.describe Joke, type: :model do
  context 'unique joke' do
    it 'is valid with valid attributes' do
      expect(FactoryBot.build(:joke)).to be_valid
    end
  end
  context 'repeated joke' do
    let(:joke) { FactoryBot.create(:joke) }
    it 'is invalid with repeated attributes' do
      expect(FactoryBot.build(:joke, api_id: joke.api_id)).to_not be_valid
    end
  end
end

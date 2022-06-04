require 'rails_helper'

RSpec.describe User, type: :model do
  context 'unique user' do    
    it 'is valid with valid attributes' do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end
  context 'repeated user' do
    let(:user) { FactoryBot.create(:user) }
    it 'is invalid with repeated attributes' do
      expect(FactoryBot.build(:user, email: user.email)).to_not be_valid
    end
  end
end

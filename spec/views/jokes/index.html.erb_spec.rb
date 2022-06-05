require 'rails_helper'

RSpec.describe 'jokes/index', type: :view do
  context 'empty jokes' do
    it 'renders a list of jokes' do
      render
      expect(rendered).to have_content("You haven't added any jokes yet")
    end
  end
end

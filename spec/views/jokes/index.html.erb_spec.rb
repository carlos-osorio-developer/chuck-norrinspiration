require 'rails_helper'

RSpec.describe 'jokes/index', type: :view do
  before(:each) do
    @joke = assign(:joke, Joke.create!(
                            api_id: 'Api1',
                            content: 'Joke1'
                          ))
    @joke2 = assign(:joke2, Joke.create!(
                              api_id: 'Api2',
                              content: 'Joke2'
                            ))
  end
  it 'renders a list of jokes' do
    render
    expect(rendered).to match(/Joke1/)
    expect(rendered).to match(/Joke2/)
  end
end

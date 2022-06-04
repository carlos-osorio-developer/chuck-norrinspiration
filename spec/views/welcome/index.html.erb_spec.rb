require 'rails_helper'

RSpec.describe 'welcome/index', type: :view do
  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Get a new joke/)
  end
end

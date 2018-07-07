require 'rails_helper'

RSpec.describe 'Starred Repos Page' do
  it 'should have a heading' do
    visit '/starred_repos'

    expect(page).to have_content()
  end
end

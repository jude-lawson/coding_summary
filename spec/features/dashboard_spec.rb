require 'rails_helper'

RSpec.describe 'Dashboard Page' do
  before :each do
    @user_data = JSON.parse(File.read('spec/fixtures/single_user_hash.json'))
  end
  it 'should display a heading' do
    visit '/dashboard'

    expect(page).to have_content('GitHub Coding Summary')
  end

  it 'should display a image, name, and username in the profile section' do
    visit '/dashboard'

    within('#profile') do
      expect(page).to have_css("img[src='#{@user_data['avatar_url']}']")
      expect(page).to have_content(@user_data['name'])
      expect(page).to have_content("@#{@user_data['login']}")
    end
  end
end

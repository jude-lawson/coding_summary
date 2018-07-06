require 'rails_helper'

RSpec.describe 'Dashboard Page' do
  before :each do
    @user_data = JSON.parse(File.read('spec/fixtures/single_user_hash.json'))
    @the_user = JSON.parse(File.read('spec/fixtures/auth_hash.json'))
    @followers_data = JSON.parse(File.read('spec/fixtures/followers.json'))
    @followers = File.read('spec/fixtures/followers.json')
    @followings_data = JSON.parse(File.read('spec/fixtures/following.json'))
    @starred_repos = File.read('spec/fixtures/starred_repos.json')

    stub_request(:any, "https://api.github.com/users/#{@user_data['login']}/starred")
      .with(query: { access_token: @the_user['credentials']['token'] })
      .to_return(status: 200, body: @starred_repos)
    
    stub_request(:any, "https://api.github.com/users/#{@user_data['login']}/followers")
      .with(query: { access_token: @the_user['credentials']['token'] })
      .to_return(status: 200, body: @followers)
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

  it 'should display followers, following, and starred repos in the stats section' do
    visit '/dashboard'

    within('#stats') do
      expect(page).to have_link('Followers')
      expect(page).to have_link('Following')
      expect(page).to have_link('Starred Repos')

      expect(page).to have_content("Followers: #{@user_data['followers']}")
      expect(page).to have_content("Following: #{@user_data['following']}")
      expect(page).to have_content("Starred Repos: 3")
    end
  end
end

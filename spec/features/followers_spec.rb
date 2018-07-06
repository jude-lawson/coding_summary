require 'rails_helper'

RSpec.describe 'Followers Page' do
  before :each do
    @user_data = JSON.parse(File.read('spec/fixtures/single_user_hash.json'))
    @the_user = JSON.parse(File.read('spec/fixtures/auth_hash.json'))
    @user_info = JSON.parse(File.read('spec/fixtures/single_user_hash.json'))
    @followers = JSON.parse(File.read('spec/fixtures/followers.json'))
    user = User.create_from_auth_info(@the_user, @the_user['credentials']['token'])

    stub_request(:any, "https://api.github.com/users/#{@user_data['login']}/starred")
      .with(query: {access_token: @the_user['credentials']['token']})
      .to_return(status: 200, body: @starred_repos)
    
    stub_request(:any, "https://api.github.com/users/#{@user_data['login']}/followers")
      .with(query: { access_token: @the_user['credentials']['token'] })
      .to_return(status: 200, body: @followers)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it 'should have a heading with the user\'s name' do
    visit '/followers'

    expect(page).to have_content("#{@user_info['name']}'s Followers'")
  end

  it 'should have a count of followers' do
    visit '/followers'

    expect(page).to have_content("Number of Followers: #{@followers.count}")
  end

  it 'should have the followers\' usernames as links to their actual github pages' do
    visit '/followers'

    @followers.each do |follower|
      expect(page).to have_link(follower['login'])
      within("#follower-#{follower['id']}") do
        expect(page).to have_css("a[href='#{follower['html_url']}']")
      end
    end
  end
end

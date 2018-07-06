require 'rails_helper'

RSpec.describe 'Following Page' do
  before :each do
    @user_data = JSON.parse(File.read('spec/fixtures/single_user_hash.json'))
    @the_user = JSON.parse(File.read('spec/fixtures/auth_hash.json'))
    user = User.create_from_auth_info(@the_user, @the_user['credentials']['token'])

    @following_data = JSON.parse(File.read('spec/fixtures/following.json'))
    @following = File.read('spec/fixtures/following.json')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    stub_request(:any, "https://api.github.com/users/#{@user_data['login']}/following")
      .with(query: { access_token: @the_user['credentials']['token'] })
      .to_return(status: 200, body: @following)
  end

  it 'should have a heading with the user\'s name in it' do
    visit '/following'

    expect(page).to have_content("#{@user_data['name']}'s Favorite Users'")
  end

  it 'should have the number of users the user is following' do
    visit '/following'

    expect(page).to have_content("Number of Favorite Users: #{@following_data.count}")
  end

  it 'should have a list of the user\'s favorite users usernames as links to their respective GitHubs' do
    visit '/following'

    @following_data.each do |fave_user|
      expect(page).to have_link(fave_user['login'])
      within("#user-#{fave_user['id']}") do
        expect(page).to have_css("a[href='#{fave_user['html_url']}']")
      end
    end
  end
end

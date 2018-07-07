require 'rails_helper'

RSpec.describe 'Starred Repos Page' do
  let(:user_auth) { JSON.parse(File.read('spec/fixtures/auth_hash.json')) }
  let(:user) { User.create_from_auth_info(user_auth, user_auth['credentials']['token']) }
  let(:starred_repos_data) { JSON.parse(File.read('spec/fixtures/starred_repos.json')) }
  let(:starred_repo) { starred_repos_data.first }

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    stub_request(:any, "https://api.github.com/users/#{user.username}/starred")
      .with(query: { access_token: user.token })
      .to_return(status: 200, body: File.read('spec/fixtures/starred_repos.json'))
  end

  it 'should have a heading' do
    visit '/starred_repos'

    expect(page).to have_content("#{user.name}'s Starred Repos'")
  end

  it 'should have a count of the starred repos' do
    visit '/starred_repos'

    expect(page).to have_content("Number of Starred Repos: #{starred_repos_data.count}")
  end

  it 'should have a list of the starred repos with the appropriate data' do
    visit '/starred_repos'

    starred_repos_data.each do |starred_repo|
      within("#starred-repo-#{starred_repo['id']}") do
        expect(page).to have_content(starred_repo['name'])
        expect(page).to have_content("By: #{starred_repo['owner']['login']}")
        expect(page).to have_content(starred_repo['description'])
        expect(page).to have_css("a[href='#{starred_repo['html_url']}']")
        expect(page).to have_css("a[href='#{starred_repo['owner']['html_url']}']")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe StarredRepo do
  let(:starred_repo_data) { JSON.parse(File.read('spec/fixtures/starred_repos.json')).first }
  let(:starred_repo) { StarredRepo.new(starred_repo_data) }

  it 'should have an id attribute' do
    expect(starred_repo.id).to eq(starred_repo_data['id'])
  end

  it 'should have a name attribute' do
    expect(starred_repo.name).to eq(starred_repo_data['name'])
  end

  it 'should have a description attribute' do
    expect(starred_repo.description).to eq(starred_repo_data['description'])
  end
  
  it 'should have a repo_url attribute' do
    expect(starred_repo.repo_url).to eq(starred_repo_data['html_url'])
  end

  it 'should have an owner attribute' do
    expect(starred_repo.owner).to eq(starred_repo_data['owner']['login'])
  end

  it 'should have an owner_url attribute' do
    expect(starred_repo.owner_url).to eq(starred_repo_data['owner']['html_url'])
  end
end

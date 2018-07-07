require 'rails_helper'

RSpec.describe FaveUser do
  let(:fave_user_data) { JSON.parse(File.read('spec/fixtures/following.json')).first }
  let(:fave_user) { FaveUser.new(fave_user_data) }

  it 'should have an id' do
    expect(fave_user.id).to eq(fave_user_data['id'])
  end

  it 'should have an login' do
    expect(fave_user.login).to eq(fave_user_data['login'])
  end

  it 'should have an url' do
    expect(fave_user.url).to eq(fave_user_data['html_url'])
  end
end

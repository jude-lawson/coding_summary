require 'rails_helper'

RSpec.describe Follower do
  let(:follower_data) { JSON.parse(File.read('spec/fixtures/followers.json')).first }
  let(:follower) { Follower.new(follower_data) }

  describe 'Attributes' do
    it 'should have a login' do
      expect(follower.login).to eq(follower_data['login'])
    end
    
    it 'should have an html_url' do
      expect(follower.url).to eq(follower_data['html_url'])
    end

    it 'should have an id' do
      expect(follower.id).to eq(follower_data['id'])
    end
   end
end

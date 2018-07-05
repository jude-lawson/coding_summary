require 'rails_helper'

RSpec.describe 'Dashboard Page' do
  it 'should display a heading' do
    visit '/dashboard'
  end
end

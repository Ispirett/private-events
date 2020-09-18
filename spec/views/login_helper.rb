require 'rails_helper'

RSpec.describe 'Hello world', type: :system do

  describe 'index page' do
    it 'shows the right content' do
      visit new_session_users_path
      expect(page).to have_content('Username')
    end
  end
end

describe "the signin process", type: :feature do
  # before :each do
  #   User.make(username: 'umair.ahmad')
  # end

  it "signs me in" do
    visit new_session_users_path
    within("#test") do
      fill_in 'username', with: 'umair.ahmad'
    end
    click_button 'Sign in'
    expect(page).to have_content 'sucess'
  end
end
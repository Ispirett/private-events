require 'rails_helper'

RSpec.describe 'sign up page', type: :system do

  describe 'sign up page' do
    it 'shows the right content' do
      visit new_user_path
      expect(page).to have_content('Username')
    end
  end
end

describe "the signup process", type: :feature do
  it "sign up a new user" do
    visit new_user_path
    within("#test_signup") do
      fill_in 'user[username]', with: 'umair.ahmad'
      fill_in 'user[first_name]', with: 'umair'
      fill_in 'user[last_name]', with: 'ahmad'
      fill_in 'user[email]', with: 'umair.ahmad@gmail.com'
    end
    click_button 'Sign Up'
    expect(page).to have_content "Sign Up"
  end
end
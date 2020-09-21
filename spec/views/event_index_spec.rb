require 'rails_helper'

describe 'the user show page process', type: :feature do
  it 'sign up a new user and login to show page' do
    visit new_user_path
    within('#test_signup') do
      fill_in 'user[username]', with: 'umair.ahmad'
      fill_in 'user[first_name]', with: 'umair'
      fill_in 'user[last_name]', with: 'ahmad'
      fill_in 'user[email]', with: 'umair.ahmad@gmail.com'
    end
    click_button 'Sign Up'
    expect(page).to have_content 'Sign Up'

    visit new_session_users_path
    expect(page).to have_content('Username')

    within('#test') do
      fill_in 'username', with: 'umair.ahmad'
    end
    click_button 'Sign in'

    visit new_event_path

    within('#event-form') do
      fill_in 'event[event_name]', with: 'gand party'
      fill_in 'event[event_place]', with: '288 paragon'
      fill_in 'event[event_date]', with: DateTime.now
    end

    click_button 'Create Event'

    visit events_path
    expect(page).to have_content('gand party')
  end
end

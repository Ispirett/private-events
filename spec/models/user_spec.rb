require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    User.create(username: 'talha1', email: 'talha1@gmail.com',
                first_name: 'Talha', last_name: 'Waqar')
  end
  let!(:user2) { User.create }

  DatabaseCleaner.start

  describe User do
    context 'validates username' do
      it { should validate_presence_of(:username) }
      it { should validate_uniqueness_of(:username) }
    end

    context 'validates first name' do
      it { should validate_presence_of(:first_name) }
    end

    context 'validates last name' do
      it { should validate_presence_of(:last_name) }
    end

    context 'validates email' do
      it { should validate_presence_of(:email) }
      it { should validate_uniqueness_of(:email) }
      it { should allow_value('abc@gmail.com').for(:email) }
      it { should_not allow_value('abcgmail.com').for(:email) }
    end

    context 'associations' do
      it { should have_many(:event_attendees) }
      it { should have_many(:events) }
      it { should have_many(:created_events) }
      it { should have_one_attached(:avatar) }
    end
  end
  DatabaseCleaner.clean
end

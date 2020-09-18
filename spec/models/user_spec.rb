require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create(username: 'talha1', email: 'talha1@gmail.com', 
  first_name: 'Talha', last_name: 'Waqar') }
  let!(:user2) { User.create }
  let!(:user3) { User.create(username: 'talha1', email: 'talha1@gmail.com', 
  first_name: 'Talha', last_name: 'Waqar') }
  let!(:user4) { User.create(username: 'talha.waqar', email: 'talha1@gmail.com', 
  first_name: 'Talha', last_name: 'Waqar') }

  DatabaseCleaner.start

  context 'a user with a unique username' do
    # before { user }
    it 'is valid' do
      expect(user.valid?).to be(true)
    end

    it 'is not valid' do
      expect(user2.valid?).to be(false)
    end

    it 'is not valid' do
      expect(user3.valid?).to be(false)
    end
  end

  # describe "Associations" do
  #   it { should has_many(:event_attendees) }
  # end
  DatabaseCleaner.clean
end

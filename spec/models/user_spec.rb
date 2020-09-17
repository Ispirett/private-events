require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create(username: 'talha1') }
  let!(:user2) { User.create }
  DatabaseCleaner.start

  context 'a user with a unique name' do
    # before { user }
    it 'is valid' do
      expect(user.valid?).to be(true)
    end

    it 'is not valid' do
      expect(user2.valid?).to be(false)
    end
  end
  DatabaseCleaner.clean
end

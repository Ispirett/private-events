require 'rails_helper'

RSpec.describe Event, type: :model do
  DatabaseCleaner.start

  describe Event do
    context 'validates event name' do
      it { should validate_presence_of(:event_name) }
    end

    context 'validates event place' do
      it { should validate_presence_of(:event_place) }
    end

    context 'validates event date' do
      it { should validate_presence_of(:event_date) }
    end

    context 'associations' do
      it { should have_many(:event_attendees) }
      it { should have_many(:attendees) }
      it { should belong_to(:creator) }
      it { should have_one_attached(:event_image) }
    end
  end
  DatabaseCleaner.clean
end

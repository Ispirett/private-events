require 'rails_helper'

RSpec.describe EventAttendee, type: :model do
  
  DatabaseCleaner.start

  describe EventAttendee do

    context 'associations' do
        it { should belong_to(:attendee) }
        it { should belong_to(:event) }
    end
  end
  DatabaseCleaner.clean
end

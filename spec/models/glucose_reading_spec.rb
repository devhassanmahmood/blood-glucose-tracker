# frozen_string_literal: true

RSpec.describe GlucoseReading, type: :model do

  it { is_expected.to validate_presence_of(:level) }
  it { is_expected.to belong_to(:user) }
    let(:user) { create :user }

  describe '#check_reading_count' do
    let(:date) {Time.zone.now}
    let!(:glucose_reading1) { create :glucose_reading, user: user, created_at: date }
    let!(:glucose_reading2) { create :glucose_reading, user: user, created_at: date }
    let!(:glucose_reading3) { create :glucose_reading, user: user, created_at: date }
    let!(:glucose_reading4) { create :glucose_reading, user: user, created_at: date }

    it "validate reading count" do 
    error = GlucoseReading.create(user: user, created_at: date, level: 120)
      expect(error.errors.full_messages.first).to eq('You can only save 4 Readings Per day.')
    end
  end
end
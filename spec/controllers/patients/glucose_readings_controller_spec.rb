require 'rails_helper'
RSpec.describe Patients::GlucoseReadingsController, type: :controller do
  describe "GET /index" do
    let!(:user) { create(:user) }
    let!(:glucose_reading1) { create :glucose_reading, user: user, created_at: Time.zone.now }
    let!(:glucose_reading2) { create :glucose_reading, user: user, created_at: Time.zone.now }
    let!(:glucose_reading3) { create :glucose_reading, user: user, created_at: Time.zone.now }
    let!(:glucose_reading4) { create :glucose_reading, user: user, created_at: Time.zone.now }

    before do
      sign_in user
      get :index, params: {date: Time.zone.now}
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(assigns['daily_report'].count).to eq 4 }
    it { expect(assigns['month_to_date_report'].count).to eq 4 }
    it { expect(assigns['month_to_date_report'].count).to eq 4 }
  end

  describe "POST /create" do
    let!(:user) { create(:user) }

    before do
      sign_in user
    end
    
    context 'when created succesfully' do
      before do
        params = { "glucose_reading": {"level": 120, "user_id": user.id} }
        post :create, params: params
      end

      it { expect(response).to redirect_to(patient_root_path) }
      it { expect(GlucoseReading.count).to eq 1 }
    end

    context 'when incorrect params' do
      before do
        params = { "glucose_reading": {"user_id": user.id} }
        post :create, params: params
      end

      it { expect(GlucoseReading.count).to eq 0 }
    end
  end
end
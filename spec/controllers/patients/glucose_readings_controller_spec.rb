require 'rails_helper'
RSpec.describe Patients::GlucoseReadingsController, type: :controller do
  describe "GET /index" do
    let!(:user) { create(:user) }
    before do
      sign_in user
      get :index, params: {date: Time.zone.now}
    end
    it { expect(response).to have_http_status(:ok) }
  end
end
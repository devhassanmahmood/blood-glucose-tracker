module Patients
  class GlucoseReadingsController < ApplicationController
    def index
      date = params[:date].present? ? params[:date] : Time.zone.now 
      @daily_report = GlucoseReading.daily_report_records(current_user.id, date)
      @month_to_date_report = GlucoseReading.month_to_date_report_records(current_user.id, date)
      @monthly_report =  GlucoseReading.monthly_report_records(current_user.id, date)
    end

    def new
      current_user.glucose_readings.create(glucose_reading_params)
    end

    private

    def glucose_reading_params
      params.require(:glucose_readings).permit()
    end
  end
end
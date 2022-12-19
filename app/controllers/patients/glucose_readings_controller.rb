module Patients
  class GlucoseReadingsController < ApplicationController
    def index
      date = params[:date].present? ? params[:date].to_datetime : Time.zone.now 
      @daily_report = GlucoseReading.daily_report_records(current_user.id, date)
      @month_to_date_report = GlucoseReading.month_to_date_report_records(current_user.id, date)
      @monthly_report =  GlucoseReading.monthly_report_records(current_user.id, date)
    end

    def new
      @glucose_reading = current_user.glucose_readings.new
    end

    def create
      @glucose_reading = current_user.glucose_readings.new(glucose_reading_params)

      if @glucose_reading.save
        flash[:success] = 'Readings has been saved successfully'
        redirect_to patient_root_path
      else
        render 'new'
      end
    end

    private

    def glucose_reading_params
      params.require(:glucose_reading).permit(:level)
    end
  end
end
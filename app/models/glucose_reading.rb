class GlucoseReading < ApplicationRecord
	belongs_to :user
	validates :level, presence: true
	validate :check_reading_count

	scope :daily_report_records, ->(user_id, date) { where(user_id: user_id, created_at: date.beginning_of_day..date.end_of_day) }
	scope :month_to_date_report_records, ->(user_id, date) { where(user_id: user_id, created_at: date.beginning_of_month..date.end_of_day) }
	scope :monthly_report_records, ->(user_id, date) { where(user_id: user_id, created_at: (date - 1.month).beginning_of_month..(date - 1.month).end_of_month) }

	private

	def check_reading_count
		if GlucoseReading.where(user_id: self.user_id, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count >= 4
			self.errors[:base] << "You can only save 4 Readings Per day."
		end
	end
end

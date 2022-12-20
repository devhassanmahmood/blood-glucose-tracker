module ApplicationHelper
	def fetch_maximum_level(readings)
		readings.maximum(:level)
	end

	def fetch_minimum_level(readings)
		readings.minimum(:level)
	end

	def fetch_average_level(readings)
		readings.average(:level)
	end
end

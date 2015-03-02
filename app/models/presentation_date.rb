class PresentationDate
	
	attr_reader :date, :group

	@@presentation_dates = []

	def initialize(date_string)
		@date_string = date_string
		@date = Date.parse(date_string)
		@@presentation_dates << self
		@group = []
	end

	def day
		date.day
	end

	def year
		date.year
	end

	def month
		date.month
	end

	def self.all
		@@presentation_dates
	end

	def self.reset_all
		@@presentation_dates.clear
	end

	def add_presenter(presenter)
		presenter_from_block = yield(presenter)
		self.group << presenter_from_block
		presenter_from_block.add_presentation_date(self)
	end

	def self.find_presenters_for(date)
		@@presentation_dates.find(-> { NullDate.new }) do |presentation_date|
			presentation_date.date == Date.parse(date)
		end.group
	end
end

class NullDate
	def group
		[]
	end
end
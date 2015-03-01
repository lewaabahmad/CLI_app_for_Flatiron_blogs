class Presenter
	attr_reader :name, :presents_on

	@@all_presenters = []

	def initialize(name)
		@name = name
		@presents_on = []
		@@all_presenters << self 
	end

	def add_presentation_date(date)
		self.presents_on << date
	end

	def self.find_by_name(name)
		@@all_presenters.find do |presenter|
			presenter.name == name
		end
	end

	def self.find_or_create_by_name(name)
		self.find_by_name(name) || self.new(name)
	end

	def self.reset_all
		@@all_presenters.clear
	end
end
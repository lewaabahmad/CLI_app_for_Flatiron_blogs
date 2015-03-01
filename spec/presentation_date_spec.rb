class FakePresenter
	attr_reader :name
	def initialize(name)
		@name = name
	end
	def add_presentation_date(*); end
end

describe PresentationDate do
	before do
		PresentationDate.reset_all
	end 

	it "converts simple date string to date" do
		date_presentation = PresentationDate.new("Jan 12")

		expect(date_presentation.day).to eq(12)
		expect(date_presentation.month).to eq(1)
		expect(date_presentation.year).to eq(2015)
	end

	it "starts with an empty presentation group" do
		date_presentation = PresentationDate.new("Jan 12")
		expect(date_presentation.group).to be_empty
	end

	it "can have members added to the group" do
		date_presentation = PresentationDate.new("Jan 12")
		date_presentation.add_presenter("Steven Nunez") do |presenter|
			FakePresenter.new(presenter) # to become something like Presenter.new(presenter)
		end
		expect(date_presentation.group).to_not be_empty
	end

	context "class methods" do
		it 'tracks its instances' do
			date = PresentationDate.new("Jan 21")
			expect(PresentationDate.all).to include date
		end

		it "finds list of presenters by date" do
			date_presentation = PresentationDate.new("Jan 12")
			date_presentation.add_presenter("Steven Nunez") do |presenter|
				FakePresenter.new(presenter) # to become something like Presenter.new(presenter)
			end
			expect(PresentationDate.find_presenters_for("Jan 12").first.name).to eq("Steven Nunez")
		end

		it "returns an empty array if the date isn't found" do
			expect(PresentationDate.find_presenters_for("Jan 12")).to eq([])
		end
	end

end
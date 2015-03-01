describe Presenter do
	before do
		Presenter.reset_all
	end
	it "has a name" do
		presenter = Presenter.new("Steven Nunez")
		expect(presenter.name).to eq("Steven Nunez")
	end

	it "knows when it presents" do
		date = Date.parse("Jan 21")
		presenter = Presenter.new("Steven Nunez")
		presenter.add_presentation_date(date)
		expect(presenter.presents_on).to include(date)
	end

	context "class methods" do
		it "can find a user by name" do
			presenter = Presenter.new("Steven Nunez")
			expect(Presenter.find_by_name("Steven Nunez")).to eq(presenter)
		end

		it "can create a presenter if it's not found" do
			presenter = Presenter.find_or_create_by_name("Steven Nunez")
			expect(Presenter.find_by_name("Steven Nunez")).to eq(presenter)
		end
	end
end
describe ScheduleParser do	
	it "takes a list of dates and students parses it" do
		schedule = ["# Jan 21\n", "\n", "* Lindsay Padian\n", "* Lezou Dali\n", "* Leah  Suter\n", "\n", "# Jan 22\n", "\n", "* Mubiyna Casey\n", "* Shawn Hansen\n", "* Daniel  Ferrer\n", "\n", "# Jan 23\n", "\n", "* Keith Embler\n", "* David Lorente\n", "* Geraldina Alvarez Garcia\n", "\n"]
		result = ScheduleParser.parse(schedule)
		expect(result["Jan 21"]).to eq(["Lindsay Padian", "Lezou Dali", "Leah  Suter"])
	end

	it "yields date and presenters to a block" do 
		schedule = ["# Jan 21\n", "\n", "* Lindsay Padian\n", "* Lezou Dali\n", "* Leah  Suter\n", "\n", "# Jan 22\n", "\n", "* Mubiyna Casey\n", "* Shawn Hansen\n", "* Daniel  Ferrer\n", "\n", "# Jan 23\n", "\n", "* Keith Embler\n", "* David Lorente\n", "* Geraldina Alvarez Garcia\n", "\n"]		
		from_the_block = []
		ScheduleParser.parse(schedule) do |date, presenters|
			from_the_block << date
		end

		expect(from_the_block.count).to eq 3
		expect(from_the_block.first).to eq("Jan 21")
	end
end
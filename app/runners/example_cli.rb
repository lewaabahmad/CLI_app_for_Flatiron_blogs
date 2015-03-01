class ExampleCLI

 def call
  # Read the file
  schedule = File.readlines("spec/fixtures/schedule.md")
  ScheduleParser.parse(schedule) do |date, presenters|
    presentation_date = PresentationDate.new(date)
    presenters.each do |presenter|
      presentation_date.add_presenter(presenter) do |presenter_name|
        Presenter.find_or_create_by_name(presenter_name)
      end
    end
  end
  PresentationDate.all
  # call the parser
  # for each date, make a new date object
  # for each presenter, find or make a presenter object and add the date
  # print who presents today
 end
end


# presenters.first.presents_on.map(&:date)
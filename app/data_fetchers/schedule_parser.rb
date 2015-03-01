require "pry"

class ScheduleParser

  def self.parse(schedule)
    split_by_date = schedule.reject{|s| s =="\n"}.slice_before(/# .*?/).to_a
   
    split_by_date.each_with_object({}) do |date_presenters, obj|

      date = date_presenters.shift.gsub("# ", "").gsub("\n", "")
      obj[date] = date_presenters.collect! { |name| name.gsub("* ", "").gsub("\n", "") }
      yield(date, date_presenters) if block_given?
    end
    # i = 0
    # date_name_pairs = {}
    # while i < schedule.length 
    #   #instantiate presentation_group here
    #   date = schedule[i].gsub("# ", "").gsub("\n", "")
    #   names = []
    #   names << schedule[i+2]
    #   names << schedule[i+3]
    #   names << schedule[i+4]
    #   date_name_pairs[date] = names.collect { |name| name.gsub("* ", "").gsub("\n", "") }
    #   i += 6
    # end
    # date_name_pairs
  end

end

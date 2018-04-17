require './modules/date_handler'

class Project
  attr_reader :project_id,
              :name,
              :start_date,
              :end_date

  def initialize(project_id, name, start_date, end_date)
    @project_id  = project_id.to_i
    @name        = name
    @start_date  = string_date_input(start_date)
    @end_date    = string_date_input(end_date)
  end

  def string_date_input(date_string)
    DateHandler.string_to_date(date_string)
  end
end

require './modules/date_handler'

class Timesheet
  attr_reader :employee_id,
              :project_id,
              :start_date,
              :minutes

  def initialize(employee_id, project_id, start_date, minutes)
    @employee_id   = employee_id.to_i
    @project_id    = project_id.to_i
    @start_date    = string_date_input(start_date)
    @minutes       = minutes.to_i
  end

  def string_date_input(date_string)
    DateHandler.string_to_date(date_string)
  end
end

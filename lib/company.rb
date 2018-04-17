require 'csv'
require './lib/employee'
require './lib/project'
require './lib/timesheet'

class Company
  attr_reader :employees,
              :projects,
              :timesheets

  def initialize
    @employees = []
    @projects = []
    @timesheets = []
  end

  def load_employees(filepath)
    result = check_employee_row_length(filepath)
    return { success: false, error: 'bad data' } if result.include?(false)
    result = { success: true, error: nil }
    employee_csv_parse(filepath)
    result
  end

  def check_employee_row_length(filepath)
    rows = []
    CSV.foreach(filepath) {|row| rows << row.length}
    rows.map {|num| num == 5}
  end

  def employee_csv_parse(filepath)
    CSV.foreach(filepath) do |row|
      @employees << Employee.new(row[0], row[1], row[2], row[3], row[4])
    end
  end

  def load_projects(filepath)
    result = check_project_row_length(filepath)
    return { success: false, error: 'bad data' } if result.include?(false)
    result = { success: true, error: nil }
    project_csv_parse(filepath)
    result
  end

  def check_project_row_length(filepath)
    rows = []
    CSV.foreach(filepath) {|row| rows << row.length}
    rows.map {|num| num == 4}
  end

  def project_csv_parse(filepath)
    CSV.foreach(filepath) {|row| @projects << Project.new(row[0], row[1], row[2], row[3])}
  end

  def load_timesheets(filepath)
    result = check_timesheet_row_length(filepath)
    return { success: false, error: 'bad data' } if result.include?(false)
    { success: true, error: nil }
  end

  def check_timesheet_row_length(filepath)
    rows = []
    CSV.foreach(filepath) {|row| rows << row.length}
    rows.map {|num| num == 4}
  end

  def timesheet_csv_parse(filepath)
    CSV.foreach(filepath) {|row| @timesheets << Timesheet.new(row[0], row[1], row[2])}
  end

  def find_employee_by_id(id)
    @employees.find {|employee| employee.employee_id == id}
  end

  def find_project_by_id(id)
    @projects.find {|project| project.project_id == id}
  end

end

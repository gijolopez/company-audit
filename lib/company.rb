require 'csv'
require './lib/employee'
require './lib/project'

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
end

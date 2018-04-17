require './test/test_helper'
require './lib/company'

class CompanyTest < Minitest::Test
  def test_it_exists
    company = Company.new

    assert_instance_of Company, company
  end

  def test_it_holds_empty_collections
    company = Company.new
    assert_equal [], company.employees
    assert_equal [], company.projects
    assert_equal [], company.timesheets
  end

  def test_it_can_load_employees
    company = Company.new
    result = company.load_employees('./data/employees.csv')
    assert_instance_of Hash, result
  end

  def test_it_does_not_load_bad_employee_file
    company = Company.new
    result = company.load_employees('./data/bad_employees.csv')
    assert_instance_of Hash, result
  end

end

require './test/test_helper'
require './lib/project'

class ProjectTest < Minitest::Test
  def test_it_exists
    project = Project.new('123', 'Widget Maker', '2015-01-01', '2018-01-01')

    assert_instance_of Project, project
  end

  def test_it_has_attributes
    project = Project.new('123', 'Widget Maker', '2015-01-01', '2018-01-01')

    assert_equal 123, project.project_id
    assert_equal 'Widget Maker', project.name
  end

  def test_output_of_classes_are_correct
    project = Project.new('123', 'Widget Maker', '2015-01-01', '2018-01-01')

    assert_instance_of Integer, project.project_id
    assert_instance_of Date, project.start_date
    assert_instance_of Date, project.end_date
  end
end

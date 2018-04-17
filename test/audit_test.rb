require './test/test_helper'
require './lib/audit'

class CompanyTest < Minitest::Test
  def setup
    @audit = Audit.new
  end

  def test_it_exists
    assert_instance_of Audit, @audit
  end
end

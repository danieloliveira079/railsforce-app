require 'test_helper'

class LeadTest < ActiveSupport::TestCase
  test "should not save lead without name" do
    lead = Lead.new
    assert_not lead.save
  end
end

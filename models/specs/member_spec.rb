require 'minitest/autorun'
require_relative '../member'

class TestMember < MiniTest::Test
  def setup
    @member = Member.new(
      'id' => 1,
      'name' => 'Test Member',
      'membership' => 'Basic'
    )
  end

  def test_member_attrs
    assert_equal(@member.id, 1)
    assert_equal(@member.name, 'Test Member')
    assert_equal(@member.membership, 'Basic')
  end
end

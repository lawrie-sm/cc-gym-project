require 'minitest/autorun'
require_relative '../member'

class TestMember < MiniTest::Test
  def setup
    @member = Member.new(
      'id' => 1,
      'first_name' => 'testy',
      'last_name' => 'testerton',
      'membership' => 'basic'
    )
  end

  def test_member_attr
    assert_equal(@member.id, 1)
    assert_equal(@member.first_name, 'testy')
    assert_equal(@member.last_name, 'testerton')
    assert_equal(@member.membership, 'basic')
  end

  def test_full_name
    assert_equal(@member.full_name, 'testy testerton')
  end
end

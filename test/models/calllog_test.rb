# == Schema Information
#
# Table name: calllogs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  caller     :string(255)
#  duration   :integer
#  called_on  :datetime
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class CalllogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

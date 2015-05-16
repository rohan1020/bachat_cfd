# == Schema Information
#
# Table name: callplans
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  price          :integer
#  network        :string(255)
#  state          :string(255)
#  plantype       :integer
#  ratepersec     :string(255)
#  ratepermin     :string(255)
#  ratepersec_std :string(255)
#  ratepermin_std :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'test_helper'

class CallplanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

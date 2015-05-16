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

class Calllog < ActiveRecord::Base
	has_one :user
	validates :called_on, :uniqueness => true
end

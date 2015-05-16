# == Schema Information
#
# Table name: mcircles
#
#  id         :integer          not null, primary key
#  number     :string(255)
#  state      :string(255)
#  network    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Mcircle < ActiveRecord::Base
	validates :number, :uniqueness => true


	

end

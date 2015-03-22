class Calllog < ActiveRecord::Base
	has_one :user
	validates :called_on, :uniqueness => true
end

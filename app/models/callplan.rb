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

class Callplan < ActiveRecord::Base
	require 'corefunctions.rb'
  	include Corefunctions


  	def getMins(secs)

  		mins = secs.to_i/60

  		if(secs.to_i%60 != 0)
  			mins = mins + 1
  		end

  		return mins
  	end

	def getTotalCost(user)

		totalCost = 0

		callLogs = user.calllogs

		callLogs.each do |clog|

			if(isStd(clog.caller, user.number))

				if(ratepersec_std == "-1")

					totalCost = totalCost + getMins(clog.duration).to_f*ratepermin_std.to_f

				else

					totalCost = totalCost + (clog.duration).to_f*ratepersec_std.to_f

				end
				 

			else

				if(ratepersec == "-1")

					totalCost = totalCost + getMins(clog.duration).to_f*ratepermin.to_f

				else

					totalCost = totalCost + (clog.duration).to_f*ratepersec.to_f

				end


			end


		end


		return totalCost

	end

	def getType

		types = {0 => "Standard", 1 => "STD", 2 => "Local", 3 => "Both"}
		return types[plantype]

	end

end

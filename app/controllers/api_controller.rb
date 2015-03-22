class ApiController < ApplicationController
  require 'corefunctions.rb'
  include Corefunctions


  def sortnumbers

  	uid = params['uid']
  	user = User.find(1)
  	callLogs = user.calllogs

  	outp = ""

  	std_mins = 0
  	local_mins = 0
  	sameNetwork_mins = 0

  	callLogs.each do |clog|

  		if(isStd(clog.caller, user.number))
  			std_mins = std_mins + clog.duration
  		else
  			local_mins = local_mins + clog.duration
  		end

  		if(isSameNetwork(clog.caller, user.number))
  			sameNetwork_mins = sameNetwork_mins + clog.duration  	
  		end

  	end
  	

  	render :text => "STD: " + std_mins.to_s + ", Local: " + local_mins.to_s+ ", Network: " + sameNetwork_mins.to_s

  end

  
  def getplans
  	uid = params['uid']
  	user = User.find(1)
  	callLogs = user.calllogs

  	outp = ""

  	std_mins = 0
  	local_mins = 0
  	sameNetwork_mins = 0

  	callLogs.each do |clog|

  		if(isStd(clog.caller, user.number))
  			std_mins = std_mins + clog.duration
  		else
  			local_mins = local_mins + clog.duration
  		end

  		if(isSameNetwork(clog.caller, user.number))
  			sameNetwork_mins = sameNetwork_mins + clog.duration  	
  		end

  	end

  	outp = {"plans" => getAllPlans(User.first), "STD" => std_mins, "Local" => local_mins, "Total" => std_mins + local_mins}
  	render :text => outp.to_json

  end

  def getAllPlans(user)

  	mCircle = findCircle(user.number)

  	plans = Callplan.where(:state => mCircle.state , :network => mCircle.network)
  	costs = []
  	standard_plan  = Callplan.where(:state => mCircle.state , :network => mCircle.network, :plantype => 0).first
  	standard_cost = standard_plan.getTotalCost(user).round(1)
  	 
  	plans.each do |p|

  		plan_cost = p.getTotalCost(user).round(1)
  		savings = standard_cost - plan_cost

      if(p.plantype != 0)
        costs.append({ "cost" => plan_cost, "savings" => savings, "plan" => {"price" => p.price, "description" => p.description, "plantype" => p.getType} })
      end

  	end

    sorted_costs = costs.sort_by{|k| k["cost"] }
    sorted_costs = sorted_costs.first(3)

  	return sorted_costs.to_json
  end

end

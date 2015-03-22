json.array!(@callplans) do |callplan|
  json.extract! callplan, :name, :description, :price, :network, :state, :plantype, :ratepersec, :ratepermin, :ratepersec_std, :ratepermin_std
  json.url callplan_url(callplan, format: :json)
end

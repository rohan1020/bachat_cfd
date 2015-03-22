json.array!(@calllogs) do |calllog|
  json.extract! calllog, :user_id, :caller, :duration, :called_on
  json.url calllog_url(calllog, format: :json)
end

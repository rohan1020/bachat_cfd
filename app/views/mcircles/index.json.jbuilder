json.array!(@mcircles) do |mcircle|
  json.extract! mcircle, :number, :state, :network
  json.url mcircle_url(mcircle, format: :json)
end

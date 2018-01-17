json.array!(@claims) do |claim|
  json.extract! claim, 
  json.url claim_url(claim, format: :json)
end
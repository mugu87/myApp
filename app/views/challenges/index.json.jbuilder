json.array!(@challenges) do |challenge|
  json.extract! challenge, :id, :cost_per_completion, :expiration
  json.url challenge_url(challenge, format: :json)
end

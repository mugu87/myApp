json.array!(@donations) do |donation|
  json.extract! donation, :npo_id, :user_id, :amount_donated, :calories_donated
  json.url donation_url(donation, format: :json)
end

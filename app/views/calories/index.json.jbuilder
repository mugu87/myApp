json.array!(@calories) do |calory|
  json.extract! calory, :user_id, :transaction
  json.url calory_url(calory, format: :json)
end

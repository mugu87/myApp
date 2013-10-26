json.array!(@npos) do |npo|
  json.extract! npo, :name, :rate, :address, :phone, :email
  json.url npo_url(npo, format: :json)
end

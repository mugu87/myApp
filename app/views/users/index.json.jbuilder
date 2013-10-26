json.array!(@users) do |user|
  json.extract! user, :company_id, :name, :user_type, :height, :weight, :gender, :dob, :email
  json.url user_url(user, format: :json)
end

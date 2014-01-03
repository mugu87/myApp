json.array!(@causes) do |cause|
  json.extract! cause, :id, :name, :description, :user_id
  json.url cause_url(cause, format: :json)
end

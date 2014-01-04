json.array!(@events) do |event|
  json.extract! event, :id, :name, :cause_id, :description, :fund, :date
  json.url event_url(event, format: :json)
end

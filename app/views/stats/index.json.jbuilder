json.array!(@stats) do |stat|
  json.extract! stat, :today_active_calories
  json.url stat_url(stat, format: :json)
end

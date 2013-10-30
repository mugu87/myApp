Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, '6e9501708c3d43cf877624705baef53f', 'f295712bc4a940198be6d9098b4a473d'
end
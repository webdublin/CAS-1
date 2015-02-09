Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "XXX", "YYY"
end
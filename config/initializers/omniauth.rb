Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, ENV['CLIENT_ID'], ENV['CLIENT_SECRET']
end
end

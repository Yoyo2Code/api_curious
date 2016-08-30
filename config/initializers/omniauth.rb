Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :github, "d9b967a5bc5975ade778", "1168513829478dca030afec6fb6bb300e4cc9228"
  # provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
# end
end

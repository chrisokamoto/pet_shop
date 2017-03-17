Rails.application.configure do
  # Version of your assets, change this if you want to expire all your assets.
  config.assets.version = '1.0'

  # Add bower components to known asset paths.
  config.assets.paths << Rails.root.join('vendor/assets/components').to_s
end

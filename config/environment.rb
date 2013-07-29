	# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Smartcon::Application.initialize!

# Set default values
# Todo: Locale based default file loading
# APP_CONFIG = YAML.load_file("#{Rails.root}/config/defaults.yml")
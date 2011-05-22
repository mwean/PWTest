# Load the rails application
require File.expand_path('../application', __FILE__)

require File.dirname(__FILE__) + "/../lib/brute_force"

# Initialize the rails application
PasswordChecker::Application.initialize!

require 'support/helpers/session_helpers'
RSpec.configure do |config|
    config.include Features::ControllerHelpers, type: :feature
end

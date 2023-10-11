# frozen_string_literal: true

Rails.application.configure do
  config.generators do |g|
    g.test_framework :rspec
    g.helper_specs false
    g.controller_specs false
    g.view_specs false
    g.routing_specs false
    g.request_specs false
  end
end

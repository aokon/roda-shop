ENV['RACK_ENV'] ||= 'test'

require 'rack/test'
require './app'

Dir[File.join(ROOT_PATH, 'spec', 'support', '**', '*.rb')].each { |f| require(f) }

module AppSetup
  def self.included(base)
    base.instance_eval do
      include Rack::Test::Methods
    end
  end

  def app
    RodaShopApp
  end
end

RSpec.configure do |config|
  config.include IntegrationHelpers, type: :integration
  config.include AppSetup, type: :integration
end


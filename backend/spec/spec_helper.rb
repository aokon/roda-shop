ENV['RACK_ENV'] ||= 'test'

require 'rack/test'
require_relative '../app'

paths = File.join(ROOT_PATH, 'spec', 'support', '**', '*.rb')
Dir[paths].each { |file| require file }

module AppSetup
  def self.included(base)
    base.instance_eval do
      include Rack::Test::Methods
    end
  end

  def app
    SpringDown::App
  end
end

RSpec.configure do |config|
  config.include IntegrationHelpers, type: :integration
  config.include AppSetup, type: :integration
end


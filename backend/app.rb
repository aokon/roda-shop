require 'rubygems'
require 'bundler/setup'
require 'roda'
require 'roda/rest_api'
require 'json'
require 'rom'
require 'rom/sql'
require 'virtus'

require_relative 'config/app'
require_relative 'db/db'
require_relative 'db/seed'
require_relative 'apps/spring_down/api/v1/app'

module SpringDown
  class App < Roda
    route do |r|
      r.run SpingDown::API::V1::App
    end
  end
end

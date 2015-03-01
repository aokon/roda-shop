require 'rubygems'
require 'bundler/setup'
require 'roda'
require 'roda/rest_api'
require 'json'
require 'rom'
require 'rom/sql'
require 'virtus'

require './config/app'
require './db/db'
require './db/seed'

require './apps/spring_down/api/v1'

module SpringDown
  class App < Roda
    route do |r|
      r.run SpingDown::API::V1
    end
  end
end

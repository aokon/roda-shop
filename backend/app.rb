require 'rubygems'
require 'bundler/setup'
require 'roda'
require 'roda/rest_api'
require 'json'
require 'rom'
require 'rom/sql'
require 'virtus'

require './config/app'
require './config/db'
require './db/seed'

require './api/v1'

class RodaShopApp < Roda
  route do |r|
    r.run API::V1
  end
end

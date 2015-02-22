require 'rubygems'
require 'bundler/setup'
require 'rom'
require 'rom/sql'
require 'roda'

require './config/app'
require './config/db'

class RodaShopApp < Roda
  plugin :render

  route do |r|
    r.root do
      render :index, locals: { title: 'title' }
    end
  end
end

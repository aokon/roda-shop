require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'])
require './config/app'
require './config/models'

class BlogApp < Roda
  plugin :render

  route do |r|
    r.root do
      render :index, locals: { blog: Blog.new }
    end
  end
end

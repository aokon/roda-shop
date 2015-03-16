require_relative '../v1/categories'

module SpingDown
  module API
    module V1
      class App < Roda
        plugin :rest_api

        route do |r|
          r.api do
            r.version 1 do
              r.run Categories
            end
          end
        end
      end # App
    end # V1
  end # API
end # SpingDown

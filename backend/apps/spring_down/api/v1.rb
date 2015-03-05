module SpingDown
  module API
    class V1 < Roda
      plugin :rest_api
      plugin :json

      route do |r|
        r.api do
          r.version 1 do
            r.resource :categories do |categories|
              categories.list do
                categories = DB.rom.relation(:categories).active.all
                { categories: categories.to_a }
              end

              categories.one do |params|
                category = DB.rom.relation(:categories).
                  find_by_id(params[:id]).active.one!
                { category: category }
              end
            end
          end
        end
      end
    end
  end
end

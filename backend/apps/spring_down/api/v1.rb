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
                results = DB.rom.relation(:categories).
                  active.all.to_a

                { categories: results }
              end

              r.resource :products, parent_key: :category_id do |products|
                products.list do |params|
                  category = DB.rom.relation(:categories).
                    find_by_id(params[:category_id]).
                    active.
                    with_products.
                    map_with(:category_with_products).
                    one!

                  { products: category[:products] }
                end
              end

              categories.one do |params|
                category = DB.rom.relation(:categories).
                  find_by_id(params[:id]).
                  active.one!

                { category: category }
              end
            end
          end
        end
      end
    end
  end
end

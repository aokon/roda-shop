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
                results = DB.rom.relation(:categories).active.all
                { categories: results.to_a }
              end

              r.resource :products, parent_key: :category_id do |products|
                def product_attributes(data)
                  {
                    name: data[:products_name],
                    description: data[:description],
                    price: data[:price],
                    active: data[:products_active]
                  }
                end

                products.list do |params|
                  products = DB.rom.relation(:categories).
                    with_category_products(params[:category_id]).
                    map_with(:products, :product_presenter).to_a
                    #to_a.map { |row| product_attributes(row) }

                  { products: products }
                end
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

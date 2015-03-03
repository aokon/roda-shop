class CreateProductCategory < ROM::Commands::Create[:sql]
  register_as :create
  relation :products_categories
  result :one
end

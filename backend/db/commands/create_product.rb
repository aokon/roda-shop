class CreateProduct < ROM::Commands::Create[:sql]
  register_as :create
  relation :products
  result :one
end

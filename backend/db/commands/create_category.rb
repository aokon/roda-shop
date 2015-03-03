class CreateCategory < ROM::Commands::Create[:sql]
  register_as :create
  relation :categories
  result :one
end

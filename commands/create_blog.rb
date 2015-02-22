class CreateBlog < ROM::Commands::Create[:sql]
  register_as :create
  relation :blogs
  result :one
end

setup = ROM.setup(:sql, "sqlite::memory")

setup.default.connection.create_table(:blogs) do
  primary_key :id
  String :title
end

Dir["#{ROOT_PATH}/relations/*.rb"].each { |f| require(f) }
Dir["#{ROOT_PATH}/models/*.rb"].each { |f| require(f) }
Dir["#{ROOT_PATH}/mappers/*.rb"].each { |f| require(f) }
Dir["#{ROOT_PATH}/commands/*.rb"].each { |f| require(f) }
Dir["#{ROOT_PATH}/params/*.rb"].each { |f| require(f) }

DB = ROM.finalize.env

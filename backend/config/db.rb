setup = ROM.setup(:sql, "sqlite::memory")

setup.default.connection.create_table(:categories) do
  primary_key :id
  String :name
  Boolean :active
end

setup.default.connection.create_table(:products) do
  primary_key :id
  String :name
  String :description
  Float  :price
  Boolean :active
end

%w(relations models mappers commands).each do |item|
  Dir[File.join(ROOT_PATH, item, '**', '*.rb')].each { |f| require(f) }
end

DB = ROM.finalize.env

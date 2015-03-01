ROM::SQL::Migration.create do
  change do
    create_table(:products) do
      primary_key :id
      String :name, null: false
      String :description
      Float :price, null: false
      Boolean :active, default: false
    end
  end
end

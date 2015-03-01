ROM::SQL::Migration.create do
  change do
    create_table :categories do
      primary_key :id
      String :name, null: false
      String :picture, null: true
      Boolean :active, null: false, default: false
    end
  end
end

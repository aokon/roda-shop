ROM::SQL::Migration.create do
  change do
    create_table(:products_categories) do
      foreign_key :product_id, :products
      foreign_key :category_id, :categories
      index [:product_id, :category_id], uniq: true
    end
  end
end

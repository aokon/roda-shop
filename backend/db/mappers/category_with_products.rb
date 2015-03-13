class CategoryWithProductsMapper < CategoryMapper
  register_as :category_with_products

  group :products do
    attribute :category_id, from: :id
    attribute :id, from: :products_id
    attribute :name, from: :products_name
    attribute :description
    attribute :active, from: :products_active
    attribute :price
  end
end

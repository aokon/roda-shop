class CategoryWithProductsMapper < CategoryMapper
  register_as :category_with_products

  group products: [:products_id, :products_name, :description,
                   :products_active, :price]

end

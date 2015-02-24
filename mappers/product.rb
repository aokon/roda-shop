class ProductMapper < ROM::Mapper
  relation :products
  register_as :entities

  model Product

  attribute :name
  attribute :description
  attribute :price
  attribute :active
end

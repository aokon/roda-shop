class ProductMapper < ROM::Mapper
  relation :products

  model Product

  attribute :name
  attribute :description
  attribute :price
  attribute :active
end

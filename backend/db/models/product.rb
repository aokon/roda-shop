class Product
  include Virtus.model

  attribute :name, String
  attribute :description, String
  attribute :price, Float
  attribute :active, Boolean
end

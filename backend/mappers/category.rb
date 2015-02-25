class CategoryMapper < ROM::Mapper
  relation :categories

  model Category

  attribute :name
  attribute :active
end

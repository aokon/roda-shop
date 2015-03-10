class Categories < ROM::Relation[:sql]
  many_to_many :products,
    join_table: :products_categories,
    left_key: :category_id,
    right_key: :product_id

  def all
    order(:name)
  end

  def find_by_id(id)
    where(['categories.id = ?', id])
  end

  def active
    where(['categories.active = ?', true])
  end

  def with_products
    association_left_join(:products)
  end
end

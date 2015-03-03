class Products < ROM::Relation[:sql]
  many_to_many :categories

  def all
    order(:id)
  end

  def find_by_id(id)
    where(id: id)
  end

  def active
    where(active: true)
  end
end

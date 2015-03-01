class Categories < ROM::Relation[:sql]
  def all
    order(:name)
  end

  def find_by_id(id)
    where(id: id)
  end

  def active
    where(active: true)
  end
end

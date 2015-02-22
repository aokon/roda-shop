class Blogs < ROM::Relation[:sql]
  def all
    order(:id)
  end

  def find_by_id(id)
    where(id: id)
  end
end

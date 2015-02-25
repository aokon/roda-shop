class Category
  include Virtus.model

  attribute :name, String
  attribute :active, Boolean

  def to_json(json_ext)
    MultiJson.dump({ name: name, active: active })
  end
end

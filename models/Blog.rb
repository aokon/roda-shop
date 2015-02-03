class Blog
  attr_accessor :name

  def initialize(opts = {})
    @name = opts.fetch(:name, 'Dummy blog')
  end
end

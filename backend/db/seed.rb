6.times do |i|
  attrs = { name: "Category #{i}", active: true }
  DB.command(:categories).create.call(attrs)
end


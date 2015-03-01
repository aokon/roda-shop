8.times do |i|
  attrs = { name: "Category #{i}", active: true }
  DB.rom.command(:categories).create.call(attrs)
end


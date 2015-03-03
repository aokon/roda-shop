8.times do |i|
  attrs = { name: "Category #{i}", active: true }
  category = DB.rom.command(:categories).create.call(attrs)
  10.times do |j|
    prod_attrs = {
      name: "Product #{i + j}",
      active: true,
      description: 'Lorem ipsum',
      price: SecureRandom.random_number(1000)
    }
    product = DB.rom.command(:products).create.call(prod_attrs)
    DB.rom.command(:products_categories).create.
      call(category_id: category[:id], product_id: product[:id])
  end
end


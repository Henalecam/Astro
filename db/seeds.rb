# Limpar os dados existentes
Variant.destroy_all
Product.destroy_all
Category.destroy_all

# Criar categorias
categories = [
  { name: 'iPhones', description: 'Explore the latest iPhone models.' },
  { name: 'MacBooks', description: 'Discover powerful and sleek MacBooks.' },
  { name: 'iPads', description: 'Experience the versatility of iPads.' },
  { name: 'Accessories', description: 'Find high-quality accessories for Apple products.' }
]

categories.each do |category_data|
  category = Category.create!(category_data)

  # Criar produtos para cada categoria
  5.times do
    product = category.products.create!(
      name: "#{category.name} #{Faker::Device.model_name}",
      description: Faker::Lorem.paragraph(sentence_count: 3),
      image: "https://via.placeholder.com/300x300.png?text=#{category.name}"
    )

    # Criar variantes para cada produto
    3.times do |i|
      product.variants.create!(
        name: "#{product.name} Variant #{i + 1}",
        price: Faker::Commerce.price(range: 1000.0..5000.0)
      )
    end
  end
end

puts 'Seeding completed!'

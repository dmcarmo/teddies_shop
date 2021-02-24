# db/seeds.rb
puts 'Cleaning database...'
Order.destroy_all
Product.destroy_all
Category.destroy_all

puts 'Creating categories...'
geek = Category.create!(name: 'geek')
kids = Category.create!(name: 'kids')

puts 'Creating teddies...'
Product.create!(sku: 'original-teddy-bear', name: 'Teddy bear', category: kids, price: 10, photo_url: 'https://images.pexels.com/photos/1019471/stuffed-bear-teddy-child-girl-1019471.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260')

Product.create!(sku: 'jean-mimi', name: 'Jean-Michel - Le Wagon', category: geek, price: 20, photo_url: 'https://pbs.twimg.com/media/B_AUcKeU4AE6ZcG.jpg:large')
Product.create!(sku: 'octocat',   name: 'Octocat -  GitHub',      category: geek, price: 15, photo_url: 'https://cdn-ak.f.st-hatena.com/images/fotolife/s/suzumidokoro/20160413/20160413220730.jpg')
puts 'Finished!'

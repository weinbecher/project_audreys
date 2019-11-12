require_relative( "../models/farm.rb" )
require_relative( "../models/product.rb" )
require("pry-byebug")

Product.delete_all()
Farm.delete_all()


farm1 = Farm.new({
  "name" => "Echo Valley Farm",
  "address" => " No.1 Vale of Nog, Pink Paw County ",
  "phone_num" => "520 3645 3728"
  })

farm1.save



farm2 = Farm.new({
  "name" => "Kims Pumpkinhead Corp",
  "address" => " 67 Hallow Field , Sneep Snoop County ",
  "phone_num" => "520 9485 3648"
})

farm2.save


farm3 = Farm.new({
  "name" => "You Got This Farm ",
  "address" => " 43 Naughty Knee Road , Almond County ",
  "phone_num" => "520 9485 3648"
})

farm3.save

product1 = Product.new({
  "name" => "strawberry",
  "description" => "/strawberry.png",
  "stock" => 12.0,
  "cost" => 1.0,
  "price" => 2.5,
  "farm_id" => farm1.id

})

product1.save

product2 = Product.new({
  "name" => "blueberry",
  "description" => "/blueberry.png",
  "stock" => 30.0,
  "cost" => 0.25,
  "price" => 0.5,
  "farm_id" => farm1.id

})

product2.save



product3 = Product.new({
  "name" => "watermelon",
  "description" => "/watermelon.png",
  "stock" => 0.2,
  "cost" => 300,
  "price" => 600,
  "farm_id" => farm3.id

})

product3.save




product4 = Product.new({
  "name" => "apple",
  "description" => "/apple.png",
  "stock" => 0.5,
  "cost" => 50,
  "price" => 100,
  "farm_id" => farm3.id

})

product4.save


product5 = Product.new({
  "name" => "banana",
  "description" => "/banana.png",
  "stock" => 0,
  "cost" => 200,
  "price" => 400,
  "farm_id" => farm3.id

})

product5.save




product6 = Product.new({
  "name" => "lettuce",
  "description" => "/lettuce.png",
  "stock" => 0.5,
  "cost" => 50,
  "price" => 100,
  "farm_id" => farm3.id

})

product6.save



binding.pry
return nil

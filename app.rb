require ('sinatra')
require ('sinatra/contrib/all') if development?
require_relative ('controllers/product_controller')
require_relative ('controllers/farm_controller')


get '/' do
  @products = Product.all()
  @farms = Farm.all()
  erb (:index)
end

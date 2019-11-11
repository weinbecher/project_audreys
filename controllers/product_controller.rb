require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/product.rb')
require_relative('../models/farm.rb')
also_reload('../models/*')


get '/products' do
  @products = Product.all()
  erb (:"products/index")
end


get '/products/:id' do
  @product = Product.find(params[:id])
  erb (:"products/show")
end

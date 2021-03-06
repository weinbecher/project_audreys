require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/product.rb')
require_relative('../models/farm.rb')
# also_reload('../models/*')


get '/products' do
  @products = Product.all()
  erb (:"products/index")
end

get '/products/new' do
  @farms = Farm.all()
  erb (:"products/new")
end

get '/products/sale' do
  @products = Product.all()
  @products_stock_above_10 = Product.stock_above_10
  erb (:"products/sale")
end


get '/products/import' do
  @products = Product.all()
  @products_stock_below_2 = Product.stock_below_2
  erb (:"products/import")
end


get '/products/:id' do
  @product = Product.find(params[:id])
  erb (:"products/show")
end

get '/products/:id/edit' do
  @farms = Farm.all()
  @product = Product.find(params[:id])
  erb (:"products/edit")
end

post '/products' do
  @product = Product.new( params )
  @product.save()
  erb( :"products/create" )
end

post '/products/:id/delete' do
  @product = Product.find(params[:id])
  @product.delete()
  erb( :"products/delete" )
end


post '/products/:id' do
  product = Product.new(params)
  product.update
  redirect to "/products/#{params['id']}"
end

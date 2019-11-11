require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/product.rb')
require_relative('../models/farm.rb')
also_reload('../models/*')

get '/farms' do
  @farms = Farm.all()
  erb (:"farms/index")
end

get '/farms/new' do
  @farms = Farm.all()
  erb (:"farms/new")
end

get '/farms/:id' do
  @farm = Farm.find(params[:id])
  erb (:"farms/show")
end

get '/farms/:id/edit' do
  @farm = Farm.find(params[:id])
  erb (:"farms/edit")
end

post '/farms' do
  @farm = Farm.new( params )
  @farm.save()
  erb( :"farms/create" )
end

post '/farms/:id/delete' do
  @farm = Farm.find(params[:id])
  @farm.delete()
  erb( :"farms/delete" )
end


post '/farms/:id' do
  farm = Farm.new(params)
  farm.update
  redirect to "/farms/#{params['id']}"
end

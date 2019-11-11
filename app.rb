require ('sinatra')
require ('sinatra/contrib/all')
# require_relative ('controller/product_controller')
# require_relative ('controller/farm_controller')

get '/' do
  erb (:index)
end

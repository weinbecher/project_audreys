require_relative('../db/sql_runner')

class Product
  attr_reader :id
  attr_accessor :name, :description, :stock, :cost, :price, :farm_id


  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @description = options ['description']
    @stock = options['stock'].to_f
    @cost = options['cost'].to_f
    @price = options['price'].to_f
    @farm_id = options['farm_id'].to_i
  end

  def save
    sql = "INSERT INTO products
    (
      name,
      description,
      stock,
      cost,
      price,
      farm_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING *"
    values = [@name, @description, @stock, @cost, @price, @farm_id]
    product_data = SqlRunner.run(sql, values)
    @id = product_data.first()['id'].to_i

  end



  def update()
    sql = "UPDATE products SET (
    name, description, stock, cost, price, farm_id
    ) = (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@name, @description, @stock, @cost, @price, @farm_id, @id]
    SqlRunner.run(sql,values)
  end



  def farm()
    farm = Farm.find(@farm_id)
    return farm
  end

  def delete()
    sql = "DELETE FROM products WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM products"
    products = SqlRunner.run(sql)
    return products.map{|product| Product.new(product)}
  end

  def self.delete_all
    sql = "DELETE FROM products"
    SqlRunner.run(sql)
  end


  def self.find(id)
    sql = "SELECT * From products WHERE id = $1"
    values = [id]
    product = SqlRunner.run(sql, values)
    result = Product.new(product.first)
    return result
  end



end

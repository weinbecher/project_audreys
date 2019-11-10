require_relative('../db/sql_runner')

class Product
  attr_reader :id
  attr_accessor :name, :description, :stock, :cost, :price, :farm_id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options ['description']
    @stock = options['stock']
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

  def delete
    sql = "DELETE FROM product WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM products"
    products = SqlRunner.run(sql)
    return products.map{|product| Product.new(hash)}
  end

  def self.delete_all
    sql = "DELETE FROM products"
    SqlRunner.run(sql)
  end


  def self.find(id)
    sql = "SELECT * From products WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return Product.new(results.first)
  end



end

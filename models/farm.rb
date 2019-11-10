require_relative('../db/sql_runner')

class Farm
  attr_reader :id
  attr_accessor :name, :address, :phone_num


  def initialize(options)
     @id = options['id'].to_i if options['id']
     @name = options['name']
     @address = options['address']
     @phone_num = options['phone_num']
  end

  def save
    sql = "INSERT INTO farms
    (
      name,
      address,
      phone_num
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@name, @address, @phone_num]
    farm_data = SqlRunner.run(sql, values)
    @id = farm_data.first()['id'].to_i
  end

  def delete
    sql = "DELETE FROM farms WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end



  def self.all
    sql = "SELECT * FROM farms"
    farms = SqlRunner.run(sql)
    return farms.map {|farm| Farm.new(hash) }
  end


  def self.delete_all
    sql = "DELETE FROM farms"
    SqlRunner.run(sql)
  end


  def self.find(id)
    sql = "SELECT * FROM farms WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return Farm.new(results.first)

  end





end

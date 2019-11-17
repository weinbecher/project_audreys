require('pg')

class SqlRunner

  def self.run( sql, values = [] )
    begin
      # db = PG.connect({ dbname: 'audreys', host: 'localhost' })

      db = PG.connect( {dbname: 'd8gcoqvlhdl3es',
      host: 'ec2-54-83-52-191.compute-1.amazonaws.com',
      port: 5432, user: 'uwjfnanpsgwwev', password: 'dd5e8f4c5bfd7cd32d009db9ceb068ad6aa7f96825bd65a4915d192be0fc5a65'})

      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end

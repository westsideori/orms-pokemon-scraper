class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id_num, db)
        pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
        Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
    end



    # def self.save
    #     sql = <<-SQL
    #     INSERT INTO pokemon (name, type, db)
    #     VALUES (?, ?, ?)
    #     SQL

    #     DB[:conn].execute(sql, self.name, self.type, self.db)

    #     @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    # end

end

require "pry"
class Pokemon

  attr_accessor :id, :name, :type, :db
  ALL = []

  def initialize(attribute)
    attribute.each do |key, value|
      self.send(("#{key}="), value)
    end
    ALL << self
  end

  def self.save(name, type ,db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}');")
    @id = db.execute("SELECT id FROM pokemon;").last
  end

  def self.find(id, db)
    newpkm = db.execute("SELECT * FROM pokemon WHERE id = #{id}").first
    data_hsh = {name: newpkm[1], type: newpkm[2], id: id}
    Pokemon.new(data_hsh)
  end

end

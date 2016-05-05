class Summoner
  attr_accessor :id
  attr_accessor :name
  attr_accessor :tier

  def initialize(id, name)
    @id = id
    @name = name
    @tier = nil
  end


end
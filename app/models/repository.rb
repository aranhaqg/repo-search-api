class Repository
  attr_accessor :id, :name, :full_name, :description, :url
  
  def initialize(id, name, full_name, description, url)
    @id = id
    @name = name
    @full_name = full_name
    @description = description
    @url = @url
  end
end

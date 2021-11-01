# frozen_string_literal: true

class Repository
  attr_accessor :id, :name, :full_name, :description, :url

  def initialize(id = nil, name = nil, full_name = nil, description = nil, _url = nil)
    @id = id
    @name = name
    @full_name = full_name
    @description = description
    @url = @url
  end
end

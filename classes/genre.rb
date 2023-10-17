require 'json'

class Genre
  attr_reader :items
  attr_accessor :name, :id

  def initialize(name: 'unknown')
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_json(option = {})
    {
      id: @id,
      name: @name
    }.to_json(option)
  end
end

require 'json'

class Genre
  attr_reader :id, :items
  attr_accessor :name

  def initialize(id: nil, name: 'unknown')
    @id = Random.rand(1..1000) if id.nil?
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_json(options = {})
    {
      id: @id,
      name: @name,
      items: @items
    }.to_json(option)
  end
end

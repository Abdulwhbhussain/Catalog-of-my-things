require 'json'

class Label
  attr_reader :items
  attr_accessor :title, :color, :id

  def initialize(title: 'unknown', color: 'Unspecified')
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_json(option = {})
    {
      id: @id,
      title: @title,
      color: @color
    }.to_json(option)
  end
end

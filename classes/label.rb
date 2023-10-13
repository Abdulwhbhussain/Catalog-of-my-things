class Label
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(id: nil, title: 'unknown', color: 'Unspecified')
    @id = Random.rand(1..1000) if id.nil?
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end

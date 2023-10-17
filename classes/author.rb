require 'json'

class Author
  attr_reader :items
  attr_accessor :first_name, :last_name, :id

  def initialize(first_name: 'unknown', last_name: 'unknown')
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_json(option = {})
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name
    }.to_json(option)
  end
end

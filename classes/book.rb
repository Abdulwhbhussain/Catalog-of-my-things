require_relative 'item'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date: nil, archived: false, publisher: nil, cover_state: 'good')
    super(publish_date: publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json(option = {})
    {
      id: @id,
      genre: @genre,
      source: @source,
      label: @label,
      author: @author,
      publish_date: @publish_date,
      archived: @archived,
      publisher: @publisher,
      cover_state: @cover_state
    }.to_json(option)
  end

  private

  def can_be_archived?()
    return true if super() || @cover_state == 'bad'

    false
  end
end

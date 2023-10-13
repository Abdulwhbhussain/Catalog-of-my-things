require_relative 'item'
require 'json'

class Music < Item
  attr_accessor :on_spotify

  def initialize(id: nil, publish_date: nil, archived: false, on_spotify: false)
    super(id: id, publish_date: publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  def to_json(options = {})
    {
      id: @id,
      genre: @genre,
      source: @source,
      label: @label,
      author: @author,
      publish_date: @publish_date,
      archived: @archived,
      on_spotify: @on_spotify
    }.to_json(options)
  end

  private

  def can_be_archived?()
    return true if super() && @on_spotify == true

    false
  end
end

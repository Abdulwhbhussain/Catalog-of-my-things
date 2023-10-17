require_relative 'item'
require 'json'

class Movie < Item
  attr_accessor :silent

  def initialize(publish_date: nil, archived: false, silent: false)
    super(publish_date: publish_date, archived: archived)
    @silent = silent
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
      silent: @silent
    }.to_json(option)
  end

  private

  def can_be_archived?()
    return true if super() || @silent == true

    false
  end
end
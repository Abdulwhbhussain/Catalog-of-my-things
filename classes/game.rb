require_relative 'item'
require 'date'
require 'json'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(id: nil, publish_date: nil, archived: false, multiplayer: false, last_played_at: nil)
    super(id: id, publish_date: publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
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
      multiplayer: @multiplayer,
      last_played_at: @last_played_at
    }.to_json(options)
  end

  private

  def can_be_archived?()
    return true if super() && check_date(@last_played_at)

    false
  end

  def check_date(date)
    return true if Date.today.year - date.year > 2

    false
  end
end

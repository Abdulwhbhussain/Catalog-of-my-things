require_relative 'item'

class Music < Item
  attr_accessor :on_spotify

  def initialize(id: nil, publish_date: nil, archived: false, on_spotify: false)
    super(id: id, publish_date: publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?()
    return true if super() && @on_spotify == true

    false
  end
end

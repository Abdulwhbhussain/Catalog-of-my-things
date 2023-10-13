require_relative 'item'

class Movie < Item
  attr_accessor :silent

  def initialize(id: nil, publish_date: nil, archived: false, silent: false)
    super(id: id, publish_date: publish_date, archived: archived)
    @silent = silent
  end

  private

  def can_be_archived?()
    return true if super() || @silent == true

    false
  end
end

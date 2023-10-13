require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(id: nil, publish_date: nil, archived: false, publisher: nil, cover_state: 'good')
    super(id: id, publish_date: publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?()
    return true if super() || @cover_state == 'bad'

    false
  end
end

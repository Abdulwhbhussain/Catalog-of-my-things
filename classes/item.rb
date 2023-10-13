require 'date'

class Item
  attr_reader :id, :archived, :genre, :author, :source, :label
  attr_accessor :publish_date

  def initialize(id: nil, publish_date: nil, archived: false)
    @id = Random.rand(1..1000) if id.nil?
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def move_to_archive()
    return true if can_be_archived?

    false
  end

  private

  def can_be_archived?()
    return true if check_date(@publish_date)

    false
  end

  def check_date(date)
    return true if Date.today.year - date.year > 10

    false
  end
end

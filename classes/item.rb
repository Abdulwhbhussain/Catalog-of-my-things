require 'date'

class Item
  attr_reader :archived, :genre, :author, :source, :label
  attr_accessor :publish_date, :id

  def initialize(publish_date: nil, archived: false)
    @id = Random.rand(1..1000)
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
    if can_be_archived?
      @archived = true
    else
      puts "This item can't be archived"
    end
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

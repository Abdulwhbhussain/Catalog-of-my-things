class Item
  def initialize()
    # Please add your code here
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

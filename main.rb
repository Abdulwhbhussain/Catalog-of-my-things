require_relative 'app'

def show_menu
  puts 'Please choose an option by entering a number:'
  puts '1 - List all Books'
  puts '2 - List all Music Albums'
  puts '3 - List all Movies'
  puts '4 - List all Games'
  puts '5 - List all Genres'
  puts '6 - List all Sources'
  puts '7 - List all Labels'
  puts '8 - List all Authors'
  puts '9 - Add a Book'
  puts '10 - Add a Music Album'
  puts '11 - Add a Movie'
  puts '12 - Add a Game'
  puts '13 - Exit'
end

class Choices
  def user_choices(number, app)
    case number
    when 1
      app.books_list
    when 2
      app.music_albums_list
    when 3
      app.movies_list
    when 4
      app.games_list
    when 5
      app.genres_list
    when 6
      app.sources_list
    when 7
      app.labels_list
    when 8
      app.authors_list
    when 9
      app.add_book
    when 10
      app.add_music_album
    when 11
      app.add_movie
    when 12
      app.add_game
    else
      puts 'Thank you for using My Catalog!'
    end
  end
end

def main
  app = App.new
  puts 'Welcome to The Catalog of My Things!'
  puts ' '
  number = 0
  while number != 13
    show_menu
    number = gets.chomp.to_i
    if number < 1 || number > 13
      puts 'Please enter a valid number'
      puts ' '
      next
    else
      Choices.new.user_choices(number, app)
    end
  end
  app.save_data
end

main

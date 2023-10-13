# App Console Entry Point
require 'json'
require 'date'
require_relative 'classes/book'
require_relative 'classes/music'
require_relative 'classes/movie'
require_relative 'classes/game'
require_relative 'classes/item'
require_relative 'classes/author'
require_relative 'classes/source'
require_relative 'classes/genre'
require_relative 'classes/label'

class App
  attr_accessor :books, :music_albums, :movies, :games, :genres, :labels, :authors, :sources

  def initialize
    @genres = load_data('genres.json') # []
    @labels = load_data('labels.json') # []
    @authors = load_data('authors.json') # []
    @sources = load_data('sources.json') # []
    @books = load_data('books.json') # []
    @music_albums = load_data('music_albums.json') # []
    @movies = load_data('movies.json') # []
    @games = load_data('games.json') # []
  end

  def books_list()
    display_items(@books, 'Books') do |book|
      "Book Id: #{book.id}, Book Name: #{book.label.title}, Publisher: #{book.publisher}"
    end
  end

  def music_albums_list()
    display_items(@music_albums, 'Music Albums') do |album|
      "Album Id: #{album.id}, , Music Name: #{album.label.title}, On Spotify: #{album.on_spotify}"
    end
  end

  def movies_list()
    display_items(@movies, 'Movies') do |movie|
      "Movie Id: #{movie.id}, Movie Name: #{movie.label.title}, Silent: #{movie.silent}"
    end
  end

  def games_list()
    display_items(@games, 'Games') do |game|
      "Game Id: #{game.id}, Game Name: #{game.label.title}, , Multiplayer: #{game.multiplayer}"
    end
  end

  def genres_list()
    display_items(@genres, 'Genres') { |genre| "Genre Id: #{genre.id}, Genre Name: #{genre.name}" }
  end

  def sources_list()
    display_items(@sources, 'Sources') { |source| "Source Id: #{source.id}, Source Name: #{source.name}" }
  end

  def labels_list()
    display_items(@labels, 'Labels') do |label|
      "Label Id: #{label.id}, Label Title: #{label.title}, Label Color: #{label.color}"
    end
  end

  def authors_list()
    display_items(@authors, 'Authors') do |author|
      "Author Id: #{author.id}, Author: #{author.first_name} #{author.last_name}"
    end
  end

  def add_book()
    puts 'Adding a book:'
    publisher = get_user_input('Publisher: ')
    cover_state = get_user_input('Cover State (good/bad): ')
    publish_date = Date.parse(get_user_input('Publish Date (YYYY-MM-DD): '))
    archived = get_user_input('Is it archived? [Y/N]: ').casecmp('Y').zero?
    book = Book.new(publish_date: publish_date, archived: archived, publisher: publisher, cover_state: cover_state)
    book.genre = add_genre
    book.author = add_author
    book.source = add_source
    book.label = add_label
    @books.push(book)
    puts 'Book Added successfully'
    puts ' '
  end

  def add_music_album()
    puts 'Adding A Music Album:'
    spotify = get_user_input('Is it on Spotify? [Y/N]: ').casecmp('Y').zero?
    publish_date = Date.parse(get_user_input('Publish Date (YYYY-MM-DD): '))
    archived = get_user_input('Is it archived? [Y/N]: ').casecmp('Y').zero?
    album = Music.new(publish_date: publish_date, archived: archived, on_spotify: spotify)
    album.genre = add_genre
    album.author = add_author
    album.source = add_source
    album.label = add_label
    @music_albums.push(album)
    puts 'Album Added successfully'
    puts ' '
  end

  def add_movie()
    puts 'Adding A Movie:'
    silent = get_user_input('Is it a silent movie? [Y/N]: ').casecmp('Y').zero?
    publish_date = Date.parse(get_user_input('Publish Date (YYYY-MM-DD): '))
    archived = get_user_input('Is it archived? [Y/N]: ').casecmp('Y').zero?
    movie = Movie.new(publish_date: publish_date, archived: archived, silent: silent)
    movie.genre = add_genre
    movie.author = add_author
    movie.source = add_source
    movie.label = add_label
    @movies.push(movie)
    puts 'Movie Added successfully'
    puts ' '
  end

  def add_game()
    puts 'Adding A Game:'
    multiplay = get_user_input('Is it multiplayer? [Y/N]: ').casecmp('Y').zero?
    last_played = Date.parse(get_user_input('Last played date (YYYY-MM-DD): '))
    publish = Date.parse(get_user_input('Publish Date (YYYY-MM-DD): '))
    archive = get_user_input('Is it archived? [Y/N]: ').casecmp('Y').zero?
    game = Game.new(publish_date: publish, archived: archive, multiplayer: multiplay, last_played_at: last_played)
    game.genre = add_genre
    game.author = add_author
    game.source = add_source
    game.label = add_label
    @games.push(game)
    puts 'Game Added successfully'
    puts ' '
  end

  # def add_item(**args)
  #   publish_date = Date.parse(get_user_input('Publish Date (YYYY-MM-DD): '))
  #   archived = get_user_input('Is it archived? [Y/N]: ').casecmp('Y').zero?
  #   case args[:class_name]
  #   when Book
  #     publisher = args[:publisher]
  #     cover_state = args[:cover_state]
  #     item = Book.new(publish_date: publish_date, archived: archived, publisher: publisher, cover_state: cover_state)
  #   when Music
  #     on_spotify = args[:on_spotify]
  #     item = Music.new(publish_date: publish_date, archived: archived, on_spotify: on_spotify)
  #   when Movie
  #     silent = args[:silent]
  #     item = Movie.new(publish_date: publish_date, archived: archived, silent: silent)
  #   when Game
  #     multiplayer = args[:multiplayer]
  #     last_played_at = args[:last_played_at]
  #     item = Game.new(publish_date: publish_date, archived: archived, multiplayer: multiplayer, last_played_at: last_played_at)
  #   else
  #     puts "Invalid item class: #{args[:class_name]}"
  #     return nil
  #   end
  #   item.genre = add_genre
  #   item.author = add_author
  #   item.source = add_source
  #   item.label = add_label
  #   item
  # end

  def save_data()
    File.write('genres.json', JSON.pretty_generate(@genres))
    File.write('labels.json', JSON.pretty_generate(@labels))
    File.write('authors.json', JSON.pretty_generate(@authors))
    File.write('sources.json', JSON.pretty_generate(@sources))
    File.write('books.json', JSON.pretty_generate(@books))
    File.write('music_albums.json', JSON.pretty_generate(@music_albums))
    File.write('movies.json', JSON.pretty_generate(@movies))
    File.write('games.json', JSON.pretty_generate(@games))
  end

  def load_data(file)
    if File.exist?(file)
      file_data = JSON.parse(File.read(file))
      data = []
      case file
      when 'books.json'
        data = parse_data(file_data, file)
      when 'music_albums.json'
        data = parse_data(file_data, file)
      when 'movies.json'
        data = parse_data(file_data, file)
      when 'games.json'
        data = parse_data(file_data, file)
      when 'genres.json'
        file_data.map do |genre|
          item = Genre.new(name: genre['name'])
          item.id = genre['id']
          data.push(item)
        end
      when 'labels.json'
        file_data.map do |label|
          item = Label.new(title: label['title'], color: label['color'])
          item.id = label['id']
          data.push(item)
        end
      when 'authors.json'
        file_data.map do |author|
          item = Author.new(first_name: author['first_name'], last_name: author['last_name'])
          item.id = author['id']
          data.push(item)
        end
      when 'sources.json'
        file_data.map do |source|
          item = Source.new(name: source['name'])
          item.id = source['id']
          data.push(item)
        end
      else
        puts "#{file} does not exist!"
      end
      return data
    end
    []
  end

  private

  def add_genre()
    genre_name = get_user_input('Genre: ')
    genre = @genres.find { |g| g.name == genre_name }
    if genre.nil?
      genre = Genre.new(name: genre_name)
      @genres.push(genre)
    end
    genre
  end

  def add_author()
    first_name = get_user_input('First Name of Author: ')
    last_name = get_user_input('Last Name of Author: ')
    author = @authors.find { |a| a.first_name == first_name && a.last_name == last_name }
    if author.nil?
      author = Author.new(first_name: first_name, last_name: last_name)
      authors.push(author)
    end
    author
  end

  def add_source()
    source_name = get_user_input('Source: ')
    source = @sources.find { |s| s.name == source_name }
    if source.nil?
      source = Source.new(name: source_name)
      @sources.push(source)
    end
    source
  end

  def add_label()
    label_title = get_user_input('Title: ')
    label_color = get_user_input('Color: ')
    label = @labels.find { |l| l.title == label_title && l.color == label_color }
    if label.nil?
      label = Label.new(title: label_title, color: label_color)
      @labels.push(label)
    end
    label
  end

  def get_user_input(prompt)
    print prompt
    gets.chomp
  end

  def parse_data(file_data, file)
    file_data.map do |item|
      genre = @genres.find { |g| g.name == item['genre']['name'] }
      source = @sources.find { |s| s.name == item['source']['name'] }
      author = @authors.find do |a|
        a.first_name == item['author']['first_name'] && a.last_name == item['author']['last_name']
      end
      label = @labels.find { |l| l.title == item['label']['title'] && l.color == item['label']['color'] }
      case file
      when 'books.json'
        book = Book.new(publish_date: Date.parse(item['publish_date']), archived: item['archived'],
                        publisher: item['publisher'], cover_state: item['cover_state'])
        book.id = item['id']
        book.genre = genre
        book.source = source
        book.author = author
        book.label = label
        book
      when 'music_albums.json'
        album = Music.new(publish_date: Date.parse(item['publish_date']), archived: item['archived'],
                          on_spotify: item['on_spotify'])
        album.id = item['id']
        album.genre = genre
        album.source = source
        album.author = author
        album.label = label
        album
      when 'movies.json'
        movie = Movie.new(publish_date: Date.parse(item['publish_date']), archived: item['archived'],
                          silent: item['silent'])
        movie.id = item['id']
        movie.genre = genre
        movie.source = source
        movie.author = author
        movie.label = label
        movie
      when 'games.json'
        game = Game.new(publish_date: Date.parse(item['publish_date']), archived: item['archived'],
                        multiplayer: item['multiplayer'], last_played_at: Date.parse(item['last_played_at']))
        game.id = item['id']
        game.genre = genre
        game.source = source
        game.author = author
        game.label = label
        game
      else
        puts "#{file} does not exist!"
      end
    end
  end

  # def parse_people_data(file_data)
  #   persons = []
  #   file_data.map do |person|
  #     if person.key?('specialization')
  #       teacher = Teacher.new(person['name'], person['age'], person['specialization'])
  #       teacher.id = person['id']
  #       persons.push(teacher)
  #     else
  #       student = Student.new(person['name'], person['age'])
  #       student.parent_permission = person['parent_permission']
  #       student.id = person['id']
  #       persons.push(student)
  #     end
  #   end
  #   persons
  # end

  def display_items(items, kind)
    if items.empty?
      puts "Record of #{kind}: 0 found "
    else
      puts "Listing all #{kind}:"
      items.each_with_index do |item, index|
        puts "#{index + 1}) #{yield(item)}"
      end
      puts ' '
    end
  end
end

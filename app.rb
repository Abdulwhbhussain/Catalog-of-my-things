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

def get_user_input(prompt)
  print prompt
  gets.chomp
end

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

def parse_items(file_data)
  file_data.map do |item|
    itm = yield(item)
    itm.id = item['id']
    itm
  end
end

def choose_item(file, item)
  case file
  when 'books.json'
    Book.new(publish_date: Date.parse(item['publish_date']), archived: item['archived'],
             publisher: item['publisher'], cover_state: item['cover_state'])
  when 'music_albums.json'
    Music.new(publish_date: Date.parse(item['publish_date']), archived: item['archived'],
              on_spotify: item['on_spotify'])
  when 'movies.json'
    Movie.new(publish_date: Date.parse(item['publish_date']), archived: item['archived'],
              silent: item['silent'])
  when 'games.json'
    Game.new(publish_date: Date.parse(item['publish_date']), archived: item['archived'],
             multiplayer: item['multiplayer'], last_played_at: Date.parse(item['last_played_at']))
  else
    puts "#{file} does not exist!"
  end
end

def fill_data(file_data, file, genres_and_sources, labels_and_authors)
  file_data.map do |item|
    genre = find_genre(genres_and_sources[0], item)
    source = find_source(genres_and_sources[1], item)
    author = find_author(labels_and_authors[1], item)
    label = find_label(labels_and_authors[0], item)
    item_var = choose_item(file, item)
    item_var.id = item['id']
    item_var.genre = genre
    item_var.source = source
    item_var.author = author
    item_var.label = label
    item_var
  end
end

def find_genre(genres, item)
  genres.find { |g| g.name == item['genre']['name'] }
end

def find_source(sources, item)
  sources.find { |s| s.name == item['source']['name'] }
end

def find_author(authors, item)
  authors.find do |a|
    a.first_name == item['author']['first_name'] && a.last_name == item['author']['last_name']
  end
end

def find_label(labels, item)
  labels.find { |l| l.title == item['label']['title'] && l.color == item['label']['color'] }
end

def parse_data_based_on_file(file_data, file)
  data = []
  file_categories = ['books.json', 'music_albums.json', 'movies.json', 'games.json']
  data = parse_data(file_data, file) if file_categories.include?(file)
  data = parse_genre(file_data) if file == 'genres.json'
  data = parse_label(file_data) if file == 'labels.json'
  data = parse_author(file_data) if file == 'authors.json'
  data = parse_source(file_data) if file == 'sources.json'
  data
end

def parse_genre(file_data)
  parse_items(file_data) { |genre| Genre.new(name: genre['name']) }
end

def parse_label(file_data)
  parse_items(file_data) do |label|
    Label.new(title: label['title'], color: label['color'])
  end
end

def parse_author(file_data)
  parse_items(file_data) do |author|
    Author.new(first_name: author['first_name'], last_name: author['last_name'])
  end
end

def parse_source(file_data)
  parse_items(file_data) { |source| Source.new(name: source['name']) }
end

def add_categories(item, genres, authors, sources, labels)
  item.genre = add_genre(genres)
  item.author = add_author(authors)
  item.source = add_source(sources)
  item.label = add_label(labels)
  item
end

def add_genre(genres)
  genre_name = get_user_input('Genre: ')
  genre = genres.find { |g| g.name == genre_name }
  if genre.nil?
    genre = Genre.new(name: genre_name)
    genres.push(genre)
  end
  genre
end

def add_author(authors)
  first_name = get_user_input('First Name of Author: ')
  last_name = get_user_input('Last Name of Author: ')
  author = authors.find { |a| a.first_name == first_name && a.last_name == last_name }
  if author.nil?
    author = Author.new(first_name: first_name, last_name: last_name)
    authors.push(author)
  end
  author
end

def add_source(sources)
  source_name = get_user_input('Source: ')
  source = sources.find { |s| s.name == source_name }
  if source.nil?
    source = Source.new(name: source_name)
    sources.push(source)
  end
  source
end

def add_label(labels)
  label_title = get_user_input('Title: ')
  label_color = get_user_input('Color: ')
  label = labels.find { |l| l.title == label_title && l.color == label_color }
  if label.nil?
    label = Label.new(title: label_title, color: label_color)
    labels.push(label)
  end
  label
end

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
      "Album Id: #{album.id}, Music Name: #{album.label.title}, On Spotify: #{album.on_spotify}"
    end
  end

  def movies_list()
    display_items(@movies, 'Movies') do |movie|
      "Movie Id: #{movie.id}, Movie Name: #{movie.label.title}, Silent: #{movie.silent}"
    end
  end

  def games_list()
    display_items(@games, 'Games') do |game|
      "Game Id: #{game.id}, Game Name: #{game.label.title}, Multiplayer: #{game.multiplayer}"
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
    book = add_categories(book, @genres, @authors, @sources, @labels)
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
    album = add_categories(album, @genres, @authors, @sources, @labels)
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
    movie = add_categories(movie, @genres, @authors, @sources, @labels)
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
    game = add_categories(game, @genres, @authors, @sources, @labels)
    @games.push(game)
    puts 'Game Added successfully'
    puts ' '
  end

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
      parse_data_based_on_file(file_data, file)
    else
      puts "#{file} does not exist!"
      []
    end
  end

  private

  def parse_data(file_data, file)
    genres_and_sources = [@genres, @sources]
    labels_and_authors = [@labels, @authors]
    fill_data(file_data, file, genres_and_sources, labels_and_authors)
  end
end

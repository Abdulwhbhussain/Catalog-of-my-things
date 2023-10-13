require_relative '../classes/item'
require 'rspec'

describe Item do
  before(:each) do
    @item =
      Item.new(
        publish_date: Date.new(2000, 1, 1),
        archived: false
      )
  end

  describe '#genre=' do
    it 'assigns a genre to an item' do
      genre = double('Genre')
      allow(genre).to receive(:items).and_return([])
      @item.genre = genre
      expect(@item.genre).to eq genre
    end
  end

  describe '#author=' do
    it 'assigns an author to an item' do
      author = double('Author')
      allow(author).to receive(:items).and_return([])
      @item.author = author
      expect(@item.author).to eq author
    end
  end

  describe '#source=' do
    it 'assigns a source to an item' do
      source = double('Source')
      allow(source).to receive(:items).and_return([])
      @item.source = source
      expect(@item.source).to eq source
    end
  end

  describe '#label=' do
    it 'assigns a label to an item' do
      label = double('Label')
      allow(label).to receive(:items).and_return([])
      @item.label = label
      expect(@item.label).to eq label
    end
  end

  describe '#initialize' do
    it 'creates a new Item object' do
      expect(@item).to be_an_instance_of Item
    end
  end

  describe '#move_to_archive' do
    it 'moves an item to the archive' do
      expect(@item.move_to_archive).to be true
    end
  end

  describe '#can_be_archived?' do
    it 'checks if an item can be archived' do
      expect(@item.send(:can_be_archived?)).to be true
    end
  end

  describe '#check_date' do
    it 'checks if an item is older than 10 years' do
      expect(@item.send(:check_date, Date.new(2000, 1, 1))).to be true
    end
  end
end

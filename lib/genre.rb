class Genre
  extend Concerns::Findable

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Genre.new(name).tap { |genre| genre.save }
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect { |song| song.artist }.uniq
  end

end

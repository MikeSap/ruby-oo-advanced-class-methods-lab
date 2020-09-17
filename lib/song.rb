class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    @name = name
    song = Song.new
    song.name = @name
    song
  end
  
  def self.create_by_name(name)
    @name = name
    song = Song.create
    song.name = name
    song
  end


  def self.find_by_name(song)
    self.all.find do |songs| songs.name == song
    end
  end

  def self.find_or_create_by_name(song)
      self.find_by_name(song) || self.create_by_name(song)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
      artist_song = file.split(" - ")
      artist = artist_song[0]
      song_name = artist_song[1].gsub(".mp3", "")
     new_song = self.create
     new_song.name = song_name
     new_song.artist_name = artist
     new_song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end
  
end

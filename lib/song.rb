class Song
  
  @@artists = []
  @@genres = []
  @@count = 0
  @@artist_count = {}
  @@genre_count = {}

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre

    @@artists << artist
    @@genres << genre
    @@count += 1

  end

  def self.artists
    @@artists
  end

  def self.genres
    @@genres
  end

  def self.count
    @@count
  end

  #expect(Song.artist_count).to eq({"Brittany Spears" => 1, "Jay-Z" => 2})
  def self.artist_count
    h = {}
    self.artists.map.with_index do |ak, av|
      h.update({
        ak => self.artists.count { |c| c == ak }
      })
    end
    @@artist_count = h.sort.to_h
  end

  #expect(Song.genre_count).to eq({"pop" => 1, "rap" => 2})
  def self.genre_count
    h = {}
    @@genre_count = self.genres.map.with_index do |gk, gv|
      h.update({
        gk => self.genres.count { |c| c == gk }
      })
    end
    @@genre_count = h.sort.to_h
  end
end


lucifer = Song.new('Lucifer', 'Jay-Z', 'rap')
ninety_nine_problems = Song.new('99 Problems', 'Jay-Z', 'rap')
hit_me = Song.new('hit me baby one more time', 'Brittany Spears', 'pop')

#Song.artist_count

Song.genre_count

Song.count
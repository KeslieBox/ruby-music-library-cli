

class Artist
    extend Concerns::Findable
    attr_accessor :name, :songs, :genres
    
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        # @genres = []
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end


    def songs
        @songs
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        s = self.new(name)
        s.save
        s
    end

    def add_song(song)
        song.artist = self unless song.artist
        @songs << song unless songs.include?(song)

    end

    def genres
       x = songs.collect do |song|
            song.genre
        end.uniq
    end

end




class Genre
extend Concerns::Findable
attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        # @artist.genres << self
    end

    def songs
        @songs
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        s = self.new(name)
        s.save
        s
    end

    def artists
        songs.collect do |song|
            song.artist
        end.uniq
        
    end

end
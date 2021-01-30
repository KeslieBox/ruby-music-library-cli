class Genre
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
        self.new(name).save
        self
    end

    def artists
        songs.collect do |song|
            song.artist
        end.uniq
        
    end

end
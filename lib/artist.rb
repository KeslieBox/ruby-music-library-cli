
# class Artist
#     attr_accessor :name, :songs, :genres
    
#     @@all = []

#     def initialize(name)
#         @name = name
#         @songs = []
#         # @genres = []
#     end

#     def save
#         @@all << self
#     end

#     def self.all
#         @@all
#     end

#     def self.find_or_create_by_name(name)
#         self.find(name) ? self.find(name) : self.new(name)  
#     end


#     def songs
#         # Song.all.select do |song|
#         #     song.artist == self
#         # end
#         @songs
#     end

#     def self.destroy_all
#         @@all.clear
#     end

#     def self.create(name)
#         self.new(name).save
#         self
#     end

#     def add_song(song)
#         if song.artist == nil
#             song.artist = self
#             @songs << song 
#         end
#     end

#     def genres
#         songs.collect do |song|
#             # song.artist == self
#         end
    
#     end
# end



class Artist
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

    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)  
    end


    def songs
        # Song.all.select do |song|
        #     song.artist == self
        # end
        @songs
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        self.new(name).save
        self
    end

    def add_song(song)
        # if song.artist == nil
        #     song.artist = self
        #     @songs << song 
        # end
        # songs
        song.artist = self unless song.artist
        @songs << song unless songs.include?(song)

    end

    def genres
       x = songs.collect do |song|
            song.genre
        end.uniq
    
    end
end





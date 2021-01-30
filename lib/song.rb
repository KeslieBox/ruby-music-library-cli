# require 'pry'

# class Song
#     attr_accessor :name, :artist, :genre
    
 
#     @@all = []
 
#     def initialize(name, artist=nil, genre=nil)
#         @name = name 
#         self.artist = artist if artist
#         self.genre = genre if genre
#         @artist = artist if artist
#         # @artist.songs << self
#     end
 
#     def self.all
#         @@all
#     end

#     def save
#         @@all << self
#     end
    
#     # def self.new_by_filename(filename)
#     #     file_name = filename.split(" - ")
#     #     song = Song.new(file_name[1])
#     #     song.artiste=(file_name[0])       
#     #     song
#     # end
    
#     # def artist=(artist)
#     #     self.artist = Artist.find_or_create_by_name(artist)
#     #     artist.add_song(self)
#     # end

#     def self.destroy_all
#         self.all.clear
#     end

#     def self.create(name)
#         self.new(name).save
#         self
#     end

#     def artist=(artist)
#        @artist = artist
#        artist.add_song(self)
#     end

#     def genre=(genre)
#         @genre = genre
#         genre.songs << self if !genre.songs.include?(self)
      
#     end
# end

require 'pry'

class Song
    attr_accessor :name
    attr_reader :artist, :genre
    
 
    @@all = []
 
    def initialize(name, artist=nil, genre=nil)
        @name = name 
        self.artist = artist if artist
        self.genre = genre if genre
    end
 
    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create(name)
        s = self.new(name)
        s.save
        s
    end

    def artist=(artist)
       @artist = artist
       artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self if !genre.songs.include?(self)
    end

    def self.find_by_name(name)
        @@all.detect do |song|
          song.name == name
        end
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end
    
    def self.new_from_filename(file)
        file = file.gsub(".mp3", "")
        artist, song, genre = file.split(" - ")

        song_artist = Artist.find_or_create_by_name(artist)
        song_genre = Genre.find_or_create_by_name(genre)
        song = self.find_or_create_by_name(song)
        # binding.pry
    end

    
end


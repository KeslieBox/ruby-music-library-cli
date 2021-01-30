class MusicImporter

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        files = Dir.glob("#{path}/*.mp3").collect do |filename|
            filename.gsub("#{path}/", "")
        end    
    end

end
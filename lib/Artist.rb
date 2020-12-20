class Artist
    extend Concerns::Findable
    
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
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
        new = self.new(name)
        new.save
        new
    end

    def add_song(song)
        if @songs.include?(song) == false
            @songs << song
            if song.artist == nil
                song.artist = self
            end
        end
    end

    def songs
        @songs
    end

    def genres
        songs.collect{|song| song.genre}.uniq
    end
        
        
    
end
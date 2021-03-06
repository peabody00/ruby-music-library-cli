class Genre
    extend Concerns::Findable
    
    attr_accessor :name
    attr_reader :song

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

    def songs
        @songs
    end

    def artists
        songs.collect{|song| song.artist}.uniq
    end
    
end
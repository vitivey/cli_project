class Event
    attr_accessor :name, :date, :location, :phone, :website, :category
    @@all=[]

    def initialize
        save
    end

    def upcoming_events  #add object details to the list of all upcoming events
        Scraper.scraped_summary_results.each do |key, value|  #scraped_summary_results should output hash
           self.send("#{key}=", value)
        end
    end

    

    def self.all
        @@all
    end

    def save
        @@all << self
    end

end
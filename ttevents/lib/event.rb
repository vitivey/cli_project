class Events
    attr_accessor :name, :date, :location, :phone, :website, :category, :details
    @@all=[]

    def initialize(event_hash)
        event_hash.each {|key, value| self.send("#{key}=", value)} #adds name, dat, location and website to event
        save
    end

    def self.create(search_results)  
        search_results.each {|event| Events.new(event)} #event is a hash of event details
    end

    def self.add_event_details(event_object)  #selected event is an event object
        Scraper.event_details(event_object.website).each do |key, value|
            event_object.send("#{key}=", value)
        end
    end

    def self.all
        @@all
    end

    def reset_all
        @@all.clear
    end

    def save
        @@all << self
    end

end
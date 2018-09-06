class CLI

    def initialize
        puts "What's happening around town? Enter 'list' to see a list of events"
        Search.new.search_events
    end
    
end
class CLI

    def self.run
        puts "What's happening around town? Let's find out!"
        Search.new.search_events
    end

end
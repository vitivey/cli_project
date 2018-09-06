class CLI

    def self.run
        puts "What's happening around town? Let's find out!"
        CLI.menu
        Search.new.search_events
    end

    
    def self.details(index) #how do I make this method private? doesn't seem to work
        puts "Event: #{Events.all[index].name}"
        puts "Date and Time: #{Events.all[index].date}"
        puts "Location: #{Events.all[index].location}"
        puts "Phone: #{Events.all[index].phone}" if !Events.all[index].phone.empty?
        puts "Category: #{Events.all[index].category}" if !Events.all[index].category.empty?
        puts "Details: #{Events.all[index].details}" if !Events.all[index].details.empty?
        puts "" #is there an alternative to putting blank line for extra space?
        puts "Enter the event number to see more details on another event"
    end
    
    def self.exit
        puts ""
        puts "Thank you! Goodbye!"
    end

    def self.invalid
        puts ""
        puts "Invalid input!"
        puts "Enter an event number between 1-#{Events.all.size} to see more details on a particular event"
    end

    def self.list_selection
        puts ""
        puts "What event interests you?"
        puts "Enter the event number to see more details on a particular event"
        puts "Enter 'exit' to end session"
    end

    def self.menu
        puts "Enter 'list' to see list of events"
        puts "Enter 'exit' to end session"
    end
end
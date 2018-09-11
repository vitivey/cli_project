class CLI

    def run
        puts "What's happening around Trinidad & Tobago? Let's find out!"
        search_events
    end

    def load_events  #loads all event data when search
        Events.create(Scraper.summary_results) if Events.all.empty?
    end

    def search_events
        menu
        input=gets
        if input.strip== "list"
            load_events
            list_of_events
            list_event_selection
            search_events
        elsif input.strip=="exit"
            end_search
        elsif input.to_i > 0 && input.to_i <= Events.all.size #i.e., it is an integer
            search_results(input)
            search_events
        else
            invalid
            search_events
        end
    end

    def list_of_events         #User types 'list' and sees list upcoming events
        Events.all.each_with_index do |event, index|
            puts "#{index+1}. #{event.name} - #{event.location}"
        end
    end

    def search_results(input) #run the search and loops
        event_details(convert_input(input))
    end

    def convert_input(input) #converts index to event number
        index=input.to_i-1
    end

    def event_details(index) #returns the details of one event
        Events.add_event_details(Events.all[index]) if Events.all[index].phone.nil? #updates event with additional details; prevents from being run multiple times
        search_details(index)
    end

    def search_details(index) #how do I make this method private? doesn't seem to work
        puts "Event: #{Events.all[index].name}"
        puts "Date and Time: #{Events.all[index].date}"
        puts "Location: #{Events.all[index].location}"
        puts "Phone: #{Events.all[index].phone}" if !Events.all[index].phone.empty?
        puts "Category: #{Events.all[index].category}" if !Events.all[index].category.empty?
        puts "Details: #{Events.all[index].details}" if !Events.all[index].details.empty?
        puts "" #is there an alternative to putting blank line for extra space?
        puts "Enter the event number to see more details on another event"
    end
    
    def end_search
        puts ""
        puts "Thank you! Goodbye!"
    end

    def invalid
        puts ""
        puts "Invalid input!"
        puts "Enter an event number between 1-#{Events.all.size} to see more details on a particular event"
    end

    def list_event_selection
        puts ""
        puts "What event interests you?"
        puts "Enter the event number to see more details on a particular event"
    end

    def menu
        puts "Enter 'list' to see list of events"
        puts "Enter 'exit' to end session"
    end

end
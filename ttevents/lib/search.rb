class Search

    def load_events  #loads all event data when search
        Events.create(Scraper.summary_results) if Events.all.empty?
    end

    def search_events
        input=gets
        if input.strip== "list"
            load_events
            list
            CLI.list_selection
            search_events
        elsif input.strip=="exit"
            CLI.exit
        elsif input.to_i > 0 && input.to_i <= Events.all.size #i.e., it is an integer
            search_results(input)
            CLI.menu
            search_events
        else
            CLI.invalid
            CLI.menu
            search_events
        end
    end

    def list         #User types 'list' and sees list upcoming events
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
        Events.add_event_details(Events.all[index]) #updates event with additional details
        CLI.details(index)
    end



end
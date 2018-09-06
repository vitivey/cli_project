class Search

    def load_events  #loads all event data when search
        Events.create(Scraper.summary_results)
    end

    def search_events
        input=gets
        if input.strip== "list"
            load_events
            list
        elsif input.strip=="exit"
            puts "Thank you! Goodbye!"
        elsif input.to_i > 0 #i.e., it is an integer
            search_results(input)
        else
            puts "Invalid input"
            CLI.new
        end
    end

    def list
        #User types 'list' and sees list upcoming events
        Events.all.each_with_index do |event, index|
            puts "#{index+1}. #{event.name} - #{event.date}"
        end
        puts "What event interests you?"
        puts "Enter number to show details on a specific event, or enter 'exit' to end session."
        search_events
    end

    def search_results(input) #run the search and loops
        event_details(convert_input(input))
        search_events
    end

    def convert_input(input) #converts index to event number
        index=input.to_i-1
    end

    def event_details(index) #returns the details of one event
        # event_id=convert_input(input)
        Events.add_event_details(Events.all[index])
        puts "name: #{Events.all[index].name}"
        puts "date: #{Events.all[index].date}"
        puts "location: #{Events.all[index].location}"
        puts "phone: #{Events.all[index].phone}" if !Events.all[index].phone.empty?
        puts "category: #{Events.all[index].category}" if !Events.all[index].category.empty?
        puts "details: #{Events.all[index].details}" if !Events.all[index].details.empty?
    end

    



end
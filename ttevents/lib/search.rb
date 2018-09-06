class Search

    def search_events
        input=gets
        if input.strip== "list"
            list
        elsif input=="exit"
            "exit"
        elsif input.to_i > 0 #i.e., it is an integer
            search_results(input)
        else
            puts "Invalid input"
            # CLI.new
        end
    end

    def list
        #User types 'list' and sees list upcoming events
        puts "What event interests you?"
        puts "Enter number to show details on a specific event, or enter 'exit' to end session."
        Event.all.each_with_index do |event, index|
            puts "#{index+1}. #{event.name} - #{event.date} - #{event.location}"
        end
    end

    def input(event_id)
        input.to_i+1
    end

    def event_details(event_id) #returns the details of one event
        id=input(event_id)
        event=Scraper.event_details(Event.all[id].website)
        
        # {:Event= "LE BALLET SCHOOL",
        # :When= "Thu. 02 AUG, 2018 to Sun. 30 SEP, 2018",
        # :Phone= "1 (868) 225-2807",
        # :Website= "https://leballetschooltt.wixsite.com/landingpage",
        # :Category= "Education , Arts & Culture , Family & Kids"}
    end

    def search_results(input) #User enters 1
        event_details(input)
        search_events
    end



end
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
        Event.all
    end

    def input(event_id)
        input.to_i+1
    end

    def event_details(event_id) #returns the details of one event
        id=input(event_id)
        puts Event.all[id]
        # puts "1. LE BALLET SCHOOL - Thursday 02 August, 2018. 09:00AM - Young Women's Christian Association (YWCA)"
        # puts "2. T&T Photographic Soci… - Wednesday 29 August, 2018. 07:00PM - Horizons Art Gallery"
    end

    def search_results(input) #User enters 1
        event_details(input)
        search_events
    end



end
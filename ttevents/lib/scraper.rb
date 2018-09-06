class Scraper

    def self.scraped_summary_results #stores each event in a list (array)
        html=open("https://buzz.tt/events")
        html_nodes=Nokogiri::HTML(html)
        results=[]
        # html_nodes.search(".ev-card .card-det h4")[0].text
        html_nodes.search(".ev-card").each do |event|
            name = event.search(".card-det h4").text.strip
            date =  event.search(".card-det p").first.text.strip
            location = event.search(".card-det .ev-venue").first.text.strip
            website= "https://buzz.tt/events/#{event.search(".card-det a").first.attr("href")}"
            event_summary="#{name} - #{date} - #{location}"
            puts "#{event_summary}"
            results << event_summary
        end
        
        results
    end

    def scraped_event_details(website) #stores event details in a hash

        # {:Event= "LE BALLET SCHOOL",
        # :When= "Thu. 02 AUG, 2018 to Sun. 30 SEP, 2018",
        # :Phone= "1 (868) 225-2807",
        # :Website= "https://leballetschooltt.wixsite.com/landingpage",
        # :Category= "Education , Arts & Culture , Family & Kids"}
    end
end
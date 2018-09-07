class Scraper

    def self.summary_results #stores each event in a list (array)
        html=open("https://buzz.tt/events")
        html_nodes=Nokogiri::HTML(html)
        
        # html_nodes.search(".ev-card .card-det h4")[0].text
        html_nodes.search(".ev-card").collect do |event|
            name = event.search(".card-det h4").text.strip
            date =  event.search(".card-det p").first.text.strip
            location = event.search(".card-det .ev-venue").first.text.strip
            website= "https://buzz.tt#{event.search(".card-det a").first.attr("href")}"
            {
                :name => name,
                :date => date,
                :location => location,
                :website => website
            }
        end
    end


    def self.event_details(website) #stores event details in a hash
        html=open(website)
        html_nodes=Nokogiri::HTML(html)

        phone=String.new
        category=String.new
            count=0
            while count < html_nodes.search(".ev-det-pg li").count
                value = html_nodes.search(".ev-det-pg li")[count]
                if !value.child.attributes.values.first.nil?
                    phone= value.text.strip if (value.child.attributes.values.first.value.include?("phone"))

                    category= value.text.gsub(/\s+/, " ").strip if (value.child.attributes.values.first.value.include?("folder"))
                end
                count+=1
            end

        details= html_nodes.search(".details-block").text.gsub(/\s+/, " ").strip

        event={
            :phone => phone,
            :category => category,
            :details => details
        }
    end
end


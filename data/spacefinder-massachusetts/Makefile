VPATH = finished

.PHONY: all clean

all: scraped-spacefinder-massachusetts.csv

clean:
	rm -Rf finished/*

scraped-spacefinder-massachusetts.csv:
	@echo "Scraping Spacefinder"
	$(PROCESSOR_DIR)/scrape-spacefinder-mass.rb > finished/$(notdir $@)

spacefinder-massachusetts.csv: scraped-spacefinder-massachusetts.csv
	csvcut -l -c "1,2,4" -x |\
		(echo "spacefinder-massachusetts_id,Name,Municipality"; tail +2) "$<" > finished/$(notdir $@)

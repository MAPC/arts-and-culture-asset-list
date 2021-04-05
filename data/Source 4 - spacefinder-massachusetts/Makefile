VPATH = finished

.PHONY: all clean
.SECONDARY: spacefinder-massachusetts-full.csv
all: spacefinder-massachusetts.csv

clean:
	rm -Rf finished/*

scraped-spacefinder-massachusetts.csv:
	@echo "Scraping Spacefinder"
	$(PROCESSOR_DIR)/scrape-spacefinder-mass.rb > finished/$(notdir $@)

spacefinder-massachusetts.csv: spacefinder-massachusetts-full.csv
	csvcut -l -c "title,municipality" -x "finished/$<" |\
		(echo "spacefinder-massachusetts_id,Name,Municipality,cff-all-applications_id,cultural-spaces-and-resources-in-ma_id,artist-work-live-spaces_id"; tail +2) |\
		csvcut -c "Name,Municipality,artist-work-live-spaces_id,cff-all-applications_id,cultural-spaces-and-resources-in-ma_id,spacefinder-massachusetts_id" > finished/$(notdir $@)

spacefinder-massachusetts-full.csv: scraped-spacefinder-massachusetts.csv
	csvcut -l -x "finished/$<" > finished/$(notdir $@)

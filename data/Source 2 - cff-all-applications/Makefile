VPATH = finished

.PHONY: all clean
.SECONDARY: CFF-all-applications-full.csv
all: CFF-all-applications.csv

clean:
	rm -Rf finished/*

CFF-all-applications.csv: CFF-all-applications-full.csv
	csvcut -l -c "Name,City" -x "finished/$<" |\
		(echo "cff-all-applications_id,Name,Municipality,cultural-spaces-and-resources-in-ma_id,artist-work-live-spaces_id,spacefinder-massachusetts_id"; tail +2) |\
		csvcut -c "Name,Municipality,artist-work-live-spaces_id,cff-all-applications_id,cultural-spaces-and-resources-in-ma_id,spacefinder-massachusetts_id" > finished/$(notdir $@)

CFF-all-applications-full.csv: CFF-All-Applications-Geocoded.csv
	csvcut -l -x "$<" > finished/$(notdir $@)

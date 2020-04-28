VPATH = finished

.PHONY: all clean

all: CFF-all-applications.csv

clean:
	rm -Rf finished/*

CFF-all-applications.csv: CFF-All-Applications-Geocoded.csv
	csvcut -l -c "Name,City" -x "$<" |\
		(echo "cff-all-applications_id,Name,Municipality,cultural-spaces-and-resources-in-ma_id,artist-work-live-spaces_id,spacefinder-massachusetts_id"; tail +2) |\
		csvcut -c "Name,Municipality,artist-work-live-spaces_id,cff-all-applications_id,cultural-spaces-and-resources-in-ma_id,spacefinder-massachusetts_id" > finished/$(notdir $@)

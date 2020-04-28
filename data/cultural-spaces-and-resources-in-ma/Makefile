VPATH = finished

.PHONY: all clean

all: spaces-in-subregions.csv

clean:
	rm -Rf finished/*

spaces-in-subregions.csv: Cultural\ Spaces\ and\ Resources\ in\ MA.xlsx
	in2csv --sheet "Spaces in Subregions" "$<" |\
		csvcut -l -c "0,2" -x |\
			(echo "cultural-spaces-and-resources-in-ma_id,Name,Municipality,cff-all-applications_id,artist-work-live-spaces_id,spacefinder-massachusetts_id"; tail +2) |\
			csvcut -c "Name,Municipality,artist-work-live-spaces_id,cff-all-applications_id,cultural-spaces-and-resources-in-ma_id,spacefinder-massachusetts_id" > finished/$(notdir $@)

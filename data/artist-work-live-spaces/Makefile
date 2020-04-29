VPATH = finished

.PHONY: all clean
.SECONDARY: artist-work-live-spaces-full.csv
all: artist-work-live-spaces.csv

clean:
	rm -Rf finished/*

artist-work-live-spaces.csv: artist-work-live-spaces-full.csv
	csvcut -l -c "Name,City/Town" -x "finished/$<" |\
		(echo "artist-work-live-spaces_id,Name,Municipality,spacefinder-massachusetts_id,cff-all-applications_id,cultural-spaces-and-resources-in-ma_id"; tail +2) |\
		csvcut -c "Name,Municipality,artist-work-live-spaces_id,cff-all-applications_id,cultural-spaces-and-resources-in-ma_id,spacefinder-massachusetts_id" > finished/$(notdir $@)

artist-work-live-spaces-full.csv: Aritst\ work-live\ spaces-Master\ List.xlsx
	in2csv -l "$<" > finished/$(notdir $@)

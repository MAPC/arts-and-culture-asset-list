VPATH = finished

.PHONY: all clean
.SECONDARY: spaces-in-subregions-full.csv
all: spaces-in-subregions.csv

clean:
	rm -Rf finished/*

spaces-in-subregions.csv: spaces-in-subregions-full.csv
	csvcut -l -c "CREATIVE WORKSPACES,MUNICIPALITY" -x "finished/$<" |\
		(echo "cultural-spaces-and-resources-in-ma_id,Name,Municipality,cff-all-applications_id,artist-work-live-spaces_id,spacefinder-massachusetts_id"; tail +2) |\
		csvcut -c "Name,Municipality,artist-work-live-spaces_id,cff-all-applications_id,cultural-spaces-and-resources-in-ma_id,spacefinder-massachusetts_id" > finished/$(notdir $@)

spaces-in-subregions-full.csv: Cultural\ Spaces\ and\ Resources\ in\ MA.xlsx
	in2csv -l --sheet "Spaces in Subregions" "$<" > finished/$(notdir $@)

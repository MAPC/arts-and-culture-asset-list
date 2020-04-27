VPATH = finished

.PHONY: all clean

all: spaces-in-subregions.csv

clean:
	rm -Rf finished/*

spaces-in-subregions.csv: Cultural\ Spaces\ and\ Resources\ in\ MA.xlsx
	in2csv --sheet "Spaces in Subregions" "$<" |\
		csvcut -l -c "0,2" -x |\
			(echo "cultural-spaces-and-resources-in-ma_id,Name,Municipality"; tail +2) > finished/$(notdir $@)

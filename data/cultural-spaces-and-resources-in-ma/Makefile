VPATH = finished

.PHONY: all clean

all: spaces-in-subregions.csv

clean:
	rm -Rf finished/*

spaces-in-subregions.csv: Cultural\ Spaces\ and\ Resources\ in\ MA.xlsx
	in2csv -l --sheet "Spaces in Subregions" "$<" > finished/$(notdir $@)

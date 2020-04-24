VPATH = finished

.PHONY: all clean

all: artist-work-live-spaces.csv

clean:
	rm -Rf finished/*

artist-work-live-spaces.csv: Aritst\ work-live\ spaces-Master\ List.xlsx
	in2csv -l "$<" |\
	csvcut -c "1-3" -x |\
		(echo "artist-work-live-spaces_id,Name,Municipality"; tail +2) > finished/$(notdir $@)

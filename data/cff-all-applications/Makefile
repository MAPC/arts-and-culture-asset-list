VPATH = finished

.PHONY: all clean

all: CFF-all-applications.csv

clean:
	rm -Rf finished/*

CFF-all-applications.csv: CFF-All-Applications-Geocoded.csv
	csvcut -l -c "4,9" -x "$<" |\
		(echo "CFF-all-applications_id,Name,Municipality"; tail +2) > finished/$(notdir $@)

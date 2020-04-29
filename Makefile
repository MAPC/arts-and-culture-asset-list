VPATH = data/finished
DATA_DIRS = artist-work-live-spaces cff-all-applications cultural-spaces-and-resources spacefinder-massachusetts
DIR = $(CURDIR)
PROCESSOR_DIR = $(DIR)/processors
export

.PHONY: all clean
# .SECONDARY: arts-and-cultural-assets-massachusetts-clustered.csv

all:  arts-and-cultural-assets-massachusetts-stacked.csv

clean:
	cd data/spacefinder-massachusetts && $(MAKE) clean
	cd data/artist-work-live-spaces && $(MAKE) clean
	cd data/cff-all-applications && $(MAKE) clean
	cd data/cultural-spaces-and-resources-in-ma && $(MAKE) clean
	rm -Rf finished/*

artist-work-live-spaces:
	cd data/artist-work-live-spaces && $(MAKE)

cff-all-applications:
	cd data/cff-all-applications && $(MAKE)

cultural-spaces-and-resources-in-ma:
	cd data/cultural-spaces-and-resources-in-ma && $(MAKE)

spacefinder-massachusetts:
	cd data/spacefinder-massachusetts && $(MAKE)

arts-and-cultural-assets-massachusetts-stacked.csv: spacefinder-massachusetts artist-work-live-spaces cff-all-applications cultural-spaces-and-resources-in-ma
	csvstack data/artist-work-live-spaces/finished/artist-work-live-spaces.csv\
		data/cff-all-applications/finished/CFF-all-applications.csv\
		data/cultural-spaces-and-resources-in-ma/finished/spaces-in-subregions.csv\
		data/spacefinder-massachusetts/finished/spacefinder-massachusetts.csv > data/finished/$(notdir $@)
# 		csvdedupe --field_names Name Municipality --training_file processors/training-cluster-rooms.json > data/finished/$(notdir $@)

# arts-and-cultural-assets-massachusetts.csv: arts-and-cultural-assets-massachusetts-clustered.csv
# 	python3 processors/deduplicate.py data/finished/$< > data/finished/$(notdir $@)

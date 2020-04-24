DATA_DIRS = artist-work-live-spaces cff-all-applications cultural-spaces-and-resources spacefinder-massachusetts
DIR = $(CURDIR)
PROCESSOR_DIR = $(DIR)/processors
export

.PHONY: all clean

all: spacefinder-massachusetts artist-work-live-spaces cff-all-applications cultural-spaces-and-resources-in-ma

clean:
	cd data/spacefinder-massachusetts && $(MAKE) clean
	cd data/artist-work-live-spaces && $(MAKE) clean
	cd data/cff-all-applications && $(MAKE) clean
	cd data/cultural-spaces-and-resources-in-ma && $(MAKE) clean

spacefinder-massachusetts:
	cd data/spacefinder-massachusetts && $(MAKE)

artist-work-live-spaces:
	cd data/artist-work-live-spaces && $(MAKE)

cff-all-applications:
	cd data/cff-all-applications && $(MAKE)

cultural-spaces-and-resources-in-ma:
	cd data/cultural-spaces-and-resources-in-ma && $(MAKE)

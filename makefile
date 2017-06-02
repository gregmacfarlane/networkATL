# Makefile to build the network
NETWORK = atl_network.xml.gz

CP = -cp .:java/bin:lib/

all: $(NETWORK)
	@ echo $< successfully written

# Convert an OpenStreetMap xml file into a MATSim network
$(NETWORK): highway/atl_highway.xml
	@echo Writing MATSim network $@ from OSM file $< ...
	java $(CP) BuildNetwork highway/atl_highway.xml "EPSG:2818" $@

# Download the OpenStreetMap data based on the query xml file.
highway/atl_highway.xml: osm_query/atl_query.xml
	@echo Fetching OSM data from API Server
	@mkdir -p $(@D)
	@wget -O $@ --timeout=0 --post-file=$< "http://overpass-api.de/api/interpreter"


# download MARTA gtfs data
transit: transit/atl_gtfs.zip

transit/atl_gtfs.zip:
	@echo Fetching GTFS data from MARTA
	@mkdir -p $(@D)
	@wget -O $@ --timeout=0 "http://transitfeeds.com/link?u=http://www.itsmarta.com/google_transit_feed/google_transit.zip"

# Makefile to build the network

NETWORK = atl_network.xml.gz


all: $(NETWORK)
	@ echo $< successfully written

$(NETWORK): highway/atl_highway.xml
	@echo Writing MATSim network $@ from OSM file $< ...

highway/atl_highway.xml: osm_query/atl_query.xml
	@echo Fetching OSM data from API Server
	@wget -O $@ --timeout=0 --post-file=$< "http://overpass-api.de/api/interpreter"
	

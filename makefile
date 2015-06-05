# Makefile to build the network
NETWORK = atl_network.xml.gz

CP = -cp .:java/bin:/Users/gregmacfarlane/Documents/matsim-0.6.1/matsim-0.6.1.jar
JC = javac

all: $(NETWORK)
	@ echo $< successfully written

$(NETWORK): highway/atl_highway.xml java/bin/BuildNetwork.class
	@echo Writing MATSim network $@ from OSM file $< ...

highway/atl_highway.xml: osm_query/atl_query.xml
	@echo Fetching OSM data from API Server
	@wget -O $@ --timeout=0 --post-file=$< "http://overpass-api.de/api/interpreter"
	
java/bin/BuildNetwork.class: java/src/BuildNetwork.java
	@echo compiling Java class
	$(JC) -d $(@D) $(CP) $<

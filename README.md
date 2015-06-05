# networkATL
A MATSim network for Atlanta

This project builds a MATSim xml network for the highways in Atlanta, Georgia. It does this by pulling data from OpenStreetMap through the Overpass API.

To create the network:

  1. clone this repository
  2. download [MATSim](http://www.matsim.org)
  3. point the `CP` variable in the `makefile` to where you saved the MATSim `.jar` files.
  4. `make all`
    

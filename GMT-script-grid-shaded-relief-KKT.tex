#!/bin/sh
# Purpose: shaded relief grid raster map from the ETOPO1 from 1 arc minute global data set (here: Kuril-Kamchatka Trench)
# GMT modules: grdcut, makecpt, grdgradient, grdimage, grdcontour, psscale, gmtlogo
# Step-1. Extract a subset of ETOPO1m for the Kuril-Kamchatka Trench area 
grdcut earth_relief_01m.grd -R140/170/40/60 -Gkkt_relief.nc
# Step-2. Make color palette 
gmt makecpt -Cglobe.cpt -V -T-10000/1000 > myocean.cpt
# Step-3. Make raster image
gmt grdimage kkt_relief.nc -Cmyocean.cpt -R140/170/40/60 -JM6i -P -I+a15+ne0.75 -Xc -K > BathymetryKKT.ps
# Step-4. Add legend
gmt psscale -Dg135/40+w6.5i/0.15i+v+o0.3/0i+ml -Rkkt_relief.nc -J -Cmyocean.cpt \
	--FONT_LABEL=8p,Helvetica,dimgray \
	--FONT_ANNOT_PRIMARY=5p,Helvetica,dimgray \
	-Baf+l"Topographic color scale" \
	-I0.2 -By+lm -O -K >> BathymetryKKT.ps	
# Step-5. Add shorelines
gmt grdcontour kkt_relief.nc -R -J -C1000 -O -K >> BathymetryKKT.ps
# Step-6. Add grid
gmt psbasemap -R -J \
	--FORMAT_GEO_MAP=dddF \
	--MAP_FRAME_PEN=dimgray \
	--MAP_FRAME_WIDTH=0.1c \
	--MAP_TICK_PEN_PRIMARY=thinner,dimgray \
	--FONT_TITLE=12p,Palatino-Roman,black \
	--FONT_ANNOT_PRIMARY=7p,Helvetica,dimgray \
	--FONT_LABEL=7p,Helvetica,dimgray \
	-Tdx5.3i/0.5i+w0.3i+f2+l+o0.15i \
	-Lx5.3i/-0.5i+c50+w500k+l"Mercator projection. Scale (km)"+f \
	-Bxg4f2a4 -Byg4f2a4 \
	-B+t"Bathymetry of the Kuril-Kamchatka Trench: 1 arc min ETOPO1 Global Relief Model" -O -K >> BathymetryKKT.ps
# Step-7. Add GMT logo
gmt logo -Dx6.2/-2.2+o0.1i/0.1i+w2c -O >> BathymetryKKT.ps
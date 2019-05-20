#!/bin/sh
# Purpose: shaded relief grid raster map from the ETOPO1 from 1 arc minute global data set (here: Kuril-Kamchatka Trench)
# GMT modules: grdcut, makecpt, grdimage, psscale, grdcontour, psbasemap, gmtlogo, psconvert
# Step-1. Generate a file
ps=BathymetryKKT.ps
# Step-2. Extract a subset of ETOPO1m for the Kuril-Kamchatka Trench area
grdcut earth_relief_01m.grd -R140/170/40/60 -Gkkt_relief.nc
# Step-3. Make color palette
gmt makecpt -Cglobe.cpt -V -T-10000/1000 > myocean.cpt
# Step-4. Make raster image
gmt grdimage kkt_relief.nc -Cmyocean.cpt -R140/170/40/60 -JM6i -P -I+a15+ne0.75 -Xc -K > $ps
# Step-5. Add legend
gmt psscale -Dg135/40+w6.5i/0.15i+v+o0.3/0i+ml -Rkkt_relief.nc -J -Cmyocean.cpt \
	--FONT_LABEL=8p,Helvetica,dimgray \
	--FONT_ANNOT_PRIMARY=5p,Helvetica,dimgray \
	-Baf+l"Topographic color scale" \
	-I0.2 -By+lm -O -K >> $ps
# Step-6. Add shorelines
gmt grdcontour kkt_relief.nc -R -J -C1000 -O -K >> $ps
# Step-7. Add grid
gmt psbasemap -R -J \
	--FORMAT_GEO_MAP=dddF \
	--MAP_FRAME_PEN=dimgray \
	--MAP_FRAME_WIDTH=0.1c \
    --MAP_TITLE_OFFSET=1c \
	--MAP_TICK_PEN_PRIMARY=thinner,dimgray \
    --MAP_GRID_PEN_PRIMARY=thin,white \
    --MAP_GRID_PEN_SECONDARY=thinnest,white \
	--FONT_TITLE=12p,Palatino-Roman,black \
	--FONT_ANNOT_PRIMARY=7p,Helvetica,dimgray \
	--FONT_LABEL=7p,Helvetica,dimgray \
    -Bpxg8f2a4 -Bpyg6f3a3 -Bsxg4 -Bsyg3 \
    -B+t"Bathymetry of the Kuril-Kamchatka Trench and coastal land topography" -O -K >> $ps
# Step-8. Add scale, directional rose
gmt psbasemap -R -J \
    --FONT=8p,Palatino-Roman,dimgray \
    --MAP_ANNOT_OFFSET=0.0c \
    -Tdx1.0c/13.3c+w0.3i+f2+l+o0.15i \
    -Lx5.3i/-0.5i+c50+w500k+l"Mercator projection. Scale (km)"+f \
    -UBL/-15p/-40p -O -K >> $ps
# Step-9. Add GMT logo
gmt logo -Dx6.2/-2.2+o0.1i/0.1i+w2c -O -K >> $ps
# Step-10. Add subtitle
gmt pstext -R0/10/0/15 -JX10/10 -X0.5c -Y7.1c -N -O \
    -F+f10p,Palatino-Roman,black+jLB >> $ps << EOF
3.0 15.0 ETOPO1 Global Relief Model 1 arc min resolution grid
EOF
# Step-11. Convert to image file using GhostScript
gmt psconvert BathymetryKKT.ps -A0.2c -E720 -Tj -Z
# сетка с одинаковыми линиями
#    -Bxg4f2a4 -Byg4f2a4

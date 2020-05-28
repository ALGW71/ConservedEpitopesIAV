# Launching from a script in PyMOL
# https://pymolwiki.org/index.php/Launching_From_a_Script
# Very useful examples.

# Python integration
# https://pymolwiki.org/index.php/Python_Integration

# Display CCP4 Maps
# https://pymolwiki.org/index.php/Display_CCP4_Maps

# How to write pymol extensions
# https://pymol.org/tutorials/scripting/writeextensions.html

reinitialize

cd ~/01_Crystal_data_figures/final_str_files/bin
load ../coordinates/pky.pdb, pky
load ../coordinates/mtz_den/pky.mtz, map1

# ALIGN TO GMF FOR IDENTICAL VIEWS
load ../coordinates/gmf.pdb, gmf
align pky, (/gmf//A, /gmf//B, /gmf//C)
# xxx is mobile. gmf is template.
delete gmf
# ALIGN MATRICES
matrix_copy pky, map1.2fofc
matrix_copy pky, map1.fofc
# xxx is sourcen now, map1 must be copied to it.

create alpha, ///A
create beta, ///B
create pep, ///C

bg_color white
hide everything, all

viewport 3000,3000

show cartoon, alpha
show cartoon, beta
show sticks, pep
set stick_radius, 0.175

set mesh_as_cylinders, on
set mesh_width, 2

set specular, off
set ray_trace_fog, 0
# turns off raytrace fog
set depth_cue, 0
# turns off depth cueing
set ray_shadows, off
# turns off ray-tracing shadows
set orthoscopic, 1
set ray_trace_mode, 0
#set line_width, 3
#show lines, pep
set valence, 0
set cartoon_transparency, 0.6

isomesh obs1, map1.2fofc, 1.0, pep, carve=2.0
# contour at level 1 sigma
# extend beyond specified atoms by two Angstroms
# 1 sigma means in the electron density variation above the average map
isomesh pos3, map1.fofc, 3.0, pep, carve=2.0
isomesh neg3, map1.fofc, -3.0, pep, carve=2.0

color tv_blue, obs1
color tv_green, pos3
color tv_red, neg3

color grey80, alpha
color grey80, beta
util.cbay pep
# sets peptide to white/gray
# https://pymolwiki.org/index.php/Advanced_Coloring

set_view (\
     0.983261406,    0.086365715,   -0.160422534,\
    -0.069284350,    0.991604090,    0.109186277,\
     0.168505579,   -0.096244201,    0.980991185,\
     0.000000000,    0.000000000,  -75.738304138,\
   -56.014667511,   79.041503906,    3.491832972,\
    63.788055420,   87.688552856,   20.000000000 )

turn x,60
ray 4000,2000
png ../output/density/pky_density_top.png

hide everything, beta
turn x,-60
ray 4000,2000
png ../output/density/pky_density_side.png

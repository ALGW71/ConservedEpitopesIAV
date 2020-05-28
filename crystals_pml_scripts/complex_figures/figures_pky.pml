# Launching from a script in PyMOL
# https://pymolwiki.org/index.php/Launching_From_a_Script
# Very useful examples.

# Python integration
# https://pymolwiki.org/index.php/Python_Integration

# Display CCP4 Maps
# https://pymolwiki.org/index.php/Display_CCP4_Maps

# How to write pymol extensions
# https://pymol.org/tutorials/scripting/writeextensions.html

reinitialize original_settings

cd ~/01_Crystal_data_figures/final_str_files/bin
load ../coordinates/pky.pdb, pky

# ALIGN TO GMF FOR IDENTICAL VIEWS
load ../coordinates/gmf.pdb, gmf
align pky, (/gmf//A, /gmf//B, /gmf//C)
# xxx is mobile. gmf is template.
delete gmf
# ALIGN MATRICES

hide everything, all

create mhca, ///A
create mhcb, ///B
create pep, ///C

create cdr1a, ///D/26-31
create cdr1b, ///E/25-30
create cdr2a, ///D/49-56
create cdr2b, ///E/45-54
create cdr3a, ///D/90-100
create cdr3b, ///E/89-100

dist "1a-pep", cdr1a, pep, mode =0, cutoff=4.00
dist "1b-pep", cdr1b, pep, mode =0, cutoff=4.00

dist "3a-pep", cdr3a, pep, mode =0, cutoff=4.00
dist "3b-pep", cdr3b, pep, mode =0, cutoff=4.00

color black, 1a-pep
color black, 1b-pep

color black, 3a-pep
color black, 3b-pep

bg_color white

viewport 3000,3000

show cartoon, mhca
show cartoon, mhcb
show dashes

show sticks, pep
show sticks, cdr*
set stick_radius, 0.175

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
set valence, 1
set cartoon_transparency, 0.0

set dash_width, 6.0
set label_size, 75
set label_distance_digits, 2
set label_position,( 1, 2.0, 1)

color grey80, mhca
color grey80, mhcb
color grey20, pep
util.cnc pep
# sets peptide to yellow
# https://pymolwiki.org/index.php/Advanced_Coloring
util.cbao cdr*a
util.cbag cdr*b

set_view (\
     0.983261406,    0.086365715,   -0.160422534,\
    -0.069284350,    0.991604090,    0.109186277,\
     0.168505579,   -0.096244201,    0.980991185,\
     0.000000000,    0.000000000,  -75.738304138,\
   -56.014667511,   79.041503906,    3.491832972,\
    63.788055420,   87.688552856,   10.000000000 )

hide everything
show cartoon, mhca
show sticks, (pep, cdr1a)
show dashes, 1a-pep
#show labels, 1a-pep

#dist "polar-1a-pep", cdr1a, pep, mode =2, cutoff=4.00
#hide labels, polar-1a-pep
#color tv_red, polar-1a-pep

center 1a-pep
origin 1a-pep
turn x,-20
turn y, 30

ray 2500,2000
png ../output/complex_figures/pky_cdr1a_pep.png

set_view (\
     0.983261406,    0.086365715,   -0.160422534,\
    -0.069284350,    0.991604090,    0.109186277,\
     0.168505579,   -0.096244201,    0.980991185,\
     0.000000000,    0.000000000,  -75.738304138,\
   -56.014667511,   79.041503906,    3.491832972,\
    63.788055420,   87.688552856,   10.000000000 )

hide everything
show cartoon, mhca
show sticks, (pep, cdr3a)
show dashes, 3a-pep
#show labels, 3a-pep

#dist "polar-3a-pep", cdr3a, pep, mode =2, cutoff=4.00
#hide labels, polar-3a-pep
#color tv_red, polar-3a-pep

center 3a-pep
origin 3a-pep
turn x, -10
turn y,  5

ray 3500,2000
png ../output/complex_figures/pky_cdr3a_pep.png

set_view (\
     0.983261406,    0.086365715,   -0.160422534,\
    -0.069284350,    0.991604090,    0.109186277,\
     0.168505579,   -0.096244201,    0.980991185,\
     0.000000000,    0.000000000,  -75.738304138,\
   -56.014667511,   79.041503906,    3.491832972,\
    63.788055420,   87.688552856,   10.000000000 )

hide everything
show cartoon, mhca
show sticks, (pep, cdr1b)
show dashes, 1b-pep
#show labels, 1b-pep

#dist "polar-1b-pep", cdr1b, pep, mode =2, cutoff=4.00
#show labels, polar-1b-pep
#color tv_red, polar-1b-pep

#dist "polar-1b-pep", /cdr1b//E/ASP`28/, pep, mode =0, cutoff=4.00
#color tv_red, polar-1b-pep

center 1b-pep
origin 1b-pep
turn x, -10
turn y,  -5

ray 2500,2000
png ../output/complex_figures/pky_cdr1b_pep.png

set_view (\
     0.983261406,    0.086365715,   -0.160422534,\
    -0.069284350,    0.991604090,    0.109186277,\
     0.168505579,   -0.096244201,    0.980991185,\
     0.000000000,    0.000000000,  -75.738304138,\
   -56.014667511,   79.041503906,    3.491832972,\
    63.788055420,   87.688552856,   10.000000000 )

hide everything
show cartoon, mhca
show sticks, (pep, cdr3b)
show dashes, 3b-pep
#show labels, 3b-pep
center 3b-pep
origin 3b-pep
turn x, -10
turn y,  -5

#dist "polar-3b-pep", cdr3b, pep, mode =2, cutoff=4.00
#hide labels, polar-3b-pep
#color tv_red, polar-3b-pep

dist "missing", /cdr3b//E/GLU`94/OE2, /pep//C/LYS`10/NZ, mode =0, cutoff=5.00
color tv_red, missing
show labels, missing

ray 3500,2000
png ../output/complex_figures/pky_cdr3b_pep.png

reinitialize original_settings
cd ~/01_Crystal_data_figures/final_str_files/bin
load ../coordinates/pky.pdb, pky

# ALIGN TO GMF FOR IDENTICAL VIEWS
load ../coordinates/gmf.pdb, gmf
align pky, (/gmf//A, /gmf//B, /gmf//C)
# xxx is mobile. gmf is template.
delete gmf

bg_color white
hide everything, all

viewport 3000,3000

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

create pMHC, (///A ///B ///C)
show cartoon, pMHC
util.cbc pMHC
delete pky

center ///B/66 ///A/38 ///C
origin ///B/66 ///A/38 ///C

set_view (\
     0.983261406,    0.086365715,   -0.160422534,\
    -0.069284350,    0.991604090,    0.109186277,\
     0.168505579,   -0.096244201,    0.980991185,\
     0.000000000,    0.000000000,  -75.738304138,\
   -56.014667511,   79.041503906,    3.491832972,\
    63.788055420,   87.688552856,   35.000000000 )

turn x,70

# set ray_trace_mode, 1
# delete apbs_ramp01
# ray 4000,3000
# png ../output/electro_pky.png

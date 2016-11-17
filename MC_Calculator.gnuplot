# id must be a numerical number between 0 and maxplanes
# Name des Flugzeugs plane_<id>
# Abrissgeschwindigkeit v_s_<id>
# Maximalgeschwindigkeit v_ne_<id>
# Koeffizienten der Geschwindikeitspolare (näherungsweise) a_<id> .. c_<id> polare(v_gleit) = a*x^2 + b*x + c
# Linenfarbe color_id
# Aktivieren mit enable_id = 1


maxplanes = 100

plane_0 = "Speed Astir IIb (G104) LXNAV"
v_s_0 = 65
v_ne_0 = 270
a_0 =  1.370 * 10**-4
b_0 = -1.940 * 10**-2
c_0 =  1.310 * 10** 0
color_0 = "blue"
enable_0 = 0

plane_30 = "Speed Astir IIb (G104) WERK"
v_s_30 = 65
v_ne_30 = 270
a_30 =  2.516 * 10**-4
b_30 = -4.902 * 10**-2
c_30 =  3.080 * 10** 0
color_30 = "green"
enable_30 = 1

plane_31 = "Speed Astir IIb (G104) WERK/515kg"
v_s_31 = 65
v_ne_31 = 270
a_31 =  1.163 * 10**-4
b_31 = -2.241 * 10**-2
c_31 =  1.830 * 10** 0
color_31 = "dark-green"
enable_31 = 0

plane_1 = "Cirrus 17.74m"
v_s_1 = 65
v_ne_1 = 220
a_1 =  2.266 * 10**-4
b_1 = -3.386 * 10**-2
c_1 =  1.86 * 10** 0
color_1 = "red"
enable_1 = 0

plane_2 = "ASW 19"
v_s_2 = 65
v_ne_2 = 270
a_2 =  2.263 * 10**-4
b_2 = -4.201 * 10**-2
c_2 =  2.685 * 10** 0
color_2 = "green"
enable_2 = 0

plane_3 = "LS 4"
v_s_3 = 65
v_ne_3 = 270
a_3 =  1.94 * 10**-4
b_3 = -3.35 * 10**-2
c_3 =  2.10 * 10** 0
color_3 = "orange"
enable_3 = 0

plane_4 = "DG 300"
v_s_4 = 65
v_ne_4 = 270
a_4 =  1.111 * 10**-4
b_4 = -1.233 * 10**-2
c_4 =  0.8288 * 10** 0
color_4 = "magenta"
enable_4 = 0

plane_5 = "Pik 20D"
v_s_5 = 65
v_ne_5 = 270
a_5 =  1.965 * 10**-4
b_5 = -3.138 * 10**-2
c_5 =  1.863 * 10** 0
color_5 = "cyan"
enable_5 = 0

plane_6 = "ASW 20"
v_s_6 = 65
v_ne_6 = 270
a_6 =  1.736 * 10**-4
b_6 = -3.104 * 10**-2
c_6 =  2.023 * 10** 0
color_6 = "brown"
enable_6 = 0

plane_7 = "DG 100"
v_s_7 = 65
v_ne_7 = 270
a_7 =  1.966 * 10**-4
b_7 = -2.976 * 10**-2
c_7 =  1.740 * 10** 0
color_7 = "grey"
enable_7 = 0

plane_8 = "Ventus 2c"
v_s_8 = 72
v_ne_8 = 280
a_8 =  1.28 * 10**-4
b_8 = -2.21 * 10**-2
c_8 =  1.53 * 10** 0
color_8 = "red"
enable_8 = 0

plane_9 = "Mini Nimbus"
v_s_9 = 65
v_ne_9 = 270
a_9 =  1.233 * 10**-4
b_9 = -1.563 * 10**-2
c_9 =  1.020 * 10** 0
color_9 = "dark-green"
enable_9 = 0

plane_10 = "Astir CS"
v_s_10 = 65
v_ne_10 = 250
a_10 = 2.13 * 10**-4
b_10 = -3.35671  * 10**-2
c_10 =  2.01901 * 10**0
color_10 = "dark-green"
enable_10 = 1

#######################################################################################################################
# Don't edit below!                                                                                                   #
#######################################################################################################################

set macros

ids = ""
planes = ""
planes_v_s = ""
planes_v_ne = ""
planes_a = ""
planes_b = ""
planes_c = ""
planes_color = ""
number_planes = 0

# Helper
apps(s, a) = s." ".a
appi(s, a) = sprintf("%s %i", s, a)
appf(s, a) = sprintf("%s %f", s, a)
at(s, i) = word(s, i+1)
index_to_id(index) = at(ids, index)
identity(x) = x


plane(index) = at(planes, index)
v_s(index) = at(planes_v_s, index)
v_ne(index) = at(planes_v_ne, index)
a(index) =  at(planes_a, index)
b(index) = at(planes_b, index)
c(index) = at(planes_c, index)
color(index) = at(planes_color, index)

v_ne_max = 0
v_s_min = 500

replace(string, char, replace) = system("echo '".string."' | tr '".char."'  '".replace."'")

print "Seaching planes..."

do for [i=0:maxplanes] {
	if(exists("enable_".i)) {
		eval "enable = enable_".i
		if(enable == 1) {
			eval "plane = plane_".i
			eval "v_s = v_s_".i
			eval "v_ne = v_ne_".i
			eval "a = a_".i
			eval "b = b_".i
			eval "c = c_".i
			eval "color = color_".i
	
			print "Found ".plane."."
			plane=replace(plane, " ", "§")			
			ids = appi(ids, i)
			planes = apps(planes, plane)
			planes_v_s = appf(planes_v_s, v_s)
			planes_v_ne = appf(planes_v_ne, v_ne)
			planes_a = appf(planes_a, a)
			planes_b = appf(planes_b, b)
			planes_c = appf(planes_c, c)
			planes_color = apps(planes_color, color)
		
			if(v_ne > v_ne_max) {
				v_ne_max = v_ne
			}
			if(v_s < v_s_min) {
				v_s_min = v_s
			}
			number_planes = number_planes + 1
		} else {
			eval "plane = plane_".i
			print "Found ".plane.". (deactivated)"
		}
	}
}

if(number_planes == 0) {
	print "Error: No planes found!"
	exit gnuplot
} else {
	print "All planes read."	
}

filename = "Flugeigenschaften.png"
title_value = "{/:Bold=20 Flugeigenschaften Vergleich}"

if (!exists("MP_LEFT"))   MP_LEFT = .05
if (!exists("MP_RIGHT"))  MP_RIGHT = .95
if (!exists("MP_BOTTOM")) MP_BOTTOM = .05
if (!exists("MP_TOP"))    MP_TOP = .92
if (!exists("MP_GAP"))    MP_GAP = 0.1

set terminal png size 1920,1080
set output filename
set multiplot layout 2, 2 rowsfirst title title_value font ",14" \
	margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_GAP

# Definition der Geschwindikeitspolare
polar(v, index)    = v >= v_s(index) && v <= v_ne(index) ? a(index)*v**2 + b(index)*v + c(index) : 1/0
gz_polar(v, index) = v / 3.6 / polar(v, index)
gz_angle(v, index) = atan(1/gz_polar(v, index))

# MC Funktion, nimmt erwartetes Steigen des nächsten Bart und liefert die optimale Vorfluggeschwindigkeit
mc_raw(w_st, index) = sqrt((c(index)+w_st)/a(index))
mc(w_st, index) = (mc_raw(w_st, index) <= v_ne(index) ? mc_raw(w_st, index) : v_ne(index))

# Reisegeschwindigkeit für festes mc und Steigen
cruisemc(w_st, w_mc, index) = (mc(w_mc, index)*w_st)/(w_st+polar(mc(w_mc, index), index))
# Funktion zur Bestimmung der maximalen Reisegeschwindigkeit, bei optimalem MC Steig/Sink Zyklus
cruise(w_st, index) = cruisemc(w_st, w_st, index)

# Fehlerfunktion für nicht mc-gemäßen Vorflug
cruise_error(w_st,w_mc, index) =  100 * cruisemc(w_st, w_mc, index) / cruise(w_st, index)

#######################################################################################################################
# Polaren Diagramm                                                                                                    #
#######################################################################################################################

set title "Sinkgeschwindigkeit Polaren"
set xlabel "Geschwindigkeit (km/h)"
set ylabel "Sinken (m/s)"
set y2label "Gleitzahl"
set yrange [6: 0]
set ytics 0.5
set ytics nomirror
set xrange [0: v_ne_max*1.1]
set xtics 20
set grid

plot for [i=0:number_planes-1] polar(x,i) with line title replace(plane(i), "§", " ") lt rgb color(i)


set title "Gleitzahl Polare"
set yrange[0:60]
set y2range[0:0.1]
set y2tics
set ytics nomirror
set ytics 5

plot for [i=0:number_planes-1] gz_polar(x,i) with line title replace(plane(i), "§", " ") lt rgb color(i) axes x1y1, \
     for [i=0:number_planes-1] gz_angle(x,i) with line title replace(plane(i), "§", " ") lt rgb color(i) axes x1y2

unset title
unset xlabel
unset ylabel
unset y2label
unset yrange
unset y2range
unset y2tics
unset ytics
unset xrange

#######################################################################################################################
# Durchschnittliche Geschwindigkeit für optimalen Vorflug/Steig Zyklus                                                #
#######################################################################################################################
#
#set title "Max. Reisegeschwindigkeit"
#set xlabel "Durchschnittliches Steigen (m/s)"
#set ylabel "Reisegeschwindigkeit (km/h)"
#set xrange [0: 5]
#set xtics 0.5
#set yrange [0: v_ne_max/2]
#set ytics 10
#
#plot for [i=0:number_planes-1] cruise(x,i) with line title replace(plane(i), "§", " ") lt rgb color(i)
#
#unset title
#unset xlabel
#unset ylabel
#unset xrange
#unset yrange


#######################################################################################################################
# Vorflug Geschwindigkeit                                                                                             #
#######################################################################################################################

set title "Vorfluggeschwindigkeit"
set xlabel "Durchschnittliches Steigen (m/s)"
set ylabel "Vorfluggeschwindigkeit (km/h)"
set xrange [0: 5]
set xtics 0.5
#set yrange [v_s_min: v_ne_max]
set ytics 10

plot for [i=0:number_planes-1] mc(x,i) with line title replace(plane(i), "§", " ") lt rgb color(i)

unset title
unset xlabel
unset ylabel
unset xrange
unset yrange



#######################################################################################################################
# Sollfahrt Fehler                                                                                                    #
#######################################################################################################################

set title "Prozentualer Zeitverlust bei falschem MC"
set xlabel "Nächstes Steigen"
set ylabel "MC geflogen"
set isosample 150, 150
set xrange [0: 5]
set yrange [0: 5]
set xtics 0.5
set ytics 0.5
set contour base
set clabel "%8.3g"
set cntrparam level discrete 99, 98, 95, 90, 80, 70, 60, 50
unset surface
do for [i=0:number_planes-1] {
	set table "cruise_error_".i.".dat"
	splot cruise_error(x,y,i)
}
unset table

unset contour
unset cntrparam
set surface
set grid

do for [i=0:number_planes-1] {
	l '<./label_cont.sh cruise_error_'.i.'.dat 0 10 0'
}
plot for [i=0:number_planes-1] '<./label_cont.sh cruise_error_'.i.'.dat 1 10 0' with line title replace(plane(i), "§", " ") lt rgb color(i), \
    identity(x) with line notitle lt rgb color(i)


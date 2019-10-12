// Replication of Nunn and Qian (2011)

use nunn_data.dta, clear

foreach x in 1000 1100 1200 1300 1400 1500 1600 1700 1750 1800 1850 1900{
	gen ln_wpot_`x'=ln_wpot*ydum`x'
	gen ln_all_`x'=ln_all*ydum`x'
	gen ln_nworld_`x'=ln_nworld*ydum`x'
	gen ln_oworld_`x'=ln_oworld*ydum`x'
	gen ln_tropical_`x'=ln_tropical*ydum`x'
	gen ln_rugged_`x'=ln_rugged*ydum`x'
	gen ln_elevation_`x'=ln_elevation*ydum`x'
	gen ln_disteq_`x'=ln_disteq*ydum`x'
	gen ln_dist_coast_`x'=ln_dist_coast*ydum`x'
	gen ln_export_`x'=ln_export*ydum`x'
	gen malaria_`x'=malaria*ydum`x'
	gen ln_spot_`x'=ln_spot*ydum`x'
	gen ln_silagemaize_`x'=ln_silagemaize*ydum`x'
	gen ln_maize_`x'=ln_maize*ydum`x'
	gen ln_cassava_`x'=ln_cassava*ydum`x'
	}

/* Macros for the control variables */
global ln_potato_flexible "ln_wpot_1100 ln_wpot_1200 ln_wpot_1300 ln_wpot_1400 ln_wpot_1500 ln_wpot_1600 ln_wpot_1700 ln_wpot_1750 ln_wpot_1800 ln_wpot_1850 ln_wpot_1900"
global ydum_flexible "ydum1100 ydum1200 ydum1300 ydum1400 ydum1500 ydum1600 ydum1700 ydum1750 ydum1800 ydum1850 ydum1900"
global ln_all_flexible "ln_all_1100 ln_all_1200 ln_all_1300 ln_all_1400 ln_all_1500 ln_all_1600 ln_all_1700 ln_all_1750 ln_all_1800 ln_all_1850 ln_all_1900"
global ln_nworld_flexible "ln_nworld_1100 ln_nworld_1200 ln_nworld_1300 ln_nworld_1400 ln_nworld_1500 ln_nworld_1600 ln_nworld_1700 ln_nworld_1750 ln_nworld_1800 ln_nworld_1850 ln_nworld_1900"
global ln_oworld_flexible "ln_oworld_1100 ln_oworld_1200 ln_oworld_1300 ln_oworld_1400 ln_oworld_1500 ln_oworld_1600 ln_oworld_1700 ln_oworld_1750 ln_oworld_1800 ln_oworld_1850 ln_oworld_1900"
global ln_tropical_flexible "ln_tropical_1100 ln_tropical_1200 ln_tropical_1300 ln_tropical_1400 ln_tropical_1500 ln_tropical_1600 ln_tropical_1700 ln_tropical_1750 ln_tropical_1800 ln_tropical_1850 ln_tropical_1900"
global ln_rugged_flexible "ln_rugged_1100 ln_rugged_1200 ln_rugged_1300 ln_rugged_1400 ln_rugged_1500 ln_rugged_1600 ln_rugged_1700 ln_rugged_1750 ln_rugged_1800 ln_rugged_1850 ln_rugged_1900"
global ln_elevation_flexible "ln_elevation_1100 ln_elevation_1200 ln_elevation_1300 ln_elevation_1400 ln_elevation_1500 ln_elevation_1600 ln_elevation_1700 ln_elevation_1750 ln_elevation_1800 ln_elevation_1850 ln_elevation_1900"
global ln_disteq_flexible "ln_disteq_1100 ln_disteq_1200 ln_disteq_1300 ln_disteq_1400 ln_disteq_1500 ln_disteq_1600 ln_disteq_1700 ln_disteq_1750 ln_disteq_1800 ln_disteq_1850 ln_disteq_1900"
global ln_dist_coast_flexible "ln_dist_coast_1100 ln_dist_coast_1200 ln_dist_coast_1300 ln_dist_coast_1400 ln_dist_coast_1500 ln_dist_coast_1600 ln_dist_coast_1700 ln_dist_coast_1750 ln_dist_coast_1800 ln_dist_coast_1850 ln_dist_coast_1900"
global malaria_flexible "malaria_1100 malaria_1200 malaria_1300 malaria_1400 malaria_1500 malaria_1600 malaria_1700 malaria_1750 malaria_1800 malaria_1850 malaria_1900"
global ln_export_flexible "ln_export_1100 ln_export_1200 ln_export_1300 ln_export_1400 ln_export_1500 ln_export_1600 ln_export_1700 ln_export_1750 ln_export_1800 ln_export_1850 ln_export_1900"

global ln_spot_flexible "ln_spot_1100 ln_spot_1200 ln_spot_1300 ln_spot_1400 ln_spot_1500 ln_spot_1600 ln_spot_1700 ln_spot_1750 ln_spot_1800 ln_spot_1850 ln_spot_1900"
global ln_silagemaize_flexible "ln_silagemaize_1100 ln_silagemaize_1200 ln_silagemaize_1300 ln_silagemaize_1400 ln_silagemaize_1500 ln_silagemaize_1600 ln_silagemaize_1700 ln_silagemaize_1750 ln_silagemaize_1800 ln_silagemaize_1850 ln_silagemaize_1900"
global ln_maize_flexible "ln_maize_1100 ln_maize_1200 ln_maize_1300 ln_maize_1400 ln_maize_1500 ln_maize_1600 ln_maize_1700 ln_maize_1750 ln_maize_1800 ln_maize_1850 ln_maize_1900"
global ln_cassava_flexible "ln_cassava_1100 ln_cassava_1200 ln_cassava_1300 ln_cassava_1400 ln_cassava_1500 ln_cassava_1600 ln_cassava_1700 ln_cassava_1750 ln_cassava_1800 ln_cassava_1850 ln_cassava_1900"

*********************************************
*** TABLE 2 - BASELINE FLEXIBLE ESTIMATES ***
*********************************************

*** Total Population ***
* Col 1
areg ln_population $ln_potato_flexible i.year, a(isocode) cluster(isocode)
test (ln_wpot_1750=0) (ln_wpot_1800=0) (ln_wpot_1850=0) (ln_wpot_1900=0)
* Col 2
areg ln_population $ln_potato_flexible $ln_oworld_flexible i.year, a(isocode) cluster(isocode)
test (ln_wpot_1750=0) (ln_wpot_1800=0) (ln_wpot_1850=0) (ln_wpot_1900=0)
* Col 3
areg ln_population $ln_potato_flexible $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
test (ln_wpot_1750=0) (ln_wpot_1800=0) (ln_wpot_1850=0) (ln_wpot_1900=0)

*** City Population Share ***
* Col 4
areg city_pop_share $ln_potato_flexible i.year, a(isocode) cluster(isocode)
test (ln_wpot_1750=0) (ln_wpot_1800=0) (ln_wpot_1850=0) (ln_wpot_1900=0)
* Col 5
areg city_pop_share $ln_potato_flexible $ln_oworld_flexible i.year, a(isocode) cluster(isocode)
test (ln_wpot_1750=0) (ln_wpot_1800=0) (ln_wpot_1850=0) (ln_wpot_1900=0)
* Col 6
areg city_pop_share $ln_potato_flexible $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
test (ln_wpot_1750=0) (ln_wpot_1800=0) (ln_wpot_1850=0) (ln_wpot_1900=0)

**************************************
*** TABLE 3 - ALTERNATIVE CUT-OFFS ***
**************************************

/* 1200--1500: Post = 1400, 1500 (Cols 1 & 2) */
preserve
drop ln_wpot_post post
drop if year<1200
drop if year>1500
tab year
gen post=0
replace post=1 if year==1400 | year==1500
gen ln_wpot_post=ln_wpot*post
* Total Population
areg ln_population ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* City Population Share
areg city_pop_share ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
restore

/* 1300--1600: Post = 1500, 1600 (Cols 3 & 4) */
preserve
drop ln_wpot_post post
drop if year<1300
drop if year>1600
tab year
gen post=0
replace post=1 if year==1500 | year==1600
gen ln_wpot_post=ln_wpot*post
* Total Population
areg ln_population ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* City Population Share
areg city_pop_share ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
restore

/* 1400--1700: Post = 1600, 1700 (Cols 5 & 6) */
preserve
drop ln_wpot_post post
drop if year<1400
drop if year>1700
tab year
gen post=0
replace post=1 if year==1600 | year==1700
gen ln_wpot_post=ln_wpot*post
* Total Population
areg ln_population ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* City Population Share
areg city_pop_share ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
restore

/* 1500--1800: Post = 1700, 1800 (Cols 7 & 8) */
preserve
drop ln_wpot_post post
drop if year<1500
drop if year>1800
tab year
gen post=0
replace post=1 if year==1700 | year==1750 | year==1800
gen ln_wpot_post=ln_wpot*post
* Total Population
areg ln_population ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* City Population Share
areg city_pop_share ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
restore

/* 1600--1900: Post = 1800, 1850, 1900 (Cols 9 & 10) */
preserve
drop ln_wpot_post post
drop if year<1600
drop if year>1900
tab year
gen post=0
replace post=1 if year==1800 | year==1850 | year==1900
gen ln_wpot_post=ln_wpot*post
* Total Population
areg ln_population ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* City Population Share
areg city_pop_share ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
restore

/* 1600--1900: post = 1750, 1850, 1900  (Cols 11 & 12) */
preserve
drop ln_wpot_post post
drop if year<1600
drop if year>1900
tab year
gen post=0
replace post=1 if year==1750 | year==1800 | year==1850 | year==1900
gen ln_wpot_post=ln_wpot*post
* Total Population
areg ln_population ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* City Population Share
areg city_pop_share ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
restore

***************************************
*** TABLE 4 - BASELINE DD ESTIMATES ***
***************************************

*** Total Population ***
* Col 1
areg ln_population ln_wpot_post i.year, a(isocode) cluster(isocode)
* Col 2
areg ln_population ln_wpot_post $ln_oworld_flexible i.year, a(isocode) cluster(isocode)
* Col 3
areg ln_population ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 4
areg ln_population ln_wpot_post `ln_all_flexible' $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 5
areg ln_population ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible `ln_spot_flexible' `ln_silagemaize_flexible' `ln_maize_flexible' `ln_cassava_flexible' i.year, a(isocode) cluster(isocode)

*** City Population Share ***
* Col 6
areg city_pop_share ln_wpot_post i.year, a(isocode) cluster(isocode)
* Col 7
areg city_pop_share ln_wpot_post $ln_oworld_flexible i.year, a(isocode) cluster(isocode)
* Col 8
areg city_pop_share ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 9
areg city_pop_share ln_wpot_post `ln_all_flexible' $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 10
areg city_pop_share ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible `ln_spot_flexible' `ln_silagemaize_flexible' `ln_maize_flexible' `ln_cassava_flexible' i.year, a(isocode) cluster(isocode)

****************************************************
*** TABLE 5 - ROBUSTNESS TO ALTERNATIVE CUT-OFFS ***
****************************************************

/* Creating the alternative suitability measures */
gen non_int_wpot=ln(1+wpot_lr_vs_mars)
gen non_ext_int_wpot=0
replace non_ext_int_wpot=1 if non_int_wpot>0
replace non_ext_int_wpot=ln(1+all_lr_vs_mars) if non_int_wpot>0

preserve
*****************************************
*** Post = 1750+ (Baseline) - (Row 1) ***
*****************************************
gen ln_wpot_post_ver2=ln_wpot_ver2*post
// gen ln_wpot_post_ver3=ln_wpot_ver3*post
gen non_int_wpot_post=non_int_wpot*post
gen non_ext_int_wpot_post=non_ext_int_wpot*post
// for @ in any non_int_wpot non_ext_int_wpot: gen @_post=@*post

*** Total Population ***
* Col1 
areg ln_population ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 2
areg ln_population ln_wpot_post_ver2 $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 3
areg ln_population non_int_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 4
areg ln_population non_ext_int_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)

*** City Population Share ***
* Baseline
* Col 1
areg city_pop_share ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 2
areg city_pop_share ln_wpot_post_ver2 $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 3
areg city_pop_share non_int_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 4
areg city_pop_share non_ext_int_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
restore

******************************
*** Post = 1800+ - (Row 2) ***
******************************
preserve
drop post ln_wpot_post
gen post=0 if missing(year)!=1
replace post=1 if year>1750 & missing(year)!=1
gen ln_wpot_post=ln_wpot*post
gen ln_wpot_post_ver2=ln_wpot_ver2*post
// gen ln_wpot_post_ver3=ln_wpot_ver3*post
gen non_int_wpot_post=non_int_wpot*post
gen non_ext_int_wpot_post=non_ext_int_wpot*post
// for @ in any non_int_wpot non_ext_int_wpot: gen @_post=@*post

*** Total Population ***
* Col 1
areg ln_population ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 2
areg ln_population ln_wpot_post_ver2 $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 3
areg ln_population non_int_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 4
areg ln_population non_ext_int_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)

*** City Population Share ***
* Col 1
areg city_pop_share ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 2
areg city_pop_share ln_wpot_post_ver2 $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 3
areg city_pop_share non_int_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 4
areg city_pop_share non_ext_int_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
restore

******************************
*** Post = 1700+ - (Row 3) ***
******************************
preserve
drop post ln_wpot_post
gen post=0 if missing(year)!=1
replace post=1 if year>1600 & missing(year)!=1
gen ln_wpot_post=ln_wpot*post
gen ln_wpot_post_ver2=ln_wpot_ver2*post
// gen ln_wpot_post_ver3=ln_wpot_ver3*post
// for @ in any non_int_wpot non_ext_int_wpot: gen @_post=@*post
gen non_int_wpot_post=non_int_wpot*post
gen non_ext_int_wpot_post=non_ext_int_wpot*post

*** Total Population ***
* Col 1
areg ln_population ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 2
areg ln_population ln_wpot_post_ver2 $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 3
areg ln_population non_int_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 4
areg ln_population non_ext_int_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)

*** City Population Share ***
* Col 1
areg city_pop_share ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 2
areg city_pop_share ln_wpot_post_ver2 $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 3
areg city_pop_share non_int_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Col 4
areg city_pop_share non_ext_int_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
restore

***********************************************
*** Table 6 - CONTROLLING FOR OTHER FACTORS ***
***********************************************

*** Total Population (Panel A) ***
* Baseline (Col 1)
areg ln_population ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Latitude (Col 2)
areg ln_population ln_wpot_post $ln_disteq_flexible $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Malaria (Col 3)
areg ln_population ln_wpot_post $malaria_flexible $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Legal Origin (Col 4)
areg ln_population ln_wpot_post i.year#legor_gbr i.year#legor_fra i.year#legor_deu i.year#legor_soc $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Identity of colonizer (Col 5)
areg ln_population ln_wpot_post i.year#colony_esp i.year#colony_gbr i.year#colony_fra i.year#colony_prt colony_oeu $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Atlantic Trader (Col 6)
areg ln_population ln_wpot_post i.year#attrade $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Roman (Col 7)
areg ln_population ln_wpot_post i.year#roman $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Protestant (Col 8)
areg ln_population ln_wpot_post i.year#protestant $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Distance from coast (Col 9)
areg ln_population ln_wpot_post $ln_dist_coast_flexible $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Slave exports (Col 10)
areg ln_population ln_wpot_post $ln_export_flexible $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* All controls (Col 11)
areg ln_population ln_wpot_post $ln_disteq_flexible $malaria_flexible i.year#legor_gbr i.year#legor_fra i.year#legor_deu i.year#legor_soc i.year#colony_esp i.year#colony_gbr i.year#colony_fra i.year#colony_prt colony_oeu i.year#attrade i.year#roman i.year#protestant $ln_dist_coast_flexible $ln_export_flexible $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)

*** City Population Share (Panel B) ***
* Baseline (Col 1)
areg city_pop_share ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Latitude (Col 2)
areg city_pop_share ln_wpot_post $ln_disteq_flexible $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Malaria (Col 3)
areg city_pop_share ln_wpot_post $malaria_flexible $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Legal Origin (Col 4)
areg city_pop_share ln_wpot_post i.year#legor_gbr i.year#legor_fra i.year#legor_deu i.year#legor_soc $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Identity of colonizer (Col 5)
areg city_pop_share ln_wpot_post i.year#colony_esp i.year#colony_gbr i.year#colony_fra i.year#colony_prt i.year#colony_oeu $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Atlantic Trader (Col 6)
areg city_pop_share ln_wpot_post i.year#attrade $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Roman (Col 7)
areg city_pop_share ln_wpot_post i.year#roman $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Protestant (Col 8)
areg city_pop_share ln_wpot_post i.year#protestant $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Distance from coast (Col 9)
areg city_pop_share ln_wpot_post $ln_dist_coast_flexible $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* Slave exports (Col 10)
areg city_pop_share ln_wpot_post $ln_export_flexible $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* All controls (Col 11)
areg city_pop_share ln_wpot_post $ln_disteq_flexible $malaria_flexible i.year#legor_gbr i.year#legor_fra i.year#legor_deu i.year#legor_soc i.year#colony_esp i.year#colony_gbr i.year#colony_fra i.year#colony_prt i.year#colony_oeu i.year#attrade i.year#roman i.year#protestant $ln_dist_coast_flexible $ln_export_flexible $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)

*******************************
*** Table 7 - Continent FEs ***
*******************************

*** Total Population ***
* Baseline without Cont FEs (Col 1) 
areg ln_population ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* No controls with Cont FEs (Col 2)
areg ln_population ln_wpot_post i.year#cont_africa i.year#cont_asia i.year#cont_europe i.year#cont_oceania i.year, a(isocode) cluster(isocode)
* Baseline with Cont FEs (Col 3)
areg ln_population ln_wpot_post i.year#cont_africa i.year#cont_asia i.year#cont_europe i.year#cont_oceania $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)

*** City Population Share ***
* Baseline without Cont FEs (Col 4) 
areg city_pop_share ln_wpot_post $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)
* No controls with Cont FEs (Col 5)
areg city_pop_share ln_wpot_post i.year#cont_africa i.year#cont_asia i.year#cont_europe i.year#cont_oceania i.year, a(isocode) cluster(isocode)
* Baseline with Cont FEs (Col 6)
areg city_pop_share ln_wpot_post i.year#cont_africa i.year#cont_asia i.year#cont_europe i.year#cont_oceania $ln_oworld_flexible $ln_elevation_flexible $ln_tropical_flexible $ln_rugged_flexible i.year, a(isocode) cluster(isocode)

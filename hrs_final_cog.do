*** Save log of program.
log using hrs_final_cog, replace


***************************
*** HRS Cleaning Do File***
***************************

clear
* Increase max number of columns to Stata mp max of 32k.
set maxvar 32000

* Install Packages, load data, and sort.
ssc install reghdfe
ssc install ftools
use "/nas/longleaf/home/rayrayc/clean1.dta"
sort hhidpn wave
xtset hhidpn wave

*** Summary
sum cogtot gender raracem rahispan  agey_m hibp bmi_miss bmi_new smoken_miss smoken_new smokev_new smokev_miss raedyrs conde shltc_miss shltc_new drinkn conde pstmem mstat cesd depres cendiv effort sleepr arthr heart strok psych lung slfmem lbrf loghatotb loghspti_miss loghspti_new diab logearn wave cendiv timwlk_miss timwlk_new puff_miss puff_new puffpos_miss puffpos_new alzhe_miss alzhe_new demen_miss demen_new effort fsad going enlife whappy diab cancr phone meds_miss meds_new money shop meals map totmbi_miss totmbi_new oopmdo_miss oopmdo_new

mdesc cogtot gender raracem rahispan  agey_m hibp bmi_miss bmi_new smoken_miss smoken_new smokev_new smokev_miss raedyrs conde shltc_miss shltc_new drinkn conde pstmem mstat cesd depres cendiv effort sleepr arthr heart strok psych lung slfmem lbrf loghatotb loghspti_miss loghspti_new diab logearn wave cendiv timwlk_miss timwlk_new puff_miss puff_new puffpos_miss puffpos_new alzhe_miss alzhe_new demen_miss demen_new effort fsad going enlife whappy diab cancr phone meds_miss meds_new money shop meals map totmbi_miss totmbi_new oopmdo_miss oopmdo_new

* Explore specific variables.
hist cogtot
hist agey_m
hist iearn
hist logearn

hist cogtot

*** Regression time
* Simple OLS
quietly reg cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, vce(robust)
disp e(rmse)

*** Random/Ffixed Effects Test
* Random Effects
xtreg cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmsi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, vce(robust) re
disp e(rmse)

* Fixed Effects xtreg
xtreg cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, vce(robust) fe
disp e(rmse)

* MLE Estimator
xtreg cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.Shibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, vce(robust) mle
disp e(rmse)
predict pred100, xb
gen resid100 = (pred100-cogtot)^2
egen mse100 = mean(resid100)
gen rmse100 = sqrt(mse100)
mean(rmse100)

* Between Effects reghdfe
quietly xtreg cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, be
disp e(rmse)

* Correia estimator
quietly reghdfe cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, noabsorb vce(robust)
disp e(rmse)

*** Distribution Test
* Park test 
quietly xtgee cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, vce(robust) link(log) family(gamma)
predict pred0, xb
generate lnrawresid2 = ln(pred0^2)
predict double xbetahat, xb
sum xbetahat

* GLM
quietly xtgee cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, vce(robust)
predict pred1, xb
gen resid1 = (pred1-cogtot)^2
egen mse1 = mean(resid1)
gen rmse1 = sqrt(mse1)
mean(rmse1)

* GLM Poisson
quietly quietly xtgee cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, vce(robust) family(poisson)
predict pred2, xb 
gen resid2 = (pred2-cogtot)^2
egen mse2 = mean(resid2)
gen rmse2 = sqrt(mse2)
mean(rmse2)

* Negative Binomial
quietly xtgee cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, vce(robust) family(nb)
predict pred4, xb 
gen resid4 = (pred4-cogtot)^2
egen mse4 = mean(resid4)
gen rmse4 = sqrt(mse4)
mean(rmse4)

* Inverse Gaussian
*** Will not run.
* quietly xtgee cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, vce(robust) family(ig)

* Quantile try one
ssc install xtqreg
quietly xtqreg cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, i(hhidpn)
predict pred5, xb 
gen resid5 = (pred5-cogtot)^2
egen mse5 = mean(resid5)
gen rmse5 = sqrt(mse5)
mean(rmse5)

* Quantile steps of .25
ssc install xtqreg
quietly xtqreg cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, i(hhidpn) quantile(.01(.25).99)
predict pred6, xb 
gen resid6 = (pred6-cogtot)^2
egen mse6 = mean(resid6)
gen rmse6 = sqrt(mse6)
mean(rmse6)

* Quantile steps of .10
quietly xtqreg cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, i(hhidpn) quantile(.01(.1).99)
predict pred7, xb 
gen resid7 = (pred7-cogtot)^2
egen mse7 = mean(resid7)
gen rmse7 = sqrt(mse7)
mean(rmse7)

*** Link Test
*** Note: GLM with gaussian family performed best.
* log link
quietly xtgee cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, vce(robust) link(log)
predict pred8, xb 
gen resid8 = (pred8-cogtot)^2
egen mse8 = mean(resid8)
gen rmse8 = sqrt(mse8)
mean(rmse8)

* power link
quietly xtgee cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, vce(robust) link(power)
predict pred10, xb
gen resid10 = (pred10-cogtot)^2
egen mse10 = mean(resid10)
gen rmse10 = sqrt(mse10)
mean(rmse10)

* odd power link
quietly xtgee cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, vce(robust) link(opower)
predict pred11, xb
gen resid11 = (pred11-cogtot)^2
egen mse11 = mean(resid11)
gen rmse11 = sqrt(mse11)
mean(rmse11)

* Negative Binomial link
quietly xtgee cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, vce(robust) link(nbinomial) family(nbinomial)
predict pred12, xb
gen resid12 = (pred12-cogtot)^2
egen mse12 = mean(resid12)
gen rmse12 = sqrt(mse12)
mean(rmse12)

* Reciprocal link
quietly xtgee cogtot i.wave i.cendiv i.gender i.raracem i.rahispan c.agey_m i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb i.loghspti_miss c.loghspti_new  c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new c.agey_m#c.agey_m i.hibp#c.agey_m i.hibp##c.bmi_new i.hibp#i.smoken i.hibp#c.raedyrs c.bmi_new#c.bmi_new, vce(robust) link(reciprocal)
predict pred13, xb
gen resid13 = (pred13-cogtot)^2
egen mse13 = mean(resid13)
gen rmse13 = sqrt(mse13)
mean(rmse13)

*** Get margins of best model.
* Best model was the random effects model.
* Interactions between hibp + bmi, hibp + smoken, hibp + years of educ, and years of education + age were removed.
xtreg cogtot i.wave i.cendiv i.gender i.raracem i.rahispan i.hibp i.bmi_miss i.smoken_new i.smokev_new i.smokev_miss c.raedyrs i.shltc_miss c.shltc_new c.drinkn i.pstmem i.mstat i.depres i.effort i.sleepr i.arthr i.heart i.strok i.psych i.lung i.diab i.slfmem i.lbrf c.loghatotb c.loghspti c.logearn c.timwlk_new c.puff_new i.puffpos_new i.alzhe_new i.demen_new i.effort i.fsad i.going i.enlife i.whappy i.diab i.cancr i.phone i.meds_miss i.meds_new i.money i.shop i.meals i.map c.oopmdo_new totmbi_new c.agey_m##c.agey_m##c.agey_m i.hibp#c.agey_m c.bmi_new#c.bmi_new c.bmi_new#c.agey_m, vce(robust) re

* Look at all margins.
margins, dydx(*)
marginsplot
graph save "Graph" "/nas/longleaf/home/rayrayc/HRS/Cognition_Prediction/Graphs/margins_all.gph", as(png) replace

* Look at average marginal effects of age from 18 to 100.
margins, dydx(agey_m) at (age = (18 (1) 100))
marginsplot
graph save "Graph" "/nas/longleaf/home/rayrayc/HRS/Cognition_Prediction/Graphs/margins_age_18_100.gph", as(png)  replace

* Look at average marginal effects of age from 40 to 100.
margins, dydx(agey_m) at (age = (40 (1) 100))
marginsplot
graph save "Graph" "/nas/longleaf/home/rayrayc/HRS/Cognition_Prediction/Graphs/margins_age_40_100.gph", as(png) replace

* Look at average marginal effects of having high blood pressure at ages 40 through 100.
margins, dydx(1.hibp) at (age = (40 (1) 100))
marginsplot
graph save "Graph" "/nas/longleaf/home/rayrayc/HRS/Cognition_Prediction/Graphs/margins_hibp_40_100.gph", as(png)  replace

* Look at average marginal effects of bmi from 10 through 60.
margins, dydx(bmi_new) at (bmi_new = (10 (1) 60))
marginsplot
graph save "Graph" "/nas/longleaf/home/rayrayc/HRS/Cognition_Prediction/Graphs/margins_bmi_0_100.gph", as(png)  replace

* Show demographic marginal effects.
margins, dydx(agey_m gender raracem rahispan)
marginsplot

* Show economic continous
margins, dydx(loghspti loghatotb logearn oopmdo_new cendiv raedyrs)
marginsplot

* Show economic categorical
margins, dydx(lbrf totmbi wave)
marginsplot

* Show health continous
margins, dydx(loghspti loghatotb logearn oopmdo_new cendiv raedyrs)
marginsplot

* Show health categorical
margins, dydx(lbrf totmbi wave)
marginsplot

*** Save log as pdf.
log close
translate hrs_final_cog.smcl hrs_final_cog.pdf, replace
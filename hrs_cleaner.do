*** Save log of program.
log using HRS_clean_log, replace


***************************
*** HRS Cleaning Do File***
***************************

clear
* Increase max number of columns to Stata mp max of 32k.
set maxvar 32000

*** Clean Respondent Variables
use "/nas/longleaf/home/rayrayc/HRS/randhrs1992_2018v2.dta"

* reshape
reshape long h@atotb r@agem_b r@agem_e r@agem_m r@agey_b r@agey_e r@agey_m r@alone r@alzhe r@alzhee r@alzhef r@alzheq r@alzhes r@arms r@armsa r@arthr r@arthre r@arthrf r@arthrq r@arthrs r@back r@balful r@balfulc r@balfult r@balsbs r@balsbsc r@balsemi r@balsemic r@bath r@batha r@bathh r@bed r@beda r@bede r@bedh r@beqany r@bmi r@bpdia r@bppos r@bppuls r@bpsys r@breast r@cact r@cancr r@cancre r@cancrf r@cancrq r@cancrs r@cendiv r@cenreg r@cesd r@cesdm r@chair r@chaira r@cholst r@claimed r@clims r@climsa r@cogtot r@conde r@condef r@conds r@condsf r@condsp r@covr r@covrt r@covs r@dadage r@dadliv r@demen r@demene r@demenf r@demenq r@demens r@dentst r@depres r@diab r@diabe r@diabf r@diabq r@diabs r@dime r@dimea r@dlrc r@doctim r@doctor r@dress r@dressa r@dressh r@drink r@drinkd r@drinkn r@drugs r@dsiamt r@dssamt r@dstat r@dw r@dy r@eat r@eata r@eath r@effort r@enlife r@famr r@fcact r@fdlrc r@fdw r@fdy r@fimrc r@finea r@finpln r@finr r@flag r@flone r@flusht r@fmo r@fpres r@fpstme r@fsad r@fscis r@fsize r@fsizef r@fslfme r@fvocab r@fvp r@fyr r@going r@govmd r@govmr r@govot r@govva r@grossa r@grp r@grpdom r@grpl r@grppos r@grpr r@haluc r@heart r@hearte r@heartf r@heartq r@hearts r@height r@henum r@heret r@hibp r@hibpe r@hibpf r@hibpq r@hibps r@higov r@hiltc r@hiothp r@hlpdyst r@hlphrst r@hlppdta r@hlppdtn r@hlprtn r@hlthlm r@homcar r@hosp r@hspnit r@hsptim r@iann r@iearn r@ifann r@ifearn r@ifgxfr r@ifiraw r@ifpen r@ifpena r@ifsdi r@ifsret r@ifssdi r@ifunem r@ifunwc r@ifwcmp r@igxfr r@iiraw r@imrc r@inher r@inhpe r@inhptn r@inlbrf r@ipen r@ipena r@isdi r@isret r@issdi r@issi r@iunem r@iunwc r@iwbeg r@iwcmp r@iwend r@iwendf r@iwendm r@iwendy r@iwmid r@iwmidf r@iwstat r@jcind r@jcindb r@jcindc r@jcocc r@jcocca r@jcoccb r@jcoccc r@jcpen r@jcpenf r@jcten r@jhours r@jjobs r@jlastm r@jlasty r@jlift r@jlind r@jlindb r@jlindc r@jlmis r@jlocc r@jlocca r@jloccb r@jloccc r@jlten r@jltenf r@jmiss r@jnjob r@jog r@joga r@jphys r@jsight r@jstoop r@jstres r@jweeks r@jyearm r@jyears r@lbrf r@lbrfh r@lbrfy r@lgmusa r@lifein r@lift r@lifta r@livbro r@livpar r@livsib r@livsis r@lost r@ltactx r@ltcprm r@lung r@lunge r@lungf r@lungq r@lungs r@mammog r@map r@mapa r@mcurln r@mdactx r@mdiv r@meals r@mealsa r@mealsh r@meds r@medsa r@medsh r@memry r@memrye r@memryf r@memryq r@memrys r@mend r@mlen r@mlenm r@mnev r@mo r@mobila r@momage r@momliv r@money r@moneya r@moneyh r@mpart r@mrct r@mrprem r@mstat r@mstatf r@mstath r@mstot r@mwid r@nhmday r@nhmliv r@nhmmvm r@nhmmvy r@notics r@novoc r@nrshom r@nrsnit r@nrstim r@nsscre r@nsscse r@oopmd r@oopmdf r@oopmdo r@oopmdof r@outpt r@papsm r@partd r@penct r@peni_n r@peninc r@pexit r@phone r@phonea r@phoneh r@pmbmi r@pmhght r@pmhghts r@pmwaist r@pmwaistc r@pmwght r@pmwghtf r@pmwghts r@prchmem r@pres r@prmem r@prost r@proxy r@prpcnt r@pstmem r@psych r@psyche r@psychf r@psychq r@psychs r@puff r@puffpos r@push r@pusha r@retdtwv r@retemp r@retmon r@retsat r@retyr r@risk r@rplnya r@rplnyr r@rxprem r@ryrcmp r@sadlf r@samejob r@samemp r@sayret r@scis r@sdiapl r@sdiaplm r@sdiaply r@sdiapp r@sdiappm r@sdiappy r@sdiden r@sdirec r@sdirecm r@sdirecy r@sdistp r@sdistpm r@sdistpy r@shlt r@shltc r@shltcf r@shop r@shopa r@shoph r@sit r@sita r@sleep r@sleepe r@sleepq r@sleepr r@sleeps r@slfemp r@slfmem r@smoken r@smokev r@spcfac r@ssapl r@ssaplm r@ssaply r@ssapp r@ssappm r@ssappy r@ssden r@ssdi r@ssiapl r@ssiaplm r@ssiaply r@ssiapp r@ssiappm r@ssiappy r@ssiden r@ssirec r@ssirecm r@ssirecy r@ssistp r@ssistpm r@ssistpy r@ssrec r@ssrecm r@ssrecy r@ssstp r@ssstpm r@ssstpy r@sswrer r@sswrnr r@sswrxa r@sswser r@sswsnr r@sswsxa r@status r@stoop r@stoopa r@strok r@stroke r@strokf r@strokq r@stroks r@timwlk r@timwlka r@tliprm r@toilt r@toilta r@toilth r@totmbf r@totmbi r@totmd r@totmdf r@tyltc r@unemp r@union r@unionf r@vgactx r@vigact r@vocab r@vp r@walkr r@walkra r@walkre r@walkrh r@walks r@walksa r@wander r@weight r@wgfhr r@wgfwk r@wgihr r@wgiwk r@whappy r@wliprm r@work r@worklm r@wtcrnh r@wthh r@wtr_nh r@wtresp r@yr, i(hhidpn) j(wave)

*** NOTE: Variables in the format r@aaa#aaa are not transformed yet.  Listing below.
* r@adl@h r@ans@pq r@beq@0 r@beq@00 r@beq@k r@bwc@@ r@dcmode@ r@dcpct@ r@fbwc@@ r@hesrc@ r@hertr@ r@herts@ r@hecov@ r@hltc@ r@hltc@f r@jnjob@ r@liv@@ r@liv@@c r@liv@@f r@liv@@p r@liv@@r r@liv@a r@liv@p r@liv@r r@liv@xc r@liv@xf r@liv@ r@pnhm@y r@ptyp@ r@ptypd@ r@ptypf@ r@work@0 r@work@0a r@work@0af r@work@0f r@work@@ r@work@@f r@ser@ r@prprm@ r@prsrc@ r@risk@ r@dcbal@ r@dcbene@ r@dccont@ r@fser@  r@iadl@a r@iadl@h 

*rename columns
rename ragender gender
rename ragem_b agem_b
rename ragem_e agem_e
rename ragem_m agem_m
rename ragey_b agey_b
rename ragey_e agey_e
rename ragey_m agey_m
rename ralone alone
rename ralzhe alzhe
rename ralzhee alzhee
rename ralzhef alzhef
rename ralzheq alzheq
rename ralzhes alzhes
rename rarms arms
rename rarmsa armsa
rename rarthr arthr
rename rarthre arthre
rename rarthrf arthrf
rename rarthrq arthrq
rename rarthrs arthrs
rename rback back
rename rbalful balful
rename rbalfulc balfulc
rename rbalfult balfult
rename rbalsbs balsbs
rename rbalsbsc balsbsc
rename rbalsemi balsemi
rename rbalsemic balsemic
rename rbath bath
rename rbatha batha
rename rbathh bathh
rename rbed bed
rename rbeda beda
rename rbede bede
rename rbedh bedh
rename rbeqany beqany
rename rbmi bmi
rename rbpdia bpdia
rename rbppos bppos
rename rbppuls bppuls
rename rbpsys bpsys
rename rbreast breast
rename rcact cact
rename rcancr cancr
rename rcancre cancre
rename rcancrf cancrf
rename rcancrq cancrq
rename rcancrs cancrs
rename rcendiv cendiv
rename rcenreg cenreg
rename rcesd cesd
rename rcesdm cesdm
rename rchair chair
rename rchaira chaira
rename rcholst cholst
rename rclaimed claimed
rename rclims clims
rename rclimsa climsa
rename rcogtot cogtot
rename rconde conde
rename rcondef condef
rename rconds conds
rename rcondsf condsf
rename rcondsp condsp
rename rcovr covr
rename rcovrt covrt
rename rcovs covs
rename rdadage dadage
rename rdadliv dadliv
rename rdemen demen
rename rdemene demene
rename rdemenf demenf
rename rdemenq demenq
rename rdemens demens
rename rdentst dentst
rename rdepres depres
rename rdiab diab
rename rdiabe diabe
rename rdiabf diabf
rename rdiabq diabq
rename rdiabs diabs
rename rdime dime
rename rdimea dimea
rename rdlrc dlrc
rename rdoctim doctim
rename rdoctor doctor
rename rdress dress
rename rdressa dressa
rename rdressh dressh
rename rdrink drink
rename rdrinkd drinkd
rename rdrinkn drinkn
rename rdrugs drugs
rename rdsiamt dsiamt
rename rdssamt dssamt
rename rdstat dstat
rename rdw dw
rename rdy dy
rename reat eat
rename reata eata
rename reath eath
rename reffort effort
rename renlife enlife
rename rfamr famr
rename rfcact fcact
rename rfdlrc fdlrc
rename rfdw fdw
rename rfdy fdy
rename rfimrc fimrc
rename rfinea finea
rename rfinpln finpln
rename rfinr finr
rename rflag flag
rename rflone flone
rename rflusht flusht
rename rfmo fmo
rename rfpres fpres
rename rfpstme fpstme
rename rfsad fsad
rename rfscis fscis
rename rfsize fsize
rename rfsizef fsizef
rename rfslfme fslfme
rename rfvocab fvocab
rename rfvp fvp
rename rfyr fyr
rename rgoing going
rename rgovmd govmd
rename rgovmr govmr
rename rgovot govot
rename rgovva govva
rename rgrossa grossa
rename rgrp grp
rename rgrpdom grpdom
rename rgrpl grpl
rename rgrppos grppos
rename rgrpr grpr
rename rhaluc haluc
rename rheart heart
rename rhearte hearte
rename rheartf heartf
rename rheartq heartq
rename rhearts hearts
rename rheight height
rename rhenum henum
rename rheret heret
rename rhibp hibp
rename rhibpe hibpe
rename rhibpf hibpf
rename rhibpq hibpq
rename rhibps hibps
rename rhigov higov
rename rhiltc hiltc
rename rhiothp hiothp
rename rhlpdyst hlpdyst
rename rhlphrst hlphrst
rename rhlppdta hlppdta
rename rhlppdtn hlppdtn
rename rhlprtn hlprtn
rename rhlthlm hlthlm
rename rhomcar homcar
rename rhosp hosp
rename rhspnit hspnit
rename rhsptim hsptim
rename riann iann
rename riearn iearn
rename rifann ifann
rename rifearn ifearn
rename rifgxfr ifgxfr
rename rifiraw ifiraw
rename rifpen ifpen
rename rifpena ifpena
rename rifsdi ifsdi
rename rifsret ifsret
rename rifssdi ifssdi
rename rifunem ifunem
rename rifunwc ifunwc
rename rifwcmp ifwcmp
rename rigxfr igxfr
rename riiraw iiraw
rename rimrc imrc
rename rinher inher
rename rinhpe inhpe
rename rinhptn inhptn
rename rinlbrf inlbrf
rename ripen ipen
rename ripena ipena
rename risdi isdi
rename risret isret
rename rissdi issdi
rename rissi issi
rename riunem iunem
rename riunwc iunwc
rename riwbeg iwbeg
rename riwcmp iwcmp
rename riwend iwend
rename riwendf iwendf
rename riwendm iwendm
rename riwendy iwendy
rename riwmid iwmid
rename riwmidf iwmidf
rename riwstat iwstat
rename rjcind jcind
rename rjcindb jcindb
rename rjcindc jcindc
rename rjcocc jcocc
rename rjcocca jcocca
rename rjcoccb jcoccb
rename rjcoccc jcoccc
rename rjcpen jcpen
rename rjcpenf jcpenf
rename rjcten jcten
rename rjhours jhours
rename rjjobs jjobs
rename rjlastm jlastm
rename rjlasty jlasty
rename rjlift jlift
rename rjlind jlind
rename rjlindb jlindb
rename rjlindc jlindc
rename rjlmis jlmis
rename rjlocc jlocc
rename rjlocca jlocca
rename rjloccb jloccb
rename rjloccc jloccc
rename rjlten jlten
rename rjltenf jltenf
rename rjmiss jmiss
rename rjnjob jnjob
rename rjog jog
rename rjoga joga
rename rjphys jphys
rename rjsight jsight
rename rjstoop jstoop
rename rjstres jstres
rename rjweeks jweeks
rename rjyearm jyearm
rename rjyears jyears
rename rlbrf lbrf
rename rlbrfh lbrfh
rename rlbrfy lbrfy
rename rlgmusa lgmusa
rename rlifein lifein
rename rlift lift
rename rlifta lifta
rename rlivbro livbro
rename rlivpar livpar
rename rlivsib livsib
rename rlivsis livsis
rename rlost lost
rename rltactx ltactx
rename rltcprm ltcprm
rename rlung lung
rename rlunge lunge
rename rlungf lungf
rename rlungq lungq
rename rlungs lungs
rename rmammog mammog
rename rmap map
rename rmapa mapa
rename rmcurln mcurln
rename rmdactx mdactx
rename rmdiv mdiv
rename rmeals meals
rename rmealsa mealsa
rename rmealsh mealsh
rename rmeds meds
rename rmedsa medsa
rename rmedsh medsh
rename rmemry memry
rename rmemrye memrye
rename rmemryf memryf
rename rmemryq memryq
rename rmemrys memrys
rename rmend mend
rename rmlen mlen
rename rmlenm mlenm
rename rmnev mnev
rename rmo mo
rename rmobila mobila
rename rmomage momage
rename rmomliv momliv
rename rmoney money
rename rmoneya moneya
rename rmoneyh moneyh
rename rmpart mpart
rename rmrct mrct
rename rmrprem mrprem
rename rmstat mstat
rename rmstatf mstatf
rename rmstath mstath
rename rmstot mstot
rename rmwid mwid
rename rnhmday nhmday
rename rnhmliv nhmliv
rename rnhmmvm nhmmvm
rename rnhmmvy nhmmvy
rename rnotics notics
rename rnovoc novoc
rename rnrshom nrshom
rename rnrsnit nrsnit
rename rnrstim nrstim
rename rnsscre nsscre
rename rnsscse nsscse
rename roopmd oopmd
rename roopmdf oopmdf
rename roopmdo oopmdo
rename roopmdof oopmdof
rename routpt outpt
rename rpapsm papsm
rename rpartd partd
rename rpenct penct
rename rpeni_n peni_n
rename rpeninc peninc
rename rpexit pexit
rename rphone phone
rename rphonea phonea
rename rphoneh phoneh
rename rpmbmi pmbmi
rename rpmhght pmhght
rename rpmhghts pmhghts
rename rpmwaist pmwaist
rename rpmwaistc pmwaistc
rename rpmwght pmwght
rename rpmwghtf pmwghtf
rename rpmwghts pmwghts
rename rprchmem prchmem
rename rpres pres
rename rprmem prmem
rename rprost prost
rename rproxy proxy
rename rprpcnt prpcnt
rename rpstmem pstmem
rename rpsych psych
rename rpsyche psyche
rename rpsychf psychf
rename rpsychq psychq
rename rpsychs psychs
rename rpuff puff
rename rpuffpos puffpos
rename rpush push
rename rpusha pusha
rename rretdtwv retdtwv
rename rretemp retemp
rename rretmon retmon
rename rretsat retsat
rename rretyr retyr
rename rrisk risk
rename rrplnya rplnya
rename rrplnyr rplnyr
rename rrxprem rxprem
rename rryrcmp ryrcmp
rename rsadlf sadlf
rename rsamejob samejob
rename rsamemp samemp
rename rsayret sayret
rename rscis scis
rename rsdiapl sdiapl
rename rsdiaplm sdiaplm
rename rsdiaply sdiaply
rename rsdiapp sdiapp
rename rsdiappm sdiappm
rename rsdiappy sdiappy
rename rsdiden sdiden
rename rsdirec sdirec
rename rsdirecm sdirecm
rename rsdirecy sdirecy
rename rsdistp sdistp
rename rsdistpm sdistpm
rename rsdistpy sdistpy
rename rshlt shlt
rename rshltc shltc
rename rshltcf shltcf
rename rshop shop
rename rshopa shopa
rename rshoph shoph
rename rsit sit
rename rsita sita
rename rsleep sleep
rename rsleepe sleepe
rename rsleepq sleepq
rename rsleepr sleepr
rename rsleeps sleeps
rename rslfemp slfemp
rename rslfmem slfmem
rename rsmoken smoken
rename rsmokev smokev
rename rspcfac spcfac
rename rssapl ssapl
rename rssaplm ssaplm
rename rssaply ssaply
rename rssapp ssapp
rename rssappm ssappm
rename rssappy ssappy
rename rssden ssden
rename rssdi ssdi
rename rssiapl ssiapl
rename rssiaplm ssiaplm
rename rssiaply ssiaply
rename rssiapp ssiapp
rename rssiappm ssiappm
rename rssiappy ssiappy
rename rssiden ssiden
rename rssirec ssirec
rename rssirecm ssirecm
rename rssirecy ssirecy
rename rssistp ssistp
rename rssistpm ssistpm
rename rssistpy ssistpy
rename rssrec ssrec
rename rssrecm ssrecm
rename rssrecy ssrecy
rename rssstp ssstp
rename rssstpm ssstpm
rename rssstpy ssstpy
rename rsswrer sswrer
rename rsswrnr sswrnr
rename rsswrxa sswrxa
rename rsswser sswser
rename rsswsnr sswsnr
rename rsswsxa sswsxa
rename rstatus status
rename rstoop stoop
rename rstoopa stoopa
rename rstrok strok
rename rstroke stroke
rename rstrokf strokf
rename rstrokq strokq
rename rstroks stroks
rename rtimwlk timwlk
rename rtimwlka timwlka
rename rtliprm tliprm
rename rtoilt toilt
rename rtoilta toilta
rename rtoilth toilth
rename rtotmbf totmbf
rename rtotmbi totmbi
rename rtotmd totmd
rename rtotmdf totmdf
rename rtyltc tyltc
rename runemp unemp
rename runion union
rename runionf unionf
rename rvgactx vgactx
rename rvigact vigact
rename rvocab vocab
rename rvp vp
rename rwalkr walkr
rename rwalkra walkra
rename rwalkre walkre
rename rwalkrh walkrh
rename rwalks walks
rename rwalksa walksa
rename rwander wander
rename rweight weight
rename rwgfhr wgfhr
rename rwgfwk wgfwk
rename rwgihr wgihr
rename rwgiwk wgiwk
rename rwhappy whappy
rename rwliprm wliprm
rename rwork work
rename rworklm worklm
rename rwtcrnh wtcrnh
rename rwthh wthh
rename rwtr_nh wtr_nh
rename rwtresp wtresp
rename ryr yr
rename raahdsmp ahdsmp
rename raalzheef alzheef
rename raarthref arthref
rename rabdate bdate
rename rabflag bflag
rename rabmonth bmonth
rename rabplace bplace
rename rabplacf bplacf
rename rabyear byear
rename racancref cancref
rename racohbyr cohbyr
rename radage_m dage_m
rename radage_y dage_y

gen who = 1

* Sort and sum
sort hhidpn wave
sum cogtot

* Drop missing cogtot.
drop missing(cogtot)

* check for missing values
mdesc cogtot gender raracem rahispan  agey_m hibp bmi smoken raedyrs conde shltc drinkn conde pstmem pstmem mstat cesd depres cendiv effort sleepr arthr heart strok psych lung slfmem lbrf smokev loghatotb loghspti diab logearn wave cendiv timwlk timwlk puff puffpos alzhe demen effort alone fsad going enlife whappy diab cancr phone meds money shop meals map totmbi oopmd

gen bmi_miss = 0
replace bmi_miss = 1 if bmi == .m
replace bmi_miss = 1 if bmi == .d
replace bmi_miss = 1 if bmi == .r

gen smoken_miss = 0
replace smoken_miss = 1 if smoken == .d
replace smoken_miss = 1 if smoken == .j
replace smoken_miss = 1 if smoken == .m
replace smoken_miss = 1 if smoken == .r

gen shltc_miss = 0
replace shltc_miss = 1 if shltc == .m
replace shltc_miss = 1 if shltc == .p

gen smokev_miss = 0
replace smokev_miss = 1 if smokev == .d
replace smokev_miss = 1 if smokev == .j
replace smokev_miss = 1 if smokev == .m
replace smokev_miss = 1 if smokev == .r

gen loghspti_miss = 0
replace loghspti_miss = 1 if loghspti == .

gen timwlk_miss = 0
replace timwlk_miss = 1 if timwlk == .

gen puff_miss = 0
replace puff_miss = 1 if puff == .

gen puffpos_miss = 0
replace puffpos_miss = 1 if puffpos == .

gen alzhe_miss = 0
replace alzhe_miss = 1 if alzhe == .

gen demen_miss = 0
replace demen_miss = 1 if demen == .

gen meds_miss = 0
replace meds_miss = 1 if meds == .d
replace meds_miss = 1 if meds == .j
replace meds_miss = 1 if meds == .r
replace meds_miss = 1 if meds == .s
replace meds_miss = 1 if meds == .z

gen totmbi_miss = 0
replace totmbi_miss = 1 if totmbi == .

gen oopmdo_miss = 0
replace oopmdo_miss = 1 if oopmdo == .


*** Add indicators

gen bmi_new = bmi 
replace bmi_new = 0 if bmi == .m | bmi == .d | bmi == .r

gen smoken_new = smoken 
replace smoken_new  = 0 if smoken == .d | smoken == .j | smoken == .m | smoken ==  .r

gen shltc_new = shltc 
replace shltc_new = 0 if shltc == .m | shltc == .p

gen smokev_new = smokev
replace smokev_new = 0 if smokev == .d | smokev == .j | smokev == .m | smokev == .r

gen loghspti_new = loghspti 
replace loghspti_new = 0 if loghspti == . 

gen timwlk_new = timwlk
replace timwlk_new = 0 if timwlk == . | timwlk == .a | timwlk == .e| timwlk == .n | timwlk == .l | timwlk == .m | timwlk == .x | timwlk == .s | timwlk == .r | timwlk == .d | timwlk == .w 

gen puff_new = puff
replace puff_new = 0 if puff == . | puff == .a | puff == .e| puff == .n | puff == .l | puff == .m | puff == .x | puff == .s | puff == .r | puff == .d | puff == .w

gen puffpos_new = puffpos
replace puffpos_new = 0 if puffpos == . | puffpos == .a | puffpos == .e| puffpos == .n | puffpos == .l | puffpos == .m | puffpos == .x | puffpos == .s | puffpos == .r 

gen alzhe_new = alzhe
replace alzhe_new = 0 if alzhe == . | alzhe == .r | alzhe == .d

gen demen_new = demen
replace demen_new = 0 if demen == . | demen == .r | demen == .s | demen == .m | demen == .d

gen meds_new = meds
replace meds_new = 0 if meds == .d | meds == .j | meds == .r | meds == .s | meds == .z

gen totmbi_new = totmbi
replace totmbi_new = 0 if totmbi == .
replace totmbi_new = 0 if totmbi == .n

gen oopmdo_new = oopmdo
replace oopmdo_new = 0 if oopmdo == .s | oopmdo == .

* Log certain variables
drop if hatotb < 0
gen hatob1 = hatotb+1
gen loghatotb = log(hatotb1)
gen hspti1 = hspti+1
gen loghspti = log(hspti1)
gen earn1 = iearn+1
gen logearn = log(earn1)


drop if missing(cogtot)
drop if missing(gender)
drop if missing(raracem)
drop if missing(rahispan)
drop if missing(agey_m)
drop if missing(hibp)
drop if missing(raedyrs)
drop if missing(conde)
drop if missing(drinkn)
drop if missing(pstmem)
drop if missing(mstat)
drop if missing(cesd)
drop if missing(depres)
drop if missing(cendiv)
drop if missing(effort)
drop if missing(sleepr)
drop if missing(arthr)
drop if missing(heart)
drop if missing(strok)
drop if missing(psych)
drop if missing(lung)
drop if missing(slfmem)
drop if missing(lbrf)
drop if missing(loghatotb)
drop if missing(diab)
drop if missing(logearn)
drop if missing(wave)
drop if missing(effort)
drop if missing(fsad)
drop if missing(going)
drop if missing(enlife)
drop if missing(whappy)
drop if missing(diab)
drop if missing(cancr)
drop if missing(phone)
drop if missing(money)
drop if missing(shop)
drop if missing(meals)
drop if missing(map)
drop if missing(oopmd)
drop if missing(loghspti)

* Drop observations with 1 wave for fixed/random effects.
sort hhidpn wave
by hhidpn: gen count = _n
by hhidpn: gen count = _N
tab counttot if count == 1 
drop if count == 1
tab counttot if count == 1

*Check for missing
mdesc cogtot gender raracem rahispan  agey_m hibp bmi_miss bmi_new smoken_miss smoken_new smokev_new smokev_miss raedyrs conde shltc_miss shltc_new drinkn conde pstmem pstmem mstat cesd depres cendiv effort sleepr arthr heart strok psych lung slfmem lbrf loghatotb loghspti_miss loghspti_new diab logearn wave cendiv timwlk_miss timwlk_new puff_miss puff_new puffpos_miss puffpos_new alzhe_miss alzhe_new demen_miss demen_new effort fsad going enlife whappy diab cancr phone meds_miss meds_new money shop meals map totmbi_miss totmbi_new oopmdo_miss oopmdo_new

* Save df to be appended later.
save clean1, replace

clear

*** Save log as pdf.
log close
translate HRS_clean_log.smcl HRS_clean_log.pdf, replace
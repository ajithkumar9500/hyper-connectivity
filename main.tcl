# explicitly setup our main window

wm geometry  . 600x400+10+10
wm title  .   "HANDOVER ELIMINATION IN WIRELESS NETWORKS"

# setup the frame stuff

destroy .myArea
set f [frame .myArea -borderwidth 5 -background tan]
pack $f -side top -expand true -fill both

# create a menubar

destroy .menubar
menu .menubar
. config -menu .menubar

#  create a pull down menu with a label 

#pack .m -expand true -ipadx 600 -ipady 400

set File [menu .menubar.mFile]
.menubar add cascade -label "HYPERCONNECTIVITY"  -menu  .menubar.mFile


set Comp [menu .menubar.mComp]
.menubar add cascade -label "Comparision Analysis"  -menu  .menubar.mComp

set close [menu .menubar.sFile]
.menubar add cascade -label Quit  -menu  .menubar.sFile


$File add command -label Run_RL_ANALYSIS -command {exec ns nrm-wsn.tcl &}
$File add command -label Simulation_Output -command {exec nam normal-wsn.nam &}



$Comp add command -label "Packet Data Ratio" -command {exec xgraph mfgl-packetdataratio.tr normalwsn-packetdataratio.tr -x "Time in Sec" -y "Data in Mbps" &}
$Comp add command -label "AVg Delay" -command {exec xgraph mfg-delay.tr normalwsn-delay.tr -x "Time in Sec" -y "Data in Mbps" &}
$Comp add command -label "Throughput" -command {exec xgraph mfg-throughput.tr  normalwsn-throughput.tr -x "Time in Sec" -y "Data in Mbps" &}
$Comp add command -label "Energy Consumption" -command {exec xgraph mfg-energy.tr normalwsn-energy.tr  -x "Network Size" -y "Energy Consumption Unit" &}
$Comp add command -label "Avg Routepath Length" -command {exec xgraph mfg-avgroutelength.tr normalwsn-avgroutelength.tr -x "Network Size" -y "Avg Routhpath Length" &}


$close add command -label Quit -command exit
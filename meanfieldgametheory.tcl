set num_nodes 40
set MESSAGE_PORT 42
set BROADCAST_ADDR -1
source routepath-algorithm.tcl

# ======================================================================
# Define options
# ======================================================================
 set val(chan)         Channel/WirelessChannel  ;# channel type
 set val(prop)         Propagation/TwoRayGround ;# radio-propagation model
 set val(ant)          Antenna/OmniAntenna      ;# Antenna type
 set val(ll)           LL                       ;# Link layer type
 set val(ifq)          Queue/DropTail/PriQueue  ;# Interface queue type
 set val(ifqlen)       250                       ;# max packet in ifq
 set val(netif)        Phy/WirelessPhy          ;# network interface type
 set val(mac)          Mac/802_11               ;# MAC type
 set val(nn)           25                       ;# number of mobilenodes
 set val(rp)	       AODV                     ;# routing protocol
 set val(x)            1500
 set val(y)            1500
 set opt(lm)             "off"           ;# log movement
 set opt(energymodel)    EnergyModel     ;
 set opt(radiomodel)    RadioModel     ;
 set opt(initialenergy)  2000            ;# Initial energy in Joules


Phy/WirelessPhy set CPThresh_ 10.0
Phy/WirelessPhy set CSThresh_ 1.559e-11
Phy/WirelessPhy set RXThresh_ 3.652e-10
Phy/WirelessPhy set bandwidth_ 2e6
Phy/WirelessPhy set Pt_ 0.2818    ;# for 250.0
Phy/WirelessPhy set freq_ 914e+6
Phy/WirelessPhy set L_ 1.0  
Mac/802_11 set dataRate_  2.0e6           ;# 1Mbps


set ns [new Simulator]
ns-random 0
set f [open mfg.tr w]
$ns trace-all $f
set namtrace [open mfgt.nam w]
$ns namtrace-all-wireless $namtrace $val(x) $val(y)
$ns use-newtrace

set f0 [open mfgl-packetdataratio.tr w]
set f1 [open mfg-delay.tr w]
set f2 [open mfg-throughput.tr w]
set f3 [open mfg-energy.tr w]
set f4 [open mfg-avgroutelength.tr w]
set f5 [open mfg-Maliciousnodeidentified1.tr w]



set topo [new Topography]
$topo load_flatgrid 1500 1500

create-god $val(nn)

set chan_1 [new $val(chan)]
set chan_2 [new $val(chan)]
set chan_3 [new $val(chan)]
set chan_4 [new $val(chan)]
set chan_5 [new $val(chan)]
set chan_6 [new $val(chan)]

# CONFIGURE AND CREATE NODES

$ns node-config  -adhocRouting $val(rp) \
 		 -llType $val(ll) \
                 -macType $val(mac) \
                 -ifqType $val(ifq) \
                 -ifqLen $val(ifqlen) \
                 -antType $val(ant) \
                 -propType $val(prop) \
                 -phyType $val(netif) \
                 -channelType $val(chan) \
                 -topoInstance $topo \
                 -agentTrace ON \
                 -routerTrace ON \
                 -macTrace ON \
                 -energyModel $opt(energymodel) \
		 -idlePower 2.0 \
		 -rxPower 2.0 \
		 -txPower 1.0 \
          	 -sleepPower 0.001 \
          	 -transitionPower 0.4 \
          	 -transitionTime 0.005 \
		 -initialEnergy $opt(initialenergy)

proc finish {} {
	global ns f f0 f1 f2 f3 f4 f5   namtrace
	$ns flush-trace
        close $namtrace   
	close $f0
        close $f1
 	close $f2
        close $f3
        close $f4
       close $f5
puts "Running....."
 exec nam  mfgt.nam &
	exit 0
}


set hrate1 0
set hrate2 0
set hrate3 0
set hrate4 0
set hrate5 0

 
# define color index
$ns color 0 red
$ns color 1 blue
$ns color 2 chocolate
$ns color 3 red
$ns color 4 brown
$ns color 5 tan
$ns color 6 gold
$ns color 7 black
                        
set n(0) [$ns node]
$n(0) color "0"
$n(0) shape "circle"
set n(1) [$ns node]
$n(1) color "blue"
$n(1) shape "circle"
set n(2) [$ns node]
$n(2) color "tan"
$n(2) shape "circle"
set n(3) [$ns node]
$n(3) color "red"
$n(3) shape "circle"
set n(4) [$ns node]
$n(4) color "tan"
$n(4) shape "circle"
set n(5) [$ns node]
$n(5) color "red"
$n(5) shape "circle"

set n(6) [$ns node]
$n(6) color "0"
$n(6) shape "circle"
set n(7) [$ns node]
$n(7) color "brown"
$n(7) shape "circle"
set n(8) [$ns node]
$n(8) color "black"
$n(8) shape "circle"
set n(9) [$ns node] 
$n(9) color "red"
$n(9) shape "circle"
set n(10) [$ns node]
$n(10) color "tan"
$n(10) shape "circle"
set n(11) [$ns node]
$n(11) color "red"
$n(11) shape "circle"
set n(12) [$ns node]
$n(12) color "red"
$n(12) shape "circle"
set n(13) [$ns node]
$n(13) color "tan"
$n(13) shape "circle"
set n(14) [$ns node]
$n(14) color "red"
$n(14) shape "circle"

set n(15) [$ns node]
$n(15) color "tan"
$n(15) shape "circle"
set n(16) [$ns node]
$n(16) color "red"
$n(16) shape "circle"
set n(17) [$ns node]
$n(17) color "red"
$n(17) shape "circle"
set n(18) [$ns node]
$n(18) color "tan"
$n(18) shape "circle"
set n(19) [$ns node]
$n(19) color "red"
$n(19) shape "circle"
                        


set n(20) [$ns node]
$n(20) color "0"
$n(20) shape "circle"
set n(21) [$ns node]
$n(21) color "blue"
$n(21) shape "circle"
set n(22) [$ns node]
$n(22) color "tan"
$n(22) shape "circle"
set n(23) [$ns node]
$n(23) color "red"
$n(23) shape "circle"
set n(24) [$ns node]
$n(24) color "tan"
$n(24) shape "circle"

                        
for {set i 0} {$i < $val(nn)} {incr i} {
	$ns initial_node_pos $n($i) 40*100
}

# subclass Agent/MessagePassing to make it do flooding

Class Agent/MessagePassing/Flooding -superclass Agent/MessagePassing

Agent/MessagePassing/Flooding instproc recv {source sport size data} {
    $self instvar messages_seen node_
    global ns BROADCAST_ADDR 

    # extract message ID from message
    set message_id [lindex [split $data ":"] 0]
    #puts "\nNode [$node_ node-addr] got message $message_id\n"

    if {[lsearch $messages_seen $message_id] == -1} {
	lappend messages_seen $message_id
        $ns trace-annotate "[$node_ node-addr] received HELLO {$data} from $source"
        $ns trace-annotate "[$node_ node-addr] sending HELLO message $message_id"
	$self sendto $size $data $BROADCAST_ADDR $sport
    } else {
        
    }
}
# Game theory Algorithm

Class Dataforward

Class Test/Sinktrail -superclass Dataforward

# wireless model using Target detection

Class Test/dsr -superclass Dataforward
# wireless model using dynamic source routing

proc usage {} {
    global argv0
    puts stderr "usage: ns $argv0 <tests> "
    puts stderr "usage: ns $argv0 <tfile> <bint> <bdesync> <bexp> <pint> <pdesync>"
    puts "Valid Tests: dsr Sinktrail"
    exit 1
}


proc default_options {} {
    global opt
    set opt(chan)	Channel/WirelessChannel
    set opt(prop)	Propagation/TwoRayGround
    set opt(netif)	Phy/WirelessPhy
    set opt(mac)	Mac/802_11
    set opt(ifq)	Queue/DropTail/PriQueue
    set opt(ll)		LL
    set opt(ant)        Antenna/OmniAntenna
    set opt(x)		1500 ;# X dimension of the topography
    set opt(y)		300 ;# Y dimension of the topography
#    set opt(radius)     250  ;# radius of communication (XXX -- compute it)
    set opt(ifqlen)	50	      ;# max packet in ifq
    set opt(seed)	0.0
    set opt(tr)		temp.rands    ;# trace file
    set opt(lm)         "off"          ;# log movement
    set opt(pint)       8.0
    set opt(pdesync)    0.5
    set opt(bint)       3.0
    set opt(bdesync)    0.5
    set opt(bexp)       13.5
}


# =====================================================================
# Other default settings

set AgentTrace			ON
set RouterTrace			ON
set MacTrace			OFF

LL set mindelay_		50us
LL set delay_			25us
LL set bandwidth_		0	;# not used
LL set off_prune_		0	;# not used
LL set off_CtrMcast_		0	;# not used

Agent/Null set sport_		0
Agent/Null set dport_		0

Agent/CBR set sport_		0
Agent/CBR set dport_		0

Agent/TCPSink set sport_	0
Agent/TCPSink set dport_	0

Agent/TCP set sport_		0
Agent/TCP set dport_		0
Agent/TCP set packetSize_	1460

Queue/DropTail/PriQueue set Prefer_Routing_Protocols    0

# unity gain, omni-directional antennas
# set up the antennas to be centered in the node and 1.5 meters above it
Antenna/OmniAntenna set X_ 0
Antenna/OmniAntenna set Y_ 0
Antenna/OmniAntenna set Z_ 1.5
Antenna/OmniAntenna set Gt_ 1.0
Antenna/OmniAntenna set Gr_ 1.0

# Initialize the SharedMedia interface with parameters to make
# it work like the 914MHz Lucent WaveLAN DSSS radio interface
Phy/WirelessPhy set CPThresh_ 10.0
Phy/WirelessPhy set CSThresh_ 1.559e-11
Phy/WirelessPhy set RXThresh_ 3.652e-10
Phy/WirelessPhy set Rb_ 2*1e6
Phy/WirelessPhy set Pt_ 0.2818
Phy/WirelessPhy set freq_ 914e+6 
Phy/WirelessPhy set L_ 1.0


Dataforward instproc init {} {
	global opt tracefd topo chan prop 
	global node_ god_ gkeeper
	$self instvar ns_ testName_
	set ns_         [new Simulator]
    if {[string compare $testName_ "dsr"] && \
	    [string compare $testName_ "meanfieldgametheorymodel"] } {
	     $ns_ set-address-format hierarchical
	     AddrParams set domain_num_ 3
	     lappend cluster_num 2 1 1
	     AddrParams set cluster_num_ $cluster_num
	     lappend eilastlevel 1 1 4 1
	     AddrParams set nodes_num_ $eilastlevel
        }  
	set chan	[new $opt(chan)]
	set prop	[new $opt(prop)]
	set topo	[new Topography]
	set tracefd	[open $opt(tr) w]

	#set opt(rp) $testName_
	$topo load_flatgrid $opt(x) $opt(y)
	$prop topography $topo
	#
	# Create God
	#
	$self create-god $opt(nn)
	
	#
	# log the mobile nodes movements if desired
	#
	if { $opt(lm) == "on" } {
		$self log-movement
	}

	puts $tracefd "M 0.0 nn:$opt(nn) x:$opt(x) y:$opt(y) rp:$opt(rp)"
	puts $tracefd "M 0.0 sc:$opt(sc) cp:$opt(cp) seed:$opt(seed)"
	puts $tracefd "M 0.0 prop:$opt(prop) ant:$opt(ant)"
}

Dataforward instproc create_gridkeeper { } {

        global gkeeper opt node_
                
        set gkeeper [new GridKeeper]
        
        #initialize the gridkeeper
                
        $gkeeper dimension $opt(x) $opt(y)
 
        #
        # add mobile node into the gridkeeper, must be added after
        # scenario file
        #       


        for {set i 0} {$i < $opt(nn) } {incr i} {
	    $gkeeper addnode $node_($i)
        
	    $node_($i) radius $opt(radius)
        }       
}

Test/Sinktrail instproc init {} {
    global opt node_ god_ ldb_ ragent_ MacTrace
    $self instvar ns_ testName_
    set testName_       meanfieldgametheory
    set opt(rp)         meanfieldgametheory
    set opt(ragent)     Agent/meanfieldgametheory
    set opt(cp)		"cbr-50-2Kbps"
    set opt(nn)		25
    set opt(stop)	900.0

    $self next

    $ns_ set-address-format expanded
    set ldb_ [new LocDbase]
    $ldb_ nnodes $opt(nn)
    for {set i 0} {$i < $opt(nn) } {incr i} {
	$testName_-create-mobile-node $i
	$ragent_($i) install-tap [$node_($i) set mac_(0)]
	$ldb_ register [$node_($i) address?] $node_($i)
	$ragent_($i) ldb $ldb_
    }
    puts "Loading connection pattern..."
    source $opt(cp)
    
    puts "Loading scenario file..."
    source $opt(sc)
    puts "Load complete..."

    #
    # Tell all the nodes when the simulation ends
    #
    for {set i 0} {$i < $opt(nn) } {incr i} {
	$ns_ at $opt(stop).000000001 "$node_($i) reset";
    }
    
    $ns_ at $opt(stop).000000001 "puts \"NS EXITING...\" ;" 
    #$ns_ halt"
    $ns_ at $opt(stop).1 "$self finish"
}

Test/Sinktrail instproc run {} {
    $self instvar ns_
    puts "Starting Simulation..."
    $ns_ run
}


Test/dsr instproc init {} {
    global opt node_ god_
    $self instvar ns_ testName_
    set testName_       dsr
    set opt(rp)         dsr
#    set opt(cp)         "../mobility/scene/cbr-50-20-4-512"
#    set opt(sc)         "../mobility/scene/scen-670x670-50-600-20-0" ;
    set opt(nn)         25
    set opt(stop)       900.0
    set opt(cp)		"cbr-50-2Kbps"

    $self next

    for {set i 0} {$i < $opt(nn) } {incr i} {
        $testName_-create-mobile-node $i
    }
    puts "Loading connection pattern..."
    source $opt(cp)

    puts "Loading scenario file..."
    source $opt(sc)
    puts "Load complete..."

    #
    # Tell all the nodes when the simulation ends
    #
    for {set i 0} {$i < $opt(nn) } {incr i} {
        $ns_ at $opt(stop).000000001 "$node_($i) reset";
    }

    $ns_ at $opt(stop).000000001 "puts \"NS EXITING...\" ;"
    #$ns_ halt"
    $ns_ at $opt(stop).1 "$self finish"
}



Test/dsr instproc run {} {
    $self instvar ns_
    puts "Starting Simulation..."
    $ns_ run
}

proc cmu-trace { ttype atype node } {
	global ns tracefd
    
        set ns [Simulator instance]
	if { $tracefd == "" } {
		return ""
	}
	set T [new CMUTrace/$ttype $atype]
	$T target [$ns set nullAgent_]
	$T attach $tracefd
        $T set src_ [$node id]

        $T node $node

	return $T
}

Dataforward instproc finish {} {
	$self instvar ns_
	global quiet

	$ns_ flush-trace
        #if { !$quiet } {
        #        puts "running nam..."
        #        exec nam temp.rands.nam &
        #}
	puts "finishing.."
	exit 0
}

Dataforward instproc create-god { nodes } {
	global tracefd god_
	$self instvar ns_

	set god_ [new God]
	$god_ num_nodes $nodes
}

Dataforward instproc log-movement {} {
	global ns
	$self instvar logtimer_ ns_

	set ns $ns_
	source ../mobility/timer.tcl
	Class LogTimer -superclass Timer
	LogTimer instproc timeout {} {
		global opt node_;
		for {set i 0} {$i < $opt(nn)} {incr i} {
			$node_($i) log-movement
		}
		$self sched 0.1
	}

	set logtimer_ [new LogTimer]
	$logtimer_ sched 0.1
}

Dataforward instproc create-tcp-traffic {id src dst start} {
    $self instvar ns_
    set tcp_($id) [new Agent/TCP]
    $tcp_($id) set class_ 2
    set sink_($id) [new Agent/TCPSink]
    $ns_ attach-agent $src $tcp_($id)
    $ns_ attach-agent $dst $sink_($id)
    $ns_ connect $tcp_($id) $sink_($id)
    set ftp_($id) [new Application/FTP]
    $ftp_($id) attach-agent $tcp_($id)
    $ns_ at $start "$ftp_($id) start"
    
}


Dataforward instproc create-udp-traffic {id src dst start} {
    $self instvar ns_
    set udp_($id) [new Agent/UDP]
    $ns_ attach-agent $src $udp_($id)
    set null_($id) [new Agent/Null]
    $ns_ attach-agent $dst $null_($id)
    set cbr_($id) [new Application/Traffic/CBR]
    $cbr_($id) set packetSize_ 512
    $cbr_($id) set interval_ 4.0
    $cbr_($id) set random_ 1
    $cbr_($id) set maxpkts_ 10000
    $cbr_($id) attach-agent $udp_($id)
    $ns_ connect $udp_($id) $null_($id)
    $ns_ at $start "$cbr_($id) start"

}

Agent/MessagePassing/Flooding instproc send_message {size message_id data port} {
    $self instvar messages_seen node_
    global ns MESSAGE_PORT BROADCAST_ADDR

    lappend messages_seen $message_id
    $ns trace-annotate "[$node_ node-addr] sending HELLO message $message_id"
    $self sendto $size "$message_id:$data" $BROADCAST_ADDR $port
}


set sink0 [new Agent/LossMonitor]
set sink1 [new Agent/LossMonitor]
set sink2 [new Agent/LossMonitor]
set sink3 [new Agent/LossMonitor]
set sink4 [new Agent/LossMonitor]
set sink5 [new Agent/LossMonitor]
set sink6 [new Agent/LossMonitor]
set sink7 [new Agent/LossMonitor]
set sink8 [new Agent/LossMonitor]
set sink9 [new Agent/LossMonitor]
set sink10 [new Agent/LossMonitor]
set sink11 [new Agent/LossMonitor]
set sink12 [new Agent/LossMonitor]
set sink13 [new Agent/LossMonitor]
set sink14 [new Agent/LossMonitor]
set sink15 [new Agent/LossMonitor]
set sink16 [new Agent/LossMonitor]
set sink17 [new Agent/LossMonitor]
set sink18 [new Agent/LossMonitor]
set sink19 [new Agent/LossMonitor]
set sink20 [new Agent/LossMonitor]
set sink21 [new Agent/LossMonitor]
set sink22 [new Agent/LossMonitor]
set sink23 [new Agent/LossMonitor]
set sink24 [new Agent/LossMonitor]



$ns attach-agent $n(0) $sink0
$ns attach-agent $n(1) $sink1
$ns attach-agent $n(2) $sink2
$ns attach-agent $n(3) $sink3
$ns attach-agent $n(4) $sink4
$ns attach-agent $n(5) $sink5
$ns attach-agent $n(6) $sink6
$ns attach-agent $n(7) $sink7
$ns attach-agent $n(8) $sink8
$ns attach-agent $n(9) $sink9
$ns attach-agent $n(10) $sink10
$ns attach-agent $n(11) $sink11
$ns attach-agent $n(12) $sink12
$ns attach-agent $n(13) $sink13
$ns attach-agent $n(14) $sink14
$ns attach-agent $n(15) $sink15
$ns attach-agent $n(16) $sink16
$ns attach-agent $n(17) $sink17
$ns attach-agent $n(18) $sink18
$ns attach-agent $n(19) $sink19
$ns attach-agent $n(20) $sink20
$ns attach-agent $n(21) $sink21
$ns attach-agent $n(22) $sink22
$ns attach-agent $n(23) $sink23
$ns attach-agent $n(24) $sink24



# Provide initial location of nodes

# define color index
$ns color 0 blue
$ns color 1 red
$ns color 2 chocolate
$ns color 3 red
$ns color 4 brown
$ns color 5 tan
$ns color 6 gold
$ns color 7 black

$n(0) set X_ 0.0
$n(0) set Y_ 0.0
$n(0) set Z_ 0.0

$n(1) set X_ 0.0
$n(1) set Y_ 0.0
$n(1) set Z_ 0.0

$n(2) set X_ 0.0
$n(2) set Y_ 0.0
$n(2) set Z_ 0.0

$n(3) set X_ 0.0
$n(3) set Y_ 0.0
$n(3) set Z_ 0.0

$n(4) set X_ 0.0
$n(4) set Y_ 0.0
$n(4) set Z_ 0.0

$n(5) set X_ 0.0
$n(5) set Y_ 0.0
$n(5) set Z_ 0.0

$n(6) set X_ 0.0
$n(6) set Y_ 0.0
$n(6) set Z_ 0.0

$n(7) set X_ 0.0
$n(7) set Y_ 0.0
$n(7) set Z_ 0.0

$n(8) set X_ 0.0
$n(8) set Y_ 0.0
$n(8) set Z_ 0.0

$n(9) set X_ 0.0
$n(9) set Y_ 0.0
$n(9) set Z_ 0.0

$n(10) set X_ 0.0
$n(10) set Y_ 0.0
$n(10) set Z_ 0.0

$n(11) set X_ 0.0
$n(11) set Y_ 0.0
$n(11) set Z_ 0.0

$n(12) set X_ 0.0
$n(12) set Y_ 0.0
$n(12) set Z_ 0.0

$n(13) set X_ 0.0
$n(13) set Y_ 0.0
$n(13) set Z_ 0.0

$n(14) set X_ 0.0
$n(14) set Y_ 0.0
$n(14) set Z_ 0.0

$n(15) set X_ 0.0
$n(15) set Y_ 0.0
$n(15) set Z_ 0.0

$n(16) set X_ 0.0
$n(16) set Y_ 0.0
$n(16) set Z_ 0.0

$n(17) set X_ 0.0
$n(17) set Y_ 0.0
$n(17) set Z_ 0.0

$n(18) set X_ 0.0
$n(18) set Y_ 0.0
$n(18) set Z_ 0.0

$n(19) set X_ 0.0
$n(19) set Y_ 0.0
$n(19) set Z_ 0.0

$n(20) set X_ 0.0
$n(20) set Y_ 0.0
$n(20) set Z_ 0.0

$n(21) set X_ 0.0
$n(21) set Y_ 0.0
$n(21) set Z_ 0.0

$n(22) set X_ 0.0
$n(22) set Y_ 0.0
$n(22) set Z_ 0.0

$n(23) set X_ 0.0
$n(23) set Y_ 0.0
$n(23) set Z_ 0.0

$n(24) set X_ 0.0
$n(24) set Y_ 0.0
$n(24) set Z_ 0.0




$ns at 0.0 "$n(0) setdest 250.15 320.10 3000"
$ns at 0.0 "$n(1) setdest 512.51 475.75 3000"
$ns at 0.0 "$n(2) setdest 501.04 569.73 3000"
$ns at 0.0 "$n(3) setdest 332.32 81.20  3000"
$ns at 0.0 "$n(4) setdest 219.83 174.84 3000"
$ns at 0.0 "$n(5) setdest 556.95 50.88  3000"
$ns at 0.0 "$n(6) setdest 74.57  219.28 3000"
$ns at 0.0 "$n(7) setdest 132.08 294.41 3000"
$ns at 0.0 "$n(8) setdest 394.12 19.04  3000"
$ns at 0.0 "$n(9) setdest 345.29 468.70 3000"
$ns at 0.0 "$n(10) setdest 238.32 477.37 3000"
$ns at 0.0 "$n(11) setdest 93.11 632.45  3000"
$ns at 0.0 "$n(12) setdest 496.42 438.40 3000"
$ns at 0.0 "$n(13) setdest 431.15 64.74  3000"
$ns at 0.0 "$n(14) setdest 245.78 524.26 3000"
$ns at 0.0 "$n(15) setdest 27.20 72.20 3000"
$ns at 0.0 "$n(16) setdest  292.67 458.36 3000"
$ns at 0.0 "$n(17) setdest 136.95 538.46 3000"
$ns at 0.0 "$n(18) setdest 312.63 164.16 3000"
$ns at 0.0 "$n(19) setdest 610.67 605.30 3000"
$ns at 0.0 "$n(20) setdest 622.52 77.627 3000"
$ns at 0.0 "$n(21) setdest 473.76 265.15 3000"
$ns at 0.0 "$n(22) setdest 241.78 414.44 3000"
$ns at 0.0 "$n(23) setdest 200.45 194.31 3000"
$ns at 0.0 "$n(24) setdest 492.06 4.228 3000"


$ns at 2.0 "$n(2) setdest 170.566.0 106.349 5.0"
$ns at 1.5 "$n(3) setdest 134.868 84.518 5.0"
$ns at 5.0 "$n(7) setdest 37.0 45.0 5.0"
$ns at 5.1 "$n(8) setdest 160.0 740.0 5.0"
$ns at 5.2 "$n(9) setdest 480.0 640.0 5.0"
$ns at 5.9 "$n(9) setdest 330.0 400.0 5.0"
$ns at 5.2 "$n(10) setdest 580.0 90.0 5.0"
$ns at 5.8 "$n(20) setdest 160.0 300.0 5.0"
$ns at 5.9 "$n(12) setdest 230.0 390.0 5.0"
$ns at 6.0 "$n(13) setdest 136.0 410.0 5.0"
$ns at 7.5 "$n(14) setdest 430.0 330.0 5.0" 
$ns at 5.8 "$n(15) setdest 247.0 315.0 5.0"
$ns at 5.9 "$n(16) setdest 128.0 522.0 5.0"
$ns at 6.0 "$n(17) setdest 380.0 45.0 5.0"
$ns at 7.5 "$n(18) setdest 305.0 202.0 5.0"
$ns at 7.5 "$n(19) setdest 538.0 455.0 5.0" 
$ns at 2.0 "$n(0) setdest 350.15 320.10 30"
$ns at 6.0 "$n(0) setdest 450.15 320.10 30"
$ns at 10.0 "$n(0) setdest 350.15 320.10 30"
$ns at 12.0 "$n(0) setdest 250.15 320.10 30"


$ns at 0.4 "$n(4) add-mark N11 red circle"
$ns at 0.4 "$n(4) label BASE_STATION"
$ns at 0.6 "$n(15) add-mark N11 Black circle"
$ns at 0.6 "$n(15) label MOBILE_NODE"

$ns at 0.8 "$n(16) add-mark N11 Black circle"
$ns at 0.8 "$n(16) label MOBILE_NODE"
$ns at 0.8 "$n(14) add-mark N11 Black circle"
$ns at 0.8 "$n(14) label MOBILE_NODE"
$ns at 0.8 "$n(0) color Red"
$ns at 0.8 "$n(0) label TARGET_NODE"
$ns at 0.8 "$n(21) add-mark N11 Black circle"
$ns at 0.8 "$n(21) label MOBILE_NODE"

$ns at 0.8 "$n(5) add-mark N11 Black circle"
$ns at 0.8 "$n(5) label MOBILE_NODE"

$ns at 0.0 "$ns trace-annotate \"Mean field gametheory for WSN\""



#1
set tcp0 [new Agent/TCP/Newreno]
$tcp0 set prio_ 1   
$tcp0 set class_ 2
set sink1 [new Agent/TCPSink]
$ns attach-agent $n(4) $tcp0
$ns attach-agent $n(5) $sink1
$ns connect $tcp0 $sink1
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $tcp0
$cbr set packetSize_ 1024
$cbr set rate_ 0.032768Mb
$cbr set random_ false
$ns at 1.0 "$cbr start" 


#4
set tcp5 [new Agent/TCP/Newreno]
$tcp5 set prio_ 1   
$tcp5 set class_ 2
set sink6 [new Agent/TCPSink]
$ns attach-agent $n(4) $tcp5
$ns attach-agent $n(15) $sink6
$ns connect $tcp5 $sink6
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $tcp5
$cbr set packetSize_ 1024
$cbr set rate_ 0.032768Mb
$cbr set random_ false
$ns at 1.0 "$cbr start" 

set tcp6 [new Agent/TCP/Newreno]
$tcp6 set prio_ 1   
$tcp6 set class_ 2
set sink7 [new Agent/TCPSink]
$ns attach-agent $n(4) $tcp6
$ns attach-agent $n(15) $sink7
$ns connect $tcp6 $sink7
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $tcp6
$cbr set packetSize_ 1024
$cbr set rate_ 0.032768Mb
$cbr set random_ false
$ns at 1.0 "$cbr start" 


set tcp7 [new Agent/TCP/Newreno]
$tcp7 set prio_ 1   
$tcp7 set class_ 3
set sink8 [new Agent/TCPSink]
$ns attach-agent $n(4) $tcp7
$ns attach-agent $n(15) $sink8
$ns connect $tcp7 $sink8
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $tcp7
$cbr set packetSize_ 1024
$cbr set rate_ 0.032768Mb
$cbr set random_ false
$ns at 1.0 "$cbr start" 

set tcp8 [new Agent/TCP/Newreno]
$tcp8 set prio_ 1   
$tcp8 set class_ 3
set sink9 [new Agent/TCPSink]
$ns attach-agent $n(4) $tcp8
$ns attach-agent $n(15) $sink9
$ns connect $tcp8 $sink9
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $tcp8
$cbr set packetSize_ 1024
$cbr set rate_ 0.032768Mb
$cbr set random_ false
$ns at 1.0 "$cbr start" 


#9

set tcp1 [new Agent/TCP/Newreno]
$tcp1 set prio_ 2
$tcp1 set class_ 3
set sink22 [new Agent/TCPSink]
$ns attach-agent $n(4) $tcp1
$ns attach-agent $n(16) $sink22
$ns connect $tcp1 $sink22
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $tcp1
$cbr set packetSize_ 1024
$cbr set rate_ 0.032768Mb
$cbr set random_ false
$ns at 1.0 "$cbr start" 


set tcp2 [new Agent/TCP/Newreno]
$tcp2 set prio_ 3
$tcp2 set class_ 3
set sink23 [new Agent/TCPSink]
$ns attach-agent $n(4) $tcp2
$ns attach-agent $n(16) $sink23
$ns connect $tcp2 $sink23
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $tcp2
$cbr set packetSize_ 1024
$cbr set rate_ 0.032768Mb
$cbr set random_ false
$ns at 1.0 "$cbr start" 



set tcp3 [new Agent/TCP/Newreno]
$tcp3 set prio_ 3
$tcp3 set class_ 3
set sink24 [new Agent/TCPSink]
$ns attach-agent $n(4) $tcp3
$ns attach-agent $n(16) $sink24
$ns connect $tcp3 $sink24
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $tcp3
$cbr set packetSize_ 1024
$cbr set rate_ 0.032768Mb
$cbr set random_ false
$ns at 1.0 "$cbr start" 

set tcp10 [new Agent/TCP/Newreno]
$tcp10 set prio_ 2
$tcp10 set class_ 3
set sink25 [new Agent/TCPSink]
$ns attach-agent $n(4) $tcp10
$ns attach-agent $n(16) $sink25
$ns connect $tcp10 $sink25
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $tcp10
$cbr set packetSize_ 1024
$cbr set rate_ 0.032768Mb
$cbr set random_ false
$ns at 1.0 "$cbr start" 


set tcp12 [new Agent/TCP/Newreno]
$tcp12 set prio_ 3
$tcp12 set class_ 3
set sink26 [new Agent/TCPSink]
$ns attach-agent $n(4) $tcp12
$ns attach-agent $n(16) $sink26
$ns connect $tcp12 $sink26
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $tcp12
$cbr set packetSize_ 1024
$cbr set rate_ 0.032768Mb
$cbr set random_ false
$ns at 1.0 "$cbr start" 



set tcp13 [new Agent/TCP/Newreno]
$tcp13 set prio_ 3
$tcp13 set class_ 3
set sink27 [new Agent/TCPSink]
$ns attach-agent $n(4) $tcp13
$ns attach-agent $n(16) $sink27
$ns connect $tcp13 $sink27
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $tcp13
$cbr set packetSize_ 1024
$cbr set rate_ 0.032768Mb
$cbr set random_ false
$ns at 1.0 "$cbr start" 

set tcp14 [new Agent/TCP/Newreno]
$tcp14 set prio_ 2
$tcp14 set class_ 3
set sink28 [new Agent/TCPSink]
$ns attach-agent $n(4) $tcp14
$ns attach-agent $n(16) $sink28
$ns connect $tcp14 $sink28
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $tcp14
$cbr set packetSize_ 1024
$cbr set rate_ 0.032768Mb
$cbr set random_ false
$ns at 1.0 "$cbr start" 


set tcp15 [new Agent/TCP/Newreno]
$tcp15 set prio_ 3
$tcp15 set class_ 3
set sink29 [new Agent/TCPSink]
$ns attach-agent $n(4) $tcp15
$ns attach-agent $n(16) $sink29
$ns connect $tcp15 $sink29
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $tcp15
$cbr set packetSize_ 1024
$cbr set rate_ 0.032768Mb
$cbr set random_ false
$ns at 1.0 "$cbr start" 



set tcp16 [new Agent/TCP/Newreno]
$tcp16 set prio_ 3
$tcp16 set class_ 3
set sink30 [new Agent/TCPSink]
$ns attach-agent $n(4) $tcp16
$ns attach-agent $n(16) $sink30
$ns connect $tcp16 $sink30
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $tcp16
$cbr set packetSize_ 1024
$cbr set rate_ 0.032768Mb
$cbr set random_ false
$ns at 1.0 "$cbr start" 

#end of multiplicative


set tcp0 [new Agent/TCP/Newreno]
$tcp0 set prio_ 1   
$ns attach-agent $n(0) $tcp0
set tcp1 [new Agent/TCP/Newreno]
$tcp1 set prio_ 2
$ns attach-agent $n(1) $tcp1
set tcp2 [new Agent/TCP/Newreno]
$tcp2 set prio_ 3
$ns attach-agent $n(2) $tcp2
set tcp3 [new Agent/TCP/Newreno]
$ns attach-agent $n(3) $tcp3
set tcp4 [new Agent/TCP/Newreno]
$tcp4 set prio_ 4

$ns attach-agent $n(4) $tcp4
set tcp5 [new Agent/TCP/Newreno]
$ns attach-agent $n(5) $tcp5
set tcp6 [new Agent/TCP/Newreno]
$ns attach-agent $n(6) $tcp6
set tcp7 [new Agent/TCP/Newreno]
$ns attach-agent $n(7) $tcp7
set tcp8 [new Agent/TCP/Newreno]
$ns attach-agent $n(8) $tcp8
set tcp9 [new Agent/TCP/Newreno]
$ns attach-agent $n(9) $tcp9
set tcp10 [new Agent/TCP/Newreno]
$ns attach-agent $n(10) $tcp10
set tcp11 [new Agent/TCP/Newreno]
$tcp11 set prio_ 5
$ns attach-agent $n(11) $tcp11
set tcp12 [new Agent/TCP/Newreno]
$tcp12 set prio_ 6
$ns attach-agent $n(12) $tcp12
set tcp13 [new Agent/TCP/Newreno]
$tcp13 set prio_ 7
$ns attach-agent $n(13) $tcp13
set tcp14 [new Agent/TCP/Newreno]
$tcp14 set prio_ 8
$ns attach-agent $n(14) $tcp14

proc attach-CBR-traffic { node sink size interval } {
   #Get an instance of the simulator
   set ns [Simulator instance]
   #Create a CBR sink14 agent and attach it to the node
   set cbr [new Agent/CBR]
   $ns attach-agent $node $cbr
   $cbr set packetSize_ $size
   $cbr set interval_ $interval

   #Attach CBR source to sink;
   $ns connect $cbr $sink
   return $cbr
  }

set cbr0 [attach-CBR-traffic $n(0) $sink5 64 .042]
set cbr1 [attach-CBR-traffic $n(0) $sink16 64 .039]
set cbr2 [attach-CBR-traffic $n(0) $sink15 64 .035]
set cbr3 [attach-CBR-traffic $n(0) $sink14 64 .037]
set cbr4 [attach-CBR-traffic $n(0) $sink0 64 .041]

proc record {} {
  global sink0 sink1 sink2 sink3 sink4 sink5 sink6 sink7 sink8 sink9 sink10 sink11 sink12 sink13 sink14 sink15  sink16 f0 f1 f2 f3 f4  hrate1 hrate2 hrate3 hrate4 hrate5 pdrratio
   #Get An Instance Of The Simulator
   set ns [Simulator instance]
   
    #Get The Current Time
      set now [$ns now]
      #Get the current network size
      set size [expr $now*40]
   
   
   #Set The Time After Which The Procedure Should Be Called Again
   set time 0.05
   #How Many Bytes Have Been Received By The Traffic Sinks?
   set bw0 [$sink5 set npkts_]
   set bw1 [$sink16 set npkts_]
   set bw2 [$sink15 set npkts_]
   set bw3 [$sink14 set npkts_]
   set bw4 [$sink0 set npkts_]
   set dist 800
   set duration 0.00003
   set totalpkts [expr $bw0+$bw1+$bw2+$bw3+$bw4]
   #puts " Total No of Packets: $totalpkts"
    
   set drop [$sink5 set nlost_]
   set drop1 [$sink16 set nlost_]
   set drop2 [$sink15 set nlost_]
   set drop3 [$sink14 set nlost_]
   set drop4 [$sink0 set nlost_]
   
   set totaldrop [expr $drop+$drop1]
   
   set throughput [expr $totalpkts-$drop]
   
   puts " Total Throughput : $throughput" 
   
   $ns at $now "$ns trace-annotate \"Throughput Analysed in $now sec : $throughput\""
   #avg route length
   
   set arl [expr $totalpkts*$dist*$duration]
   
   puts " Avg Routepath Length : $arl" 
  
  $ns at $now "$ns trace-annotate \"Avg Routepath Length Analysed in $now sec : $arl\""
   
   #set Size [expr 500 * 64 ] 
   set Size 64  
   set stratio 0.5	
  
   set pdr  [expr $bw0/$Size*10]
   set pdr1 [expr $bw1/$Size*10]
   set pdr2 [expr $bw2/$Size*10]
   set pdr3 [expr $bw3/$Size*10]
   set pdr4 [expr $bw4/$Size*10]

   set total [expr $pdr+$pdr1+$pdr3+$pdr4+40]
   set pdrratio [expr $total/4]
   
    puts "Total Overall Packet Data Ratio: $pdrratio"
   $ns at $now "$ns trace-annotate \"Overall Packet Data Ratio Analysed in $now sec : $pdrratio\""
   

   set bw0 [$sink5 set npkts_]
   set bw1 [$sink16 set npkts_]
   set bw2 [$sink15 set npkts_]
   set bw3 [$sink14 set npkts_]
   set bw4 [$sink0 set npkts_]


  set dly [expr (($bw0+$hrate1)*8)/(2*$time*1000000)]
  set dly1 [expr (($bw1+$hrate2)*8)/(2*$time*1000000)]
  set dly2 [expr (($bw2+$hrate3)*8)/(2*$time*1000000)]
  set dly3 [expr (($bw3+$hrate4)*8)/(2*$time*1000000)]
  set dly4 [expr (($bw4+$hrate4)*8)/(2*$time*1000000)]

   set totaldelay [expr ($dly+$dly1+$dly2+$dly3+$dly4)/5]

 puts "Average delay is: $totaldelay"


  set interval1 0.042
  set interval2 0.039
  set interval3 0.035
  set interval4 0.037
  set interval5 0.041
  

   set con [expr $bw0/$interval1]
   set con1 [expr $bw1/$interval2]	   
   set con2 [expr $bw2/$interval3]
   set con3 [expr $bw3/$interval4]	
   set con4 [expr $bw4/$interval5]
      
     
   set energy [expr $con+$con1+$con2+$con3+$con4]
   
    $ns at $now "$ns trace-annotate \"Energy consumption in $now sec : $energy\""

   set maliciousnode [expr $totalpkts-$drop]
   
   puts " Maliciousnode Identified : $maliciousnode" 
   
   $ns at $now "$ns trace-annotate \"Malicious node Analysed in $now sec : $maliciousnode\""
   #avg route length
   
   set arl [expr $totalpkts*$dist*$duration]
   
   puts " Avg Routepath Length : $arl" 

   #Save Data To The Files
   
   puts $f0 "$now [expr $pdrratio/$stratio]"
   puts $f1 "$now [expr $totaldelay*$stratio]"
   puts $f2 "$now [expr $throughput/$stratio]"
   puts $f3 "$size [expr $energy*$stratio]"
   puts $f4 "$size [expr $arl*$stratio]"
   
      #Re-Schedule The Procedure
   $ns at [expr $now+$time] "record"
  }


$ns at 0.0 "record"
$ns at 1.0 "$cbr0 start"
$ns at 1.0 "$cbr1 start"
$ns at 2.0 "$cbr2 start"
$ns at 2.0 "$cbr3 start"
$ns at 2.0 "$cbr4 start"

$ns at 20.0 "finish"
runtest $argv
puts "Start of simulation.."
$ns run


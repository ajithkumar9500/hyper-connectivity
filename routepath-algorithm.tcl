#algorithm congestion control
set Routepath RP
set Threshold p

set val(np) 8   ;#number of priorities
set val(rp) 4   ;#number of access categories


set RP(0) 'AppearanceTime'
set RP(1) 'DetectionDelay'
set RP(2) 'Deployment'
set RP(3) 'Clustering'

puts "Route path Analysis"
for {set j 0} {$j < $val(rp)} {incr j} {

puts "Routepath($j)==>$RP($j)"

}


set F(0) 100
set F(1) 200
set F(2) 300
set F(3) 500
set F(4) 750
set F(5) 850
set F(6) 1000
set F(7) 1250


puts "Detection Threshold"
for {set j 0} {$j < $val(np)} {incr j} {

puts "Threshold($j) =>$F($j) KB"

}

set CW_Min 10
set CW_Max 100

#set AIFSD 0
set AIFSD SIFS+(AIFS*slottime)



Agent/Null set sport_		0
Agent/Null set dport_		0

Agent/CBR set sport_		0
Agent/CBR set dport_		0

Agent/TCPSink set sport_	0
Agent/TCPSink set dport_	0

Agent/TCP set sport_		0
Agent/TCP set dport_		0



Class congestioncontrol

Class Test/SCAP -superclass congestioncontrol

Test/SCAP instproc usage {} {
	puts stderr {usage: ns test-suite-source-routing.tcl test [QUIET] Test suites for source routing.
}
	exit 1
}

Test/SCAP instproc init {} {

}

Test/SCAP instproc setup_topo {} {


}

Test/SCAP instproc run {} {
   }


proc runtest {arg} {
	set test "SCAP"
	set t [new Test/$test]
	$t run
}

Class Test/RCCP -superclass congestioncontrol

Test/RCCP instproc usage {} {
	puts stderr {usage: ns test-suite-source-routing.tcl test [QUIET] Test suites for source routing.
}
	exit 1
}

Test/RCCP instproc init {} {

}

Test/RCCP instproc setup_topo {} {


}

Test/RCCP instproc run {} {
   }


proc runtest {arg} {
	set test "RCCP"
	set t [new Test/$test]
	$t run
}

runtest $argv

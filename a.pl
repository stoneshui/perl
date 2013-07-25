#local $\="\n";
#@nums = ();
#while(<DATA>){
#	chomp;
#	s/^\s+//;
#   if(/Date\s+(\d+)/i){
#
#   		print;
#   		push @nums, $1;
#   }
#
#}
#print join ",", @nums;

#use Net::Ping::Network;
#my $net = Net::Ping::Network->new( "172.28.15.173", 55227 );
#$net->doping();
#my $results = $net->results();
#while(($key, $value) = each %$results){
#	print "$key : $value\n";
#} http://mcmrdevapp81

use Net::Ping;

#local $\ = "\n";
#$p = Net::Ping->new('tcp');
#$p->port_number(80);
#$st = $p->ping("mcmrdevapp81");
#print $st;
#$p->port_number(81);
#$st = $p->ping("mcmrdevapp81");
#print $st;
#
#@ports = 1024 .. 65535;
#for (@ports) {
#	$p->port_number($_);
#	$st = $p->ping("mcmrdevapp81");
#	print "$_ : $st";
#}
#print "done";

#scan("localhost"); #http://book.knowsky.com  book.knowsky.com
#$\ = "\n";
#
#$start = time;
#@prime = ();
#print "calculate...";
#for(2..1000*10000){
#	push @prime, $_ if isPrime($_);
#	 
#}
#print "wast: ", time - $start;
 
 
 
 
$SIG{INT} = sub{
	print "interupt";
};
$SIG{TERM} = sub{
	print "TERM         ";
};
print "go";
while(1){
	print "nnn\n";
} 
 
 
sub isPrime
{
	my $nr = shift;
    for ($d = 2; ($d * $d) < ($nr + 1); ++$d){
        if (!($nr % $d)){
            return 0;
        }
     }
    return 1;
}


sub scan {
	my $host = shift;
	local $\ = "\n";
	local $| = 1;
	$p     = Net::Ping->new('tcp');
	@ports = 1024 .. 65535;
	for (@ports) {
		$p->port_number($_);
		$st = $p->ping($host);
		print  STDOUT "$host, $_ : $st";
	}
	 
}

__DATA__
Data Points	API ID
Standard Deviation	41
Sharpe Ratio	36
Sortino Ratio	39
Information Ratio	22
Calmar Ratio	
Treynor Ratio	44
Tracking Error	43
Excess Return	20
R-squared	34
Beta	11
Alpha	2
Down Capture Ratio	16
Up Capture Ratio	47
Max Drawdown	61
Max Drawdown # Periods	62
Max Drawdown Peak Date	63
Max Drawdown Valley Date	64
Max Gain	1014
Max Gain # Periods	1015
Max Gain Start Date	1016
Max Gain End Date	1017
Longest Down Streak Return	72
Longest Down Streak # Periods	71
Longest Down Streak Start Date	73
 Longest Down Streak End Date	74
Longest Up Streak Return	68
Longest Up Streak # Periods	67
Longest Up Streak Start Date	69
Longest Up Streak End Date	70

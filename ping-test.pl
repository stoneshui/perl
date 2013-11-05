use Net::Ping;
my  $p = Net::Ping->new("tcp", 2);
$p->port_number(80);
my $host = "210.51.4.173";
# $host = 'localhost';
if($p->ping($host)){
	print "connection $host avaiable\n";
}
else{
	print "connection $host unavaiable\n";
}
print "done\n";
<>;  


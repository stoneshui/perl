use Net::Ping;
$ping = Net::Ping->new('tcp');#icmp, syn, udp 116.7.15.94 8080
$ping->port_number(80);
$success = $ping->ping('219.129.239.147');
if($success){
	print "reachable\n";
}
else{
	print "unreachable\n";
}
$ping->close();
<>; 
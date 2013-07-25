use IO::Socket;
 

#http://localhost:9080/webtest/ms/customers/2


#/deleteCustomer?id=123
#/getCustomers?id=123
#/addCustomers?id=123
#
#
#/customers/123 get
#/customers/123 delete
#/customers/123 put

#$regex = "http(s)://([a-z0-9-_]+)(:\d+)?(/)?";
#$url = "http://localhost:9080/webtest/ms/customers/2";
#$param = "param=%7B%22id%22%3A%22STUSA04G2B%22%2C%22selType%22%3A0%2C%22vehicleType%22%3A%22%22%2C%22startDate%22%3A%222007-11-05%22%2C%22endDate%22%3A%222013-04-10%22%7D";
#request('','', $param);

sub request{
	#http://localhost:8089/data-mr/DocLibrary/GetSelectDocList
	my($method, $url, $content) = @_;
	$method = "POST";
	my $host = "localhost";
	my $path = "/data-mr/DocLibrary/GetSelectDocList";
	my $port = 8089;
	$socket = IO::Socket::INET->new(
                           PeerPort  => $port,
                           PeerAddr  => $host,
                           Proto     => 'tcp',    
                           Type      =>SOCK_STREAM) or die "socket create failed:$@";
	$CRLF = "\n";
	print $socket "$method $path HTTP/1.1$CRLF";
	print $socket "Host: $host$CRLF";
	print $socket "Connection: Close$CRLF";  
	print $socket $CRLF;
	print $socket $content;
	while(<$socket>){
		print ;
	}
	close $socket;  
}
request2();

sub request2{
	my $socket = IO::Socket::INET->new(
                           PeerPort  => 8089,
                           PeerAddr  => 'localhost',
                           Proto     => 'tcp',    
                           Type      =>SOCK_STREAM) or die "socket create failed:$@";
      
     @data = <DATA>;
     $d = join "", @data;
     print $socket $d;    
     while(<$socket>){
		print ;
	 }
	 close $socket;               
}

__DATA__
POST http://localhost:8089/data-mr/DocLibrary/GetSelectDocList HTTP/1.1
Host: localhost:8089
Connection: Close
Content-Length: 104
Cache-Control: no-cache
Pragma: no-cache
Origin: http://localhost:8089
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.52 Safari/537.17
Content-Type: application/x-www-form-urlencoded
Accept: application/json, text/javascript, */*; q=0.01
X-Requested-With: XMLHttpRequest
GloalSetting-Header: {"theme":"dark","language":"en-US","currency":"USD","gsDate":"europe-slash","gsDecimal":"period","gsSeparator":"comma","gsDecPlaces":"3","gsNegative":"dash","msAnnualize":"true","msStartDate":"trading","msTrailTimeExtend":"false","msBenchmark":"XIUSA04G92","msRiskFreeRate":"XIUSA000OC"}
Referer: http://localhost:8089/repo/mercury/uif/2013-04-01_15-08-33_rev5227_INTERIM/tools/iframe-boot.html?name=mr-vehicle/js/vehicle&toolid=U0c9c9cc1-9303-4fd0-d276-aae151efd07b&tgId=U250711cc-bd83-48ba-f046-e85b2258cd6c&summary=false&startTime=1365157736879&productName=/mr/trunk
Accept-Language: en-US,en;q=0.8
Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3
Cookie: JSESSIONID=1492FF0365C048EF665707F425E7577A; i18next=en-US

param=%7B%22id%22%3A%22STUSA04G2B%22%2C%22selType%22%3A0%2C%22vehicleType%22%3A%22%22%2C%22startDate%22%3A%222007-11-05%22%2C%22endDate%22%3A%222013-04-10%22%7D


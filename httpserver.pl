#use IO::Socket;
#use URI::Encode qw(uri_encode uri_decode);
#
#$server = IO::Socket::INET->new(Listen    => 5,
#                                 LocalAddr => 'localhost',
#                                 LocalPort => 9000,
#                                 Proto     => 'tcp');
#print "server start\n";
#print "$!" unless defined $server;
#while(1){
#	$client = $server->accept();
#	my $pid = fork;
#	if($pid == 0){
#		eval{
#			my $requestStr = '';
#			my $i=0;
#			my $headerLine = '';
#			while(<$client>){
#				print $_;
#				$headerLine = $_;
#				last;
#			}
#			print "headerLine:".$headerLine;
#			my @arr = split /\s+/, $headerLine;
#			my $url = $arr[1];#POST /users/login/global/request HTTP/1.1
#			print "url:$url\n";
#			my $path_ret = parsePath($url);
#			
#			if(!validate($path_ret)){
#				sendError($client);
#				exit;
#			}
#			
#			fetchDiskInfo();
#			sendResponse();
#		};
#		exit;
#	}
#	
#}
#sub sendError{
#	my $client = shift;
#	print $client "HTTP/1.1 200 OK\r\n";
#	print $client "Content-Type: text/html; charset=UTF-8\r\n";
#	print $client "Connection: closed\r\n";
#	print $client "\r\n";
#	print $client "not a valid path";
#	close $client;
#}
#sub validate{
#	
#}	
#	
#sub fetchDiskInfo{
#	
#}
#sub sendResponse{
#	my $client = shift;
#	print $client "HTTP/1.1 200 OK\r\n";
#	print $client "Content-Type: text/html; charset=UTF-8\r\n";
#	print $client "Connection: closed\r\n";
#	print $client "\r\n";
#	print $client "hello world ".rand();
#	close $client;
#}
#	
#sub parsePath{
#	my $url = shift;
#	my $path = undef;
#	$url = uri_decode($url);
#	if($url =~ /\?path+=([^\?]+)/){
#		$path = $1;
#	}
#	return {'path'=>$path};
#}
#
#
# 
































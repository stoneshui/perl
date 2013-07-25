package HttpFileServer;
use IO::Socket;
use File::Spec;
use Data::Dumper;
use IO::Handle;
use File::Spec;
use Cwd;
 
start("F:\\workspace_f\\MR4\\webtest\\WebContent\\dhtmlxGrid", 9000) or die $!;
 

sub start{
	my($rootPath, $port) = @_;
	chdir $rootPath;
	my $server = IO::Socket::INET->new(Listen    => 5,
                                 LocalAddr => 'localhost',
                                 LocalPort => $port,
                                Proto     => 'tcp') or die $!;
    print "start server at $port...\n";
    while(1){
    	my $client = $server->accept();
    	my $pid = fork;
    	if($pid == 0){
    		print "new client coming...\n";
    		processRequest($client);
    		exit 0;
    	}
    	else{
    		close $client;
    	}
    }                             
}
sub readFile{
	my $file = shift;
	$file = File::Spec->catfile(getcwd, $file);
	return  (type=>'text/html', content=>"file $file not found!\n")  unless -e $file;
	 
	my $handle = IO::Handle->new;
	open $handle, "<", $file;
	my $buf;
	sysread $handle, $buf, -s $file;
	close $handle;
	my $type = getFileType($file); 
	return (type=>$type, content=>$buf);
}
sub readURL{
	my $client = shift;
	my $line = <$client>;
	chomp $line; 
	my @stat = $line =~ /(GET|POST)\s+(\/[^\s]*)\s+(HTTP\/1\.[01])/ig;
 	return @stat;   
}
sub getFileType{
	my $file = shift;
	return "image/$1" if $file =~ /\.(jpg|png|gif|bmp|jpeg)\Z/i; 
	return undef;
}
sub parseHeaders{
	my $client = shift;
	my $hRegex = qr/([^:]+):\s*(.*)/;
	my @headers = ();
	while(1){
		my $line = <$client>;
		$line =~ s/(\r)?\n\Z//g;
		print "$line len:", length($line),"\n";
		last if length($line) == 0;
		my %header = $line =~ /$hRegex/;
		push @headers, %header;
	}
	print "\nparse header done.\n";
	return @headers;
}
sub parseContent{
	print "\nparse content begin\n";
	my($client, $len) = @_;
	return undef unless $len;
	my $buf;
	sysread $client, $buf, 0;
	print "\nparse content done\n";
	return $buf;
}

sub processRequest{
	print "new request....\n";
	my $client = shift;
    my @statusLine = readURL($client);
    my %headers = parseHeaders($client); 
    parseContent($client, $headers{'Content-Length'}); 
    print "read file";
    my %fileEntry = readFile($statusLine[1]);
    sendHeaders($client, 'Content-Type' => $fileEntry{type});
    sendBody($client, $fileEntry{content});
    close $client;
}
sub sendStatusLine{
	my $status = (shift @_) || 200;
	my $client = shift;
	print $client "HTTP/1.1 200 OK\r\n";
}
sub sendHeaders{
	my $client = shift;
	my %headers = @_;
	my $contentType = $headers{'Content-Type'} || 'text/html; charset=UTF-8';
	print $client "HTTP/1.1 200 OK\r\n";
	print $client "Content-Type: $contentType\r\n";
	print $client "Connection: closed\r\n";
	print $client "\r\n";
}
sub sendBody{
	my ($client, $content) = @_;
	print $client $content;
}
__DATA__
abc

efg
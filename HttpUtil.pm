use LWP::Simple;
use LWP::UserAgent;
use HTTP::Request;
use HTTP::Response;
# $argRef: hash ref, contains http header key-value, http content, url
# %optRef: UserAgent option: timeout, etc..
# 
sub request{
	my($argRef, %optRef) = @_;
	my $method = (defined $argRef->{GET}) ? "GET" : "POST";
	my $url = $argRef->{GET} || $argRef->{POST};
	 
	my %params = %{$argRef};
	my $ua = new LWP::UserAgent(%optRef);
	my $req = new HTTP::Request($method => $url);
	if($method eq 'POST'){
		$req->content_type('application/x-www-form-urlencoded');#必须有这句  否则post的内容被当成普通的内容而不会解析里面的参数
		$req->content($params{content});
	}
	while(($k, $v) = each %params){
		next if $k eq "content";
		next if $k eq "GET";
		next if $k eq "POST";
		$req->header($k, $v);
	}
	my $res = $ua->request($req);
	return $res;
}


1; 
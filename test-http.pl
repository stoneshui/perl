#$\="\n";
#use LWP::UserAgent;
#use MIME::Base64;
#use Encode;
#$c = qq/param=%7B%22dp%22%3A%22OS01W%2C3051%2C3007%2C3009%2C3010%2C3011%2C3016%22%2C%22criteria%22%3A%7B%22peerGroupCriteria%22%3A%7B%7D%2C%22searchCriteria%22%3A%7B%7D%2C%22excludeListId%22%3A%5B%5D%2C%22includeListId%22%3A%5B%5D%7D%2C%22subuniv%22%3A41523%2C%22univ%22%3A%22FO%22%2C%22pageSize%22%3A40%2C%22start%22%3A0%2C%22end%22%3A39%7D/;
# my $ua = LWP::UserAgent->new;
# my $req = HTTP::Request->new('POST' => 'http://localhost:8089/data-mr/DataAPIDemo/GetControllerList');
#
# $req->header('Cookie' => "JSESSIONID=71CDDBE58DA26BAFD36CA84DC8B2C68E; i18next=en"); #如果想发送cookie，则需这句
#$req->content($c);
# my $res = $ua->request($req);
# 
# print $res->as_string();#获取的是原始内容，包括响应头，响应正文
# 
# 
# sub encodeURIComponent {
#    my $str = encode('utf-8', shift);
#    $str =~ s/([^0-9A-Za-z!'()*\-._~])/sprintf("%%%02X", ord($1))/eg;
#    return $str;
#}

#param:{"id":"STUSA04G2B","selType":0,"vehicleType":"","startDate":"2011-08-01","endDate":"2013-04-02"}
#http://localhost:8089/data-mr/DocLibrary/GetSelectDocList

#%7B%22id%22%3A%22STUSA04G2B%22%2C%22selType%22%3A0%2C%22vehicleType%22%3A%22%22%2C%22startDate%22%3A%222011-08-01%22%2C%22endDate%22%3A%222013-04-02%22%7D
use URI::Escape;
use LWP::UserAgent;
use HTTP::Request;
$param = "param=%7B%22id%22%3A%22STUSA04G2B%22%2C%22selType%22%3A0%2C%22vehicleType%22%3A%22%22%2C%22startDate%22%3A%222007-11-05%22%2C%22endDate%22%3A%222013-04-10%22%7D";
local $timeout = 150;
print uri_unescape($param), "\n";
$param = "param=%7B%22id%22%3A%22STUSA04G2B%22%2C%22selType%22%3A0%2C%22vehicleType%22%3A%22%22%2C%22startDate%22%3A%22%22%2C%22endDate%22%3A%22%22%7D";
fetch();
sub fetch{
	my $fundId = shift;
	my $url = "http://localhost:8089/data-mr/DocLibrary/GetSelectDocList";
	$url="http://localhost:9080/webtest/test";
	my $ua = LWP::UserAgent->new(timeout=>$timeout);
	my $req = HTTP::Request->new('POST' => $url);
	#$req->header('Content-Type','application/json');
	$req->content($param);
	my $res = $ua->request($req);
	 
	print $res->status_line," $url\n";
 	print $res->content;
}

#
#my $str = pack 'a1', '123a';
#print $str;







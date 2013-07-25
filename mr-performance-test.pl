use HttpUtil;
use Try::Tiny;
use Data::Dump qw(dump dd);
use URI::Escape;
local $\="\n";

my $param = "param=%7B%22id%22%3A%22STUSA04G2B%22%2C%22selType%22%3A0%2C%22vehicleType%22%3A%22%22%2C%22startDate%22%3A%22%22%2C%22endDate%22%3A%22%22%7D";
my $url = 'http://localhost:8089/data-mr/RiskTools/GetRiskData';
open F, 'real-strategyIds.txt';
@ids = <F>;
@ids = map{chomp; $_ = 'StrategyId_'.$_;} @ids;
close F;

$param = "param=%7B%22secIds%22%3A%22StrategyId_STUSA04G2B%22%2C%22timePeriod%22%3A%223yr%22%2C%22windowSize%22%3A%221y%22%2C%22windowStep%22%3A%221m%22%7D";
for $id(@ids){
	my $pcontent = q/{"secIds":"/.$id.q/","timePeriod":"3yr","windowSize":"1y","windowStep":"1m"}/;
	my $param = 'param='.uri_escape($pcontent);
	my $res =  request({POST=>$url, content=>$param}, timeout=>111);
    print pack("A".(length($pcontent)+10), $pcontent), $res->content;
} 
 
sub testMR{
	
} 
sub testDataApi{
	
}

sub testGetMultiRollingReturn{
	
}
 

 

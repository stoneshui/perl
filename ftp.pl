##use Net::FTP;
##$ftp = Net::FTP->new( "localhost", Debug => 0 )
##  or die "Cannot connect to some.host.name: $@";
##$ftp->login( "anonymous", '-anonymous@' )
##  or die "Cannot login ", $ftp->message;
##$ftp->ls();
##$ftp->get( "a.c", 'a.c' )
##  or die "get failed ", $ftp->message;
##$ftp->quit;
#
#
#use LWP::Simple;
##print get('http://mymrdevapp81/DataApiDemo/GetFirmNarrative?strategyId=STUSA04G2B');#http://localhost:8089/data-mr/Commentary/GetCommentary?fundId=STUSA04G2B&type=parent
##use URI::Escape;
##use LWP::Simple;
##$param = 'param='.uri_escape(q/{"secIds":"StrategyId_STUSA04G2B","timePeriod":"3yr","windowSize":"1y","windowStep":"1m"}/);
##print $param, "\n";
#use HttpUtil;
#print request({GET=>'http://mymrdevapp81/DataApiDemo/GetFirmNarrative?strategyId=STUSA04G2B', content=>$param})->as_string();#http://localhost:8089/data-mr/RiskTools/GetRiskData

my $parser = Text::CSV::Simple->new;
my @data   = $parser->read_file('cars.csv');
print @$_ foreach @data;

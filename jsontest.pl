#use JSON -support_by_pp;   #��Ҫ��-support_by_pp�� ��Ȼ��֧��allow_xx����
#use LWP::Simple;
#$url = 'http://localhost:8089/data-mr/PerformanceReport/GetMultipleRollingData?ids=StrategyId_STUSA04G2B&relative=&calcid=41&range=5yr&window=12&shift=1';
#$url = 'http://localhost:8089/data-mr/Commentary/GetCommentary?fundId=STUSA04G2B&type=parent';
#$c = get($url);
#print $c,"\n";
#$p = from_json($c);
#print 'true' if undef $p->{Commentary}->{content} ;
##$json = JSON->new; allow_barekey
##$json_text = '{"x":1, "y":["a", "b"]}';
##$perl_scalar = from_json( $json_text, {});   #��$json->decode($json_text); ��Ч
##print $perl_scalar->{y}->[0];
##$json_text   = to_json( $perl_scalar);     #��$json->encode($json_text); ��Ч
##print "\n", $json_text;
#use Carp;
#eval{
#	$a = 1/10;
#	cluck   $a;
#};
# 
#$v=-1231111;
#if($v=~/^(-)?\d+$/ && $v < -1000){
#		print 'true';
#	}
#	else{
#		print 'false';
#	}
 
 
use JSON -support_by_pp; 
open F, "tmp.json";
$txt = join "",<F>;
close F;
#print $txt;

$obj = from_json($txt);
#print $obj->[0]->{data}->[0]->{date};
$len = scalar(@$obj);
for(0..11){
	my $d = $obj->[$_];
	
}
















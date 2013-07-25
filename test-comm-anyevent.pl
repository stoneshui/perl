use AnyEvent;  
use AnyEvent::HTTP;  
use Carp;
use JSON;
use String::Trim;
use LWP::Simple;
#my $start = time;
#local $cv = AnyEvent->condvar;   
#local @comms = ();
#local $current = 1;
#@fundIds = fetchFundIds();
#for(@fundIds){
#	fetch($_);
#}
#$cv->recv(); 
#my $end = time;
#print "wast time: ", $end-$start, " seconds";
#
#
#print "done\n";
#@comms = sort @comms;
#writeFundIds(@comms);

$s =  get('http://localhost:8089/data-mr/PerformanceReport/GetMultipleRollingData?ids=StrategyId_STUSA05312&relative=&range=5yr&window=12&shift=1s');
#http://localhost:8089/data-mr/PerformanceReport/GetMultipleRollingData?ids=StrategyId_STUSA05312&relative=&range=5yr&window=12&shift=1
$p = from_json($s);
print "len:",scalar @{$p->{table}->{rows}};
sub writeFundIds{
	open F, '>comms.txt';
	foreach(@_){
		print F $_, "\n";
	}
	close F;
}
sub fetchFundIds{
	open F, 'a.txt';
	my @urls = ();
	while(<F>){
		chomp;
		push @urls, $_;
	};
	return @urls;
}

sub fetch{
	my $fundId = shift;
	my $url = "http://localhost:8089/data-mr/Commentary/GetCommentary?fundId=$fundId&type=parent";
	$cv->begin();
	http_request "GET" => $url, timeout  => 15, sub{my($data, $headers) = @_; parseComm($data, $headers,$fundId);};
#http://localhost:8089/data-mr/Commentary/GetCommentary?fundId=STUSA04YRZ
}

sub parseComm{
	my($data, $headers, $fundId) = @_;
	my $c = $data;
	my $valid = 0;
	my $str = 'not valid';
	eval{
		my $comm = from_json($c);
		 
		my $v1 = isValid($comm->{Commentary}->{date});
		my $v2 = isValid($comm->{Commentary}->{content});
		my $v3 = isValid($comm->{Commentary}->{title});
		my $v4 = isValid($comm->{Commentary}->{author}->{name});
		my $v5 = isValid($comm->{Commentary}->{author}->{jobTitle});
		my $v6 = isValid($comm->{Commentary}->{author}->{shortBio});
		my $v7 = isValid($comm->{Commentary}->{author}->{photoUrl});
		my $v8 = isValid($comm->{Commentary}->{pillarRating});
		my $v9 = isValid($comm->{Commentary}->{headline});# && $v2 && $v3 && $v4 && $v5 && $v6 && $v7 && $v8 && $v9
		$valid = $v2 || $v9 || $v3;
		my %fields = (title=>0, date=>0, content=>0,  name=>0, jobTitle=>0, shortBio=>0, photoUrl=>0, pillarRating=>0, headline=>0);
		
		my @strs = ();
		push @strs, "title:".isValid($comm->{Commentary}->{title});
		push @strs, "headline:".isValid($comm->{Commentary}->{headline});
		push @strs, "content:".isValid($comm->{Commentary}->{content});
		push @strs, "pillarRating:".isValid($comm->{Commentary}->{pillarRating});
		push @strs, "date:".isValid($comm->{Commentary}->{date});
		
		push @strs, "author-name:".isValid($comm->{Commentary}->{author}->{name});
		push @strs, "jobTitle:".isValid($comm->{Commentary}->{author}->{jobTitle});
		push @strs, "shortBio:".isValid($comm->{Commentary}->{author}->{shortBio});
		push @strs, "photoUrl:".isValid($comm->{Commentary}->{author}->{photoUrl});
		
		
		$str = join ",", @strs;
	};
	carp $@ if $@;
	$cv->end();
	$str = $str."*****$fundId";
	push @comms, $str;
	print "current:$current\n";
	$current++;
}

sub isValid{
	
	my $v = shift;
	my $isNull = !(defined $v);
	return 0 if $isNull;
	$v=$v.'';
	$v = trim($v);
	if(length($v) == 0){
		return 0;
	}
	if($v=~/^(-)?\d+$/ && $v < -1000){
		return 0;
	}
	return 1;
}


use JSON;
use Carp;
use String::Trim;
use LWP::Simple;
use LWP::UserAgent;
use HTTP::Response;
use HTTP::Request;
use Spreadsheet::ParseExcel;
$start = time;
local $timeout = 35;
local @comms = ();
my @urls = fetchURLS();#('STUSA04Q22');#
$total = scalar(@urls);
$i = 0;
$j=0;
for(@urls){
	fetch($_);
	$j++;
	last if $j==100;
}
@comms = sort @comms;

$end = time;
print "\nwast:", $end-$start;

writeFundIds(@comms);
sub fetch{
	my $fundId = shift;
	my $url = "http://localhost:8089/data-mr/Commentary/GetCommentary?strategyId=$fundId&type=parent";#mcmrdevapp81
	$url = "http://admrqa81.morningstar.com/Commentary/GetCommentary?strategyId=$fundId&type=parent";#mcmrdevapp81
	
	my $ua = LWP::UserAgent->new(timeout=>$timeout);
	my $req = HTTP::Request->new('GET' => $url);
	my $res = $ua->request($req);
	$i++;
	print "$total:$i $fundId ",$res->status_line," $url\n";
	print $res->content(), "\n";
#	my $str = parseCommentary($res->content())."*****$fundId";
#	print $str,"\n";
#	push @comms, $str;
#	print "\n", "-" x 100, "\n"; 
}
sub parseCommentary{
	my $c = shift;
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
	return $str;
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

sub fetchURLS{
	open F, 'real-strategyIds.txt';
	my @urls = ();
	while(<F>){
		chomp;
		push @urls, (split /\s+/,$_)[0];
	};
	return @urls;
}

sub writeFundIds{
	open F, '>fundIds.txt';
	foreach(@_){
		print F $_, "\n";
		print $_, "\n";
	}
	close F;
}

__DATA__
STUSA04D3C      AllianceBernstein Emerging Markets Gr
STUSA04EX0       AllianceBernstein US High Yield
STUSA04G2B      AllianceBernstein US SMID Cap Growth
STUSA04EMF     Franklin Templeton Global Bond Plus
STUSA04MPV    Franklin Templeton India Equity
STUSA0530C       Franklin Templeton Intl Bond Plus
STUSA04BFR      Franklin Templeton U.S. Large Cap Gr Eq
STUSA04BFW     Franklin Templeton U.S. SMID Cap Gr Eq
STUSA04CJG      Morgan Stanley Emerging Markets Debt
STUSA05314       Morgan Stanley Focus Growth
STUSA04EXT       Morgan Stanley International Small Cap
STUSA04CJX       Morgan Stanley Small Company Growth
STUSA04CJZ       Morgan Stanley US Real Estate Securities
STUSA051AM    Turner Titan Equity
STUSA04F0Y       Wellington Global Bond
STUSA04FFR       Wellington Global Contrarian Equity
STUSA04F89       Wellington Global Growth
STUSA04F87       Wellington Global Research Equity
STUSA05312       Wellington Global Value
STUSA04F0P       Wellington US Research Equity
STUSA056YG      Franklin Templeton U.S. TIPS
STUSA056YH      Franklin U.S. Large Cap Tech
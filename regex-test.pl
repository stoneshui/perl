#open F , 'C:\Projects\mercury-conf\a.txt';
#open F2 , 'C:\Projects\mercury-conf\b.txt';
#$space = " ";
#$CRLF = "\n";
#while(read(F, $a,1) && read(F2, $b,1)){
#	print $a,$space,$b,$space,$a eq $b,$CRLF;
#} 
#while(read(F, $a,1)){
#	print $a,$CRLF;
#} 
#while(read(F2, $b,1)){
#	print $b,$CRLF;
#} 
#close F;
#close F2;
use File::Spec;
travelDir("E:\\prodject\\rearch report");

sub travelDir{
	my $dir = shift;
	opendir DIR, $dir;
	while(readdir(DIR)){
		next if /^\.{1,2}$/;
		print $_,"\n";  
		#travelDir(File::Spec->rel2abs($_)) if(-d File::Spec->rel2abs($_));
	}
	close DIR;
}
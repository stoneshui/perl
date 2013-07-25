use File::Compare;
use File::Spec;
my $root1 = 'F:/workspace_f/MR4/mercury-mr/mr/trunk/';
my $root2 = 'F:/workspace_f/MR4/mercury-mr/mr/branches/2013-05-17-rev3852-r1/';

compareDir($root1, $root2);


sub compareDir{
	my($src, $dest) = @_;
	my @files = travelDir($src);
	my @notEquals = ();
	for my $f (@files){
		my($srcFile, $destFile) = (File::Spec->catfile($src, $f), File::Spec->catfile($dest, $f));
	    print "compare: $srcFile   $destFile\n";
		if(compare($srcFile, $destFile) != 0){# not equal
			push @notEquals, $srcFile;
		}
	}
	print "\n", "-"x200, "\n\n";
	@notEquals = map {$_ = convertPath($_);} @notEquals;
	if(scalar(@notEquals) == 0){
		print "all are equal";
	}
	else{
		print "not equal files:\n";
		print join "\n", @notEquals;
	}
} 
sub convertPath{
	my $s = shift;
	$s =~ s/\\/\//g;
	return $s;
}
sub travelDir{
	my @files = ();
	my @lasts = ();
	my $dir = shift;
	@lasts = collectSubFiles($dir);
	
	 
	while(scalar(@lasts)> 0){
		my $f = pop @lasts;
		my $fullName = File::Spec->catfile($dir, $f);
		push @files, $f if -f $fullName;
		if(-d $fullName){
			my @fs = collectSubFiles($fullName);
			@fs = map {$_ = File::Spec->catfile($f, $_);} @fs;
			push @lasts, @fs;
		}#end if
	}
	return @files;
}

sub collectSubFiles{
	my $dir = shift;
	my @files = ();
	if(!$dir || -f $dir || !(-e $dir)){
		return @files;
	}
	opendir D, $dir;
	while(readdir D){
		next if($_ eq '.' || $_ eq '..');
		push @files, $_;
		print "scanning ", File::Spec->catfile($dir, $_), "\n";
	}
	closedir D;
	return @files;
}
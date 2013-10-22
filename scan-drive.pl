use FileHandle;
use File::Spec;
travelDir('c:/', \&fileSub);
<>;

sub travelDir {
	sub getFiles{
		my $f = shift;
		my $d = new FileHandle;
		opendir $d, $f;
		@fs = grep {$_ ne '.' && $_ ne '..';} readdir $d;
		@fs = map File::Spec->catfile($f, $_), @fs;
		closedir $d;
		return @fs;
	}
	sub fileSub{
		$i++;
		my $file = shift;
		print $log "$i:$file\n";
	}

	local $i=0;
	local $log = new FileHandle;
	$log->autoflush(1);
	open $log, '>scan-log.log';

	my @files = ();
	my @lasts = ();
	my ($dir, $fileSub, $dirSub) = @_;
	@lasts = getFiles($dir);
	while ( scalar(@lasts) > 0 ) {
		my $f        = pop @lasts;
		my $fullName = $f;
		push @files, $f if -f $fullName;
		if ( -f $fullName ) {
			$fileSub->($fullName) if $fileSub;
			$i++; 
		}
		if ( -d $fullName ) {
			push @lasts,getFiles($fullName);
		}    #end if
	}
	close $log;
	return @files;
}


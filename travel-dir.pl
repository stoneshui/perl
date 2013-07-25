use File::Spec;
use FileHandle;


$i = 1;
open F, '>', 'c-all-files2.txt';
select F;
travelDir('c:/');
close F;

 

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
	my @files = ();
	my @lasts = ();
	my ($dir) = @_;
	@lasts = getFiles($dir);
	while ( scalar(@lasts) > 0 ) {
		my $f        = pop @lasts;
		my $fullName = $f;
		push @files, $f if -f $fullName;
		if ( -f $fullName ) {
			print "$i:$fullName\n";
			$i++;
		}
		if ( -d $fullName ) {
			push @lasts,getFiles($fullName);
		}    #end if
	}
	return @files;
}

sub travelDirWithOpenDir {
	my $dir = shift;
	return unless -d $dir;

	$d = new FileHandle;
	opendir $d, $dir;
	while ( readdir $d ) {
		print $_, "\n";
	}
	closedir $d;
}

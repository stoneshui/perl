use File::Find;
use File::Path;
use File::Copy;
use File::Basename;
rmtree('C:\ManagerResearch\ConfigureFiles');
rmtree('C:\ManagerResearch\DataPointMapping');
mcopy( 'E:\dotnet_workspace\MR\ConfigureFiles','C:\ManagerResearch');#qr/\.(jar|class)$|\.svn/
mcopy( 'E:\dotnet_workspace\MR\DataPointMapping','C:\ManagerResearch');
print "\ndone";
sub mcopy {
	local ( $source, $dest, $excPattern, $incPattern ) = @_;
	local ( $inc, $exc ) = ( defined $incPattern, defined $excPattern );

	$dest =~ s/(.*?)\/+$/$1/;

	if ( !-e $dest ) {
		mkpath $dest;
	}
	if ( -f $source ) {
		copy $source, $dest;
	}

	local @files=();
	local $i = 0;
	local $total=0;
	collect();
    do_copy();
	print "copy done\n";
}
sub collect{
	print "scanning files\n";
	find( \&wanted, $source );

	@files = grep { /$incPattern/ } @files  if $inc;
	@files = grep { !/$excPattern/ } @files if $exc;

	$total = scalar(@files);
	print "total file:$total\n";
}

sub do_copy{
	my $base_src = basename($source);
	my $r = rindex $source, $base_src;
	$i = 0;
	foreach $file (@files) {

		$i++;
		my $dpath = $dest . '/' . ( substr $file, $r );
		print "$total:$i  copying $file to $dpath ....\n";

		my $dir  = dirname($dpath);
		my $name = basename($dpath);
		if ( !-e $dir ) {
			mkpath $dir;
		}
		chdir $dir;
		mkdir $name if -d $file;
		copy $file, $dir if -f $file;

	}
}

sub wanted {
	$i++;
	push @files, $File::Find::name;
	print "find $i files: $File::Find::name\n";

}

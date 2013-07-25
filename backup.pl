use File::Copy;
use File::Spec;
use File::Path;
use File::Basename;
use DateTime;
use File::Copy::Recursive qw(dircopy);
#dircopy('F:\\workspace_f\\MR4\\mercury-mr\\mr\\trunk','F:\\back up\\mr\\mr-front\\');

$d = createTimeStr();
print "$d\n";
print "copy...\n";
# dircopy('F:\\workspace_f\\MR4\\mercury-mr\\mr\\trunk','F:\\back up\\mr\\mr-front\\'.$d); 
dircopy('F:\\workspace_f\\MR4\\p', 'F:\\workspace_f\\MR5\\p'); 
dircopy('F:\\workspace_f\\MR4\\py', 'F:\\workspace_f\\MR5\\py'); 
dircopy('F:\\workspace_f\\MR4\\webtest', 'F:\\workspace_f\\MR5\\webtest'); 
print "done";
sub createTimeStr{
	my @dates = localtime;
	$dates[5] += 1900;
	$dates[4] += 1;
	@dates = map {my $a = $_<10? "0": ""; $_ = $a.$_;  } @dates;
 	my $str = join "-", @dates[5,4,3];
 	$str = $str." ".join "-", @dates[2,1,0];
 	return $str; 
}

sub copyFile{
	my($src, $dest) = @_;
	if(-d $src && -f $dest){
		return;
	} 
	if(-f $src && -f $dest){
		copy($src, $dest);
		return;
	}
	if(-f $src && -d $dest){
		my ($shortName) = fileparse($src);
		my $target = File::Spec->catfile($dest, $shortName);
		copy($src, $target);
		return ;
	}
	if(-d $src && -d $dest){
		my ($shortName) = fileparse($src);
		make_path(File::Spec->catfile($dest, $shortName)); 
	}
}
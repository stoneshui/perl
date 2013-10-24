use File::Spec;
use File::Basename;
use Cwd;
my $d = getcwd;
my @fs = File::Spec->splitdir($d);
pop @fs;
$d = 'E:\\framework';#File::Spec->catfile(@fs, 'mr', 'trunk');
print $d, "\n";
 

$total = 1;

$start = time;
#$d = 'F:\\workspace_f\\MR4\\webtest\\WebContent\\dhtmlxGrid\\dhtmlxGrid'; 
search($d, qr/flash-column/);
$wast = time - $start;
print "scan wast $wast seconds\n";
<>; 

sub search{
	my($dir, $content, $isFile) = @_;
	return unless -d $dir;
	my @files = travelDir($dir, $content);
	print "-"x200, "\n";
	my $i = 1;
	if($isFile){
		@files = grep {my $name = basename($_); $name =~ /$content/;} @files;
		print "fonud:", scalar(@files),"\n";
		print join "\n", @files, "\n";
		return;
	}
	for my $f(@files){
		open $F, $f;
		while(<$F>){
			print "find ".($i++).":  $& at $f, line $. \n" if /$content/; 
		}
		close $F;
	}
	 
}
sub travelDir{
	my $path = shift;  
	my @files = ();
	my $F;
	return unless -d $path;
	opendir($F, $path);
    while ($subpath = readdir($F)) {
       next if $subpath =~ /^\.{1,2}$/;
	   my $p = File::Spec->rel2abs($subpath, $path); 
	   if(-f $p){
	   	  print "scanning $total files: $p","\n";
	   	  push @files, $p;
	   	  $total++;
	   }
	   elsif(-d $p){
	   	  push @files, travelDir($p);
	   }
    }
    closedir($F);   
    return @files;   
}
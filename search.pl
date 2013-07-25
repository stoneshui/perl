#use File::Find;
#use File::Spec;
#use File::Basename;
#use Cwd;
#my $d = getcwd;
#my @fs = File::Spec->splitdir($d);
#pop @fs;
#$d = File::Spec->catfile(@fs, 'mr', 'trunk');
#print $d, "\n";
#$d="F:\\workspace_f\\MR4\\mr\\trunk";
#search($d, "highLightRowAtClick");
#
#
#sub searchAndReplace{
#	local ($dir, $content,$replace) = @_; #, $replace
#	my @files = search($dir, $content);
#	for(@files){
#		system qq(perl -pi.bak -e "s/$content/$replace/g" $_);
#	}
#}
#
#sub search{
#	local ($dir, $content) = @_;
# 
#	local $findNum = 0;
#	local $total = 0;
#	local @founds = ();
#	local @files = ();
#	find(\&callback, $dir);#"F:/workspace_f/MR4/uif/trunk/components/panel-content"
#	print '-'x100, "\n";
#	print "total: find $findNum\n";
##	@founds = grep /\b\.c\b/, @founds;
#	print join "", @founds;
#	return @files;
#}
#sub callback{
#	print "scanning ".(++$total)." files: $File::Find::name\n" if -f;
#	next if (/\.svn/ || /\bbin\b/ || /\btags\b/ ) ; 
#	my $F;
#	#//if(11){
#		open $F, $File::Find::name;
#		while(<$F>){
#			if(/$content/){
#				push @founds, "find $content at $File::Find::name, line $. \n"; 
#				push @files, $File::Find::name;
#				$findNum++;
#			}
#		}
#		close $F;
#	#//}
#}
#
#sub travelDir {    
#  # my $path = $_[0]; #或者使用 my($path) = @_; @_类似javascript中的arguments
#   my $subpath;
#   my $handle; 
#   my ($path, $content) = @_;
#   if (-d $path) {#当前路径是否为一个目录
#	   if (opendir($handle, $path)) {
#		   while ($subpath = readdir($handle)) {
#			   if (!($subpath =~ m/^\.$/) and !($subpath =~ m/^(\.\.)$/)) {
#				   my $p = $path."/$subpath"; 
#
#				   if (-d $p) {
#				   	   next if $p=~/\.svn|\btags\b|\bbin\b/;
#					   travelDir($p);
#				   } else {
#					   ++$filecount;
#					   print "$filecount:", $p."\n";
#					   open F, $p;
#					   while(<F>){
#							if(/$content/){
#								push @founds, "find $content at $p, line $. \n"; 
#								$findNum++;
#							}
#					   }
#					   close F;
#				   }
#			   }                
#		   }
#		   closedir($handle);            
#	   }
#   } 
#
#   return $filecount;
#} 
#

use File::Find::Rule;
@files = File::Find::Rule->file()
                              ->name( 'my-cfg' )
                              ->in( 'D:\\IDE2' );
print join "\n", @files;                              




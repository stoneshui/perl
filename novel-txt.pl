use File::Spec;
use File::Copy;

chdir 'F:\\Downloads';
@txts = glob '*.txt';
mkdir unless -e 'txt';
for(@txts){
	copy($_, File::Spec->catfile('txt', $_));
}
print "done";
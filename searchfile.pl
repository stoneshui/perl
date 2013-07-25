#C:\Users\rhuang\Desktop\linux-3.8.4.tar\linux-3.8.4\linux-3.8.4\kernel\sched
use File::Find;
local $r="sched.c";
local @fs = ();
local $i=0;
find(\&callback, "C:\\Users\\rhuang\\Desktop\\linux-3.8.4.tar\\linux-3.8.4\\linux-3.8.4\\kernel");
print '-'x100, "\n";
print join "\n", @fs;
sub callback{
	$i++;
	print "scanning $i files: $File::Find::name\n";
	push @fs, $File::Find::name if /$r/;
}
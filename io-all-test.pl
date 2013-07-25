use IO::All;
use File::Compare;
use File::Spec;
use DirCompare;
$root1 = 'C:/Projects/mercury-mr/mr/trunk';
$root2 = 'C:/Projects/mercury-mr/mr/branches/2013-05-17-rev3852-r1';



#open F, ">a2.txt"; close F;
#$f = 'components/navigation-grid/js/navigation-grid.js';
#io($root1.$f) > io($root2.$f);
@fs = ('tools/risk/risk-scatterplot/js/risk-scatterplot-tool.js', 'components/navigation-grid/js/navigation-grid.js');
for(@fs){
#	io($root1.$_) > io($root2.$_);
}
 

#$src = "F:\\workspace_f\\MR4\mercury-mr\\mr\\branches\\2013-05-17-rev3852-r1";
#$dest = "F:\\workspace_f\\MR4\\mercury-mr\\mr\\trunk";
print convertPath(join "",<DATA>), "\n";
 

#print "update all finished\n";
#sleep 15;
DirCompare::compareDir($root1.'/tools/parent/narratives', $root2.'/tools/parent/narratives');


sub convertPath{
	my $s = shift;
	$s =~ s/\\/\//g;
	print $s;
}

__DATA__
F:\workspace_f\MR4\mercury-mr\mr\branches\2013-05-17-rev3852-r1\tools\performance\js
F:\workspace_f\MR4\mercury-mr\mr\trunk\tools\performance\js
F:\workspace_f\MR4\mercury-mr\mr\branches\2013-05-17-rev3852-r1
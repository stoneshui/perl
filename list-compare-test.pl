#use List::Compare;
#use Data::Dumper;
#@Llist = qw(1 2 3 4 4 5 6 7 7 8 8 8);
#@Rlist = qw(3 4 5);
#
#$lc = List::Compare->new( \@Llist, \@Rlist );
###$lc = List::Compare->new( \@Llist );
###@intersection = $lc->get_intersection;
###@union        = $lc->get_union;
###$\= "\n";
###print join ",", @intersection;
###print join ",", @union;
##print join ",", $lc->get_unique;
#use Data::Dumper;
#use Algorithm::Diff qw/diff/;
#@arr = diff([1,2,3], [3,2,0]);
#$arr = {a=>1, b=>2};
 
 
 
require Data::Dumper;
print Dumper(3);
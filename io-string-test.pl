# use LWP::Simple;
# $str = get 'http://search.cpan.org/~gaas/IO-String-1.08/String.pm';
# @lines = split /\n/, $str;
# print $_ for(@lines);

# use IO::All;
# $io = io(__FILE__);
# print $io->all;
 # io(__FILE__) > $content;
 # print $content;
 
 
 use overload '+' => sub {
	my ($a, $b) = @_;
	print $a - $b;
 };
 
 print 'result:',5+3;
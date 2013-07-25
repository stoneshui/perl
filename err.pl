#system 'svn -h revert';
#system 'svn -h update';
#print join "\n", @ARGV;

#$r = qr/\b(?!cat\b)\w+/;
#$r2 = qr/\w+\b(?<!cat\b)/;
#$_ = 'categorically match any word except cat';
#while(/$r2/g){
#	print $&, "\n";
#}

#${system 'notepad'} = 3;
#$a = 123;
#@a = (1,2,3);
#%a = ('a'=>1, 'b'=>2, 'c'=>3); 
#$\="\n";
#
#print *a{SCALAR};
#print *a{ARRAY};
#print *a{HASH};
#
#print ${*a{SCALAR}};
#print @{*a{ARRAY}};
#print %{*a{HASH}};
#
#print '-'x100;
#while(($k, $v) = each %main::){
#	print $k, ',', $v;
#}
 


#use Number::Format;
#my $de = new Number::Format(-thousands_sep   => ',',
#						  -decimal_point   => '.',
#						  -int_curr_symbol => 'DEM');
#print $de->format_number(8537354001986);

#use Date::Format;
#print time2str("%C", time);

#$s = '321abcD';
#$r = qr/[a-z]+/;
#if($s =~ $r){
#	print $&;
#}
#else{
#	print "not match";
#}


#   <([a-z]+)>.*?</$1>

#$r = qr/[a-z]+='.*'/;
#$s = "id='123' class='red''";
#while($s =~ /$r/gi){
#	print $&, "\n";
#}

#  /<([a-z]+)(\s[a-z]+=(["'])[^\3]*\3)?\s*>(.*?)<\/\1>/i;
# <div id="123" class='red'>abc</div>
# qr/<([a-z]+)(\s[a-z]+='[^']*')?\s*>(.*?)<\/\1>/i;

#$tagRegex = qr/<([a-z]+)(\s[a-z]+=('[^']*'|"[^"]*"))?\s*>(.*?)<\/\1>/i;
#
#$s = "<div id=\"123\" class=\"green\">ab2c</div>abc</div> <a class='red'></a>";
#while($s =~ /$tagRegex/g){
##	print "$&, $1, $2", "    <<<<<<<<   ", $', "\n";
##	last;
#	print $&, "   $2\n";
#}

#$s = a();
#print $s->();

#$it = upto(1, 10);
#while(defined($s = $it->())){
#	print $s, "\n";
#}
#sub it(&){
#	return $_[0];
#}
#sub a{
#	return it{
#		3;
#	}
#}
# 
#sub upto{
#	my ($from, $to) = @_;
#	my $curr = $from - 1;
#	return sub{
#		$curr++;
#		return undef if $curr > $to;
#		return $curr;
#	};
#}
#
#
#

#print 'a'..'z', '.', 'A'..'Z';

open F, 'rksdp.txt';
while(<F>){
	chomp;
	s/^\s+(.*)/$1/;
	print "$_\n" if /Date\s*/i;
}
close F;











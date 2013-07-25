open F, 'cars.txt';
<F>;
$\ = "\n";
my @arr = ();
while(<F>){
	my @line = split /\s+/;
	my $len = scalar(@line);
	my @data = @line[($len - 7)..($len-1)];
	my @name = @line[0..($len - 8)] ;
	my $name = join " ", @name;
	my $data = join ",", @data;
#	print $name;
#	print $data; exit;
	
	my $line = qq/{name:"$name", data:[$data]}/;
	push @arr, $line;
   
}
print $arr[0];
$str = join ",", @arr;
$str = "[$str]";
print $str;
close F;

use File::Slurp;
write_file('cars.js', $str);

 my @txt = ('A'..'E');
my %map = ('A'=>2, 'B'=>4, 'C'=>0, 'D'=>1, 'E'=>3);
my $txt = "ACDEB";
my $encTxt = enc($txt);
print $encTxt;
print "\n";

dec($encTxt, $txt);

 



sub dec{
	my $encTxt = shift;
	my $txt = shift;
	my $pNum = 0;
	my $len = length($encTxt);
	while(1){
		my $decTxt = "";
		my @indexEs = 0..4;
		for(my $i=0; $i<$len; $i++){
			my $arrLen = scalar(@indexEs) - 1;
			my $index = getRandomIn(0, $arrLen); 
			$decTxt = $decTxt.substr($encTxt, $index, 1);
			splice @indexEs, $index, 1;
		}
		++$pNum;
		print "�����ƽ��$pNum�� $decTxt  $txt\n";
		  
		last if $txt eq $decTxt;
	}
	print "�����ƽ�ɹ����������ƽ�$pNum��";
}



sub enc{
	my $txt = shift;
	my $etxt = '';
	my $len = length($txt);
	for(my $i=0; $i<$len; $i++){
		my $c = substr($txt, $i, 1);
		my $index = $map{$c};
		$etxt = $etxt.substr($txt, $index, 1);
	}
	return $etxt;
}
	
sub getRandomIn{
	my ($min, $max) = @_;
	return int(rand(($max - $min) + 1)) + $min;
}
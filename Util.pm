package Util;
use LWP::Simple;
download{
	my($url, $file) = @_;
	getstore($url, $file);
}
return 1;
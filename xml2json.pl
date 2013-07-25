#use XML::XML2JSON;
#
#my $XML = '<test><element foo="bar"/></test>';
#
#my $XML2JSON = XML::XML2JSON->new();
#
#my $JSON = $XML2JSON->convert($XML);
#
#print $JSON;
use Try::Tiny;
use Data::Dumper;
use Carp;
try{
	 
 	print 1/0;
}catch{
	print $_;
}
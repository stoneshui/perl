#void match(char expectedToken){
 require HTML::LinkExtor;
 $p = HTML::LinkExtor->new(\&cb, "http://www.perl.org/");
 sub cb {
     my($tag, %links) = @_;
     print "$tag @{[%links]}\n";
 }
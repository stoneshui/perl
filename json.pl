use JSON qw/encode_json decode_json/;
my $data = [
    {
        'name' => 'Ken',
        'age' => 19
    },
    {
        'name' => 'Ken',
        'age' => 25
    }
];
#my $json_out = encode_json($data);
#print $json_out;
#print "\n";
#my @jsonObj = decode_json($json_out);
#
#use Data::Dump;
#print dump($jsonObj[1]);
my $d = {};
$d->{'a'}=1;
$d->{'b'}=2;
print encode_json($d);


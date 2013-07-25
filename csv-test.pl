use Text::CSV;
@arr = ();
my @rows;
my $csv = Text::CSV->new( { binary => 1 } )    # should set binary attribute.
  or die "Cannot use CSV: " . Text::CSV->error_diag();

open my $fh, "<:encoding(utf8)", "cars.csv" or die "cars.csv: $!";
$i = 0;
while ( my $row = $csv->getline($fh) ) {
	if($i > 0){
		print join ",", @$row, "\n";
		my $name = $row->[0];
		my @data = @$row[1..7];
		my $data = join ",", @data;
		my $line = qq/{name:"$name", data:[$data]}/;
		print $line; 
		push @arr, $line;
	}
	$i++;
}
$csv->eof or $csv->error_diag();
close $fh;


$str = join ",", @arr;
$str = "[$str]";
use File::Slurp;
write_file('cars.js', $str);

__DATA__
 use Text::CSV;

 my @rows;
 my $csv = Text::CSV->new ( { binary => 1 } )  # should set binary attribute.
                 or die "Cannot use CSV: ".Text::CSV->error_diag ();
 
 open my $fh, "<:encoding(utf8)", "test.csv" or die "test.csv: $!";
 while ( my $row = $csv->getline( $fh ) ) {
     $row->[2] =~ m/pattern/ or next; # 3rd field should match
     push @rows, $row;
 }
 $csv->eof or $csv->error_diag();
 close $fh;

 $csv->eol ("\r\n");
 
 open $fh, ">:encoding(utf8)", "new.csv" or die "new.csv: $!";
 $csv->print ($fh, $_) for @rows;
 close $fh or die "new.csv: $!";
 
 #
 # parse and combine style
 #
 
 $status = $csv->combine(@columns);    # combine columns into a string
 $line   = $csv->string();             # get the combined string
 
 $status  = $csv->parse($line);        # parse a CSV string into fields
 @columns = $csv->fields();            # get the parsed fields
 
 $status       = $csv->status ();      # get the most recent status
 $bad_argument = $csv->error_input (); # get the most recent bad argument
 $diag         = $csv->error_diag ();  # if an error occured, explains WHY
 
 $status = $csv->print ($io, $colref); # Write an array of fields
                                       # immediately to a file $io
 $colref = $csv->getline ($io);        # Read a line from file $io,
                                       # parse it and return an array
                                       # ref of fields
 $csv->column_names (@names);          # Set column names for getline_hr ()
 $ref = $csv->getline_hr ($io);        # getline (), but returns a hashref
 $eof = $csv->eof ();                  # Indicate if last parse or
                                       # getline () hit End Of File
 
 $csv->types(\@t_array);               # Set column types
https://github.com/rock117  https://github.com/rock117/SvgCompoent.git
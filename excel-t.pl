use Spreadsheet::ParseExcel;  
#use Spreadsheet::ParseExcel::FmtUnicode;  
use Spreadsheet::ParseExcel::FmtDefault;   
my $parser   = Spreadsheet::ParseExcel->new();  
#my $fmt = Spreadsheet::ParseExcel::FmtUnicode->new(Unicode_Map => 'gb2312');  
my $workbook = $parser->Parse('F:\\Downloads\\Data Points for MR Request(slava).xlsx');  
for my $worksheet ( $workbook->worksheets() ) {  
        my ( $row_min, $row_max ) = $worksheet->row_range();  
        my ( $col_min, $col_max ) = $worksheet->col_range();  
        for my $row ( $row_min .. $row_max ) {  
                for my $col ( $col_min .. $col_max ) {  
                        my $cell = $worksheet->get_cell( $row, $col );  
                        print $cell->value(),"|";  
                        ###print "Row, Col    = ($row, $col)/n";   
                        ###print "Value       = ", $cell->value(),       "/n";   
                        ###print "Unformatted = ", $cell->unformatted(), "/n";   
                }  
                print "/n";  
        }  
}  
 
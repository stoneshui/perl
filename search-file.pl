#dhtmlxgrid_mcol//
use File::Spec;
$r = qr/dhtmlxgrid_mcol\.js/;
@files = travelDir('F:\\workspace_f\\MR4\\webtest\\WebContent\\dhtmlxGrid\\dhtmlxGrid');
@files = grep /$r/, @files;
print "find:", scalar(@files), "\n";
print join "\n", @files;
sub travelDir{
    my @files = ();
    my @lasts = ();
    my ($dir) = @_;
    @lasts = grep {$_ ne '.' && $_ ne '..';} glob File::Spec->catfile($dir, '*');
    while(scalar(@lasts)> 0){
        my $f = pop @lasts;
        my $fullName = $f;
        push @files, $f if -f $fullName;
        if(-d $fullName){
            my @fs = grep {$_ ne '.' && $_ ne '..';} glob File::Spec->catfile($fullName, '*');
            push @lasts, @fs;
        }#end if
    }
    return @files;
}
use File::Path;
use File::Find;
use File::Copy;
#
#find(\&wanted, 'F:\workspace_f\MR\dhtmlx-demo');
#sub wanted{
#	print "$File::Find::name\n";
#}

#  @arr= grep $_%2,1..3;
#print join ",",@arr;

searchFile('F:\workspace_f\MR\p','^a');

sub searchFile{
	local($src, $incRegex, $excRegex) = @_;
	 
	local @files = ();
	find(\&callback, $src);
	if(defined $incRegex){
		@files = grep /$incRegex/, @files;
	}
	if(defined $excRegex){
		@files = grep !/$excRegex/, @files;
	}
	
	
	sub callback{
		my $f = $File::Find::name;
		if(defined $incRegex && defined $excRegex){
			print $f,"\n" if /$incRegex/ && !/$excRegex/; 
		}
		elsif(defined $incRegex){
			print $f,"\n" if /$incRegex/;
		}
		elsif(defined $excRegex){
			print $f,"\n" if !/$excRegex/; 
		}
	}
} 

sub copyFile{
	my($src, $desc, $incRegex, $excRegex) = @_;
	if(- f $src){
		copy($src, $desc);
		return ;
	}
	local @files = ();
	find(\&callback, $src);
	if(defined $incRegex){
		@files = grep /$incRegex/, @files;
	}
	if(defined $excRegex){
		@files = grep !/$excRegex/, @files;
	}
	sub callback{
		push @files, $File::Find::name;
	}
	
	
}


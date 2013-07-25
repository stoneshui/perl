##print "hello world";
##use LWP::Simple;
##print get('http://www.epic-ide.org/updates/testing/');
##
##
##
##
##
##
##
##
##
##use LWP::Simple;
##chdir "c:/";
##print glob "*";
#
##print 'a'..'z','.','A'..'Z';
##
##use Spreadsheet::ParseExcel;  
##
## 
##my $file = 'E:/22.xls';  
##
##my $data = readExcel($file);
## 
## 
##
##sub readExcel{
##	my $file = shift;
##	my $xls = Spreadsheet::ParseExcel::Workbook->Parse( $file);  
##	my $workSheet = @{ $xls->{Worksheet} }[0];  
##	my ( $minRow, $maxRow ) = $sheet->row_range();  
##    my ( $minCol, $maxCol ) = $sheet->col_range();  
## 
##	my @data = ();
##    for my $row ($minRow, $maxRow){
##    	my @rowData = ();
##    	for my $col($minCol, $maxCol){
##    		my $cell = $sheet->get_cell( $row, $col );  
##    		if(!$cell){
##    			continue;
##    		}
##    		push @rowData, $cell->value;
##    	}
##    	
##    	push @data, \@rowData;
##    }
##	return \@data;
##}
#
#use LWP::Simple;
#use LWP::UserAgent;
#use HTTP::Request;
#$ua = LWP::UserAgent->new;
#$req = HTTP::Request->new('GET'=>'http://i2.itc.cn/20130304/a31_f3bff1bf_865f_c6ec_1961_5f4bb809651b_1.jpg');
#$res = $ua->request($req);
#$data = $res->content();
#$len = length($data);
#$headers = $res->headers();
#while(($k, $v)=each(%$headers)){
#	print "$k: $v\n";
#}
#
#print "file typpe:".$res->header("Content-Type")."\n";
#print "len:$len\n";
#open JPG, '>jpg.jpg';
#binmode(JPG);
#print JPG $data;
#close JPG;
#print "done";
# 
#
#
#
#
#
#
#
#

#
#use LWP::Simple;
#$SIG{INT} = \&onQuit;
#$SIG{QUIT} = \&onQuit;
#$SIG{STOP} = \&onQuit;
##$SIG{ABRT} = \&onQuit;
#for(1..10011){
#	print head('http://www.baidu.com'),"\n";
#}
#
#
#sub onQuit{
#	print "\nquit---------------";
#}
#
#
#
#parse_env("F:\\Downloads");
#sub listdir {  
# my @arr, $j = 0;  
# for($i=0;$i<=$#_;$i++) {  
#  if(-d $_[$i]) {  
#   if(opendir($handle, $_[$i])) {  
#    while($dir = readdir($handle)) {  
#     if(!($dir =~ m/^\.$/) and !($dir =~ m/^(\.\.)$/)) {  
#      print "$dir";  
#      if(-d $_[$i]."\\$dir") {  
#       $arr[$j++] = $_[$i]."\\$dir";  
#       print "\t[DIR]"  
#      }  
#      print "\n";  
#     }  
#    }  
#    closedir($handle);  
#   }  
#  }  
# }  
# if($j>0) {  
#  listdir (@arr);  
# }  
#}
#
#
#sub parse_env {    
#   my $path = $_[0]; #或者使用 my($path) = @_; @_类似javascript中的arguments
#   my $subpath;
#   my $handle; 
#
#   if (-d $path) {#当前路径是否为一个目录
#	   if (opendir($handle, $path)) {
#		   while ($subpath = readdir($handle)) {
#			   if (!($subpath =~ m/^\.$/) and !($subpath =~ m/^(\.\.)$/)) {
#				   my $p = $path."/$subpath"; 
#
#				   if (-d $p) {
#					   parse_env($p);
#				   } else {
#					   ++$filecount;
#					   print "$filecount:", $p."\n";
#				   }
#			   }                
#		   }
#		   closedir($handle);            
#	   }
#   } 
#
#   return $filecount;
#} 
#
#my $func = 'add';
##use strict;
#use warnings;
#print &$func(1,2);
#sub add{
#	my($a, $b) = @_;
#	return $a+$b;
#}
#$\="\n";
#for(1..60){
#	@ts = localtime;
#	print join ",", @ts;
#	sleep 1;
#}
#open F, '>kk.txt';
#select F;
#print pack ("A16" x 3, "test1", "test2", "test3");
#print "\n";
#print pack ("A16" x 3, "a", "b", "c"); 
#close F;

use Encode;
use HttpUtil;
#$agent = 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31';
#my $token = 'QJDABZoTVKKbmhKLTfG4duMPX2aqyD4ojr3MxSvahR4=';
#my $param = "authenticity_token=$token&name=zk1878&password=zk19831202";
#$res = request({POST=>'http://www.iteye.com/login', content=>$param, 'User-Agent' => $agent});
#print $res->as_string;
#print "\n", "x"x111, "\n";
#print $res->header("Cookie");
#print request({GET=>"http://www.iteye.com"}, timeout=>11111)->as_string;


system 'C:\Program Files (x86)\Mozilla Firefox\firefox.exe';


 







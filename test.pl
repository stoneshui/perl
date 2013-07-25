#use HttpUtil;
#use JSON -support_by_pp; 
##http://mcmrdevapp81/trunk
#$res = request({POST=>'http://mcmrdevapp81.morningstar.com/api/RiskTools/RiskData', content=>'param:{"secIds":"2045_STUSA04D3C","timePeriod":"3yr"}'});
#print $res->as_string;

#@keys = keys %ENV;
#print join "\n", map $_ = $_.': '.$ENV{$_}, sort @keys;




print <<ABC;
dfwew
kewlel
eweww
\\ABC
ABC













#use HttpUtil;
#use JSON -support_by_pp; 
#$url = 'http://mcsvdevapp83/export/api/excelexport/2/MR/RollingReturn/xls';
##$url = 'http://localhost:50288/test';
##$url = 'http://mcsvdevapp83/Export/api/excelexport/1/MR/RollingReturn/csv/RollingReturneeba5573-cc17-4420-bc46-deb74974bbbb201373-1315293';
##$param = join "", <DATA>;
#$res = request({POST=>$url, 'Content-Type'=>'application/json', content=>join "", <DATA>});
##$res = request({GET=>$url});
#print $res->as_string;
#
#open F, '>', 'rr2.xls';
#binmode F;
#print F $res->content;
#close F;
#print "\ndone";
## r: row, c: column, v: value
#__DATA__
#{
# WorkBook: [
#        {"sheetname": "sheet1",
#         "rows":[ 
#            {"r": "0","cells":[{"c": "0","v": "Date"},{"c": "1","v": "Security Name"},{"c": "2","v": "Ticker"}]},
#            {"r": "1","cells":[{"c": "0","v": "3/31/2013"},{"c": "1","v": "Amazon"},{"c": "2","v": "AMZN"}]},
#            {"r": "2","cells":[{"c": "0","v": "3/31/2013"},{"c": "1","v": "Microsoft"},{"c": "2","v": "MSFT"}]},
#            {"r": "3","cells":[{"c": "0","v": ""},{"c": "1","v": ""},{"c": "2","v": ""}]},
#            {"r": "5","cells":[{"c": "0","v": "3/31/2013"},{"c": "1","v": "Buy Average"},{"c": "2","v": "NA"}]},
#            {"r": "6","cells":[{"c": "0","v": "3/31/2013"},{"c": "1","v": "Sell Average"},{"c": "2","v": "NA"}]},
#            {"r": "7","cells":[{"c": "0","v": "3/31/2013"},{"c": "1","v": "Portfolio Average"},{"c": "2","v": "NA"}]},
#            {"r": "8","cells":[{"c": "0","v": "3/31/2013"},{"c": "1","v": "Index Average"},{"c": "2","v": "NA"}]}
#            
#            ]
#        }
#    ]
#}
#http://s4.51cto.com/wyfs01/M01/0F/BC/wKioOVHNMPewxeDzAACSWLOM9zE518.jpg

#use HttpUtil;
#$url = 'http://s4.51cto.com/wyfs01/M01/0F/BC/wKioOVHNMPewxeDzAACSWLOM9zE518.jpg';
#$res = request({GET=>$url});
#print $res->as_string;
#open F, '>', 'Knuth.jpg';
#binmode F;
#syswrite F, $res->content;
#close F;
#print "done";
#system 'Knuth.jpg';





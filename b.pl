#use LWP::Simple;
#$agent = new LWP::UserAgent(timeout=>30);
#$req = new HTTP::Request(GET=>'http://www.iteye.com/');
#$req->header("Cookie", "_javaeye_cookie_id_=1374630528592584; remember_me=no; _javaeye3_session_=BAh7CSIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsGOgplcnJvciIy55m75b2V5ZCN56ew5oiW5a%2BG56CB6ZSZ6K%2Bv77yM6K%2B36YeN5paw55m75b2VBjoKQHVzZWR7BjsGVDoRb3JpZ2luYWxfdXJpIhpodHRwOi8vd3d3Lml0ZXllLmNvbS86EF9jc3JmX3Rva2VuIjFMcmlGSVErazZKVmlFTEpGY0p1R2RzaGNVVDhIRmhKUWE0Sm9KTlBGcVBJPToPc2Vzc2lvbl9pZCIlZGFlOGE1YTBlZDY4ZDI3YjM0NmVhNDg4ZjQ0ODA4MTk%3D--56b61d8e3d94060113bacd1d72a97a1873a20069; __utma=191637234.1773169507.1374630534.1374630534.1374630534.1; __utmb=191637234.4.10.1374630534; __utmc=191637234; __utmz=191637234.1374630534.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)");
#$req->header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.72 Safari/537.36");
#$res = $agent->request($req);
#print $res->as_string;
#use  HTML::TokeParser;

#system 'svn checkout http://web-sorrow.googlecode.com/svn/web-sorrow-read-only';
use SVG;
my $svg= SVG->new(width=>200,height=>200);

    # use explicit element constructor to generate a group element
    my $y=$svg->group(
        id    => 'group_y',
        style => { stroke=>'red', fill=>'green' }
    );

    # add a circle to the group
    $y->circle(cx=>100, cy=>100, r=>8, id=>'circle_in_group_y');
  print $svg->xmlify;




__DATA__
Proxy-Connection: keep-alive
Cache-Control: max-age=0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.72 Safari/537.36
Accept-Encoding: gzip,deflate,sdch
Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4
Cookie: _javaeye_cookie_id_=1374630528592584; remember_me=no; _javaeye3_session_=BAh7CSIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoRb3JpZ2luYWxfdXJpIhpodHRwOi8vd3d3Lml0ZXllLmNvbS86EF9jc3JmX3Rva2VuIjFMcmlGSVErazZKVmlFTEpGY0p1R2RzaGNVVDhIRmhKUWE0Sm9KTlBGcVBJPToPc2Vzc2lvbl9pZCIlZGFlOGE1YTBlZDY4ZDI3YjM0NmVhNDg4ZjQ0ODA4MTk%3D--2edba122ea1987821ae0c95487391343f8f3ee22; __utma=191637234.1773169507.1374630534.1374630534.1374630534.1; __utmb=191637234.5.10.1374630534; __utmc=191637234; __utmz=191637234.1374630534.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)
If-None-Match: "14153a9bfa45bd5c8648b34a5fe6467b"



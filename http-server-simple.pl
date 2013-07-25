use Net::HTTPServer;
local $reqNum = 0;
print "server start at port 5000...\n";
my $server = new Net::HTTPServer(port=>5000, docroot=>"E:\\source code\\dhtmlxGrid");
$server->RegisterURL('/mytest',\&processRequest);




$server->Start();
$server->Process();  # Run forever
$server->Stop();




sub processRequest{
   print ++$reqNum, " request\n";
   
   my $req = shift;             # Net::HTTPServer::Request object
      my $res = $req->Response();  # Net::HTTPServer::Response object
   if($reqNum > 1){
  $res->Code(304);
   }
   else{
 $res->Print("hello");
   }
      
   return $res;
}
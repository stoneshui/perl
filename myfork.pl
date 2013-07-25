$\="\n";
print "main process start";
$pid = fork;
if($pid == 0){
	exec "notepad";
}
else{
	print "main process $pid";
	
}
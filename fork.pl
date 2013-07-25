
for(1..10){
	$pid = fork;
	if($pid == 0){
		print $$,"\n";
		sleep (3+int(rand(10)));
		exit 0;
	}
}
print "waitting --------\n";
print "process$p has exist\n" while(($p=wait)!=-1)
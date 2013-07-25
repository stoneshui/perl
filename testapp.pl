@lines = qx(netstat -ano);
@lines = grep /8080/, @lines;
print join "", @lines;
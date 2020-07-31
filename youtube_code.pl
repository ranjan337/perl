use strict;
use warnings;
$\ = "\n";

print "select the alarm time in HH MM SS format ";
print "hour:";
my $user_hour = <STDIN>;
print "minute:";
my $user_minute = <STDIN>;
print "second:";
my $user_second = <STDIN>;

print "user time entered :";
printf("%02d:%02d:%02d\n", $user_hour, $user_minute, $user_second);
if ($user_hour>=24 || $user_minute>=60 || $user_second >= 60){
	print "you have entered incorrect choice";
	exit;
}

my $user_time_seconds = $user_hour * 60 * 60 + $user_minute * 60 + $user_second;
print "user time in seconds: $user_time_seconds seconds";
my $a=0;

while ($a < 86400) {
(my $sys_sec,my $sys_min,my $sys_hour, my $mday,my $mon,my $year,my $wday,my $yday,my $isdst) = localtime();
my $sys_time_seconds = $sys_hour * 60 *60 + $sys_min*60 + $sys_sec;
if ($sys_time_seconds != $user_time_seconds){
	sleep (1);
	$a++;
}
else { 
$\ = "\n";
#read text file and run any url
open(DATA,"<youtube_urls.txt") or die "Can't open data";
my @lines = <DATA>;
my $url= $lines[rand(5)];
qx/start $url/;
close(DATA);
last;
}
}
#timer purpose

print"enter the time for timer in hh mm ss format:";
print "hour:";
my $hour = <STDIN>;
print "minute:";
my $minute = <STDIN>;
print "second:";
my $second = <STDIN>;
print "user time entered :";
printf("%02d:%02d:%02d\n", $hour, $minute, $second);
if ($hour>=24 || $minute>=60 || $second >= 60){
	print "you have entered incorrect choice";
	exit;
}
my $timer_seconds = $hour * 60 * 60 + $minute * 60 + $second;
sleep ($timer_seconds);
print "your time is up";

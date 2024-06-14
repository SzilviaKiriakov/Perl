#!/usr/bin/perl

# hello.pl
# print "Hello world!\n";

# interactive_hello.pl
#print "What is your name? ";
# $name=<STDIN>;
# chomp($name);
# print "Hello there $name. \n";

# string_types.pl
$name = "Tim";
print "Hello there $name. \n";
print "Left\tMiddle\tRight\n";
$y='Hello\nGoodbye';
print $y;

# typical operators are *,-,+,/, ** exponential operator, % modulus, 6.022E23
# $a++ ++$a $a-- --$a auto increment
$x="A";
++$x; # $x now equals B

$a=3;
$a+=2; # $a now equals 5
$a*=4; # $a = $a*4 = 20
$a-=7; # $a now equals 13

# concatenation between strings
$x="Hello";
$y="There";
$z=$x.$y; # $z is now "HelloThere"
$z=$x." ".$y; # $z is now "Hello There"

print "\n$z\n";

# manipulating the case of a string
$a= "hello";
$a=uc($a); # $a now equals "HELLO"
$a=lc($a); # $a now equals "hello"
$a=ucfirst($a); # $a now equals "Hello"
$a=lcfirst(uc($a)); # $a now equals "hELLO"

# removing characters from string
$a = "Hello There\n";
chomp($a); # $a now equals "Hello There", chomp() only removes trailing newline character if there
$b= "Hi There";
chomp($b); # $b still equals "Hi There"
chop($b); # $b now equals "Hi Ther", chop() removes last character in a string

# comparisons
1==0+1;
$a eq "Hello There";
1!=0;
$a ne "Hi There";
1<2;
"a" lt "b"; #alphabetical order
3>4;
"c" gt "b";
1<=2;
"a" le "b";
3>=4;
"c" ge "b";

# arrays
@X=(1,2,3,4,5,6,7);
@DaysOfWeek=("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun");
@MixAndMatch=("Hi", 3.25, 9, "Bye\n");
print "$X[0]\n"; #indexing starts from 0
@MixAndMatch=(@MixAndMatch, "Harry"); #adding element to the end of the array
@MixAndMatch=("Tom", @MixAndMatch); # @MixAndMatch is now ("Tom", "Hi", 3.25, 9, "Bye\n", "Harry"), added element to the beginning of the array
$X[7]=8; #adding element by index
@CopyOfX=@X; #copying arrays
@Weekdays = @DaysOfWeek[0..2,3..4];  # slicing an array
@NumersAndDays =(@X, @DaysOfWeek); # combining two arrays
@Weekdays = sort(@Weekdays); # sorting by ASCII dictionary order, converts to strings before sorting
print "@Weekdays\n";

# associateive arrays/hashes
$Grade{"Tom"}="A"; #keys and values can also be different scalar types
$Grade{"Dick"}="B";
%Grade = ("Tom" => "A", "Dick" => "B", "xyz" => "1", 3.14 => "pi");
@Students=keys(%Grade); # @Students now equals ("Tom", "Dick", "xyz", 3.14)
$Grade{"Harry"}; # is undef
$Grade{"Harry"} = "C";

# control structures
print "What\'s the password? ";
#$entry=<STDIN>;
chomp($entry);
if($entry eq "FOOBAR") {
	print "Access granted\n";
}else{
	print "Incorrect password\n";
}
# or shorter: if(chomp(<STDIN>) eq "Thank You") {print "You are Welcome!\n";}

# "","0", undef are false
if(($day eq "Mon")&&($time eq "7 AM")){
	print "Time to go!\n";
}
# logical AND && OR || NOT !

# loops
$n=1;
$sum=0;
while($n<=10){
	$sum=$sum+$n;
	$n++;
}
$n--;
print "The sum of the numbers from 1 to $n is $sum.\n";

$n=1;
$sum=0;
until($n==101){
	$sum=$sum+$n;
	$n++;
}
$n--;
print "The sum of the numbers from 1 to $n is $sum.\n";

$sum=0;
for($n=1;$n<=200;$n++){
	$sum=$sum+$n;
}
$n--;
print "The sum of the numbers from 1 to $n is $sum.\n";

# stepping through each element of an array
@DaysOfWeek=("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun");
foreach $day (@DaysOfWeek){
	print "$day\t";
}

@People=keys(%Grade);
foreach $person (@People){
#	print "\n$person received a(n) $Grade{$person} \n";
	if ($Grade{$person}=~ /^(a|o|i|e|u)/i){
		print "\n$person received an $Grade{$person} \n";
	}else{
		print "\n$person received a $Grade{$person} \n";
	}
}




# regular expressions
$x =~ /pattern/; # pattern matching operator and syntax of pattern, case sensitive
if($x =~ /hello/i){
	# do something, ignore case
}
$x=~ /th(is|at|en)/; #alternation
$x=~ /a./; #matches strings which have the letter "a" followed by at least one text character, but not newline/number/special character
$x=~ /be*t/; #zero or more of the previos entity, here "e"
$x=~ /be+t/; #at least one of the previos entity, here "e"
$x=~ /be?t/; #0 or 1 of the previos entity, here "e"
$x=~ /be{$n}t/; # $n instances of the previos entity, here "e"
$x=~ /be{$m,$n}t/; # between $m and $n instances of the previos entity, here "e"

$x=~ /be.+t/; #at least one character following "e"



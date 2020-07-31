
# Name: Achraj Satsangi
#Submission date : 31-07-2020
# This application has three subroutine.
# First subroutine is used to store the chores in the file.
# Second subroutine is used to display the whole content of the file.
# Third subroutine is used to display the chores of the particular date.
# You can call any subroutine by entering number 1,2 and 3. And any other number will exit the code.

use strict;
use warnings;   

my $t = localtime;
print $t;
my %chores;

print"Enter the choice:\n writing down the chores in file enter 1 \n Displaying your chores enter 2 \n To see the chores of particular date enter 3\n please enter\n >>>";
my $select = <STDIN>;
chomp($select);
if ($select==1){
storing_in_file();
}
elsif($select==2)
{
display_chores();
}
elsif($select==3)
{
chores_on_date();
}
else{
exit;}


sub storing_in_file{
print"Enter the name of the file where you want to store the chores \n >>>";
my $filename = <STDIN>;
chomp($filename);
print"How many chores do you have to enter: Please Enter a number \n >>>";
my $n = <STDIN>;
chomp($n);
my $date;

open (FH,'>>', $filename) or die $!;

 print FH $t;
 print FH "\n";

 for(my $i=0; $i<$n; $i++)
 {   
	 print"enter the date in  this form (dd-mm-yyyy)\n >>>";
	 $date = <STDIN>;
	 chomp($date);
	 print"enter the chores\n >>>";
     $chores{$date} = <STDIN> ;
	 chomp($chores{$date});
	 print FH $i+1 ."|". $date ."|". $chores{$date} ."|";
	 print FH "\n";
	
 }
 close FH;
}


sub display_chores
{  
   print"Enter the name of the file you want to display to see all the chores \n >>>";
   my $filename1 = <STDIN>;
   chomp($filename1);
   
open(DATA, '<',$filename1) or die "Couldn't open file file.txt, $!";

 while(<DATA>) 
 {
	chomp;
	print"$_";
	print"\n";
 }
close DATA;

}



sub chores_on_date{
print"Enter the name of the file where you want to see the chores of particular date \n >>>";
my $filename2 = <STDIN>;
chomp($filename2);
print"Enter the date in this form (dd-mm-yyyy) to see the chores of that date \n>>>";
my $a =<STDIN>;
chomp($a);
open(DATA, '<',$filename2) or die "Couldn't open file file.txt, $!";

 while(<DATA>) {
 no warnings;
	 chomp;
	 if( $_ = ~ /$a.+/)
   {
    print "$&";
    
    print"\n";
    next;
    }
   }
  
close DATA;

}


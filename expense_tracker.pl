use strict;
use warnings;
use List::Util qw[min max];

my %expenses;

my $t = localtime;
#print $t;

sub Expense_recorder{
print"Enter the file name to store the expenses\n>>>";
my $file = <STDIN>;
chomp($file);

print"Enter the file name to store the prices only\n>>>";
my $file_price = <STDIN>;
chomp($file_price);

print"Enter the number of items you want to maintain record\n>>>";
my $n = <STDIN>;
chomp($n);
open (A,'>>', $file) or die $!;
open (C,'>>', $file_price) or die $!;
print A $t;
print A "\n";
for(my $i=0; $i<$n; $i++)
 {   my $data;
	 print"enter the item\n >>>";
	 my $item = <STDIN>;
	 chomp($item);
	 print"Enter the quantity with units\n>>>";
	 my $qty = <STDIN>;
	 chomp($qty);
	 print"enter the price\n >>>";
     $expenses{$item} = <STDIN> ;
	 chomp($expenses{$item});
	 
	 $data = $expenses{$item};
	 print A $i+1 ."|". $item ."|". $qty ."|". $expenses{$item} ."|";;
	 print A "\n";
	 print C "$data\n";
	
 }
 
 close C;
 close A;
}
Expense_recorder(); 
 
print"Enter the file name where you have recorded the expenses\n>>>";
my $file1 = <STDIN>;
chomp($file1);

print"Enter the file name where you stored the price only\n>>>";
my $file_price1 = <STDIN>;
chomp($file_price1);

open ( my $B,'<',$file_price1) or die $!;
my @tot;
while ( my $line = <$B> ) {
   
   #print "$line";
   push @tot, $line;
      
}
my $maxim = max(@tot);
my $minim = min(@tot);

chop($maxim);
chop($minim);
print "maximum price is $maxim\n";
print "minimum price is $minim\n";
close $B;



sub max_price_item
{
open ( D,'<',$file1) or die $!;
while ( <D> ) {
   
    if( $_ =~ /.*$maxim/)
   {
    print"item of maximum price:--->";
    print "$&";
    
    print"\n";
    next;
    }
}
close D;
}
max_price_item();

sub total_expense{
my $var1 = 0;
foreach my $var(@tot)
{
	$var1= $var1 + $var;
	
}
	print "Total Price: $var1\n";
}
total_expense();
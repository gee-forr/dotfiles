#!/usr/bin/perl

my $curl = `which curl`;
chomp $curl;

my $firstAttempt = `$curl http://www.google.com 2>/dev/null`;
$firstAttempt    =~ /href="(.*)"/ms;
my $magic        = $1;

print STDERR "Magic: $magic\n";

if ($magic eq "") {
    print "No 303 redirect, looks like you can get out already.\n";
    exit 0; 
}

print STDERR "303 redirect detected. Here is the magic: $magic\n";
print STDERR "Attempting to authenticate...\n";

my $secondAttempt = `$curl --ntlm -u 'AFRICA\\gabriel.fortuna' http://www.google.com/$magic`;
$secondAttempt    =~ /(Authentication was successful.)/ms;

if ('Authentication was successful.' eq $1) {
    print "Success!\n";
} 
else {
    print "Aw... try again... Last magic: $magic\n";
}



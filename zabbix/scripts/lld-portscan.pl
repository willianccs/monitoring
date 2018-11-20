#!/usr/bin/perl
$output = `which ss` ? `ss -ntlp | tail -n +2`: `netstat -ntlp | tail -n +3`;
for (split("\n", $output)) {
        ($port, $service) = $_ =~ m/:([0-9]+) [\w:.*()\[\]çÇ ]+"?\/?([\w\-.]*)"?/g;
        $services{$port} = '{"{#SVCNAME}": "'.$service.'","{#SVCPORT}": "'.$port.'"}';
}
print '{"data": ['. join(',', values(%services)) .']}';
Setup a Cisco switch as an NTP source

1 .Set date and time

> # clock set 11:09:05 06 AUG 2021

2. Set timezone daylight savings etc if applicable 

>(config) clock summer-time zone  date date month year

example:
>(config) clock summer-time PDT date 10 March 2013 2:00 3 November 2013 2:00
*google DST in your area*

***Set your AD TO point to NTP source***

run CMD as Admin
>w32tm /config /syncfromflags:manual /manualpeerlist:1.2.3.4, 0x8 /reliable:yes
-replace 1.2.3.4 with NTP source IP address

Verify with 
>w32tm /query /status 
source should be NTP IP address NTP, should take effect right away

PDT Summer
Pacic Daylight time

PST
Winter
pacific standard time

See upstream NTP host (on windows)
w32tm /query /peers /verbose

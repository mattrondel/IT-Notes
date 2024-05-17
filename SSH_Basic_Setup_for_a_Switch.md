
** From an out of the box **

en

config t

hostname <ins>myswitch</ins>

ip domain-name <ins>mydomain.com</ins>

crypto key generate rsa

2048

line vty <ins>0 15</ins>

transport input ssh

login local

exit

username <ins>matt</ins> privilege 15 secret <ins>cisco</ins>

vlan <ins>20</ins>

name laptops

exit

interface vlan <ins>20</ins>

description laptops

ip address <ins>10.0.20.1 255.255.255.0</ins>

no shut

int <ins>gi 1/0/2</ins>

switchport mode access

switchport access vlan <ins>20</ins>

end

change underlined items for your needs



<ins>Bonus to make your life easier:</ins>

Config t

Line con 0

Log sync 

End/exit

Line vty 0 15

Log sync

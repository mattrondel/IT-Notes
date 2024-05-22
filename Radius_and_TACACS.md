| Radius   | TACACS |
| ------------- | ------------- |
| Combines Authetication and Authorization  | Sepraates all 3 elements of AAA  |
| Less secure - only runs a hash on the password  | More secure -encrypts the whole packet including username, password and attributes  |
| Requires each network device to contain authorization configuration  | central management for authorization configuration  |
| no command logging  | ful command loggin |
| minimal vendor support for authorization  | Support for most major vendors |
| UDP connectionless  | TCP connection orinetated  |
| UDP ports 1645/1646, 1812/1813  | TCP Port 49  |
| Designed for Subscriber AAA  | Designed for Administrator AAA   |

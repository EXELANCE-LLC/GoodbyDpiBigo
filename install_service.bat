@echo off
cd /d "%~dp0"
sc create GoodbyeDpiBigo binPath= "\"%~dp0goodbyedpi.exe\" -5 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253" start= auto DisplayName= "GoodbyeDpiBigo Service"
sc description GoodbyeDpiBigo "DPI circumvention utility"
sc start GoodbyeDpiBigo
pause

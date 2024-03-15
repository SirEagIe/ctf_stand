#!/usr/bin/expect

spawn /usr/bin/vncpasswd
expect "Password:"
send "qweqwe123\r"
expect "Verify:"
send "qweqwe123\r"
expect "Would you like to enter a view-only password (y/n)?"
send "n\r"

set timeout -1
expect eof
# puma-test-socket

tested on Digital Ocean Ubuntu 18.04 droplet

* clone repository
* run `./puma_systemctl_init`
* run `systemctl start puma.socket puma.service`
* run `socat TCP-LISTEN:1234,reuseaddr UNIX-CLIENT:/var/run/puma/puma.sock`
* open browser and point to http://{IP}:1234/random
* restart puma using `systemctl restart puma.service`
* run `socat` again ...

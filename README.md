# puma-test-socket

tested on Digital Ocean Ubuntu 18.04 droplet

* clone repository
* run `./puma_systemctl_init`
* run `systemctl start puma.socket puma.service`
* run `socat TCP-LISTEN:1234,reuseaddr UNIX-CLIENT:/var/run/puma/puma.sock`
* open browser and point to http://{IP}:1234/random
* restart puma using `systemctl restart puma.service`
* run `socat` again ... rinse&repeat

alternative (without `socat`, seems a bit more stable):

* `curl --unix-socket /var/run/puma/puma.sock http://localhost/random`

## Logrotate issue

to reproduce:

* follow the above process, reboot to make sure things are clean if necessary
* check the log file in `/var/log/puma.log`, it should show some entries
* tail this file using `tail -f /var/log/puma.log &`
* run `logrotate -f /etc/logrotate.d/puma` - this would rotate the log and start a phased-restart
* from that point however, `/var/log/puma.log` is empty, and data keeps being appended to `/var/log/puma.log.1`

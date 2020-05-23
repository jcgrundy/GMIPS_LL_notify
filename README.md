# GIMPS LL notify

A bash script that will update you via email when there are new LL test results
in the prime.log file. 

## Usage

You will need to set up your own smtp settings in order to send mail via the
terminal. I have used ssmtp on ubuntu but the specifics for your config will
depend on your host, a helpful starting point can be found 
[here](https://wiki.archlinux.org/index.php/SSMTP). You can then update the 
script to contain your desired To: and From: email adresses

Place the GIMPS_LL_notify.sh file in the prime folder, the script will look
in this location for the prime.log file. Then open a terminal in this directory
and run the following: 

```
bash GIMPS_LL_notify.sh & exit
```

This will run as a background process without needing a dedicated termainal
window.

You can turn it off by running the following, where `<pid>` is the process id shown in the grep result:
  
```
ps -aux | grep GIMPS_LL_notify.sh
sudo kill -9 <pid>
```

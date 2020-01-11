# docker-sftp
alipine based sftp

Usage

It takes 2 variables: USER and PASSWORD, both in cleartext. Redirect the TCP/22 port to whatever port you want.

    docker run -d \
    -p 2222:22 \
    -e USER=myusername \
    -e PASSWORD=mypassword \
    -v othersVolume:/mnt/data \
    kahatie/docker-sftp


Dropbear Notes

Options used in this container:

-R              Create hostkeys as required
-F              Don't fork into background
-E              Log to stderr rather than syslog
-m              Don't display the motd on login
-w              Disallow root logins
-g              Disable password logins for root

# This is the list of commands I used to install nexus manually on the remote DigitalOcean server.

root@ubuntu-s-4vcpu-8gb-sfo3-01:~# history
    1  apt install -y openjdk-17-jre-headless curl wget net-tools
    2  apt update
    3  apt install -y openjdk-17-jre-headless curl wget net-tools
    4  java -version
    5  cd ..
    6  pwd
    7  ls -al\
    8  cd /opt
    9  wget -vS https://download.sonatype.com/nexus/3/nexus-unix-x86-64-3.79.0-09.tar.gz
   10  ls
   11  tar -xvzf nexus-unix-x86-64-3.79.0-09.tar.gz
   12  ls -al
   13  chwon -R nexus:nexus nexus-3.79.0-09
   14  chown -R nexus:nexus nexus-3.79.0-09
   15  adduser nexus
   16  chown -R nexus:nexus nexus-3.79.0-09
   17  chown -R nexus:nexus sonatype-work
   18  vim nexus-3.79.0-09/bin/nexus.rc
   19  su - nexus



nexus@ubuntu-s-4vcpu-8gb-sfo3-01:~$ history
    1  /opt/nexus-3.79.0-09/bin/nexus start
    2  ps aux | grep nexus
    3  netstat -ltnp
    4  netstat -ltnp | grep :8081
    5  netstat -ltnp
    6  ps aux | grep nexus
    7  cat /opt/sonatype-work-nexus3/admin.password
    8  ls /opt/sonatype-work-nexus3/
    9  sudo ls /opt/sonatype-work-nexus3/
   10  sudo ls /opt/
   11  logout

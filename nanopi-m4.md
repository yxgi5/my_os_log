# 更新密码
```
sudo passwd pi
sudo passwd root
```  

# 更换国内源
ubuntu 18.04 arm64架构  
/etc/apt/sources.list
```
deb http://mirrors.ustc.edu.cn/ubuntu-ports bionic main multiverse restricted universe
deb http://mirrors.ustc.edu.cn/ubuntu-ports bionic-backports main multiverse restricted universe
deb http://mirrors.ustc.edu.cn/ubuntu-ports bionic-proposed main multiverse restricted universe
deb http://mirrors.ustc.edu.cn/ubuntu-ports bionic-security main multiverse restricted universe
deb http://mirrors.ustc.edu.cn/ubuntu-ports bionic-updates main multiverse restricted universe
deb-src http://mirrors.ustc.edu.cn/ubuntu-ports bionic main multiverse restricted universe
deb-src http://mirrors.ustc.edu.cn/ubuntu-ports bionic-backports main multiverse restricted universe
deb-src http://mirrors.ustc.edu.cn/ubuntu-ports bionic-proposed main multiverse restricted universe
deb-src http://mirrors.ustc.edu.cn/ubuntu-ports bionic-security main multiverse restricted universe
deb-src http://mirrors.ustc.edu.cn/ubuntu-ports bionic-updates main multiverse restricted universe
```

# 设置静态ip
```
set static ip in network-manager
```  

# 全盘更新
```
sudo dpkg --configure -a  
sudo apt update  
sudo apt list --upgradable  
sudo apt upgrade  
sudo apt autoremove  
```  

# 补全一些软件
```
sudo apt-get install apt-transport-https ttf-mscorefonts-installer  
sudo apt-get install curl wget apt-transport-https ca-certificates  
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
```  

# bash设置
```
sudo gedit /etc/bash.bashrc  
open bash_comletion
```  

# 设置默认终端为lxterminal
```
sudo apt-get install lxterminal  
sudo update-alternatives --config x-terminal-emulator  
/usr/bin/lxterminal  
```  

# 中文输入法, fcitx要注意设置～/.xprofile， 这个可以从fcitx-diagnose看出来，其他地方设置没有用。
```
sudo apt-get install fcitx fcitx-googlepinyin fcitx-module-cloudpinyin fcitx-sunpinyin   
fcitx-autostart  
```
gedit ～/.xprofile
```
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export QT4_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```

update:其实是好用的，没配置好而已
// 发现fcitx在这个平台不好使, 换成ibus, 先删除fcitx  
sudo apt purge fcitx*  
```
The following packages will be REMOVED:
  fcitx* fcitx-bin* fcitx-config-common* fcitx-config-gtk* fcitx-data*
  fcitx-frontend-all* fcitx-frontend-gtk2* fcitx-frontend-gtk3*
  fcitx-frontend-qt4* fcitx-frontend-qt5* fcitx-googlepinyin*
  fcitx-module-cloudpinyin* fcitx-module-dbus* fcitx-module-kimpanel*
  fcitx-module-lua* fcitx-module-x11* fcitx-modules* fcitx-sunpinyin*
  fcitx-ui-classic*
```
```
sudo apt autoremove  
```  

## 安装ibus中文输入法
```
sudo apt-get install ibus ibus-clutter ibus-gtk ibus-gtk3 ibus-qt4  
sudo apt-get install ibus-pinyin  
/usr/lib/ibus-pinyin/ibus-setup-pinyin  
sudo apt-get install ibus-sunpinyin  
/usr/lib/ibus-sunpinyin/ibus-setup-sunpinyin  
sudo  im-config  
im-config -s ibus  
```

在/etc/profile, /etc/envirenment等添加  
```
export GTK_IM_MODULE=ibus
export QT4_IM_MODULE=xim
export QT_IM_MODULE=xim
export XMODIFIERS=@im=ibus
```
  
本地配置也添加  
gedit ~/.xprofile
```
export GTK_IM_MODULE=ibus
export QT4_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
ibus-daemon -drx
```

## 添加英文和中文拼音输入法
修改切换热键ctrl+space（好像没有生效）  
在输入法的reference里面设置出事输入法为英文  

## 强制运行ibus
```
ibus-daemon -drx --panel /usr/lib/ibus/ibus-ui-gtk3
```  

# 安装vncserver
ref:   
<http://wiki.friendlyarm.com/wiki/index.php/How_to_setup_VNC_server_on_NanoPC-T4/zh>  

## 安装VNC Server
```
sudo apt-get install tightvncserver
tips: 不要用VNC-Server-6.5.0-Linux-ARM.deb 
```  
万一安装了就  
```
sudo apt purge realvnc
sudo apt purge VNC-Server-6.5.0-Linux-ARM.deb 
sudo apt purge realvnc-vnc-server
sudo apt autoremove
```  

## 设置密码
运行一次tightvncserver  
```
tightvncserver :1
tightvncserver -kill :1
```  

## 配置VNC server
编辑~/.vnc/xstartup文件，在尾部添加:  
```
#!/bin/sh

xrdb $HOME/.Xresources
xsetroot -solid grey
#x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
#x-window-manager &
# Fix to make GNOME work
export XKL_XMODMAP_DISABLE=1
/etc/X11/Xsession
#lxterminal &
/usr/bin/lxsession -s LXDE &
ibus-daemon -drx --panel /usr/lib/ibus/ibus-ui-gtk3 &
```  

## 手动启动VNC Server
```
vncserver -geometry 1280x800
```  

## 设置开机自动启动VNC server
/etc/systemd/system/vncserver@.service  
```
[Unit]
Description=Start TightVNC server at startup
After=syslog.target network.target
 
[Service]
Type=forking
User=pi
PAMName=pi
PIDFile=/home/pi/.vnc/%H:%i.pid
ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1
ExecStart=/usr/bin/vncserver -depth 24 -geometry 1280x800 :%i
ExecStop=/usr/bin/vncserver -kill :%i
 
[Install]
WantedBy=multi-user.target
```
创建符号链接以实现开机自启动：  
```
sudo ln -s /etc/systemd/system/vncserver@.service /etc/systemd/system/multi-user.target.wants/vncserver@1.service
```  
重启开发板：  
```
sudo reboot
```

# apt-get 告警问题
```
W: Download is performed unsandboxed as root as file '/var/cache/apt/archives/partial/libmng2_2.0.2-0ubuntu3_arm64.deb' 
couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
参考：

解决办法：
sudo chown _apt /var/lib/update-notifier/package-data-downloads/partial/
https://askubuntu.com/questions/954862/couldnt-be-accessed-by-user-apt-pkgacquirerun-13-permission-denied

我的解决办法
//sudo chown root cache/apt/archives/partial/
sudo chown _apt cache/apt/archives/partial/

没有效果,也不影响,算了


```

# 安装vim套件
```
sudo apt-get install vim ctags vim-doc vim-scripts exuberant-ctags libtemplate-perl ispell vim-addon-manager cscope  
之后导入我的vimrc配置  
```  

# 安装mplayer
```
sudo apt install mplayer
```  

# 安装nethogs
```
sudo apt install nethogs
```  

# 禁用hostapd ,如果apt报这玩意启动错误
```
sudo systemctl disable hostapd.service
```  

# 安装docker
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88

sudo apt-get remove docker docker-engine docker.io containerd runc

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```
!注意!arch=arm64  
```
sudo docker run hello-world
sudo usermod -aG docker $USER
newgrp docker
docker version
docker run hello-world
```  
这样就算安装好了  

# docker安装apache2和php服务器
  
## docker安装配置httpd(这个没有php)
```
docker pull httpd
docker run --rm httpd:2.4 cat /usr/local/apache2/conf/httpd.conf > my-httpd.conf
```
添加或修改为如下 
```
DocumentRoot "/usr/local/apache2/htdocs"
<Directory "/usr/local/apache2/htdocs">
    Options Indexes FollowSymLinks
    AllowOverride None
    Order allow,deny
    Allow from all
    Require all granted
</Directory>

#AddDefaultCharset UTF-8
AddDefaultCharset off
#AddDefaultCharset GBK
#AddDefaultCharset GB2312
# vim: syntax=apache ts=4 sw=4 sts=4 sr noet

#IndexOptions Charset=GB2312
IndexOptions Charset=UTF-8 # 文件服务器列表中文防乱码
```
```
docker run -d --name my-httpd -p 8080:80 -v /media/pi:/usr/local/apache2/htdocs/ httpd
docker cp my-httpd.conf my-httpd:/usr/local/apache2/conf/httpd.conf
sudo chmod 755 /media/pi
docker restart my-httpd
```
这样就是一个最简单的apache服务器了


## docker安装配置php:7.2-apache
```
docker pull php:7.2-apache
docker run -d --name my-apache-php -p 8080:80 -v /media/pi:/var/www/html php:7.2-apache
docker cp my-apache-php:/etc/apache2/apache2.conf .
```
修改参考上面httpd的修改  
```
docker exec -it my-apache-php /bin/bash
docker cp apache2.conf my-apache-php:/etc/apache2/apache2.conf
docker container update --restart=always my-apache-php
docker restart my-apache-php
```  
用文件服务器和test.php等进行测试  
test.php  
```
<?php phpinfo(); ?>
```  
hello.php  
```
<html>
 <head>
  <title>PHP Test</title>
 </head>
 <body>
 <?php echo '<p>Hello World</p>'; ?> 
 </body>
</html>
```  

# 安装samba服务
```
sudo apt install -y samba samba-common python-glade2 system-config-samba
```  

## 设置移动硬盘samba共享
```
sudo gedit /etc/samba/smb.conf
```
```
[dell]
    comment = Network Logon Service
    path = /media/andy
    guest ok = yes
    read only = no
    writeable = yes
    browseable = yes
```  
```
//sudo update-rc.d samba defaults
//sudo useradd andy
sudo useradd andy -d /media/pi -s /usr/sbin/nologin
sudo passwd andy
sudo smbpasswd -a andy
sudo /etc/init.d/nmbd restart
sudo /etc/init.d/smbd restart
```  

# 安装tftp服务
```
sudo apt install vsftpd
```  

## 添加全局访问用户
配置/etc/shells 
```
sudo gedit /etc/shells  
```  
```
/bin/sh
/bin/dash
/bin/bash
/bin/rbash
/bin/ksh93
/usr/bin/tmux
/bin/csh
/bin/sash
/bin/tcsh
/usr/bin/tcsh
/usr/sbin/nologin     ++ 用户设置成这个就禁止登录, 不添加这行用户会无法登录ftp
/usr/bin/screen
```  
```
sudo useradd andy -d /media/pi -s /usr/sbin/nologin
sudo passwd andy
```

## ftp配置修改
```
sudo gedit /etc/vsftpd.conf
```  
```
local_enable=YES
write_enable=YES
chroot_local_user=YES
chroot_list_enable=YES
chroot_list_file=/etc/vsftpd.chroot_list
allow_writeable_chroot=YES
userlist_enable=YES
userlist_deny=NO
userlist_file=/etc/allowed_users
seccomp_sandbox=NO
user_config_dir=/etc/vsftpd/vsftpd_user_conf
```  

## 限制用户操作权限
这里我们不限制本地用户pi的权限, 限制非管理员全局ftp访问用户的权限为 可写,不可删除,不可重命名  
这样就可以防止误操作删掉文件了, 要删除用本地用户登录去删  
```
mkdir -p /etc/vsftpd/vsftpd_user_conf
sudo gedit /etc/vsftpd/vsftpd_user_conf/pi
sudo gedit /etc/vsftpd/vsftpd_user_conf/andy
```
```
write_enable=YES
cmds_denied=DELE,RNFR
```
既然是全局访问的ftp专用账户, 要能访问本地用户pi的私有目录, 添加到同一组  
/etc/group
```
andy:x:1001:pi
```

## vsftpd配置生效
```
sudo service vsftpd restart
sudo service vsftpd status
```  

# 源码编译安装cmocka
```
wget https://cmocka.org/files/1.1/cmocka-1.1.5.tar.xz
cd cmocka-1.1.5
mkdir build
cd build
cmake -DWITH_STATIC_LIB=on ..
等效于
cmake -DBUILD_STATIC_LIB=on ..
make
sudo make install
```  

# 编译安装gtest
```
git clone https://github.com/google/googletest
cd googletest
mkdir build
cd build
//cmake ..
cmake -DBUILD_SHARED_LIBS=on ..
make
sudo make install
```  


# openbox的nm-applet消失问题
NetworkManager图标无法显示，可在/etc/gdm/Init/Default增加killall nm-applet && nohup nm-applet --sm-disable 1&>/dev/null &;

或者在openbox的autostart里对应位置先killall nm-applet，再运行nm-applet





































































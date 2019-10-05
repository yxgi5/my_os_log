# 更换国内源
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



# 中文输入法
sudo apt-get install fcitx fcitx-googlepinyin fcitx-module-cloudpinyin fcitx-sunpinyin



# 安装vncserver
ref: <http://wiki.friendlyarm.com/wiki/index.php/How_to_setup_VNC_server_on_NanoPC-T4/zh>  

## 安装VNC Server
sudo apt-get install tightvncserver

## 设置密码
运行一次tightvncserver
tightvncserver :1
tightvncserver -kill :1

## 配置VNC server
编辑~/.vnc/xstartup文件，在尾部添加:
```
lxterminal &
/usr/bin/lxsession -s LXDE &
```
## 手动启动VNC Server
vncserver -geometry 1280x800

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
sudo ln -s /etc/systemd/system/vncserver@.service /etc/systemd/system/multi-user.target.wants/vncserver@1.service
重启开发板：  
sudo reboot


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


sudo apt-get install vim ctags vim-doc vim-scripts exuberant-ctags libtemplate-perl ispell vim-addon-manager cscope  
sudo apt-get install apt-transport-https ttf-mscorefonts-installer  





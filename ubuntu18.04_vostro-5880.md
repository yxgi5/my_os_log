* * *
# 更换源为 mirrors.163.com
```
sudo /etc/apt/sources.list
```
修改之后
```
sudo update
```
```
cat /etc/apt/sources.list
```
```
# deb cdrom:[Ubuntu 18.04.5 LTS _Bionic Beaver_ - Release amd64 (20200806.1)]/ bionic main restricted

# See http://help.ubuntu.com/community/UpgradeNotes for how to upgrade to
# newer versions of the distribution.
deb http://mirrors.163.com/ubuntu/ bionic main restricted
# deb-src http://mirrors.163.com/ubuntu/ bionic main restricted

## Major bug fix updates produced after the final release of the
## distribution.
deb http://mirrors.163.com/ubuntu/ bionic-updates main restricted
# deb-src http://mirrors.163.com/ubuntu/ bionic-updates main restricted

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team. Also, please note that software in universe WILL NOT receive any
## review or updates from the Ubuntu security team.
deb http://mirrors.163.com/ubuntu/ bionic universe
# deb-src http://mirrors.163.com/ubuntu/ bionic universe
deb http://mirrors.163.com/ubuntu/ bionic-updates universe
# deb-src http://mirrors.163.com/ubuntu/ bionic-updates universe

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu 
## team, and may not be under a free licence. Please satisfy yourself as to 
## your rights to use the software. Also, please note that software in 
## multiverse WILL NOT receive any review or updates from the Ubuntu
## security team.
deb http://mirrors.163.com/ubuntu/ bionic multiverse
# deb-src http://mirrors.163.com/ubuntu/ bionic multiverse
deb http://mirrors.163.com/ubuntu/ bionic-updates multiverse
# deb-src http://mirrors.163.com/ubuntu/ bionic-updates multiverse

## N.B. software from this repository may not have been tested as
## extensively as that contained in the main release, although it includes
## newer versions of some applications which may provide useful features.
## Also, please note that software in backports WILL NOT receive any review
## or updates from the Ubuntu security team.
deb http://mirrors.163.com/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src http://mirrors.163.com/ubuntu/ bionic-backports main restricted universe multiverse

## Uncomment the following two lines to add software from Canonical's
## 'partner' repository.
## This software is not part of Ubuntu, but is offered by Canonical and the
## respective vendors as a service to Ubuntu users.
deb http://archive.canonical.com/ubuntu bionic partner
# deb-src http://archive.canonical.com/ubuntu bionic partner

deb http://security.ubuntu.com/ubuntu bionic-security main restricted
# deb-src http://security.ubuntu.com/ubuntu bionic-security main restricted
deb http://security.ubuntu.com/ubuntu bionic-security universe
# deb-src http://security.ubuntu.com/ubuntu bionic-security universe
deb http://security.ubuntu.com/ubuntu bionic-security multiverse
# deb-src http://security.ubuntu.com/ubuntu bionic-security multiverse
deb http://archive.ubuntu.com/ubuntu bionic main universe restricted multiverse
```


* * *
# 安装几个下载工具
```
sudo apt install aptitude curl aria2 wget
```

* * *
# 如果是虚拟机运行这个u1804, 安装vbox增强后
```
/sbin/rcvboxadd quicksetup <version>
/sbin/rcvboxadd quicksetup all
sudo vi /etc/fstab
share /mnt/share vboxsf rw,gid=100,uid=1000,auto 0 0
```

* * *
# nvidia sdk for jetsonX

<https://developer.nvidia.com/nvsdk-manager>
```
sudo dpkg -i sdkmanager_1.4.1-7402_amd64.deb

sudo apt install -f

sudo apt install vim-gtk vim ctags vim-doc vim-scripts exuberant-ctags libtemplate-perl ispell vim-addon-manager cscope

sudo tail -f ~/.nvsdkm/sdkm.log

sdkmanager
```

下载包在
```
~/Downloads/nvidia/sdkm_downloads
```
安装在
```
~/nvidia/nvidia_sdk
```
nvidia默认的usb网口, default ip
```
Target: 192.168.55.1
Host: 192.168.55.100
```

<https://developer.download.nvidia.com/sdkmanager/sdkm-config/SDKMANAGER/Linux/sdkml2_sdkmanager_linux_deb.json>

<https://developer.nvidia.com/assets/embedded/secure/tools/files/jetpack-sdks/jetpack-4.5.1/JETPACK_451_b17/sdkml3_jetpack_l4t_451.json>

<https://developer.nvidia.com/assets/embedded/secure/tools/files/jetpack-sdks/jetpack-4.5.1/JETPACK_451_b17_DEEPSTREAM/sdkml3_jetpack_l4t_451_deepstream.json>

实际上类似于这样

<https://developer.download.nvidia.com/assets/embedded/secure/tools/files/jetpack-sdks/jetpack-4.5.1/JETPACK_451_b17_DEEPSTREAM/sdkml3_jetpack_l4t_451_deepstream.json?WXKwCOquaAWNu0X3zcATvilrY8x1PcRrVnEG9pKFSH4Vc4GegPrhsJb9NW5jLO6ylPTWFG4XGwCKG7GwqvdWzwzy6dKGkfZECHjUg-F8LzftM6d-GbL_y06u3O7YXGErzlb8S1fzx31JU8oefmvxMgvyEWvkbs6exA2oog-oWXxwFR30l6h53XE7g-Dul5QDb7i-V2RJy0BFG6G6oxNl0devcqnhb0qnS_o3a0aszUa3enxdriPIUmac9AQN9Q>

几个比较大的文件很难下

<https://developer.nvidia.com/assets/embedded/secure/tools/files/jetpack-sdks/jetpack-4.5.1/JETPACK_451_b17/ubuntu1804/cuda-repo-ubuntu1804-10-2-local-10.2.89-440.40_1.0-1_amd64.deb>

<https://developer.download.nvidia.com/assets/embedded/secure/tools/files/jetpack-sdks/jetpack-4.5.1/JETPACK_451_b17/T210/Tegra_Linux_Sample-Root-Filesystem_R32.5.1_aarch64.tbz2>

<https://developer.nvidia.com/assets/embedded/secure/tools/files/jetpack-sdks/jetpack-4.5.1/JETPACK_451_b17/cuda-repo-l4t-10-2-local-10.2.89_1.0-1_arm64.deb>

<https://developer.nvidia.com/assets/embedded/secure/tools/files/jetpack-sdks/jetpack-4.5.1/JETPACK_451_b17/NsightSystems-linux-public-2020.5.3.17-0256620.deb>

<https://developer.nvidia.com/assets/embedded/secure/tools/files/jetpack-sdks/jetpack-4.5.1/JETPACK_451_b17/NoDLA/libnvinfer-samples_7.1.3-1+cuda10.2_all.deb>

<https://developer.nvidia.com/assets/embedded/secure/tools/files/jetpack-sdks/jetpack-4.5.1/JETPACK_451_b17/NoDLA/libnvinfer-doc_7.1.3-1+cuda10.2_all.deb>

<https://developer.nvidia.com/assets/embedded/secure/tools/files/jetpack-sdks/jetpack-4.5.1/JETPACK_451_b17/NoDLA/libnvinfer-bin_7.1.3-1+cuda10.2_arm64.deb>

<https://developer.download.nvidia.com//assets/embedded/secure/tools/files/jetpack-sdks/jetpack-4.5.1/JETPACK_451_b17/DLA/libnvinfer-samples_7.1.3-1+cuda10.2_all.deb>

<https://developer.download.nvidia.com//assets/embedded/secure/tools/files/jetpack-sdks/jetpack-4.5.1/JETPACK_451_b17/T186/Jetson_Linux_R32.5.1_aarch64.tbz2>

<https://developer.download.nvidia.com/assets/embedded/secure/tools/files/jetpack-sdks/jetpack-4.5.1/JETPACK_451_b17_DEEPSTREAM/deepstream-5.1_5.1.0-1_arm64.deb>

有时候替换成developer.download.nvidia.cn可以下的动

<http://172.17.0.1/Jetson_Linux_R32.5.1_aarch64.tbz2?fid=xPaCAOd6Io9uzil11Ik8wMSQiC196eQUAAAAAF0vEo99-hU7BE7JoYsl-BNsMd2-&mid=666&threshold=150&tid=5E392A99E5A7292FF65E3AB98212333E&srcid=119&verno=1>

导出cookie再用工具下载
```
1) wget -x --load-cookies cookies.txt "chrome://startpage/downloads"
2) curl --cookie cookies.txt "chrome://startpage/downloads"
3) aria2c --load-cookies cookies.txt "chrome://startpage/downloads"
```

* * *
# 科^学%上$网, FUCK CCP!!
```
sudo apt install shadowsocks shadowsocks-libev privoxy proxychains
```

原始的go.sh脚本需要修改, 已经修改好的go_mod.sh

v2ray-linux-64.zip下载到相同目录就可以安装到本机, 然后
```
sudo gedit /etc/v2ray/config.json
sudo systemctl enable v2ray.service
sudo systemctl start v2ray.service
sudo systemctl restart v2ray.service
```

### v2ray for terminal
```
export ALL_PROXY="socks5://127.0.0.1:10808"
或者
export https_proxy="socks5://127.0.0.1:10808"
export http_proxy="socks5://127.0.0.1:10808"
export ftp_proxy="socks5://127.0.0.1:10808"
```

## 可以命令运行
```
nohup sslocal -c /etc/shadowsocks.json /dev/null 2>&1 &
```

## 也可以设置ss服务

### ss服务脚本
```
sudo gedit /lib/systemd/system/shadowsocks@.service
```
```
[Unit]
Description=Shadowsocks Client Service
After=network.target

[Service]
Type=simple
User=nobody
ExecStart=/usr/bin/sslocal -c /etc/shadowsocks/%i.json

[Install]
WantedBy=multi-user.target
```
### ss配置文件
```
sudo gedit /etc/shadowsocks/config.json
```
```
{
    "server":"119.28.9.79",
    "server_port":3588,
    "local_address": "127.0.0.1",
    "local_port":1081,
    "password":"******",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false,
    "workers": 10
}
```
这里xh全拼

### 运行ss服务
```
sudo systemctl enable shadowsocks@config.service
Created symlink /etc/systemd/system/multi-user.target.wants/shadowsocks@config.service → /lib/systemd/system/shadowsocks@.service.

sudo systemctl start shadowsocks@config.service
systemctl status shadowsocks@config.service
```

### 重定向privoxy的https/http端口到ss的socks5端口
```
sudo gedit /etc/privoxy/config
```
```
...
#listen-address  localhost:8118
listen-address  127.0.0.1:8118
...
#forward-socks5 / 127.0.0.1:1081 .
forward-socks5 / 127.0.0.1:10808 .
...
```

### 启动 privoxy 服务
```
systemctl status privoxy.service
sudo systemctl start privoxy.service
sudo systemctl enable privoxy.service
Created symlink /etc/systemd/system/multi-user.target.wants/privoxy.service → /usr/lib/systemd/system/privoxy.service.
```

### 如果出错
```
sudo apt install --reinstall privoxy
```

### 测试 privoxy

#### 测试1
```
aria2c --all-proxy='http://127.0.0.1:8118' -D
```
#### 测试2
```
export https_proxy="127.0.0.1:8118"

export http_proxy="127.0.0.1:8118"

[ 上面两句可以添加到类似 /etc/profile 的地方去 ]


curl www.google.com

yay [ 就可以加速了 ]
```
### 还可以用proxychains
```
sudo gedit /etc/proxychains.conf
```
```
[ProxyList]
# add proxy here ...
# meanwile
# defaults set to "tor"
#socks4 	127.0.0.1 9050
# set to "v2ray"
socks5 	127.0.0.1 10808
# set to "SS"
#socks5 	127.0.0.1 1081
```

#### 测试
```
export PROXY_DNS_SERVER=8.8.8.8
PROXYCHAINS_SOCKS5=1081 proxychains4 -f /etc/proxychains.conf curl www.google.com
proxychains curl www.google.com
```

#### LD_PRELOAD 处理

问题:
```
ERROR: ld.so: object 'libproxychains.so.3' from LD_PRELOAD cannot be preloaded: ignored.
```
处理:
```
sudo gedit /usr/bin/proxychains
```
```
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libproxychains.so.3
```
用proxychains-ng是否更好?

## SwitchyOmega设置
```
设置v2ray-->启用代理
Socks5, 127.0.0.1:10808
也可以设置为ss代理
Socks5, 127.0.0.1:1081
```

* * *
# root 用户

## 创建root密码
```
sudo passwd root
```

## 允许root登录
```
sudo gedit /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
```
```
[Seat:*]
greeter-session=unity-greeter
user-session=ubuntu
greeter-show-manual-login=true
all-guest=false
```

## 修改root设置

/root/.profile
```
mesg n
```
改成
```
tty -s && mesg n
```



* * *
# openbox 风格桌面环境配置及一些必要设置
```
sudo apt install xinit openbox menu libxml2-dev tint2 openbox-menu openbox-gnome-session pkg-config menu-l10n lxdm obmenu feh dmenu fonts-dejavu
sudo apt install lxappearance pcmanfm libfm-tools lxterminal leafpad
sudo apt install libgtk2.0-dev libpango-perl libpango1.0-dev
```
## 安装配置 obmenu-generator

```
sudo apt install build-essential cpanminus git
sudo cpan install YAML Gtk2 Pango Linux::DesktopFiles Data::Dump

git clone git://github.com/trizen/obmenu-generator
sudo cp obmenu-generator/obmenu-generator /usr/bin
mkdir ~/.config/obmenu-generator/
sudo cp -r obmenu-generator/schema.pl ~/.config/obmenu-generator/
sudo cpanm Linux::DesktopFiles
sudo cpanm Data::Dump
sudo chmod 777 /usr/bin/obmenu-generator 

obmenu-generator -i
```

配置目录在
```
~/.config/dmenu
```
## 安装配置 conky
### 恢复默认网卡为eth0
```
sudo vim /etc/default/grub
```
```
查找
GRUB_CMDLINE_LINUX=""
修改为
GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"
```

重新生成grub引导配置文件
```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## 先安装一些基础包
```
sudo apt install conky conky-all tk-dev volumeicon-alsa gnome-icon-theme parcellite shutter net-tools rar p7zip p7zip-full p7zip-rar unace unrar zip unzip p7zip-full p7zip-rar sharutils uudeview mpack jlha-utils arj cabextract file-roller xz-utils fonts-ipafont-gothic fonts-ipafont-mincho fonts-wqy-microhei fonts-wqy-zenhei fonts-indic git libgtk2.0-dev libglib2.0-dev libgconf2-dev libgstreamer1.0-dev g++ make cmake libgst-dev autoconf libtool automake cmake cmake-gui python-pip gtk-theme-switch gtk2-engines openbox-dev lxappearance-obconf adwaita-icon-theme-full opera chromium-browser  chromium-browser-l10n firefox
```
```
sudo apt install network-manager-dev network-manager-openvpn network-manager-pptp network-manager-vpnc network-manager-openconnect network-manager-iodine pppoe ppp pppoeconf pppconfig fcitx-table-wubi libreoffice-l10n-en-za hyphen-en-gb hunspell-en-ca libreoffice-l10n-en-gb thunderbird-locale-en-gb mythes-en-au libreoffice-help-en-gb fcitx-sunpinyin hunspell-en-za gimp-help-en kde-l10n-engb hunspell-en-au hunspell-en-gb kde-l10n-zhcn fcitx-googlepinyin fcitx fcitx-bin fcitx-data fcitx-modules fcitx-googlepinyin fcitx-config-gtk fcitx-frontend-gtk2 fcitx-ui-classic fcitx-module-dbus
```
```
sudo apt install xscreensaver libopengl-xscreensaver-perl xscreensaver-data xscreensaver-data-extra xscreensaver-gl xscreensaver-gl-extra xscreensaver-screensaver-bsod xscreensaver-screensaver-dizzy xscreensaver-screensaver-webcollage fonts-freefont-ttf
```
## 配置 obconf

导入carbon.obt
```
lxappearance
```

## 配置输入法
```
sudo im-config
```

~/.xprofile中加入：(不要在/etc/environment)
```
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export QT4_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```


## 电池和充电指示器
```
$ git clone https://github.com/valr/cbatticon
$ cd cbatticon
$ make WITH_GTK3=0 WITH_NOTIFY=0
$ sudo make install
$ cbatticon &
```

## 桌面背景图片
```
可以在这找一些合适的背景
https://www.pixelstalk.net/ubuntu-logo-wallpapers/
背景放到
/usr/share/wallpapers/
```


## 全局文件查找 mlocate
```
sudo apt install mlocate
sudo updatedb
```

## 局域网通讯 iptux
```
sudo apt install iptux
```

## 修改 bash 显示风格
```
~/.bashrc添加一句
PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ "
```
~/.bashrc
```
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
修改为
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
```

## 添加其他几个备胎桌面环境
```
sudo apt install ubuntu-desktop
sudo apt install ubuntu-restricted-extras
sudo apt install ubuntu-unity-desktop
需要重启
sudo shutdown -r now
```
这几个桌面环境的输入法自启动
```
sudo cp /usr/share/applications/fcitx.desktop ~/.config/autostart/fcitx.desktop
或者
sudo cp /usr/share/fcitx/xdg/autostart/fcitx-autostart.desktop /etc/xdg/autostart/
```

### 安装几个登录管理器

```
sudo dpkg-reconfigure lightdm
sudo dpkg-reconfigure gdm3
```
几个小工具
```
unity --version
sudo apt install unity-tweak-tool
sudo apt install screenfetch
```
unity-control-center, gnome-control-center
都空白, 下面这样设置就可以显示了
```
env XDG_CURRENT_DESKTOP=GNOME gnome-control-center
```
可以修改/usr/share/applications/unity-control-center.desktop, unity-control-center应该也类似，
```
XDG_CURRENT_DESKTOP=Unity
```

### 配置一下git全局设置
```
sudo apt install gitk
The remote end hung up unexpectedly 解决方案
git config --global http.postBuffer 1048576000
git config --global http.lowSpeedLimit 0
git config --global http.lowSpeedTime 999999  单位 秒
```

### qr code 二维码工具
```
sudo apt install qtqr
```

### 安装 tor

```
sudo apt install tor torbrowser-launcher 
```
其实还是直接下载torbrowser就好了, 这个launcher鸟用没有.

### 安装 ffmpeg
```
sudo apt install ffmpeg ffmpeg-doc libavcodec57 libjs-bootstrap libx264-dev x264 x265 libx265-dev libx265-doc libgpac4 libffms2-4 libx264-152 libx265-146 libavformat-dev libavfilter-dev libavdevice-dev libavresample-dev libavcodec-dev
```

### 安装wine[废弃]
```
//sudo apt install wine-stable winetricks playonlinux

ERROR: ld.so: object 'libgtk3-nocsd.so.0' from LD_PRELOAD cannot be preloaded (cannot open shared object file): ignored.
sudo apt install gtk3-nocsd
sudo apt-get install libgtk3-nocsd0:i386
sudo apt-get install libgtk3-nocsd0
//gedit ~/.bashrc
//export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libgtk3-nocsd.so.0

sudo apt-get purge gtk3-nocsd
关于wine修改这个地方吧
cat /etc/X11/Xsession.d/51gtk3-nocsd-detect
```



### 安装 vbox

apt-repo里版本低, 不采用
```
//sudo apt install virtualbox virtualbox-guest-additions-iso virtualbox-qt virtualbox-guest-dkms
```
#### 方法1: 下载最新的版本, 比如

<https://download.virtualbox.org/virtualbox/6.1.18>
```
sudo dpkg-i virtualbox-6.1_6.1.18-142142_Ubuntu_bionic_amd64.deb
sudo apt-get install libqt5opengl5 libqt5x11extras5
```
配置vbox服务
```
systemctl status virtualbox.service
sudo usermod -a -G vboxusers <andreas>
cat /etc/group | grep vbox
```

/var/lib/update-notifier/package-data-downloads/partial/

??忘了为啥记录这个了

#### 方法2: 添加vbox的apt-repo
```
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib"
```
安装
```
su
proxychains apt install virtualbox-6.1
```

#### 可能是虚拟机一些其他修改记录, host安装应该无视

(先在vbox再迁移到host的遗留记录)
```
sudo modinfo vboxdrv
sudo apt purge virtualbox-dkms
sudo apt purge virtualbox-guest-dkms
sudo apt install dkms
sudo /sbin/vboxconfig
```

#### 安装 vbox 扩展包
`sudo virtualbox`

安装`extension`包

或者用命令行添加
```
VBoxManage extpack install [--replace] <tarball> |
                   uninstall [--force] <name> |
                   cleanup
```


#### Solve "Cannot change group vboxusers for device /dev/vboxdrv" Virtualbox Error
<https://ostechnix.com/solve-cannot-change-group-vboxusers-for-device-dev-vboxdrv-virtualbox-error/>

To fix this issue, first create vboxusers group using command:
```
$ sudo groupadd vboxusers
```
Then add the current user to the above group:
```
$ sudo usermod -a -G vboxusers andreas
```
Check if the user is added to the group:
```
$ grep vboxusers /etc/group
vboxusers:x:1002:andreas
```
Finally, restart the virtualbox kernel module using command:
```
$ sudo /sbin/vboxconfig
```
or
```
$ sudo modprobe vboxdrv
```
or
```
$ sudo /sbin/rcvboxdrv setup
```


* * *
# 安装 AC6 及 openocd

Ac6安装/解压到/opt/Ac6, 本身也带了一个openocd

全局安装一个也没啥问题
```
sudo apt install openocd
```
然后按专案记录patch一些bug



* * *
# 安装 foxitreader

foxitreader有两个, 一个是linux的原生版本,这个基本上大部分情况都胜任, 但是在制作书签时候很可能出错并导致文档破坏性后果, 所以, 编辑pdf咱还是用另一个就是wine的旧版foxitreader

wine 的桌面用 foxitreader.desktop
```
[Desktop Entry]
Name=Foxit Reader Pro
Exec=env LC_ALL="zh_CN.UTF-8" LANG="zh_CN.UTF-8" WINEARCH=win32 WINEPREFIX="/home/andreas/.wine" wine C:\\\\windows\\\\command\\\\start.exe /Unix /home/andreas/.wine/dosdevices/c:/Program\\ Files/Foxit\\ Software/Foxit\\ Reader/Foxit\\ Reader.exe
#Exec=env WINEPREFIX="/home/andreas/.wine" wine start /ProgIDOpen FoxitReader.Document %f
Type=Application
StartupNotify=true
Path=/home/andreas/.wine/dosdevices/c:/Program Files/Foxit Software/Foxit Reader
Icon=6EB5_Foxit Reader.0
```

右键关联并用wine版本打开的, 需要修改mime配置
这里记录 ~/.local/share/applications/wine-extension-pdf.desktop
```
[Desktop Entry]
Type=Application
Name=福昕阅读器，最好的PDF阅读软件!
MimeType=application/pdf;
Exec=env WINEPREFIX="/home/andreas/.wine" wine start /ProgIDOpen FoxitReader.Document %f
NoDisplay=true
StartupNotify=true
Icon=E361_Foxit Reader.0
```

参考 试试看 fdf
~/.local/share/applications/wine-extension-fdf.desktop
```
[Desktop Entry]
Type=Application
Name=福昕阅读器，最好的PDF阅读软件!
MimeType=application/x-wine-extension-fdf;
Exec=env WINEPREFIX="/home/andreas/.wine" wine start /ProgIDOpen FoxitReader.FDFDoc %f
NoDisplay=true
StartupNotify=true
Icon=E361_Foxit Reader.0
```


* * *
# 安装 retext 和 haroopad
```
sudo apt install retext haroopad
```

* * *
# 安装 wps
```
sudo apt-get install wps-office ttf-mscorefonts-installer wps2odt wps2epub
```
* * *
# 安装 science-electronics
```
sudo apt install science-electronics
```
* * *
# 高级剪贴板 cliplt 与 parcellite
```
sudo apt install cliplt parcellite
```

* * *
# 安装 nvidia 显卡驱动 及 cuda 库
```
sudo ubuntu-drivers devices
sudo apt install nvidia-driver-390
sudo apt install nvidia-utils-390

sudo apt-get install mesa-common-dev

nvidia-settings

sudo apt install xserver-xorg-video-nouveau

sudo apt install linux-headers-$(uname -r)

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.2.2/local_installers/cuda-repo-ubuntu1804-11-2-local_11.2.2-460.32.03-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-11-2-local_11.2.2-460.32.03-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu1804-11-2-local/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda

sudo apt install ubuntu-desktop ubuntu-unity-desktop xserver-xorg-input-all
```

* * *
# 安装 notepadqq
```
sudo add-apt-repository ppa:notepadqq-team/notepadqq
sudo apt-get update
sudo apt-get install notepadqq
```

* * *
# 恢复intel核显驱动

查看安装记录
```
gedit /var/log/apt/term.log
```
恢复核显驱动
```
//sudo aptitude install xserver-xorg-input-all-hwe-18.04 xserver-xorg-input-libinput-hwe-18.04 xserver-xorg-video-ati-hwe-18.04 xserver-xorg-video-fbdev-hwe-18.04 xserver-xorg-video-intel-hwe-18.04 xserver-xorg-video-nouveau-hwe-18.04 xserver-xorg-video-qxl-hwe-18.04 xserver-xorg-video-radeon-hwe-18.04 xserver-xorg-video-vesa-hwe-18.04 xserver-xorg-core-hwe-18.04 ubuntu-desktop ubuntu-unity-desktop xorg xserver-xorg-hwe-18.04 xserver-xorg-video-all-hwe-18.04 xserver-xorg-video-vmware-hwe-18.04 xserver-xorg-video-amdgpu-hwe-18.04 xserver-xorg-input-wacom-hwe-18.04 

sudo aptitude install xserver-xorg-input-all xserver-xorg-input-libinput xserver-xorg-video-ati xserver-xorg-video-fbdev xserver-xorg-video-intel xserver-xorg-video-nouveau xserver-xorg-video-qxl xserver-xorg-video-radeon xserver-xorg-video-vesa xserver-xorg-core ubuntu-desktop ubuntu-unity-desktop xorg xserver-xorg xserver-xorg-video-all xserver-xorg-video-vmware xserver-xorg-video-amdgpu xserver-xorg-input-wacom libqtwebkit4
```



* * *
# 安装 drawio
修改/usr/share/applications/drawio.desktop
```
[Desktop Entry]
Name=draw.io
Exec=/opt/draw.io/drawio %f
Terminal=false
Type=Application
Icon=drawio
StartupWMClass=draw.io
Comment=diagrams.net desktop
MimeType=application/vnd.jgraph.mxfile;application/vnd.visio;
Categories=Graphics;
```
并且mimeapp有
```
application/vnd.jgraph.mxfile=drawio.desktop;
```
就可以双击打开drawio文件

这里修改了desktop文件的占位符

* * *
# 安装  matlab 2017


* * *
# 安装 petalinux
```
./petalinux-v2020.1-final-installer.run -d /opt/petalinux
$ sudo apt-get install u-boot-tools lrzsz minicom nfs-kernel-server tftpd xinetd libncurses5-dev
$ sudo apt-get install slang-xfig
$ sudo apt-get install quilt
$ sudo apt-get install e2fsck-static
sudo apt-get install build-essential vim tofrodos iproute2 gawk gcc git make net-tools zlib1g-dev libssl-dev flex bison libselinux1 libncurses5-dev tftpd lib32z1 lib32ncurses5 libbz2-1.0:i386 lib32stdc++6 xvfb chrpath socat autoconf libtool
sudo apt-get install screen pax gzip tar
sudo apt-get install tftp
sudo apt-get install tftpd
```
## 配置tftp

/etc/xinetd.d/tftp
```
service tftp
{
protocol = udp
port = 69
socket_type = dgram
wait = yes
user = nobody
server = /usr/sbin/in.tftpd
server_args = /tftpboot
disable = no
}
```
tftp目录权限修改
```
sudo mkdir -p /tftpboot
sudo chmod 777 /tftpboot
sudo chown nobody /tftpboot
```
启动tftp服务
```
sudo /etc/init.d/xinetd stop
sleep 1
sudo /etc/init.d/xinetd start
```

确认tftp服务是否已经开启
```
netstat -au | grep tftp
```
本机测试,需要tftp客户端
```
tftp <ip>
get <testfile>
```
目标板上测试访问
```
tftp -g -r <testfile> <ip>
```

## 安装配置nfs
```
sudo apt-get install nfs-kernel-server nfs-common portmap
sudo apt install rpcbind
```
sudo gedit /etc/default/portmap
内容是
```
-i 127.0.0.1
```
`sudo gedit /etc/hosts.allow`
内容是
```
portmap lockd rquotad mountd statd:ALL
```
```
$ sudo exportfs -ra
$ sudo service portmap restart
或者sudo /etc/init.d/rpcbind restart
```
`sudo gedit /etc/exports`
内容是
```
/home/andreas/targetfs *(rw,nohide,insecure,no_subtree_check,async,no_root_squash)
```
启动nfs服务
```
$ sudo /etc/init.d/nfs-kernel-server restart
```
测试nfs
```
sudo showmount -e localhost

showmount
rpcinfo
exportfs
nfsstat
```

服务器端nfs-kernel-server自动安装nfs-common、rpcbind等13个软件包

mount到本机nfs目录的客户端机器。
```
sudo showmount -e localhost
```
将配置文件中的目录全部重新export一次！无需重启服务。
```
sudo exportfs -rv
```

查看NFS的运行状态
```
sudo nfsstat
```
查看rpc执行信息，可以用于检测rpc运行情况
```
sudo rpcinfo
```
查看网络端口，NFS默认是使用111端口。
```
sudo netstat -tu -4
```
客户端nfs-common自动安装nfs-common、rpcbind等12个软件包

显示指定的（192.168.3.167）NFS服务器上export出来的目录
```
sudo showmount -e 192.168.3.167
```
创建本地挂载目录
```
sudo mkdir -p /mnt/data
```
将NFS服务器192.168.3.167上的目录，挂载到本地的/mnt/目录下
```
sudo mount -t nfs 192.168.3.167:/data /mnt/data
```

* * *
# 安装Xilinx vitis
为了安装Xilinx vitis(包括vivado)
```
sudo gedit /etc/lsb-release
```
其中Description:	Ubuntu 18.04.5 LTS

先暂时修改成Description:	Ubuntu 18.04.4 LTS

```
sudo apt install blt 

sudo apt install lib32asan4 lib32atomic1 lib32cilkrts5 lib32gcc-7-dev lib32gcc1 lib32gomp1 lib32itm1 lib32mpx2 lib32quadmath0 lib32stdc++6 lib32ubsan0 libasound2-dev libbison-dev libc6-dev-i386 libc6-dev-x32 libc6-i386 libc6-x32 libcaca-dev libfl-dev libfl2 libpulse-dev libslang2-dev libtext-unidecode-perl libtinfo-dev libx32asan4 libx32atomic1 libx32cilkrts5 libx32gcc-7-dev libx32gcc1 libx32gomp1 libx32itm1  libx32quadmath0 libx32stdc++6 libx32ubsan0 python3-astroid python3-gitdb python3-isort python3-lazy-object-proxy python3-logilab-common python3-mccabe python3-smmap python3-tk python3-wrapt tk8.6-blt2.5

sudo apt install gcc-7-multilib texinfo libncurses5-dev libapr1 libapr1-dev libaprutil1 libsctp-dev uuid-dev tcl

sudo apt install gcc-multilib libapr1 libapr1-dev libaprutil1 net-tools libc6-dev-i386 fonts-liberation graphviz libann0 libcdt5 libcgraph6 libgts-0.7-5 libgts-bin libgvc6 libgvpr2 liblab-gamut1 libpathplan4
```
冲突删除了一些包，安装完petalinux再换回来
```
sudo apt install cuda-cross-aarch64-10-2 g++-7-aarch64-linux-gnu g++-aarch64-linux-gnu gcc-7-aarch64-linux-gnu gcc-aarch64-linux-gnu vpi1-cross-aarch64-l4t
```
vpi1-cross-aarch64-l4t是nvidia的sdk包里的

vitis后续
```
sudo /opt/Xilinx/.xinstall/Vitis_2020.1/scripts/installAIeDepLibs.sh
cd /opt/Xilinx/Vivado/2020.1/data/xicom/cable_drivers/lin64/install_script/install_drivers/
sudo ./install_drivers
```
这些包还是留着，不要auto remove了
```
sudo apt install binutils-aarch64-linux-gnu cpp-7-aarch64-linux-gnu cpp-aarch64-linux-gnu cuda-cudart-cross-aarch64-10-2 cuda-cufft-cross-aarch64-10-2 cuda-cupti-cross-aarch64-10-2 cuda-curand-cross-aarch64-10-2 cuda-cusolver-cross-aarch64-10-2 cuda-cusparse-cross-aarch64-10-2 cuda-driver-cross-aarch64-10-2 cuda-misc-headers-cross-aarch64-10-2 cuda-npp-cross-aarch64-10-2 cuda-nsight-compute-addon-l4t-10-2 cuda-nvgraph-cross-aarch64-10-2 cuda-nvml-cross-aarch64-10-2 cuda-nvrtc-cross-aarch64-10-2 gcc-7-aarch64-linux-gnu-base gcc-7-cross-base gcc-8-cross-base libasan4-arm64-cross libatomic1-arm64-cross libc6-arm64-cross libc6-dev-arm64-cross libcublas-cross-aarch64 libgcc-7-dev-arm64-cross libgcc1-arm64-cross libgomp1-arm64-cross libitm1-arm64-cross liblsan0-arm64-cross libstdc++-7-dev-arm64-cross libstdc++6-arm64-cross libtsan0-arm64-cross libubsan0-arm64-cross linux-libc-dev-arm64-cross nsight-compute-addon-l4t-2019.5.0
```


* * *
# 安装 qt5 and qtcreator
```
sudo apt install qtcreator
sudo apt install qtbase5-dev qtbase5-dev-tools qtbase5-doc qtbase5-doc-html qtbase5-examples qtbase5-private-dev qt5-qmake qt5-default qt5-doc qt5-doc-html qt5-assistant qt5ct qtcreator-data qtcreator-doc qtchooser libevdev-doc qt5-style-plugins default-libmysqlclient-dev firebird-dev libpq-dev libsqlite3-dev unixodbc-dev
```
* * *
# 安装 sqlite / sqlitebrowser
```
sudo apt install sqlite sqlitebrowser sqlite-doc libqscintilla2-doc sqlite3-doc
```

* * *
# 安装 hwinfo
``
sudo apt install hwinfo
``

* * *
# 重新安装 extras
```
sudo apt install ubuntu-restricted-extras ttf-mscorefonts-installer --reinstall
```

* * *
# 未详记录
~/.Xresources
```
Xft.antialias: true
Xft.hinting: true
Xft.hintstyle: hintslight
Xft.lcdfilter: lcddefault
Xft.rgba: rgb
Xft.dpi:   107
```

* * *
# 安装 rlwrap (for vitis/vivado)
```
sudo apt install rlwrap
```


* * *
# 安装 allegro
安装一些依赖包
```
sudo apt install lsb
sudo apt install ksh lsb-core
sudo apt install vlc-bin
sudo apt install libxmu-dev:i386
```
创建dmenu启动器

`cd /usr/local/bin`

`sudo gedit allegro`
```
#!/bin/bash
cd /opt/cadence/allegro_166_patch/
source spb166
/opt/cadence/SPB166/tools/pcb/bin/allegro
```
`sudo gedit concepthdl`
```
#!/bin/bash
cd /opt/cadence/allegro_166_patch/
source spb166
/opt/cadence/SPB166/tools/bin/concepthdl
```
`sudo gedit pad_designer`
```
#!/bin/bash
cd /opt/cadence/allegro_166_patch/
source spb166
/opt/cadence/SPB166/tools/pcb/bin/pad_designer
```
`sudo chmod +x allegro pad_designer concepthdl`

`sudo gedit projmgr`
```
#!/bin/bash
cd /opt/cadence/allegro_166_patch/
source spb166
/opt/cadence/SPB166/tools/bin/projmgr
```
`sudo chmod +x projmgr`

* * *
# 创建 eagle 8.1.0 dmenu启动器

`cd /usr/local/bin`

`sudo gedit eagle`
```
#!/bin/bash
cd /opt/eagle-8.1.0/
./eagle
```
`sudo chmod +x eagle`

`ls eagle -l`



* * *
# cnpm 加速 及安装 electron
```
sudo aptitude install libssl1.0-dev
sudo aptitude install npm
sudo npm install -g cnpm --registry=https://registry.npm.taobao.org
sudo npm config set registry https://registry.npm.taobao.org

sudo npm install n -g
sudo npm install -g cnpm
sudo n stable
sudo node -v      ###shuould>10
sudo cnpm install -g electron
electron -v
```

test
```
git clone https://github.com/electron/electron-quick-start
cd electron-quick-start
cnpm install
cnpm start
```
选择安装electron版本
```
sudo cnpm install -g electron@9
electron --version
```

## 复制 electronic-wechat

/media/andreas/4be7143e-a6ab-4c1d-8456-e571b77a1014/usr/lib/electronic-wechat
```
$ exec electron . "$@"
```
运行ok

可以复制到

`/usr/lib/electronic-wechat`

* * *
# evince
```
sudo apt install evince evince-common libevince-dev gir1.2-evince-3.0
sudo apt install browser-plugin-evince
```

* * *
# 未详记录
```
sudo apt install ark fam voikko-fi phonon4qt5-backend-gstreamer hspell libdvdcss2

sudo dpkg-reconfigure libdvd-pkg

sudo apt install vlc vlc-plugin-notify vlc-plugin-qt vlc-plugin-samba vlc-plugin-skins2 vlc-plugin-video-splitter vlc-plugin-visualization

sudo apt install caja engrampa meld mate-desktop-environment lzip lzop ncompress rzip unalz fonts-mathjax-extras fonts-stix libjs-mathjax-doc mate-desktop-environment-extras rss-glx synaptic python-configobj-doc python-psutil-doc heimdal-clients  mate-sensors-applet-nvidia
```
* * *
# 安装 geany
```
sudo apt install geany geany-common geany-plugins geany-plugins-common
```

* * *
# 未详记录
```
sudo apt install rlwrap
sudo apt install libpoppler-glib-dev poppler-utils browser-plugin-evince
```

* * *
# git 有关配置修改
error: RPC failed; curl 56 GnuTLS recv error (-9): A TLS packet with unexpected length was received.

`git config --global http.postBuffer 2000000000`

not ok
```
git config --global https.postBuffer 2000000000
sudo apt install gnutls-bin
git config --global http.sslVerify false
git config --global core.longpaths true
```
anyway ok

* * *
# 修复 shutter
## 修复 shutter 编辑功能
```
sudo cpanm Goo::Canvas/libgoo-canvas-perl
```
not ok
```
sudo apt install libgoocanvas2-perl
```
not ok

<https://launchpad.net/ubuntu/+archive/primary/+files/libgoocanvas-common_1.0.0-1_all.deb>

<https://launchpad.net/ubuntu/+archive/primary/+files/libgoocanvas3_1.0.0-1_amd64.deb>

<https://launchpad.net/ubuntu/+archive/primary/+files/libgoo-canvas-perl_0.06-2ubuntu3_amd64.deb>

```
sudo dpkg -i ~/Downloads/libgoocanvas3_1.0.0-1_amd64.deb
sudo dpkg -i ~/Downloads/libgoocanvas-common_1.0.0-1_all.deb
sudo dpkg -i ~/Downloads/libgoo-canvas-perl_0.06-2ubuntu3_amd64.deb
sudo apt-get -f install
```
shutter 编辑功能ok了

## 修复 shutter 的 web-photo

<https://launchpad.net/ubuntu/+archive/primary/+files/gnome-web-photo_0.10.6-1_amd64.deb>
```
sudo dpkg -i ~/Downloads/gnome-web-photo_0.10.6-1_amd64.deb
sudo apt-get -f install
```

## 修复 shutter 的 其他
```
sudo cpanm Image::ExifTool
sudo cpanm --mirror http://mirrors.163.com/cpan/ --mirror-only Gtk2::AppIndicator
```
not ok
```
sudo apt install libgtk2-appindicator-perl
```
not ok
```
sudo apt install libappindicator-dev libgtk2.0-dev
//sudo cpan -i Gtk2::AppIndicator
sudo cpanm Gtk2::AppIndicator
```

* * *
# 安装 miredo
```
sudo apt install miredo
sudo miredo
```
另外可以作为系统服务启动参考arch wiki等

报错`Invalid host name “teredo-debian.remlab.net” at line 6: Name or service not known`
```
$ cat /etc/miredo.conf 
# Please refer to the miredo.conf(5) man page for details.
InterfaceName	teredo

# Pick a Teredo server:
ServerAddress	win10.ipv6.microsoft.com
#ServerAddress	teredo.ipv6.microsoft.com
#ServerAddress	teredo-debian.remlab.net
#ServerAddress 83.170.6.76 # ip of teredo-debian.remlab.net

# Some firewall/NAT setups require a specific UDP port number:
#BindPort	3545

$ sudo systemctl start miredo.service
$ systemctl status miredo.service -l --no-pager
```
就可以了

下面这个办法没有测试
```
I've wrote in /etc/miredo/miredo.conf

# Pick a Teredo server:
#ServerAddress teredo.ipv6.microsoft.com
#ServerAddress teredo-debian.remlab.net
ServerAddress 83.170.6.76 # ip of teredo-debian.remlab.net

And in /etc/network/if-up.d/miredo

if [ "$ADDRFAM" = "ipx" ] || [ "$ADDRFAM" = "inet6" ]; then
exit 0
fi

replaced for

if [ "$ADDRFAM" = "ipx" ] || [ "$ADDRFAM" = "inet6" ]; then
ip -6 route add default dev teredo; exit 0
fi
```


* * *
# 安装 SaleaeLogic 驱动信息
``
cat /tmp/.mount_Logic-cLBdoK/resources/linux/99-SaleaeLogic.rules | sudo tee /etc/udev/rules.d/99-SaleaeLogic.rules > /dev/null && echo "finished installing /etc/udev/rules.d/99-SaleaeLogic.rules"
``
* * *
# 安装dsview
```
sudo apt install zstd libzstd-dev libzstd1-dev
tar -I zstd -xvf dsview-1.12-2-x86_64.pkg.tar.zst


sudo apt-get install git-core build-essential cmake autoconf automake libtool pkg-config \
   libglib2.0-dev libzip-dev libudev-dev libusb-1.0-0-dev \
   python3-dev qt5-default libboost-dev libboost-test-dev libboost-thread-dev libboost-system-dev libboost-filesystem-dev check libfftw3-dev
```
/etc/udev/rules.d/DreamSourceLab.rules

```
SUBSYSTEM=="usb", ATTRS{idVendor}=="2a0e", MODE="0666"
```

* * *
# 安装 oracle java
```
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

sudo update-alternatives --config java
sudo update-alternatives --config javac


sudo tar zxvf jdk-8u291-linux-x64.tar.gz -C /usr/lib/jvm
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_291/bin/java" 1112
sudo update-alternatives --config java
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_291/bin/javac" 1112
sudo update-alternatives --config javac
sudo update-alternatives --install "/usr/bin/javah" "javah" "/usr/lib/jvm/jdk1.8.0_291/bin/javah" 1112
sudo update-alternatives --config javah
```


* * *
# android emulator
##安装 qemu-kvm
Android Studio: /dev/kvm device permission denied
```
sudo apt install qemu-kvm
ls -al /dev/kvm
grep kvm /etc/group
sudo adduser $USER kvm
grep kvm /etc/group
```
## 一般genymotion需要配合合适的vbox版本
vbox downgrade为vbox6.1.14

## maybe I don‘t need this shit adb
```
sudo apt-get install android-tools-adb
```
## android studio 里的 adb 更新一些
```
andreas@Vostro-5880:/opt/Android
$ ./android-sdk/platform-tools/adb --version
Android Debug Bridge version 1.0.41
Version 31.0.2-7242960
Installed as /opt/Android/android-sdk/platform-tools/adb
andreas@Vostro-5880:/opt/Android
$ adb --version
Android Debug Bridge version 1.0.39
Version 1:8.1.0+r23-5~18.04
Installed as /usr/lib/android-sdk/platform-tools/adb
```
## android 有关 udev 设置
```
sudo apt-get install android-tools-adb android-tools-fastboot
```
lsusb得到
```
Bus 002 Device 003: ID 2a45:0c02 Meizu Corp. MX Phone (MTP & ADB)
```
`gedit ~/.android/adb_usb.ini`
添加0x2a45
实际上直接用360手机助手文件夹里的这个文件不是很好吗

不要在android-sdk/tools/运行
`./android update adb`
会覆盖~/.android/adb_usb.ini
`~/.android/adb_usb.ini`
`/etc/udev/rules.d/50-android.rules`
```
SUBSYSTEM=="usb", ENV{DEVTYPE} == "usb_device", ATTR{idVendor}=="2a45", MODE="0666"
```
after modify rules don't forget
```
sudo /etc/init.d/udev restart
```

* * *
# 安装 tree
```
sudo apt install tree
```
* * *
# 安装 ninja-build
```
sudo apt install ninja-build
```
* * *
# 安装 cutecom
```
sudo apt install cutecom
```

* * *
# 记录
~/.bashrc
```
...
export LM_LICENSE_FILE=/opt/modelsim/license.dat:/opt/altera/license.dat:/opt/lscc/license.dat:/opt/synopsys/synopsys.dat
export PATH=$PATH:/opt/modelsim/modeltech/bin:/opt/modelsim/modeltech/linux_x86_64:/opt/altera/11.0/quartus/bin:/opt/altera/11.0/nios2eds/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/altera/11.0/quartus/dsp_builder/bin64:/opt/altera/11.0/quartus/dspba/Blocksets/BaseBlocks/linux64
...
```

* * *
# 安装 modelsim
/opt/modelsim/modeltech/bin/../linux_x86_64/vish: error while loading shared libraries: libpng12.so.0: cannot open shared object file: No such file or directory
```
cp /opt/modelsim/modeltech/linux_x86_64/libpng12.so.0* /opt/modelsim/modeltech/lib
```

* * *
# 安装 gradle
```
sudo apt install gradle gradle-doc gradle-completion
sudo apt purge gradle gradle-doc

sudo snap install gradle  # version 7.0.2, or
sudo apt  install gradle

See 'snap info gradle' for additional versions.

sudo snap install gradle --classic
```
* * *
# 安装 tty0tty
<https://github.com/freemed/tty0tty>
```
sudo apt-get install devscripts
sudo apt-get update && sudo apt-get install -y dh-make dkms build-essential
```
PKGBUILD
```
# Maintainer: foo <foo(at)gmail(dot)com>
# Contributor: bar <bar(at)gmai(dot)com>

_pkgbase=tty0tty
pkgname=tty0tty-git
pkgver=1.2.r25.g5f8d18d
pkgrel=1
pkgdesc="tty0tty Virtual Serial Cable (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/freemed/tty0tty"
license=('GPL2/Apache2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("git+https://github.com/freemed/tty0tty"
        "95-tty0tty.rules"
        "tty0tty.conf"
	"postinst"
	"prerm"
        )
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP" "SKIP")

pkgver() {
  cd ${_pkgbase}
  git describe --tags | sed 's/-/.r/; s/-/./'
}

build() {
  cd ${_pkgbase}
}

package() {
  # Install
  msg2 "Copying DKMS module..."

  # Copy dkms.conf
  install -Dm644 "${_pkgbase}"/debian/tty0tty-dkms.dkms "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  install -Dm644 "${srcdir}/95-tty0tty.rules" -t "${pkgdir}/etc/udev/rules.d/"
  install -Dm644 "${srcdir}/tty0tty.conf" -t "${pkgdir}/etc/modules-load.d/"
  install -Dm644 "${_pkgbase}"/README -t "${pkgdir}/usr/share/doc/tty0tty/"
  install -Dm755 "${srcdir}"/postinst -t "${pkgdir}/DEBIAN/"
  install -Dm755 "${srcdir}"/prerm -t "${pkgdir}/DEBIAN/"

  # Set name and version
  sed -e "s/\#MODULE_VERSION\#/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  sed -e "s/\#MODULE_VERSION\#/${pkgver}/" \
      -i "${pkgdir}"/DEBIAN/postinst
  sed -e "s/\#MODULE_VERSION\#/${pkgver}/" \
      -i "${pkgdir}"/DEBIAN/prerm

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/module/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
```
* * *
# 安装 qt5serialport5
```
sudo apt-get install libqt5serialport5
sudo apt-get install libqt5serialport5-dev
```


* * *
# 安装 mingw
```
sudo apt install binutils-mingw-w64-i686 binutils-mingw-w64-x86-64 g++-mingw-w64-i686 g++-mingw-w64-x86-64 gcc-mingw-w64-i686 gcc-mingw-w64-x86-64  gcc-mingw-w64-base g++-mingw-w64 gcc-mingw-w64 binutils-mingw-w64 gdb-mingw-w64 gdb-mingw-w64-target gfortran-mingw-w64 gfortran-mingw-w64-i686 gfortran-mingw-w64-x86-64 gnat-mingw-w64 gnat-mingw-w64-i686 gnat-mingw-w64-x86-64 gobjc++-mingw-w64 gobjc++-mingw-w64-i686 gobjc++-mingw-w64-x86-64 gobjc-mingw-w64 gobjc-mingw-w64-i686 gobjc-mingw-w64-x86-64 mingw-w64 mingw-w64-common mingw-w64-i686-dev mingw-w64-tools mingw-w64-x86-64-dev
```

* * *
# 安装 kazam
```
sudo apt install kazam
```
* * *
# 安装 gimp
```
sudo apt install gimp
```

* * *
# 安装 一些 python 模块
```
sudo -H pip3 install numpy==1.8.2 -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install scipy==1.1.0 -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install imageio -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install matplotlib==2.2.4 -i https://mirrors.163.com/pypi/simple
```


* * *
# 安装 faketime
```
sudo apt install faketime
```

* * *
# 安装 pycharm

清理
```
gedit ~/.config/JetBrains/PyCharm2020.3/pycharm64.vmoptions
rm -rf ~/.config/JetBrains/PyCharm*
rm -rf ~/.local/share/JetBrains/PyCharm*
rm -rf ~/.jetbrains/
rm -rf ~/.local/share/JetBrains
rm -rf ~/.cache/JetBrains
```

pycharm-professional.desktop
```
[Desktop Entry]
Name=Pycharm Professional
Comment=Pycharm IDE
Exec=faketime '2021-03-03 08:15:42' /opt/pycharm-professional/bin/pycharm.sh
Icon=/opt/pycharm-professional/bin/pycharm.png
Terminal=false
Type=Application
Categories=GNOME;Application;Development;
StartupNotify=true
```
激活码也没啥用
```
VUN5DND42O-eyJsaWNlbnNlSWQiOiJWVU41RE5ENDJPIiwibGljZW5zZWVOYW1lIjoi5r+A5rS75p2l5rqQIHd3d8K3YWppaHVvwrdjb20iLCJhc3NpZ25lZU5hbWUiOiIiLCJhc3NpZ25lZUVtYWlsIjoiIiwibGljZW5zZVJlc3RyaWN0aW9uIjoiIiwiY2hlY2tDb25jdXJyZW50VXNlIjpmYWxzZSwicHJvZHVjdHMiOlt7ImNvZGUiOiJEUE4iLCJwYWlkVXBUbyI6IjIwMjEtMDctMTAiLCJleHRlbmRlZCI6ZmFsc2V9LHsiY29kZSI6IkRCIiwicGFpZFVwVG8iOiIyMDIxLTA3LTEwIiwiZXh0ZW5kZWQiOmZhbHNlfSx7ImNvZGUiOiJQUyIsInBhaWRVcFRvIjoiMjAyMS0wNy0xMCIsImV4dGVuZGVkIjpmYWxzZX0seyJjb2RlIjoiSUkiLCJwYWlkVXBUbyI6IjIwMjEtMDctMTAiLCJleHRlbmRlZCI6ZmFsc2V9LHsiY29kZSI6IlJTQyIsInBhaWRVcFRvIjoiMjAyMS0wNy0xMCIsImV4dGVuZGVkIjp0cnVlfSx7ImNvZGUiOiJHTyIsInBhaWRVcFRvIjoiMjAyMS0wNy0xMCIsImV4dGVuZGVkIjpmYWxzZX0seyJjb2RlIjoiRE0iLCJwYWlkVXBUbyI6IjIwMjEtMDctMTAiLCJleHRlbmRlZCI6ZmFsc2V9LHsiY29kZSI6IlJTRiIsInBhaWRVcFRvIjoiMjAyMS0wNy0xMCIsImV4dGVuZGVkIjp0cnVlfSx7ImNvZGUiOiJQQyIsInBhaWRVcFRvIjoiMjAyMS0wNy0xMCIsImV4dGVuZGVkIjpmYWxzZX0seyJjb2RlIjoiUkMiLCJwYWlkVXBUbyI6IjIwMjEtMDctMTAiLCJleHRlbmRlZCI6ZmFsc2V9LHsiY29kZSI6IkNMIiwicGFpZFVwVG8iOiIyMDIxLTA3LTEwIiwiZXh0ZW5kZWQiOmZhbHNlfSx7ImNvZGUiOiJXUyIsInBhaWRVcFRvIjoiMjAyMS0wNy0xMCIsImV4dGVuZGVkIjpmYWxzZX0seyJjb2RlIjoiUkQiLCJwYWlkVXBUbyI6IjIwMjEtMDctMTAiLCJleHRlbmRlZCI6ZmFsc2V9LHsiY29kZSI6IlJTMCIsInBhaWRVcFRvIjoiMjAyMS0wNy0xMCIsImV4dGVuZGVkIjpmYWxzZX0seyJjb2RlIjoiUk0iLCJwYWlkVXBUbyI6IjIwMjEtMDctMTAiLCJleHRlbmRlZCI6ZmFsc2V9LHsiY29kZSI6IkFDIiwicGFpZFVwVG8iOiIyMDIxLTA3LTEwIiwiZXh0ZW5kZWQiOmZhbHNlfSx7ImNvZGUiOiJSU1YiLCJwYWlkVXBUbyI6IjIwMjEtMDctMTAiLCJleHRlbmRlZCI6dHJ1ZX0seyJjb2RlIjoiREMiLCJwYWlkVXBUbyI6IjIwMjEtMDctMTAiLCJleHRlbmRlZCI6ZmFsc2V9LHsiY29kZSI6IlJTVSIsInBhaWRVcFRvIjoiMjAyMS0wNy0xMCIsImV4dGVuZGVkIjpmYWxzZX0seyJjb2RlIjoiRFAiLCJwYWlkVXBUbyI6IjIwMjEtMDctMTAiLCJleHRlbmRlZCI6dHJ1ZX0seyJjb2RlIjoiUERCIiwicGFpZFVwVG8iOiIyMDIxLTA3LTEwIiwiZXh0ZW5kZWQiOnRydWV9LHsiY29kZSI6IlBXUyIsInBhaWRVcFRvIjoiMjAyMS0wNy0xMCIsImV4dGVuZGVkIjp0cnVlfSx7ImNvZGUiOiJQU0kiLCJwYWlkVXBUbyI6IjIwMjEtMDctMTAiLCJleHRlbmRlZCI6dHJ1ZX0seyJjb2RlIjoiUENXTVAiLCJwYWlkVXBUbyI6IjIwMjEtMDctMTAiLCJleHRlbmRlZCI6dHJ1ZX0seyJjb2RlIjoiUFBTIiwicGFpZFVwVG8iOiIyMDIxLTA3LTEwIiwiZXh0ZW5kZWQiOnRydWV9LHsiY29kZSI6IlBHTyIsInBhaWRVcFRvIjoiMjAyMS0wNy0xMCIsImV4dGVuZGVkIjp0cnVlfSx7ImNvZGUiOiJQUEMiLCJwYWlkVXBUbyI6IjIwMjEtMDctMTAiLCJleHRlbmRlZCI6dHJ1ZX0seyJjb2RlIjoiUFJCIiwicGFpZFVwVG8iOiIyMDIxLTA3LTEwIiwiZXh0ZW5kZWQiOnRydWV9LHsiY29kZSI6IlBTVyIsInBhaWRVcFRvIjoiMjAyMS0wNy0xMCIsImV4dGVuZGVkIjp0cnVlfSx7ImNvZGUiOiJSUyIsInBhaWRVcFRvIjoiMjAyMS0wNy0xMCIsImV4dGVuZGVkIjp0cnVlfV0sIm1ldGFkYXRhIjoiMDEyMDIxMDYxMVBQQU0wMDAwMDUiLCJoYXNoIjoiMjQ3MzIxOTYvMDoxMDcxMTUyOTU2IiwiZ3JhY2VQZXJpb2REYXlzIjo3LCJhdXRvUHJvbG9uZ2F0ZWQiOmZhbHNlLCJpc0F1dG9Qcm9sb25nYXRlZCI6ZmFsc2V9-U8dIpI1MByMXFxwd3R8yORzUJwXoxZzfwttApOYvGdOd5TctZR8gNPOmhWgiETWx8+94VIzhSe20uXrQX00fNf2JETdZbAbl6X6FJelXkAQamglCZb2Ld+HRZcE1Ar1cEFlzXZbDp1AAa74z99jqd3NrCGI6k92W4C94yeDS89VwKSwo2XIPpRj+t1x4qiTlXYE2NK0XJcgoA5BE8idWQxNtBM1GwCD8TUI+2HLA8T6hxqO5ErQvCuut9d3Rh0v2uf9AlL2Vw0W5WgNL/lmoOrXIt7sDB/QprEmUYmm7ccFexCXE+qZAgmmyLHlJ4umpJbh9PKW/m+zW/MBrlriJsQ==-MIIETDCCAjSgAwIBAgIBDTANBgkqhkiG9w0BAQsFADAYMRYwFAYDVQQDDA1KZXRQcm9maWxlIENBMB4XDTIwMTAxOTA5MDU1M1oXDTIyMTAyMTA5MDU1M1owHzEdMBsGA1UEAwwUcHJvZDJ5LWZyb20tMjAyMDEwMTkwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDCP4uk4SlVdA5nuA3DQC+NsEnZS9npFnO0zrmMWcz1++q2UWJNuGTh0rwi+3fUJIArfvVh7gNtIp93rxjtrQAuf4/Fa6sySp4c32MeFACfC0q+oUoWebhOIaYTYUxm4LAZ355vzt8YeDPmvWKxA81udqEk4gU9NNAOz1Um5/8LyR8SGsSc4EDBRSjcMWMwMkYSauGqGcEUK8WhfplsyF61lKSOFA6VmfUmeDK15rUWWLbOMKgn2cxFA98A+s74T9Oo96CU7rp/umDXvhnyhAXSukw/qCGOVhwKR8B6aeDtoBWQgjnvMtPgOUPRTPkPGbwPwwDkvAHYiuKJ7Bd2wH7rAgMBAAGjgZkwgZYwCQYDVR0TBAIwADAdBgNVHQ4EFgQUJNoRIpb1hUHAk0foMSNM9MCEAv8wSAYDVR0jBEEwP4AUo562SGdCEjZBvW3gubSgUouX8bOhHKQaMBgxFjAUBgNVBAMMDUpldFByb2ZpbGUgQ0GCCQDSbLGDsoN54TATBgNVHSUEDDAKBggrBgEFBQcDATALBgNVHQ8EBAMCBaAwDQYJKoZIhvcNAQELBQADggIBAB2J1ysRudbkqmkUFK8xqhiZaYPd30TlmCmSAaGJ0eBpvkVeqA2jGYhAQRqFiAlFC63JKvWvRZO1iRuWCEfUMkdqQ9VQPXziE/BlsOIgrL6RlJfuFcEZ8TK3syIfIGQZNCxYhLLUuet2HE6LJYPQ5c0jH4kDooRpcVZ4rBxNwddpctUO2te9UU5/FjhioZQsPvd92qOTsV+8Cyl2fvNhNKD1Uu9ff5AkVIQn4JU23ozdB/R5oUlebwaTE6WZNBs+TA/qPj+5/wi9NH71WRB0hqUoLI2AKKyiPw++FtN4Su1vsdDlrAzDj9ILjpjJKA1ImuVcG329/WTYIKysZ1CWK3zATg9BeCUPAV1pQy8ToXOq+RSYen6winZ2OO93eyHv2Iw5kbn1dqfBw1BuTE29V2FJKicJSu8iEOpfoafwJISXmz1wnnWL3V/0NxTulfWsXugOoLfv0ZIBP1xH9kmf22jjQ2JiHhQZP7ZDsreRrOeIQ/c4yR8IQvMLfC0WKQqrHu5ZzXTH4NO3CwGWSlTY74kE91zXB5mwWAx1jig+UXYc2w4RkVhy0//lOmVya/PEepuuTTI4+UJwC7qbVlh5zfhj8oTNUXgN0AOc+Q0/WFPl1aw5VV/VrO8FCoB15lFVlpKaQ1Yh+DVU8ke+rt9Th0BCHXe0uZOEmH0nOnH/0onD
```
不如用无限试用呢

无限试用有两种方法，一种是上面那么删配置文件，另一种是ide-eval-resetter插件

插件一般在~/.local/share/JetBrains/PyCharm*






* * *
# 安装 peco
sudo apt install peco

* * *
# 安装 virtualenv
sudo apt install virtualenv

* * *
# 安装 一些 python 模块
```
sudo -H pip3 install --upgrade pip -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install pyinstaller -i https://mirrors.163.com/pypi/simple
//sudo -H pip3 install pyQt5==5.12.0 -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install pyQt5 -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install pyQt5-tools -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install pyqtdoc -i https://mirrors.163.com/pypi/simple
```

* * *
# 安装 pyqt5
```
sudo apt install qt5-default qttools5-dev-tools
sudo apt install pyqt5* 
```

* * *
# 创建 一些 dmenu 启动器

`cd /usr/local/bin`

`sudo gedit uex`
```
#!/bin/bash
rm ${HOME}/.idm/*.spl
rm /tmp/*.spl
rm ${HOME}/.idm/uex/*.spl
cd /opt/uex/bin
./uex
```
`sudo chmod +x uex`

`sudo gedit pycharm`
```
#!/bin/bash
/opt/pycharm-professional/bin/pycharm.sh
```
`sudo chmod +x pycharm`

`sudo gedit android-studio`
```
#!/bin/bash
/opt/android-studio/bin/studio.sh
```
`sudo chmod +x android-studio`

`sudo gedit baidunetdisk`
```
#!/bin/bash
/opt/baidunetdisk/baidunetdisk  --no-sandbox %U
```
`sudo chmod +x baidunetdisk`

`sudo gedit genymotion`
```
#!/bin/bash
/opt/genymotion/genymotion/genymotion
```
`sudo chmod +x genymotion`

`sudo gedit electronic-wechat`
```
#!/bin/bash
/opt/electronic-wechat-linux-x64/electronic-wechat
```
`sudo chmod +x electronic-wechat`

`sudo gedit vivado`
```
#!/bin/bash
/opt/Xilinx/Vivado/2020.1/bin/vivado
```
`sudo chmod +x vivado`

`sudo gedit vitis`
```
#!/bin/bash
/opt/Xilinx/Vitis/2020.1/bin/vitis 
```
`sudo chmod +x vitis`

* * *
# 安装 一些 包
```
sudo apt install ant ant-optional antlr bnd default-jdk-doc groovy groovy-doc ivy junit4 libaopalliance-java libbcel-java libbcpg-java libbcprov-java libbindex-java libbsf-java libcdi-api-java libcommons-codec-java libcommons-collections3-java libcommons-io-java libcommons-lang-java libcommons-lang3-java libdd-plist-java libdom4j-java libfelix-framework-java libfelix-gogo-runtime-java libfelix-osgi-obr-java libfelix-resolver-java libfindbugs-java libgeronimo-annotation-1.3-spec-java libgeronimo-interceptor-3.0-spec-java libgoogle-gson-java libgpars-groovy-java libgradle-core-java libgradle-plugins-java libguice-java libhamcrest-java libhttpclient-java libhttpcore-java libjarjar-java libjatl-java libjavaewah-java libjaxen-java libjaxp1.3-java libjcifs-java libjcip-annotations-java libjcommander-java libjcsp-java libjformatstring-java libjgit-java libjsch-java libjsoup-java libjsr166y-java libkryo-java libkxml2-java liblogback-java libmaven-parent-java libmaven-resolver-java libmaven-shared-utils-java libmaven3-core-java libminlog-java libmultiverse-core-java libnative-platform-java libnative-platform-jni libnekohtml-java libobjenesis-java libosgi-annotation-java libosgi-compendium-java libosgi-core-java libplexus-cipher-java libplexus-classworlds-java libplexus-component-annotations-java libplexus-container-default-java libplexus-container-default1.5-java libplexus-interpolation-java libplexus-sec-dispatcher-java libplexus-utils-java libplexus-utils2-java libpolyglot-maven-java libqdox-java libreflectasm-java librhino-java libservlet3.1-java-doc libsimple-http-java libsisu-inject-java libsisu-plexus-java libwagon-file-java libwagon-http-java libwagon-provider-api-java libxalan2-java libxbean-reflect-java libxerces2-java libxml-commons-external-java libxml-commons-resolver1.1-java libxpp3-java libxstream-java libyaml-snake-java linux-hwe-5.4-headers-5.4.0-72 openjdk-11-doc testng

sudo apt install linux-headers-5.4.0-73-generic linux-hwe-5.4-headers-5.4.0-73 linux-image-5.4.0-73-generic linux-modules-5.4.0-73-generic linux-modules-extra-5.4.0-73-generic

apt list --upgradable
```



* * *
# 安装 graphviz 等
```
sudo apt install iverilog verilator gtkwave yosys yosys-doc graphviz graphviz-doc
sudo apt-get install build-essential clang bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git \
	graphviz xdot pkg-config python3 libboost-system-dev \
	libboost-python-dev libboost-filesystem-dev zlib1g-dev
sudo apt-get install inkscape dia
```

* * *
# 安装 秒表
```
sudo apt-get install orage stopwatch gnome-clocks
```



* * *
# 安装 qt4-demos
```
sudo apt-get install qt4-demos
The following NEW packages will be installed:
  libqt4-declarative-gestures libqt4-declarative-particles libqt4-designer libqt4-dev libqt4-dev-bin libqt4-help libqt4-opengl-dev libqt4-qt3support libqt4-scripttools libqt4-test qt4-demos qt4-designer
  qt4-dev-tools qt4-doc qt4-linguist-tools qt4-qmake


sudo apt-get install libsqlite0-dev qt4-qmlviewer qt4-doc-html
```


* * *
# 编译 qt 5.15.2 静态库 和 mingw 静态库

qt-everywhere-src-5.15.2

ubuntu18.04/static_gcc
```
./configure -confirm-license -opensource -platform linux-g++ -c++std c++11 -static -release -fontconfig -system-freetype -opengl desktop -pkg-config -dbus-linked  -ltcg -prefix /opt/Qt5.15_static OPENSSL_LIBS="-lssl -lcrypto -ldl -lpthread" -qt-sqlite -qt-pcre -plugin-sql-sqlite -qt-zlib -qt-harfbuzz -qt-libpng -qt-libjpeg -qt-libpng -qt-tiff -qt-webp -skip qtwayland -skip qtscript -no-compile-examples

gmake -j$(nproc)
gmake install
```
```
sudo apt-get install libz-mingw-w64 libz-mingw-w64-dev libgcrypt-mingw-w64-dev ocaml-mingw-w64 ocaml-mingw-w64-x86-64 ocaml-mingw-w64-i686
```

<https://launchpad.net/~cybermax-dexter/+archive/ubuntu/mingw-w64-backport>
```
sudo add-apt-repository ppa:cybermax-dexter/mingw-w64-backport
sudo apt-get update
sudo apt-get upgrade
```
```
sudo aptitude install gcc-mingw-w64-base
      Remove the following packages:                                          
1)      g++-mingw-w64 [9.3.0-11ubuntu0~18.04.1+22~exp1ppa5 (bionic, now)]     
2)      g++-mingw-w64-i686 [7.3.0-11ubuntu1+20.2build1 (bionic, now)]         
3)      g++-mingw-w64-x86-64 [7.3.0-11ubuntu1+20.2build1 (bionic, now)]       
4)      gcc-mingw-w64 [9.3.0-11ubuntu0~18.04.1+22~exp1ppa5 (bionic, now)]     
5)      gcc-mingw-w64-i686 [7.3.0-11ubuntu1+20.2build1 (bionic, now)]         
6)      gcc-mingw-w64-x86-64 [7.3.0-11ubuntu1+20.2build1 (bionic, now)]       
7)      gfortran-mingw-w64 [9.3.0-11ubuntu0~18.04.1+22~exp1ppa5 (bionic, now)]
8)      gfortran-mingw-w64-i686 [7.3.0-11ubuntu1+20.2build1 (bionic, now)]    
9)      gfortran-mingw-w64-x86-64 [7.3.0-11ubuntu1+20.2build1 (bionic, now)]  
10)     gnat-mingw-w64 [9.3.0-11ubuntu0~18.04.1+22~exp1ppa5 (bionic, now)]    
11)     gnat-mingw-w64-i686 [7.3.0-11ubuntu1+20.2build1 (bionic, now)]        
12)     gnat-mingw-w64-x86-64 [7.3.0-11ubuntu1+20.2build1 (bionic, now)]      
13)     gobjc++-mingw-w64 [9.3.0-11ubuntu0~18.04.1+22~exp1ppa5 (bionic, now)] 
14)     gobjc++-mingw-w64-i686 [7.3.0-11ubuntu1+20.2build1 (bionic, now)]     
15)     gobjc++-mingw-w64-x86-64 [7.3.0-11ubuntu1+20.2build1 (bionic, now)]   
16)     gobjc-mingw-w64 [9.3.0-11ubuntu0~18.04.1+22~exp1ppa5 (bionic, now)]   
17)     gobjc-mingw-w64-i686 [7.3.0-11ubuntu1+20.2build1 (bionic, now)]       
18)     gobjc-mingw-w64-x86-64 [7.3.0-11ubuntu1+20.2build1 (bionic, now)]     
19)     mingw-w64 [8.0.0-1ppa1 (bionic, now)] 
```

```
sudo apt-get install g++-mingw-w64 gcc-mingw-w64 gfortran-mingw-w64 gnat-mingw-w64 gobjc++-mingw-w64 gobjc-mingw-w64 mingw-w64 gcc-mingw-w64
sudo aptitude install gcc-mingw-w64 mingw-w64 

libgcc-s1 (>= 4.2) which is a virtual package and is not provided by any available package
```
download gcc-10-base
```
wget http://mirrors.edge.kernel.org/ubuntu/pool/main/g/gcc-10/gcc-10-base_10-20200411-0ubuntu1_amd64.deb
download libgcc-s1
wget http://mirrors.xmission.com/ubuntu/pool/main/g/gcc-10/libgcc-s1_10-20200411-0ubuntu1_amd64.deb
```
```
sudo aptitude install mingw-w64 gcc-mingw-w64
The following NEW packages will be installed:
  g++-mingw-w64{a} g++-mingw-w64-i686{a} g++-mingw-w64-x86-64{a} gcc-mingw-w64 gcc-mingw-w64-i686{a} gcc-mingw-w64-xmingw-w6486-64{a} mingw-w64
```
```
sudo apt-get install g++-mingw-w64 gcc-mingw-w64 gfortran-mingw-w64 gnat-mingw-w64 gobjc++-mingw-w64 gobjc-mingw-w64 mingw-w64 gcc-mingw-w64 gdb-mingw-w64
```
ok
```
sudo apt-get install mingw-w64-common mingw-w64-tools mingw-w64-x86-64-dev  mingw-w64-i686-dev mingw-ocaml
```

这个版本也是Thread model: win32
不是POSIX，会报错‘mutex’ is not a member of ‘QtPrivate’ 之类

Always build with -nomake tests -nomake examples especially when doing a static build
也还是报这个错
```
sudo apt-get purge mingw-w64-common mingw-w64-tools mingw-w64-x86-64-dev  mingw-w64-i686-dev mingw-ocaml gcc-mingw-w64-base
sudo apt-get purge g++-mingw-w64 gcc-mingw-w64 gfortran-mingw-w64 gnat-mingw-w64 gobjc++-mingw-w64 gobjc-mingw-w64 mingw-w64 gcc-mingw-w64 gdb-mingw-w64
```
恢复 7.3 的 mingw-w64
```
sudo apt-get install libgcc1 --reinstall
sudo apt remove gcc-10-base
sudo apt remove g++-mingw-w64* g++-mingw-w64-i686* g++-mingw-w64-x86-64* gcc-10-base* gcc-mingw-w64* gcc-mingw-w64-i686* gcc-mingw-w64-x86-64* gfortran-mingw-w64* gfortran-mingw-w64-i686* gfortran-mingw-w64-x86-64* gnat-mingw-w64* gnat-mingw-w64-i686* gnat-mingw-w64-x86-64* gobjc++-mingw-w64* gobjc++-mingw-w64-i686* gobjc++-mingw-w64-x86-64* gobjc-mingw-w64* gobjc-mingw-w64-i686* gobjc-mingw-w64-x86-64* libgcc-s1* mingw-w64* gcc-mingw-w64-base
sudo apt-get install g++-mingw-w64 gcc-mingw-w64 gfortran-mingw-w64 gnat-mingw-w64 gobjc++-mingw-w64 gobjc-mingw-w64 mingw-w64 gcc-mingw-w64 gdb-mingw-w64 mingw-w64-common mingw-w64-tools mingw-w64-x86-64-dev  mingw-w64-i686-dev mingw-ocaml gcc-mingw-w64-base binutils-mingw-w64-i686 binutils-mingw-w64-x86-64 g++-mingw-w64-i686 g++-mingw-w64-x86-64 gcc-mingw-w64-i686 gcc-mingw-w64-x86-64  gcc-mingw-w64-base g++-mingw-w64 gcc-mingw-w64 binutils-mingw-w64 gdb-mingw-w64 gdb-mingw-w64-target gfortran-mingw-w64 gfortran-mingw-w64-i686 gfortran-mingw-w64-x86-64 gnat-mingw-w64 gnat-mingw-w64-i686 gnat-mingw-w64-x86-64 gobjc++-mingw-w64 gobjc++-mingw-w64-i686 gobjc++-mingw-w64-x86-64 gobjc-mingw-w64 gobjc-mingw-w64-i686 gobjc-mingw-w64-x86-64 mingw-w64 mingw-w64-common mingw-w64-i686-dev mingw-w64-tools mingw-w64-x86-64-dev libz-mingw-w64 libz-mingw-w64-dev libgcrypt-mingw-w64-dev ocaml-mingw-w64 ocaml-mingw-w64-x86-64 ocaml-mingw-w64-i686 g++-mingw-w64 gcc-mingw-w64 gfortran-mingw-w64 gnat-mingw-w64 gobjc++-mingw-w64 gobjc-mingw-w64 mingw-w64 gcc-mingw-w64

sudo apt-get install linux-headers-5.4.0-74-generic linux-hwe-5.4-headers-5.4.0-74 linux-image-5.4.0-74-generic linux-modules-5.4.0-74-generic
```
保留老内核


* * *
# mysqlclient
目前libmysqlclient-dev libmysqlclient20不更新/安装，其他apt未报错


* * *
# tar 命令显示进度条
```
sudo apt-get install pv
```
解压
```
pv question.tar.gz | tar -zxf -
pv qt-everywhere-src-5.15.2.tar.xz | tar -Jxpf -
```
压缩
```
tar -cf - questions.sql | pv -s $(du -sk questions.sql | awk '{print $1}') | gzip > question.tar.gz
tar -cf - questions.sql | pv -s $(($(du -sk questions.sql | awk '{print $1}') * 1024)) | gzip > question.tar.gz
```


* * *
# 安装 qt 的 其他模块 及配置 creator
```
sudo apt install qtdeclarative5-dev qml-module-qtquick-scene2d qml-module-qtquick-scene3d qmlscene
sudo apt install lldb
```
qt4:
```
/usr/lib/x86_64-linux-gnu/qt4/bin/qmake
```
qt5:
```
/usr/lib/qt5/bin/qmake
```
qt5_static:
```
/opt/Qt5.15_static/bin/qmake
```




* * *
# 安装 一些 包
```
sudo add-apt-repository ppa:savoury1/backports
sudo apt-get update
sudo apt-get upgrade

sudo apt install libmpc3 libmpc-dev

sudo apt install meson ninja-build

sudo apt install --reinstall bash-completion
```
* * *
# 安装 makedeb
```
sudo apt install libarchive-tools
sudo dpkg -i makepkg_all_6.0.0-3.1.deb
sudo dpkg -i makedeb_all_5.9.1-1.deb
```


* * *
# 重新打包deb
```
mkdir extract
mkdir extract/DEBIAN
mkdir build
dpkg -X mingw-w64-binutils_2.36.1-1_amd64.deb extract
dpkg -e mingw-w64-binutils_2.36.1-1_amd64.deb extract/DEBIAN/
```
这里修改deb包内容
打包出deb(从已有的可以执行文件，同样按照这个方法可以打包出deb)
```
dpkg-deb -b extract/ build/
```
生成的deb在build目录




* * *
# 从源码编译生成deb包

## 方法一: 使用checkinstall方法创建deb包
checkinstall不仅可以生成deb包，还可以生成rpm包，使用简单，但是不灵活，功能粗糙，只做介绍，不推荐使用
目录格式要求是x.x.x 这样的版本格式，其中x为数字

### example1： 
```
$ tar xvjf fceu-0.98.12.src.tar.bz2 // 解包
$ cd fceu;./configure;make // 编译
$ checkinstall -D -y -install=no --pkgversion-0.98 --pkgname=fceuxy --pkgcource=./ --showinstall=no -default make install // 制作deb包
```
此时当前目录下生成了deb包

### example2： 
```
cd xxx-1.0
make distclean
./configure
make
checkinstall -D -y --install=no --pkgversion=1.0 --maintainer=xxx@yyy.com --requires=libc6,libnessus2,libssl0.9.8,bison,libxml2,libcurl3,libinotifytools0
```
--requires指定依赖的包，这里需要注意两个包的名字之间没有空格


checkinstall详细例程

<https://www.ibm.com/developerworks/cn/linux/l-cn-checkinstall/index.html>

## 方法二: 使用dpkg方法创建deb包
dpkg是最基本的制作deb包的方法，推荐使用

### example1： 非debian修改源码
```
$ tar xvjf fceu-0.98.12.src.tar.bz2 // 解包
$ mv fceu fceu-0.98 // 改目录名为 包名-版本号
$ cd fceu-0.98
$ dh_make -s -e xieyan0811@sina.com.cn -f ../fceu-0.98.12.src.tar.bz2 // 生成制作deb包所需的默认信息， 这里的-s是single binary的意思，我一般都是制作single binary，不给出的话会让你选择[s/i/m/l/k/n/b]
```
此时当前目录下生成了debian目录，此时通常修改两个文件：

修改debian/control文件，配置你的信息，具体字段见参考部分
  
修改debian/rules脚本，它决定编译参数(也可以不改)，文件末尾要以空行结束
比如修改
```
override_dh_auto_configure:
	./configure --prefix=/opt/xxx --enable-static
```

意思是覆盖默认的 ./configure 行为
```
$ dpkg-buildpackage -rfakeroot
```
此时可以看到，上一层目录(../)中已建立了deb包

官方的debian制作手册（比较长）

<https://www.debian.org/doc/manuals/maint-guide/index.zh-cn.html>


### example2：
```
# cd c-icap-0.2.2
# ./configure --enable-static --prefix=/opt/c-icap
# make dist
```
将会把源码打包为 c-icap-0.2.2.tar.gz
```
# mv c-icap-0.2.2.tar.gz ..
# dh_make -f ../c-icap-0.2.2.tar.gz
```
将会在本目录生成 debian 目录，里面是 deb 包的模板。

修改 debian 里的 rules 文件，在文件最后追加下列内容，文件末尾要以空行结束：
```
override_dh_auto_configure:
 ./configure --prefix=/opt/c-icap --enable-static
```
意思是覆盖默认的 ./configure 行为。

最后，生成 deb 安装包：
```
dpkg-buildpackage
```
deb 文件将被生成在父目录下。

### example3：
生成 zlib 的 deb 安装包

由于 zlib 的源码包不支持 make dist 进行源码打包，所以步骤有所变更：

#### 1. 生成模板：
```
# cd zlib-1.2.7
# dh_make -native
```
#### 2. 修改 debian/rules 文件，覆盖默认的 ./configure 行为：
```
override_dh_auto_configure:
 ./configure --prefix=/opt/zlib
```
#### 3. 生成 deb 安装包：
```
# dpkg-buildpackage
```
注意：为 squid 生成 deb 包时，需要安装 cppuint：
```
apt-get install libcppunit-dev
```

### example4：经过debian修改源码
```
git_2.11.0.orig.tar.xz
git_2.11.0-3+deb9u5.debian.tar.xz
git_2.11.0-3+deb9u5.dsc
sudo apt-get install dh-exec dh-apache2
dpkg-source -x git_2.11.0-3+deb9u5.dsc
cd git-2.11.0
dpkg-buildpackage -rfakeroot -uc -b      # dpkg-buildpackage -rfakeroot -D -us -uc
```
这里'-rfakeroot'指定命令使用fakeroot程序来模仿root权限(来实现所有者(ownership)目的)，'-uc'表示"Don't cryptographically sign the changelog"，'-b'代表只建立二进制包。



### example5：直接拉取仓库里的源码
```
apt-get source git
```
修改debian/control

Replace all the occurences of “libcurl4-gnutls-dev” to “libcurl4-openssl-dev”

修改debian/rules

delete the line “TEST =test”
```
sudo dpkg-buildpackage -rfakeroot -b
sudo dpkg -i git_... 
```

## 方法三: 模仿makepkg的工具
makedeb 或者 unipkg

最简单，编写或修改PKGBUILD文件

比如安装makedeb

makedeb_all_5.9.1-1.deb

依赖

makepkg_all_6.0.0-3.1.deb

makepkg 需要 bash4.4以上才支持 local -

官方的PPA仓库bash源码， 16.04 Xenial 只到 4.3
<https://launchpad.net/ubuntu/+source/bash>
下面有可选PPA仓库
比如<https://launchpad.net/~savoury1/+archive/ubuntu/backports>就很合适
#### 更新bash
```
sudo add-apt-repository ppa:savoury1/backports
sudo apt-get update
sudo apt-get upgrade 
bash --version
```

获得合适的cflags和cxxflags
```
python3-config --cflags
```
修改cflags和cxxflags到
```
/etc/makepkg.conf
```
修改/etc/makepkg.conf的
```
#MAKEFLAGS="-j2"
为
MAKEFLAGS="-j$(nproc)"
```
另外修改/usr/bin/makedeb
```
DEFAULT VALUES的
export INSTALL='FALSE'
换到793行去，防止configure找不到install工具路径(可以看config.log是否有/usr/bin/install，不能是0,否则无法生成deb，对比直接用makepkg的config.log)
```
可以在arch包网址或者AUR获得参照的PKGBUILD文件
这样基本上可以用makedeb编译出deb包


## arch转换到deb包

从makedeb修改出了凑合用的convert_arch_to_deb

跳过编译，但是还是需要PKGBUILD文件提供少量信息

由于arch的基本库如glibc什么的，还有编译器，都比ubuntu/debian的LTS版本新，所以很多转换的包都无法运行，

从arch迁移软件到deb系列，主要还是用源码编译靠谱。

反之，从deb迁移到arch（debtap 或者 makepkg配合PKGBUILD文件 都可以进行这种转换），基本上都能直接用。


## 将rpm包转为deb包 

使用alien
```
fakeroot alien name.rpm
```

* * *
# 升级 gcc
为避免麻烦，尽量升级gcc
```
sudo update-alternatives --config gcc
update-alternatives: error: no alternatives for gcc

sudo apt-get install -y \
                   g++-8 \
                   gcc-8 \
                   libc-dev \
                   make \
                   xz-utils \
                   ca-certificates \
                   libtool \
                   pkg-config \
                   wget
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 10
sudo apt install gnat-8
```


## mingw-w64编译顺序 [abort]

### 1.mingw-w64-headers

mingw-w64编译好之后安装问题
```
sudo aptitude remove gcc-mingw-w64-i686
The following packages will be REMOVED:
  binutils-mingw-w64-i686{u} g++-mingw-w64{a} g++-mingw-w64-i686{a} gcc-mingw-w64{a} gcc-mingw-w64-i686 libgeos-3.6.2{u} libntfs-3g88{u} libsensors4:i386{u} mingw-w64{a} mingw-w64-i686-dev{u} 
sudo dpkg -i mingw-w64-headers_9.0.0-2_all.deb
```
### 2.mingw-w64-binutils
### 3.mingw-w64-gcc fail
### 4.mingw-w64-crt fail
### 5.mingw-w64-winpthreads fail


sudo add-apt-repository ppa:savoury1/build-tools
sudo apt-get update
安装7.5版本（原始是7.3，比较新那个是8.3)

## 还原 mingw
```
sudo apt-get install libgcc1 --reinstall
sudo apt remove gcc-10-base
sudo apt remove g++-mingw-w64* g++-mingw-w64-i686* g++-mingw-w64-x86-64* gcc-10-base* gcc-mingw-w64* gcc-mingw-w64-i686* gcc-mingw-w64-x86-64* gfortran-mingw-w64* gfortran-mingw-w64-i686* gfortran-mingw-w64-x86-64* gnat-mingw-w64* gnat-mingw-w64-i686* gnat-mingw-w64-x86-64* gobjc++-mingw-w64* gobjc++-mingw-w64-i686* gobjc++-mingw-w64-x86-64* gobjc-mingw-w64* gobjc-mingw-w64-i686* gobjc-mingw-w64-x86-64* libgcc-s1* mingw-w64* gcc-mingw-w64-base
sudo apt-get install g++-mingw-w64 gcc-mingw-w64 gfortran-mingw-w64 gnat-mingw-w64 gobjc++-mingw-w64 gobjc-mingw-w64 mingw-w64 gcc-mingw-w64 gdb-mingw-w64 mingw-w64-common mingw-w64-tools mingw-w64-x86-64-dev  mingw-w64-i686-dev mingw-ocaml gcc-mingw-w64-base binutils-mingw-w64-i686 binutils-mingw-w64-x86-64 g++-mingw-w64-i686 g++-mingw-w64-x86-64 gcc-mingw-w64-i686 gcc-mingw-w64-x86-64  gcc-mingw-w64-base g++-mingw-w64 gcc-mingw-w64 binutils-mingw-w64 gdb-mingw-w64 gdb-mingw-w64-target gfortran-mingw-w64 gfortran-mingw-w64-i686 gfortran-mingw-w64-x86-64 gnat-mingw-w64 gnat-mingw-w64-i686 gnat-mingw-w64-x86-64 gobjc++-mingw-w64 gobjc++-mingw-w64-i686 gobjc++-mingw-w64-x86-64 gobjc-mingw-w64 gobjc-mingw-w64-i686 gobjc-mingw-w64-x86-64 mingw-w64 mingw-w64-common mingw-w64-i686-dev mingw-w64-tools mingw-w64-x86-64-dev libz-mingw-w64 libz-mingw-w64-dev libgcrypt-mingw-w64-dev ocaml-mingw-w64 ocaml-mingw-w64-x86-64 ocaml-mingw-w64-i686 g++-mingw-w64 gcc-mingw-w64 gfortran-mingw-w64 gnat-mingw-w64 gobjc++-mingw-w64 gobjc-mingw-w64 mingw-w64 gcc-mingw-w64

apt-cache showpkg gcc-mingw-w64-x86-64
sudo aptitude install gcc-mingw-w64-x86-64=7.3.0-11ubuntu1+20.2build1

      Downgrade the following packages:                                                                              
1)      g++-mingw-w64-i686 [7.5.0-3ubuntu1~18.04+20.3~18.04.sav0 (now) -> 7.3.0-11ubuntu1+20.2build1 (bionic)]       
2)      g++-mingw-w64-x86-64 [7.5.0-3ubuntu1~18.04+20.3~18.04.sav0 (now) -> 7.3.0-11ubuntu1+20.2build1 (bionic)]     
3)      gcc-mingw-w64-base [7.5.0-3ubuntu1~18.04+20.3~18.04.sav0 (now) -> 7.3.0-11ubuntu1+20.2build1 (bionic)]       
4)      gcc-mingw-w64-i686 [7.5.0-3ubuntu1~18.04+20.3~18.04.sav0 (now) -> 7.3.0-11ubuntu1+20.2build1 (bionic)]       
5)      gfortran-mingw-w64-i686 [7.5.0-3ubuntu1~18.04+20.3~18.04.sav0 (now) -> 7.3.0-11ubuntu1+20.2build1 (bionic)]  
6)      gfortran-mingw-w64-x86-64 [7.5.0-3ubuntu1~18.04+20.3~18.04.sav0 (now) -> 7.3.0-11ubuntu1+20.2build1 (bionic)]
7)      gnat-mingw-w64-i686 [7.5.0-3ubuntu1~18.04+20.3~18.04.sav0 (now) -> 7.3.0-11ubuntu1+20.2build1 (bionic)]      
8)      gnat-mingw-w64-x86-64 [7.5.0-3ubuntu1~18.04+20.3~18.04.sav0 (now) -> 7.3.0-11ubuntu1+20.2build1 (bionic)]    
9)      gobjc++-mingw-w64-i686 [7.5.0-3ubuntu1~18.04+20.3~18.04.sav0 (now) -> 7.3.0-11ubuntu1+20.2build1 (bionic)]   
10)     gobjc++-mingw-w64-x86-64 [7.5.0-3ubuntu1~18.04+20.3~18.04.sav0 (now) -> 7.3.0-11ubuntu1+20.2build1 (bionic)] 
11)     gobjc-mingw-w64-i686 [7.5.0-3ubuntu1~18.04+20.3~18.04.sav0 (now) -> 7.3.0-11ubuntu1+20.2build1 (bionic)]     
12)     gobjc-mingw-w64-x86-64 [7.5.0-3ubuntu1~18.04+20.3~18.04.sav0 (now) -> 7.3.0-11ubuntu1+20.2build1 (bionic)] 

sudo aptitude install mingw-w64-common=5.0.3-1 mingw-w64-i686-dev=5.0.3-1 mingw-w64-tools=5.0.3-1 mingw-w64-x86-64-dev=5.0.3-1 mingw-w64-tools=5.0.3-1 mingw-w64-x86-64-dev=5.0.3-1 mingw-w64-i686-dev=5.0.3-1
```
## 增加 可选的 gcc 版本 alternatives
```
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 1
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 1
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
```




## 静态编译的qt程序无法运行
```
$ QT_DEBUG_PLUGINS=1 ./HelloWorld 
QFactoryLoader::QFactoryLoader() ignoring "org.qt-project.Qt.QPA.QPlatformIntegrationFactoryInterface.5.3" since plugins are disabled in static builds
qt.qpa.plugin: Could not find the Qt platform plugin "xcb" in ""
This application failed to start because no Qt platform plugin could be initialized. Reinstalling the application may fix this problem.
Aborted (core dumped)
```
```
sudo apt install xcb libqt5dxcb-plugin  qt5dxcb-plugin
```
没有啥用
```
cat /usr/lib/x86_64-linux-gnu/qt5/qt.conf
/usr/lib/x86_64-linux-gnu/qt5/plugins

sudo apt install libxkbcommon-dev
sudo apt install '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev
```



* * *
# 安装 project
安装

Download openproj from <http://sourceforge.net/projects/openproj/> Yes, you can only download the rpm file. But you can also install it in Ubuntu via alien. sudo apt-get install alien sudo alien -i openproj.rpm

错误

Your Java vendor is "Oracle Corporation". To run OpenProj, you need the Sun Java implementation. The auto-detected Java Runtime used is..

解决办法

修改$HOME/.openproj/run.conf，将JAVA_OPTS="-Xms128m -Xmx768m"改为JAVA_OPTS="-Djava.vendor=Sun -Xms128m -Xmx768m"，
也可也修改/usr/bin/openproj脚本的
```
run_openproj() {

if [ "$LOG_LEVEL" ] && [ "x$LOG_LEVEL" = "xDEBUG" ]; then
    "$JAVA_EXE" $JAVA_OPTS -Djava.vendor="Sun Microsystems Inc."  -jar "$OPENPROJ_HOME/openproj.jar" $ARGS > "$LOG_FILE"
else
    "$JAVA_EXE" $JAVA_OPTS -Djava.vendor="Sun Microsystems Inc."  -jar "$OPENPROJ_HOME/openproj.jar" $ARGS > /dev/null 2>&1
fi
}
```

`sudo gedit /usr/bin/openproj`

在头部添加
```
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_291/
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$CLASSPATH:$JAVA_HOME/lib:$JRE_HOME/lib
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
```
我这里安装了jdk8,实际上也还是能用。


不过呢，用wps的et，group功能也是个简单的project工具嘛






* * *
# HLS 修复依赖关系

HDL opencv_gcc 报错 libpng12.so.0 => not found
```
andreas@Vostro-5880:/opt/Xilinx/Vivado/2018.3/lnx64/tools/opencv/opencv_gcc
$ ldd libopencv_highgui.so
	linux-vdso.so.1 (0x00007fff3d908000)
	libgtk3-nocsd.so.0 => /usr/lib/x86_64-linux-gnu/libgtk3-nocsd.so.0 (0x00007f896412f000)
	libopencv_core.so.2.4 (0x00007f8963cb5000)
	libopencv_imgproc.so.2.4 (0x00007f89637c8000)
	libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f89635c4000)
	libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f89633a5000)
	librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007f896319d000)
	libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007f8962f80000)
	libjpeg.so.62 => /usr/lib/x86_64-linux-gnu/libjpeg.so.62 (0x00007f8962d5c000)
	libpng12.so.0 => not found
	libOpenCL.so.1 => /usr/local/cuda/targets/x86_64-linux/lib/libOpenCL.so.1 (0x00007f8962b55000)
	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f89627b7000)
	libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f896242e000)
	libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f8962216000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f8961e25000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f896473b000)
```
```
$ locate libpng12.so.0
/opt/MATLAB/R2010b/bin/glnxa64/libpng12.so.0
/opt/MATLAB/R2010b/bin/glnxa64/libpng12.so.0.39.0
/opt/MATLAB/R2010b/toolbox/sl3d/orbisnap/bin/glnxa64/libpng12.so.0
/opt/MATLAB/R2010b/toolbox/sl3d/orbisnap/bin/glnxa64/libpng12.so.0.39.0
/opt/MATLAB/R2017b/bin/glnxa64/libpng12.so.0
/opt/MATLAB/R2017b/bin/glnxa64/libpng12.so.0.39.0
/opt/MATLAB/R2017b/toolbox/sl3d/orbisnap/bin/glnxa64/libpng12.so.0
/opt/MATLAB/R2017b/toolbox/sl3d/orbisnap/bin/glnxa64/libpng12.so.0.39.0
/opt/kingsoft/wps-office/office6/libpng12.so.0
/opt/kingsoft/wps-office/office6/libpng12.so.0.50.0
/opt/modelsim/modeltech/lib/libpng12.so.0
/opt/modelsim/modeltech/lib/libpng12.so.0.50.0
/opt/modelsim/modeltech/linux_x86_64/libpng12.so.0
/opt/modelsim/modeltech/linux_x86_64/libpng12.so.0.50.0
/opt/uex/bin/libpng12.so.0
/opt/uex/bin/libpng12.so.0.46.0
/opt/uex4/bin/libpng12.so.0
/opt/uex4/bin/libpng12.so.0.46.0
```
这样
```
cp /opt/uex/bin/libpng12.so.0 .
cp /opt/uex/bin/libpng12.so.0.46.0 .
```
ok，反正可以用了




* * *
# 修复 apt repo
```
apt list --upgradable
sudo apt upgrade
```
报错
```
$ sudo apt --fix-broken install
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Correcting dependencies... Done
The following additional packages will be installed:
  libegl-dev libgl-dev libglx-dev
The following NEW packages will be installed:
  libegl-dev libgl-dev libglx-dev
0 upgraded, 3 newly installed, 0 to remove and 64 not upgraded.
7 not fully installed or removed.
Need to get 0 B/137 kB of archives.
After this operation, 1,599 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
(Reading database ... 713247 files and directories currently installed.)
Preparing to unpack .../libglx-dev_1.3.2-1~ubuntu0.18.04.1sav1_amd64.deb ...
Unpacking libglx-dev:amd64 (1.3.2-1~ubuntu0.18.04.1sav1) ...
dpkg: error processing archive /var/cache/apt/archives/libglx-dev_1.3.2-1~ubuntu0.18.04.1sav1_amd64.deb (--unpack):
 trying to overwrite '/usr/include/GL/glx.h', which is also in package mesa-common-dev:amd64 20.0.8-0ubuntu1~18.04.1sav0
Preparing to unpack .../libgl-dev_1.3.2-1~ubuntu0.18.04.1sav1_amd64.deb ...
Unpacking libgl-dev:amd64 (1.3.2-1~ubuntu0.18.04.1sav1) ...
dpkg: error processing archive /var/cache/apt/archives/libgl-dev_1.3.2-1~ubuntu0.18.04.1sav1_amd64.deb (--unpack):
 trying to overwrite '/usr/include/GL/gl.h', which is also in package mesa-common-dev:amd64 20.0.8-0ubuntu1~18.04.1sav0
dpkg-deb: error: paste subprocess was killed by signal (Broken pipe)
Preparing to unpack .../libegl-dev_1.3.2-1~ubuntu0.18.04.1sav1_amd64.deb ...
Unpacking libegl-dev:amd64 (1.3.2-1~ubuntu0.18.04.1sav1) ...
dpkg: error processing archive /var/cache/apt/archives/libegl-dev_1.3.2-1~ubuntu0.18.04.1sav1_amd64.deb (--unpack):
 trying to overwrite '/usr/include/EGL/egl.h', which is also in package libegl1-mesa-dev:amd64 20.0.8-0ubuntu1~18.04.1sav0
Errors were encountered while processing:
 /var/cache/apt/archives/libglx-dev_1.3.2-1~ubuntu0.18.04.1sav1_amd64.deb
 /var/cache/apt/archives/libgl-dev_1.3.2-1~ubuntu0.18.04.1sav1_amd64.deb
 /var/cache/apt/archives/libegl-dev_1.3.2-1~ubuntu0.18.04.1sav1_amd64.deb
E: Sub-process /usr/bin/dpkg returned an error code (1)
andreas@Vostro-5880:~
$ sudo dpkg -i --force-all /var/cache/apt/archives/libglx-dev_1.3.2-1~ubuntu0.18.04.1sav1_amd64.deb
(Reading database ... 713247 files and directories currently installed.)
Preparing to unpack .../libglx-dev_1.3.2-1~ubuntu0.18.04.1sav1_amd64.deb ...
Unpacking libglx-dev:amd64 (1.3.2-1~ubuntu0.18.04.1sav1) ...
dpkg: warning: overriding problem because --force enabled:
dpkg: warning: trying to overwrite '/usr/include/GL/glx.h', which is also in package mesa-common-dev:amd64 20.0.8-0ubuntu1~18.04.1sav0
dpkg: warning: overriding problem because --force enabled:
dpkg: warning: trying to overwrite '/usr/include/GL/glxext.h', which is also in package mesa-common-dev:amd64 20.0.8-0ubuntu1~18.04.1sav0
Setting up libglx-dev:amd64 (1.3.2-1~ubuntu0.18.04.1sav1) ...
andreas@Vostro-5880:~
$ sudo dpkg -i --force-all /var/cache/apt/archives/libgl-dev_1.3.2-1~ubuntu0.18.04.1sav1_amd64.deb
(Reading database ... 713254 files and directories currently installed.)
Preparing to unpack .../libgl-dev_1.3.2-1~ubuntu0.18.04.1sav1_amd64.deb ...
Unpacking libgl-dev:amd64 (1.3.2-1~ubuntu0.18.04.1sav1) ...
dpkg: warning: overriding problem because --force enabled:
dpkg: warning: trying to overwrite '/usr/include/GL/gl.h', which is also in package mesa-common-dev:amd64 20.0.8-0ubuntu1~18.04.1sav0
dpkg: warning: overriding problem because --force enabled:
dpkg: warning: trying to overwrite '/usr/include/GL/glcorearb.h', which is also in package mesa-common-dev:amd64 20.0.8-0ubuntu1~18.04.1sav0
dpkg: warning: overriding problem because --force enabled:
dpkg: warning: trying to overwrite '/usr/include/GL/glext.h', which is also in package mesa-common-dev:amd64 20.0.8-0ubuntu1~18.04.1sav0
dpkg: warning: overriding problem because --force enabled:
dpkg: warning: trying to overwrite '/usr/include/KHR/khrplatform.h', which is also in package mesa-common-dev:amd64 20.0.8-0ubuntu1~18.04.1sav0
Setting up libgl-dev:amd64 (1.3.2-1~ubuntu0.18.04.1sav1) ...
andreas@Vostro-5880:~
$ sudo dpkg -i --force-all /var/cache/apt/archives/libegl-dev_1.3.2-1~ubuntu0.18.04.1sav1_amd64.deb
(Reading database ... 713261 files and directories currently installed.)
Preparing to unpack .../libegl-dev_1.3.2-1~ubuntu0.18.04.1sav1_amd64.deb ...
Unpacking libegl-dev:amd64 (1.3.2-1~ubuntu0.18.04.1sav1) ...
dpkg: warning: overriding problem because --force enabled:
dpkg: warning: trying to overwrite '/usr/include/EGL/egl.h', which is also in package libegl1-mesa-dev:amd64 20.0.8-0ubuntu1~18.04.1sav0
dpkg: warning: overriding problem because --force enabled:
dpkg: warning: trying to overwrite '/usr/include/EGL/eglext.h', which is also in package libegl1-mesa-dev:amd64 20.0.8-0ubuntu1~18.04.1sav0
dpkg: warning: overriding problem because --force enabled:
dpkg: warning: trying to overwrite '/usr/include/EGL/eglplatform.h', which is also in package libegl1-mesa-dev:amd64 20.0.8-0ubuntu1~18.04.1sav0
dpkg: warning: overriding problem because --force enabled:
dpkg: warning: trying to overwrite '/usr/lib/x86_64-linux-gnu/pkgconfig/egl.pc', which is also in package libegl1-mesa-dev:amd64 20.0.8-0ubuntu1~18.04.1sav0
Setting up libegl-dev:amd64 (1.3.2-1~ubuntu0.18.04.1sav1) ...
```
```
sudo apt --fix-broken install
sudo apt upgrade
apt list --upgradable
```

libfilezilla0
libfilezilla13
libhfstospell9 
libhfstospell11

* * *
# 安装 ufraw
```
sudo apt-get install ufraw gimp-ufraw
```

* * *
# 修复matlab2010b

/opt/MATLAB/R2010b/bin/util/oscheck.sh
```
ver=`/lib64/libc.so.6 | head -n 1 | sed -e "s/^[^0-9]*//" -e "s/[ ,].*$//"`
==> ver=`getconf GNU_LIBC_VERSION | awk '{print $2}'`
ver=`/lib/libc.so.6 | head -n 1 | sed -e "s/^[^0-9]*//" -e "s/[ ,].*$//"`
==> ver=`getconf GNU_LIBC_VERSION | awk '{print $2}'`
```
```
ldd /opt/MATLAB/R2010b/bin/glnxa64/MATLAB
sudo apt install apt-file
sudo apt update
apt-file search libXp.so.6
```
无libXp.so.6

<https://askubuntu.com/questions/944838/libxp-so-6-missing-for-ubuntu-17-04>

可以用libXpm.so替代 sudo ln -s libXpm.so.4.11.0 libXp.so.6
为了迁移可用，复制过来
```
cp /usr/lib/x86_64-linux-gnu/libXpm.so.4.11.0 /opt/MATLAB/R2010b/bin/glnxa64/libXp.so.6
```
成功修复



* * *
# 编译产生 tty0tty-git_xxx.deb
PKGBUILD
```
# Maintainer: foo <foo(at)gmail(dot)com>
# Contributor: bar <bar(at)gmai(dot)com>

_pkgbase=tty0tty
pkgname=tty0tty-git
pkgver=1.2.r25.g5f8d18d
pkgrel=1
pkgdesc="tty0tty Virtual Serial Cable (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/freemed/tty0tty"
license=('GPL2/Apache2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("git+https://github.com/freemed/tty0tty"
        "95-tty0tty.rules"
        "tty0tty.conf"
	"postinst"
	"prerm"
        )
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP" "SKIP")

pkgver() {
  cd ${_pkgbase}
  git describe --tags | sed 's/-/.r/; s/-/./'
}

build() {
  cd ${_pkgbase}
}

package() {
  # Install
  msg2 "Copying DKMS module..."

  # Copy dkms.conf
  install -Dm644 "${_pkgbase}"/debian/tty0tty-dkms.dkms "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  install -Dm644 "${srcdir}/95-tty0tty.rules" -t "${pkgdir}/etc/udev/rules.d/"
  install -Dm644 "${srcdir}/tty0tty.conf" -t "${pkgdir}/etc/modules-load.d/"
  install -Dm644 "${_pkgbase}"/README -t "${pkgdir}/usr/share/doc/tty0tty/"
  install -Dm755 "${srcdir}"/postinst -t "${pkgdir}/DEBIAN/"
  install -Dm755 "${srcdir}"/prerm -t "${pkgdir}/DEBIAN/"

  # Set name and version
  sed -e "s/\#MODULE_VERSION\#/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  sed -e "s/\#MODULE_VERSION\#/${pkgver}/" \
      -i "${pkgdir}"/DEBIAN/postinst
  sed -e "s/\#MODULE_VERSION\#/${pkgver}/" \
      -i "${pkgdir}"/DEBIAN/prerm

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/module/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
```

下面是手动 添加、编译、删除 模块操作，上面的制作添加了 postinst 和 prerm 脚本，制作出的包实际上就 不用 手动操作 (而 arch 就由pacman提供 post hook 来实现类似的功能 却不用在 制作arch包的时候提供， arch 大法好！ )

## 更新内核模块的依赖
`ls /usr/src/tty0tty-1.2.r25.g5f8d18d/`
```
	$ sudo dkms add -m tty0tty -v 1.2.r25.g5f8d18d 

	Creating symlink /var/lib/dkms/tty0tty/1.2.r25.g5f8d18d/source ->
		         /usr/src/tty0tty-1.2.r25.g5f8d18d

	DKMS: add completed.

	$ sudo dkms build -m tty0tty -v 1.2.r25.g5f8d18d

	Kernel preparation unnecessary for this kernel.  Skipping...

	Building module:
	cleaning build area...
	make -j16 KERNELRELEASE=5.4.0-80-generic -C /lib/modules/5.4.0-80-generic/build M=/var/lib/dkms/tty0tty/1.2.r25.g5f8d18d/build...
	Signing module:
	 - /var/lib/dkms/tty0tty/1.2.r25.g5f8d18d/5.4.0-80-generic/x86_64/module/tty0tty.ko
	Secure Boot not enabled on this system.
	cleaning build area...

	DKMS: build completed.
```

- 编译所有已经注册的模块
```
# dkms install
//sudo dkms autoinstall -k      （看起来啥也没有输出）
```
输出更多信息
```
sudo dkms --debug autoinstal

	$ sudo dkms install -m tty0tty -v 1.2.r25.g5f8d18d

	tty0tty:
	Running module version sanity check.
	 - Original module
	   - No original module exists within this kernel
	 - Installation
	   - Installing to /lib/modules/5.4.0-80-generic/updates/dkms/

	depmod...

	DKMS: install completed.
```


arch有`/usr/share/libalpm/hooks/70-dkms-install.hook`


- 使dkms服务自动启动？？没有，1804不存在这个玩意
```
# systemctl enable dkms.service
```

- 显示所有模块的状态，ok
```
# dkms status
	$ dkms status
	nvidia, 460.32.03, 5.4.0-73-generic, x86_64: installed
	nvidia, 460.32.03, 5.4.0-74-generic, x86_64: installed
	nvidia, 460.32.03, 5.4.0-77-generic, x86_64: installed
	nvidia, 460.32.03, 5.4.0-80-generic, x86_64: installed
	tty0tty, 1.2.r25.g5f8d18d, 5.4.0-80-generic, x86_64: installed
```

- 移除一个内核模块
```
# dkms remove -m XXXXX -v 331.49 --all
# dkms remove XXXXX/331.49 --all
	$ sudo dkms remove -m tty0tty -v 1.2.r25.g5f8d18d --all

	-------- Uninstall Beginning --------
	Module:  tty0tty
	Version: 1.2.r25.g5f8d18d
	Kernel:  5.4.0-80-generic (x86_64)
	-------------------------------------

	Status: Before uninstall, this module version was ACTIVE on this kernel.

	tty0tty.ko:
	 - Uninstallation
	   - Deleting from: /lib/modules/5.4.0-80-generic/updates/dkms/
	 - Original module
	   - No original module was found for this module on this kernel.
	   - Use the dkms install command to reinstall any previous module version.

	depmod...

	DKMS: uninstall completed.

	------------------------------
	Deleting module version: 1.2.r25.g5f8d18d
	completely from the DKMS tree.
	------------------------------
	Done.
```
- 查看有关文件
```
ls -l /var/lib/dkms/tty0tty/1.2.r25.g5f8d18d
ls /lib/modules/5.4.0-80-generic/updates/dkms/
ls /var/lib/dkms/tty0tty/1.2.r25.g5f8d18d/5.4.0-80-generic/x86_64/module/
```

- DKMS注册和更新内核模块
```
sudo dkms add -m tty0tty -v 1.2.1
sudo /etc/kernel/postinst.d/dkms
==
sudo /usr/lib/dkms/dkms_autoinstaller start $(uname -r)
```
更新dkms模块(借鉴其他deb的postinst脚本)
```
	$ sudo /usr/lib/dkms/common.postinst tty0tty 1.2.r25.g5f8d18d
	Removing old tty0tty-1.2.r25.g5f8d18d DKMS files...

	-------- Uninstall Beginning --------
	Module:  tty0tty
	Version: 1.2.r25.g5f8d18d
	Kernel:  5.4.0-80-generic (x86_64)
	-------------------------------------

	Status: Before uninstall, this module version was ACTIVE on this kernel.

	tty0tty.ko:
	 - Uninstallation
	   - Deleting from: /lib/modules/5.4.0-80-generic/updates/dkms/
	 - Original module
	   - No original module was found for this module on this kernel.
	   - Use the dkms install command to reinstall any previous module version.

	depmod...

	DKMS: uninstall completed.

	------------------------------
	Deleting module version: 1.2.r25.g5f8d18d
	completely from the DKMS tree.
	------------------------------
	Done.
	Loading new tty0tty-1.2.r25.g5f8d18d DKMS files...
	Building for 5.4.0-80-generic
	Building initial module for 5.4.0-80-generic
	Secure Boot not enabled on this system.
	Done.

	tty0tty:
	Running module version sanity check.
	 - Original module
	   - No original module exists within this kernel
	 - Installation
	   - Installing to /lib/modules/5.4.0-80-generic/updates/dkms/

	depmod...

	DKMS: install completed.
```




* * *
# 更新内存盘镜像
```
$ sudo update-initramfs -u
update-initramfs: Generating /boot/initrd.img-5.4.0-80-generic
```


* * *
# 1604 的 qt / pyqt安装 记录
```
sudo apt install qt5-default qt5-doc libqt5serialport5 libqt5qml5 qmlscene libqt5serialport5-dev qt4-default qt4-doc qt4-dev-tools qt4-designer qt4-demos

sudo pip3.6 install libscrc -i https://mirrors.163.com/pypi/simple

sudo apt install libqt4-dbus libqt4-declarative libqt4-designer libqt4-dev libqt4-dev-bin libqt4-help libqt4-network libqt4-opengl libqt4-opengl-dev libqt4-qt3support libqt4-script libqt4-scripttools libqt4-sql   libqt4-sql-mysql libqt4-svg libqt4-test libqt4-xml libqt4-xmlpatterns libqtcore4 libqtdbus4 libqtgui4 qdbus qt-at-spi qt4-linguist-tools qt4-qmake qtcore4-l10n
```


* * *
# 编译安装 qt4-serialport
qt4-serialport_4.8.7-2_amd64

PKGBUILD的Maintainer要符合 xx <yy@zz> 格式，最好是解包修改
```
# Maintainer: Berk Demirkır <berk at demirkir dot me>

_pkgname=qt4-serialport
pkgname=$_pkgname
pkgver=4.8.7
pkgrel=2
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL' 'FDL' 'custom')
pkgdesc='Qt4 Serial Port support'
depends=('libqt4-dev')
makedepends=()
source=("$_pkgname::git://code.qt.io/qt/qtserialport.git#branch=qt4-dev")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"

  qmake-qt4 qtserialport.pro
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 LICENSE* -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm644 LGPL* -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
```
`makedeb`

* * *
# 安装 wine mono
```
sudo apt install mono-runtime
sudo apt install mono-complete
```
<http://dl.winehq.org/wine/wine-mono/4.9.4/wine-mono-4.9.4.msi>

<http://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86_64.msi>

执行安装
```
wine   msiexec /i  wine-mono-4.9.4.msi
wine   msiexec /i  wine_gecko-2.47-x86_64.msi
wine   start /i  wine-mono-4.9.4.msi
wine   start /i  wine_gecko-2.47-x86_64.msi
```
都不成功[其实和版本没有关系，新建一个prefix目录就能安装上]
```
sudo add-apt-repository ppa:ubuntu-wine/ppa
```
无效了

```
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
sudo apt update
```
<https://wiki.winehq.org/Mono>
<https://wiki.winehq.org/Gecko>
<http://mirrors.ustc.edu.cn/wine/wine/wine-mono/>
<http://mirrors.ustc.edu.cn/wine/wine/wine-gecko/>
<https://dl.winehq.org/wine/wine-gecko/2.47/>
<https://dl.winehq.org/wine/wine-mono/>
```
sudo apt-get  install wine
sudo apt-get  install winehq-staging
```
```
$ sudo apt remove wine64 wine-stable wine1.6 wine-development winetricks
```
```
$ sudo aptitude install winehq-staging
The following NEW packages will be installed:
  glib-networking:i386{a} i965-va-driver:i386{a} libatk-bridge2.0-0:i386{a} libatk1.0-0:i386{a} libatspi2.0-0:i386{a} libcairo-gobject2:i386{a} libcolord2:i386{a} libdatrie1:i386{a} libepoxy0:i386{a} 
  libgdk-pixbuf2.0-0:i386{a} libgraphite2-3:i386{a} libgtk-3-0:i386{a} libharfbuzz0b:i386{a} libjson-glib-1.0-0:i386{a} libpango-1.0-0:i386{a} libpangocairo-1.0-0:i386{a} libpangoft2-1.0-0:i386{a} 
  libproxy1v5:i386{a} librest-0.7-0:i386{a} libsdl2-2.0-0:i386{a} libsoup-gnome2.4-1:i386{a} libsoup2.4-1:i386{a} libthai0:i386{a} libva-drm2:i386{a} libva-x11-2:i386{a} libva2:i386{a} 
  libwayland-client0:i386{a} libwayland-cursor0:i386{a} libwayland-egl1:i386{a} libxcb-xfixes0:i386{a} libxkbcommon0:i386{a} libxss1:i386{a} mesa-va-drivers:i386{a} va-driver-all:i386{a} wine-staging{a} 
  wine-staging-amd64{a} wine-staging-i386:i386{ab} winehq-staging 
The following packages will be REMOVED:
  fuseiso{u} libwine{u} libwine-development{u} libwine-development:i386{u} wine32-development:i386{u} wine64-development{u} 
```
```
$ sudo apt remove fuseiso libwine-development libwine-development:i386 wine32-development:i386 wine64-development libwine
```

```
wget https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/amd64/libfaudio0_19.07-0~bionic_amd64.deb
$ sudo dpkg -i libfaudio0_19.07-0_bionic_amd64.deb
wget https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/i386/libfaudio0_19.07-0~bionic_i386.deb
$ sudo dpkg -i libfaudio0_19.07-0_bionic_i386.deb 
$ sudo apt install -f
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Correcting dependencies... Done
The following packages were automatically installed and are no longer required:
  libcapi20-3 libosmesa6
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  libegl-mesa0:i386 libegl1:i386 libgbm1:i386 libsdl2-2.0-0:i386
  libwayland-client0:i386 libwayland-cursor0:i386 libwayland-egl1:i386
  libwayland-egl1-mesa:i386 libwayland-server0:i386 libxcb-xfixes0:i386
  libxkbcommon0:i386 libxss1:i386
The following NEW packages will be installed:
  libegl-mesa0:i386 libegl1:i386 libgbm1:i386 libsdl2-2.0-0:i386
  libwayland-client0:i386 libwayland-cursor0:i386 libwayland-egl1:i386
  libwayland-egl1-mesa:i386 libwayland-server0:i386 libxcb-xfixes0:i386
  libxkbcommon0:i386 libxss1:i386
0 upgraded, 12 newly installed, 0 to remove and 9 not upgraded.
```
```
$ sudo aptitude install winehq-staging
The following NEW packages will be installed:
  glib-networking:i386{a} i965-va-driver:i386{a} libatk-bridge2.0-0:i386{a} libatk1.0-0:i386{a} libatspi2.0-0:i386{a} libcairo-gobject2:i386{a} libcolord2:i386{a} libdatrie1:i386{a} libepoxy0:i386{a} 
  libgdk-pixbuf2.0-0:i386{a} libgraphite2-3:i386{a} libgtk-3-0:i386{a} libharfbuzz0b:i386{a} libjson-glib-1.0-0:i386{a} libpango-1.0-0:i386{a} libpangocairo-1.0-0:i386{a} libpangoft2-1.0-0:i386{a} 
  libproxy1v5:i386{a} librest-0.7-0:i386{a} libsoup-gnome2.4-1:i386{a} libsoup2.4-1:i386{a} libthai0:i386{a} libva-drm2:i386{a} libva-x11-2:i386{a} libva2:i386{a} mesa-va-drivers:i386{a} 
  va-driver-all:i386{a} wine-staging{a} wine-staging-amd64{a} wine-staging-i386:i386{a} winehq-staging 
0 packages upgraded, 31 newly installed, 0 to remove and 9 not upgraded.
```
```
$ sudo apt install winetricks
The following NEW packages will be installed:
  fuseiso winetricks
```
```
$ sudo apt install mono-runtime
$ sudo apt install mono-complete
```



* * *
# android-sdk emulator
emulator: ERROR: unknown skin name 'nexus_10'
```
/opt/android-sdk/emulator/emulator -list-avds
/opt/android-sdk/emulator/emulator -avd Nexus_10_API_22
cd ~/.android/avd/Nexus_10_API_22.avd/
gedit config.ini
```

ioctl(KVM_CREATE_VM) failed: 16 Device or resource busy
```
rm /home/andreas/.android/avd/Nexus_10_API_22.avd/*.lock
```
```
$ /opt/android-sdk/emulator/emulator -avd Nexus_10_API_22
emulator: Android emulator version 30.7.5.0 (build_id 7491168) (CL:N/A)
emulator: WARNING: encryption is off
handleCpuAcceleration: feature check for hvf
cannot add library /opt/android-sdk/emulator/qemu/linux-x86_64/lib64/vulkan/libvulkan.so: failed
added library /opt/android-sdk/emulator/lib64/vulkan/libvulkan.so
ioctl(KVM_CREATE_VM) failed: 16 Device or resource busy
qemu-system-i386: failed to initialize KVM: Device or resource busy
```
```
sudo apt install libvulkan1 mesa-vulkan-drivers vulkan-utils
sudo apt install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
sudo kvm-ok
```
折腾啥，新建一个最好了哇

```
$ /opt/android-sdk/emulator/emulator -avd Nexus_10_API_22 -verbose -qemu -serial /dev/tnt0
$ /opt/android-sdk/platform-tools/adb devices
List of devices attached
emulator-5554	device
```
```
$ /opt/android-sdk/platform-tools/adb -s emulator-5554 shell
root@generic_x86:/ # ls /dev/tty* -l
```
经测试是/dev/ttyS1被映射出来到host的/dev/tnt0



* * *
# eclipse
```
sudo apt install netbeans
sudo apt install eclipse-platform
The following additional packages will be installed:
  eclipse-jdt eclipse-pde eclipse-platform-data eclipse-rcp fastjar jarwrapper
  libasm3-java libcommons-dbcp-java libcommons-httpclient-java
  libcommons-pool-java libdb-java libdb-je-java libdb5.3-java
  libdb5.3-java-jni libeasymock-java libecj-java
  libfelix-bundlerepository-java libfelix-gogo-command-java
  libfelix-gogo-shell-java libfelix-shell-java libfelix-utils-java
  libicu4j-4.2-java libicu4j-49-java libjavascriptcoregtk-1.0-0 libjetty9-java
  libjline-java libjtidy-java liblucene2-java libswt-cairo-gtk-3-jni
  libswt-glx-gtk-3-jni libswt-gtk-3-java libswt-gtk-3-jni
  libswt-webkit-gtk-3-jni libtomcat8-java libwebkitgtk-1.0-0 sat4j
Suggested packages:
  eclipse libcommons-dbcp-java-doc libcommons-httpclient-java-doc
  libeasymock-java-doc ecj libfelix-bundlerepository-java-doc
  libfelix-gogo-command-java-doc libfelix-gogo-shell-java-doc
  libfelix-shell-java-doc libfelix-utils-java-doc jetty9 libjline-java-doc
  libjtidy-java-doc tomcat8
Recommended packages:
  libswt-gnome-gtk-3-jni
The following NEW packages will be installed:
  eclipse-jdt eclipse-pde eclipse-platform eclipse-platform-data eclipse-rcp
  fastjar jarwrapper libasm3-java libcommons-dbcp-java
  libcommons-httpclient-java libcommons-pool-java libdb-java libdb-je-java
  libdb5.3-java libdb5.3-java-jni libeasymock-java libecj-java
  libfelix-bundlerepository-java libfelix-gogo-command-java
  libfelix-gogo-shell-java libfelix-shell-java libfelix-utils-java
  libicu4j-4.2-java libicu4j-49-java libjavascriptcoregtk-1.0-0 libjetty9-java
  libjline-java libjtidy-java liblucene2-java libswt-cairo-gtk-3-jni
  libswt-glx-gtk-3-jni libswt-gtk-3-java libswt-gtk-3-jni
  libswt-webkit-gtk-3-jni libtomcat8-java libwebkitgtk-1.0-0 sat4j
0 upgraded, 37 newly installed, 0 to remove and 9 not upgraded.
sudo apt install eclipse
```
这个eclipse不能运行啊
```
sudo apt purge eclipse*
sudo apt purge eclipse-platform*
The following packages were automatically installed and are no longer required:
  eclipse-rcp fastjar jarwrapper libasm3-java libcommons-httpclient-java
  libdb-java libdb-je-java libdb5.3-java libdb5.3-java-jni libeasymock-java
  libfelix-bundlerepository-java libfelix-gogo-command-java
  libfelix-gogo-shell-java libfelix-shell-java libfelix-utils-java
  libicu4j-4.2-java libicu4j-49-java libjavascriptcoregtk-1.0-0 libjline-java
  libjtidy-java liblucene2-java libswt-cairo-gtk-3-jni libswt-glx-gtk-3-jni
  libswt-gtk-3-java libswt-gtk-3-jni libswt-webkit-gtk-3-jni
  libwebkitgtk-1.0-0 sat4j
```
```
$ sudo apt install eclipse
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  eclipse-jdt eclipse-pde eclipse-platform eclipse-platform-data
The following NEW packages will be installed:
  eclipse eclipse-jdt eclipse-pde eclipse-platform eclipse-platform-data
0 upgraded, 5 newly installed, 0 to remove and 9 not upgraded.
```
```
$ sudo apt purge eclipse
$ sudo apt purge eclipse-platform
$ sudo apt autoremove
```


* * *
# java版本全部替换成8

eclipse-jee-neon-3-linux-gtk-x86_64.tar.gz还是可以运行的

<https://ftp.jaist.ac.jp/pub/eclipse/technology/epp/downloads/release/neon/3/eclipse-jee-neon-3-linux-gtk-x86_64.tar.gz>

<https://ftp.jaist.ac.jp/pub/eclipse/technology/epp/downloads/release/2021-06/R/eclipse-jee-2021-06-R-linux-gtk-x86_64.tar.gz>


* * *
# mysql-workbench

<https://cdn.mysql.com/archives/mysql-workbench/mysql-workbench-community_8.0.20-1ubuntu18.04_amd64.deb>
```
sudo dpkg -i mysql-workbench-community_8.0.20-1ubuntu18.04_amd64.deb
```


* * *
# 安装 jetbrains 全家桶

<https://download-cdn.jetbrains.com/cpp/CLion-2021.2.tar.gz>
<https://download-cdn.jetbrains.com/idea/ideaIU-2021.2.tar.gz>
<https://download-cdn.jetbrains.com/datagrip/datagrip-2021.2.tar.gz>
<https://download-cdn.jetbrains.com/go/goland-2021.2.tar.gz>
<https://download-cdn.jetbrains.com/ruby/RubyMine-2021.2.tar.gz>
<https://download-cdn.jetbrains.com/rider/JetBrains.Rider-2021.2.tar.gz>
<https://download-cdn.jetbrains.com/webstorm/WebStorm-2021.2.tar.gz>
<https://download-cdn.jetbrains.com/webide/PhpStorm-2021.2.tar.gz>
<https://download-cdn.jetbrains.com/python/pycharm-professional-2021.2.tar.gz>
<https://download-cdn.jetbrains.com/objc/AppCode-2021.2.dmg>


* * *
# qt5 一些模块
```
sudo apt install libqt5svg5-dev libqt5webkit5-dev uchardet libuchardet-dev qttools5-dev libqt5websockets5 libqt5websockets5-dev libqt5webengine5 qtwebengine5-dev
The following NEW packages will be installed:
  libqt5positioning5-plugins libqt5webchannel5-dev libqt5webengine-data
  libqt5webengine5 libqt5webenginecore5 libqt5webenginewidgets5 libre2-4
  qtpositioning5-dev qtwebengine5-dev
```

* * *
# notepadqq编译的版本[失效]
```
sudo apt remove notepadqq notepadqq-common
sudo dpkg -i notepadqq-git_2.0.0.beta.r12.gd8000f25-1_amd64.deb
```

* * *
# pcmanfm一些库
```
sudo apt install libfm-dev libfm-extra-dev libfm-gtk-dev libfmt-dev libfml0 libfml-dev
```

* * *
# 安装 apache 及配置
```
sudo apt-get install apache2 apache2-utils apache2-doc 
sudo apt-get install ntfs-config
```
`sudo gedit /etc/apache2/sites-available/zhang.conf`
```
<VirtualHost *:80>
	ServerAdmin yxgi5@163.com
	ServerName andreas.com
	ServerAlias www.andreas.com
	#DocumentRoot /media/sdd1/
	#DocumentRoot /media/andy/BC482DD5482D8EE81/
	DocumentRoot /media/andy/
	#DocumentRoot /home/andy/Documents/
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
`sudo gedit /etc/apache2/apache2.conf`
添加
```
<Directory /media/andy/>
	Options Indexes FollowSymLinks
	AllowOverride None
	Order allow,deny
	Allow from all
	Require all granted
</Directory>
...末尾
IndexOptions Charset=UTF-8
```
```
$ sudo chmod 755 /media/andreas
$ cd /etc/apache2
$ sudo a2dissite 000-default.conf
$ sudo a2ensite zhang.conf
$ sudo /etc/init.d/apache2 restart
```
后续错误处理

`Apache Configuration Error AH00558: Could not reliably determine the server's fully qualified domain name`

On Ubuntu and Debian-derived systems, run the following command:
```
sudo systemctl status apache2.service -l --no-pager
sudo journalctl -u apache2.service --since today --no-pager
```

On Rocky Linux, Fedora, and Red Hat-derived systems, use this command to inspect the logs:
```
sudo systemctl status apache2.service -l --no-pager
sudo journalctl -u httpd.service --since today --no-pager
```

To check your Apache configuration 

`sudo apachectl configtest`

按<https://mk-55.hatenablog.com/entry/2014/07/07/004510>修改无效且无更多信息
```
echo ServerName $HOSTNAME | sudo tee /etc/apache2/conf-available/fqdn.conf
sudo a2enconf fqdn
sudo systemctl reload apache2
sudo systemctl start apache2.service
```
还是启动不了服务

那么查看
```
cat /var/log/apache2/error.log
AH00016: Configuration Failed
[Thu Dec 08 12:57:56.828896 2022] [wsgi:crit] [pid 28505] mod_wsgi (pid=28505): The mod_python module can not be used in conjunction with mod_wsgi 4.0+. Remove the mod_python module from the Apache configuration.
```
看来根本问题是 python module
```
sudo a2dismod python
sudo systemctl status apache2.service
```
就修复了，其他的恢复原状。


* * *
# 安装 php
```
sudo apt install php
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


* * *
# 安装 pyqt5 有关包
```
sudo apt-get install python3-pyqt5 python3-pyqt4 pyqt4-dev-tools pyqt5-dev-tools pyqt5-dev pyqt5-examples python-sip-do
```

* * *
# 安装 7z 有关包
```
sudo apt install p7zip convmv
```

* * *
# 安装 配置 lightdm
```
sudo apt install lightdm 不要安装 lightdm-gtk-greeter
```
`$ cat /etc/lightdm/lightdm.conf`
```
[SeatDefaults]
greeter-setup-script=xhost +
```
/etc/gdm3/Init/Default添加一行 xhost + 到头部

gdm是否添加
/etc/gdm3/custom.conf
```
DisallowTCP=false
WaylandEnable=false
？
```
`root@my_ip:/etc/gdm3# cat custom.conf`
```
# GDM configuration storage
#
# See /usr/share/gdm/gdm.schemas for a list of available options.

[daemon]
# Uncoment the line below to force the login screen to use Xorg
WaylandEnable=false

# Enabling automatic login
#  AutomaticLoginEnable = true
#  AutomaticLogin = user1

# Enabling timed login
#  TimedLoginEnable = true
#  TimedLogin = user1
#  TimedLoginDelay = 10

[security]
DisallowTCP=false

[xdmcp]
Enable=true
DisplaysPerHost=10 

[chooser]

[debug]
# Uncomment the line below to turn on debugging
# More verbose logs
# Additionally lets the X server dump core if it crashes
#Enable=true
```
？

* * *
# 配置 ssh
```
/etc/ssh/ssh_config
ForwardX11 yes
ForwardX11Trusted yes
/etc/ssh/sshd_config
PermitRootLogin yes
# systemctl restart sshd
```

* * *
# 未详记录
```
sudo apt install adacontrol
sudo apt purge adacontrol
sudo apt install gnat-8
```


* * *
# python保存网页全部内容的调查
```
sudo -H pip3 install selenium -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install webdriver-manager -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install pywebcopy -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install pyautogui -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install bencoder -i https://mirrors.163.com/pypi/simple
```
测试脚本
```
from webdriver_manager.firefox import GeckoDriverManager

try:
    driver = webdriver.Firefox()
except Exception:
    driver = webdriver.Firefox(GeckoDriverManager().install())


from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys

br = webdriver.Firefox()
br.get('http://www.baidu.com/')

save_me = ActionChains(br).key_down(Keys.CONTROL)\
         .key_down('s').key_up(Keys.CONTROL).key_up('s')
save_me.perform()
```

<https://github.com/operasoftware/operachromiumdriver/releases>

解压后+x，放到/usr/bin

```
sudo apt-get install chromium-chromedriver firefox-geckodriver
```

To use the default Chrome Profile:
```
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

options = webdriver.ChromeOptions()
options.add_argument("user-data-dir=C:\\Users\\AtechM_03\\AppData\\Local\\Google\\Chrome\\User Data\\Default")
driver = webdriver.Chrome(executable_path=r'C:\path\to\chromedriver.exe', chrome_options=options)
driver.get("https://www.google.co.in")
```

Note: Your default chrome profile would contain a lot of bookmarks, extensions, theme, cookies etc. Selenium may fail to load it. So as per the best practices create a new chrome profile for your @Test and store/save/configure within the profile the required data.

To use the customized Chrome Profile:
```
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

options = Options()
options.add_argument("user-data-dir=C:\\Users\\AtechM_03\\AppData\\Local\\Google\\Chrome\\User Data\\Profile 2")
driver = webdriver.Chrome(executable_path=r'C:\path\to\chromedriver.exe', chrome_options=options)
driver.get("https://www.google.co.in")



options = webdriver.ChromeOptions()
options.add_argument("user-data-dir=/home/andreas/.config/opera")
br=webdriver.Opera(options=options)
br.get("https://www.javbus.com/ja/BNST-035")
save_me = ActionChains(br).key_down(Keys.CONTROL)\
         .key_down('s').key_up(Keys.CONTROL).key_up('s')
save_me.perform()
```


## 好像没有啥用，存不了啊

ActionChains(driver).key_down(Keys.CONTROL).send_keys('c').key_up(Keys.CONTROL).perform()
```
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys

driver = webdriver.Firefox()
driver.get('http://www.baidu.com/')
#driver.maximize_window()
driver.switch_to.window(driver.current_window_handle)

time.sleep(1) # Pause to allow you to inspect the browser.

#save_me = ActionChains(driver).key_down(Keys.CONTROL)\
#         .key_down('s').key_up(Keys.CONTROL).key_up('s')
#save_me.perform()

#ActionChains(driver).key_down(Keys.CONTROL).send_keys('c').key_up(Keys.CONTROL).perform()
ActionChains(driver).key_down(Keys.CONTROL).key_down('s').key_up(Keys.CONTROL).key_up('s').perform()
#body = driver.find_element_by_tag_name('body')
#body.send_keys(Keys.CONTROL, "s")  # on Mac: body.send_keys(Keys.COMMAND, "s")
#ActionChains(driver).key_down(Keys.LEFT_CONTROL).key_down('s').key_up(Keys.LEFT_CONTROL).key_up('s').perform()

#save = ActionChains(driver).key_down(Keys.CONTROL).send_keys('s').perform()
#save = ActionChains(driver).key_down(Keys.CONTROL).send_keys('s').key_up(Keys.CONTROL).perform()

#ActionChains(driver).send_keys(Keys.CONTROL + "s").perform()
#ActionChains(driver).key_down(Keys.CONTROL).send_keys("s").perform()
#ActionChains(driver).send_keys(Keys.CONTROL + 's').perform()
#ActionChains(driver).send_keys(Keys.CONTROL).send_keys('s').perform()
#ActionChains(driver).send_keys('Test').perform()

#这几个有效啊
#webdriver.ActionChains(driver).key_down(Keys.CONTROL).send_keys("a").perform()
#ActionChains(driver).key_down(Keys.CONTROL).send_keys('a').perform()
#ActionChains(driver).key_down(Keys.CONTROL).key_down('a').key_up(Keys.CONTROL).key_up('a').perform()



#ActionChains(driver).key_down(Keys.CONTROL).perform()
#ActionChains(driver).key_down('s').perform()
#ActionChains(driver).key_up(Keys.CONTROL).perform()
#ActionChains(driver).key_up('s').perform()

#ActionChains(driver).key_down(Keys.ALT).perform()
#ActionChains(driver).key_up(Keys.ALT).perform()


# create action chain object
#action = ActionChains(driver)
 
# perform the operation
#action.key_down(Keys.CONTROL).send_keys('F').key_up(Keys.CONTROL).perform()

time.sleep(5) # Pause to allow you to inspect the browser.
driver.quit()


```
谁知道呢，反正ctrl+a可以，ctrl+s不行

```
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options

options = webdriver.ChromeOptions()
options.add_argument("user-data-dir=/home/andreas/.config/opera")
driver = webdriver.Opera(options=options)
driver.get('http://www.baidu.com/')
#driver.maximize_window()
driver.switch_to.window(driver.current_window_handle)

time.sleep(1) # Pause to allow you to inspect the browser.

#save_me = ActionChains(driver).key_down(Keys.CONTROL)\
#         .key_down('s').key_up(Keys.CONTROL).key_up('s')
#save_me.perform()

#ActionChains(driver).key_down(Keys.CONTROL).send_keys('c').key_up(Keys.CONTROL).perform()
#ActionChains(driver).key_down(Keys.CONTROL).key_down('s').key_up(Keys.CONTROL).key_up('s').perform()
#body = driver.find_element_by_tag_name('body')
#body.send_keys(Keys.CONTROL, "s")  # on Mac: body.send_keys(Keys.COMMAND, "s")
#ActionChains(driver).key_down(Keys.LEFT_CONTROL).key_down('s').key_up(Keys.LEFT_CONTROL).key_up('s').perform()

#save = ActionChains(driver).key_down(Keys.CONTROL).send_keys('s').perform()
#save = ActionChains(driver).key_down(Keys.CONTROL).send_keys('s').key_up(Keys.CONTROL).perform()

#ActionChains(driver).send_keys(Keys.CONTROL + "s").perform()
#ActionChains(driver).key_down(Keys.CONTROL).send_keys("s").perform()
#ActionChains(driver).send_keys(Keys.CONTROL + 's').perform()
#ActionChains(driver).send_keys(Keys.CONTROL).send_keys('s').perform()
#ActionChains(driver).send_keys('Test').perform()

#这几个有效啊
#webdriver.ActionChains(driver).key_down(Keys.CONTROL).send_keys("a").perform()
#ActionChains(driver).key_down(Keys.CONTROL).send_keys('a').perform()
#ActionChains(driver).key_down(Keys.CONTROL).key_down('a').key_up(Keys.CONTROL).key_up('a').perform()



#ActionChains(driver).key_down(Keys.CONTROL).perform()
#ActionChains(driver).key_down('s').perform()
#ActionChains(driver).key_up(Keys.CONTROL).perform()
#ActionChains(driver).key_up('s').perform()

#ActionChains(driver).key_down(Keys.ALT).perform()
#ActionChains(driver).key_up(Keys.ALT).perform()


# create action chain object
action = ActionChains(driver)
 
# perform the operation
#action.key_down(Keys.CONTROL).send_keys('F').key_up(Keys.CONTROL).perform()

action.key_down(Keys.CONTROL).key_down('s').key_up(Keys.CONTROL).key_up('s').perform()

time.sleep(5) # Pause to allow you to inspect the browser.
driver.quit()
```


`export https_proxy="127.0.0.1:8118"`
`export http_proxy="127.0.0.1:8118"`

```

from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options

#options = webdriver.ChromeOptions()
#options.add_argument("user-data-dir=/home/andreas/.config/opera")
#driver = webdriver.Chrome(options=options)
driver = webdriver.Chrome()
driver.get('http://www.google.com/')
#driver.maximize_window()
driver.switch_to.window(driver.current_window_handle)

time.sleep(1) # Pause to allow you to inspect the browser.
driver.find_element_by_xpath('//body').send_keys(Keys.CONTROL+"f")

time.sleep(5) # Pause to allow you to inspect the browser.
driver.quit()
```

这也不行。回去试试arch的情况了。


### tips：
driver.get('http://www.baidu.com/')
view_source_code = driver.execute_script('return document.documentElement.outerHTML')
print(view_source_code)
```
export https_proxy="127.0.0.1:8118"
export http_proxy="127.0.0.1:8118"
```
// Proxy test
```
curl --proxy 127.0.0.1:8118 google.com >/dev/null 2>&1 && echo success || echo fail
success
```

```
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time
import pyautogui
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options

#options = webdriver.ChromeOptions()
#options.add_argument("user-data-dir=/home/andreas/.config/opera")
#driver = webdriver.Chrome(options=options)
driver = webdriver.Chrome()
driver.get('http://www.baidu.com/')
#driver.maximize_window()
driver.switch_to.window(driver.current_window_handle)

time.sleep(2) # Pause to allow you to inspect the browser.

pyautogui.hotkey('ctrl','s')
pyautogui.press('enter')

#save_me = ActionChains(driver).key_down(Keys.CONTROL)\
#         .key_down('s').key_up(Keys.CONTROL).key_up('s')
#save_me.perform()


time.sleep(3) # Pause to allow you to inspect the browser.
driver.quit()
```
用pyautogui才能行。。。。


## title操作
```
get_title = driver.title
print(get_title)
words=get_title.split()
a=" ".join(words[0:2])
driver.execute_script('document.title = a')
driver.execute_script('document.title = "%s"' % a)
```
## tab操作
```
tab1 = driver.window_handles[1]
driver.switch_to.window(tab1)
driver.execute_script('document.title = "My New Title"')
```

## 最终的单链接版本
```
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
import subprocess
import sys

os.environ ['https_proxy']='127.0.0.1:8118'
os.environ ['http_proxy']='127.0.0.1:8118'


import time
import pyautogui
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options

#options = webdriver.ChromeOptions()
#options.add_argument("user-data-dir=/home/andreas/.config/opera")
#driver = webdriver.Chrome(options=options)
driver = webdriver.Chrome()
driver.get('https://www.javbus.com/ja/BNST-036')
#driver.maximize_window()
driver.switch_to.window(driver.current_window_handle)

#time.sleep(2) # Pause to allow you to inspect the browser.

get_title = driver.title
print(get_title)
words=get_title.split()
a=" ".join(words[0:2])
driver.execute_script('document.title = "%s"' % a)

pyautogui.hotkey('ctrl', 's')
time.sleep(2)
pyautogui.typewrite(a + '.html')
pyautogui.hotkey('enter')

#pyautogui.hotkey('ctrl','s')
#pyautogui.press('enter')

#save_me = ActionChains(driver).key_down(Keys.CONTROL)\
#         .key_down('s').key_up(Keys.CONTROL).key_up('s')
#save_me.perform()

time.sleep(3) # Pause to allow you to inspect the browser.
driver.quit()
```

* * *
# 更新 npm
```
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo npm install -g npm
sudo npm install -g npm@8.1.3

sudo apt install nodejs-mozilla
sudo apt install libqt5xmlpatterns5-dev
sudo apt install libqjson-dev libxml++2.6-dev libxmlsec1-dev libxmltok1-dev qml-module-qtwebengine
sudo apt install redis redis-tools
```


* * *
# magnet 搜索工具 [失效]

<https://chrome.google.com/webstore/detail/magnetar-磁力聚合搜索/aelfbedmomigndkbpbpplblbgeaaghnf/related?hl=zh-CN>
## 依赖
```
$ sudo apt install libssl1.0-dev
[sudo] password for andreas: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  gyp libgcrypt20-dev libgnat-7 libgnatcoll16.1.0 libgnatvsn7 libgnutls-openssl27 libgnutls28-dev libgnutlsxx28 libgpg-error-dev libgpr16.1.2016 libhogweed4:i386 libidn2-dev libjs-async libjs-inherits
  libjs-node-uuid libnettle6:i386 libnspr4-dev libnss3-dev libp11-kit-dev libqrencode3 libtasn1-6-dev libtasn1-doc libunbound2 libusbmuxd4 libuv1-dev libxmlada-dom4.6 libxmlada-input4.6 libxmlada-sax4.6.2016
  libxmlada-schema4.6.2016 libxmlada-unicode4.6.2016 libxmlsec1-gcrypt libxmlsec1-gnutls libxmlsec1-openssl libxslt1-dev linux-hwe-5.4-headers-5.4.0-77 linux-hwe-5.4-headers-5.4.0-81
  linux-hwe-5.4-headers-5.4.0-87 nettle-dev node-abbrev node-ansi node-ansi-color-table node-archy node-async node-balanced-match node-block-stream node-brace-expansion node-builtin-modules
  node-combined-stream node-concat-map node-cookie-jar node-delayed-stream node-forever-agent node-form-data node-fs.realpath node-fstream node-fstream-ignore node-github-url-from-git node-glob
  node-graceful-fs node-hosted-git-info node-inflight node-inherits node-ini node-is-builtin-module node-isexe node-json-stringify-safe node-lockfile node-lru-cache node-mime node-minimatch node-mkdirp
  node-mute-stream node-node-uuid node-nopt node-normalize-package-data node-npmlog node-once node-osenv node-path-is-absolute node-pseudomap node-qs node-read node-read-package-json node-request node-retry
  node-rimraf node-semver node-sha node-slide node-spdx-correct node-spdx-expression-parse node-spdx-license-ids node-tar node-tunnel-agent node-underscore node-validate-npm-package-license node-which
  node-wrappy node-yallist nodejs nodejs-doc shim
Use 'sudo apt autoremove' to remove them.
The following packages will be REMOVED:
  default-libmysqlclient-dev libmysqlclient-dev libssl-dev libxmlsec1-dev
The following NEW packages will be installed:
  libssl1.0-dev
0 upgraded, 1 newly installed, 4 to remove and 10 not upgraded.
Need to get 1,366 kB of archives.
After this operation, 10.1 MB disk space will be freed.
Do you want to continue? [Y/n] 
```
```
$ sudo apt install default-libmysqlclient-dev libmysqlclient-dev libssl-dev libxmlsec1-dev
```


* * *
# 安装docker
see 
<https://docs.docker.com/engine/install/linux-postinstall/>

<https://docs.docker.com/engine/install/ubuntu/>

```
$ sudo apt-get remove docker docker-engine docker.io containerd runc
$ sudo apt-get update
$ sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
Add Docker’s official GPG key:
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu/ \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
$ sudo groupadd docker
$ docker version
$ sudo docker run hello-world
$ sudo usermod -aG docker $USER
$ newgrp docker
$ docker run hello-world
```
## docker 源加速
`sudo gedit /etc/docker/daemon.json`, 加上如下的键值:
```
{
  "registry-mirrors": ["https://registry.docker-cn.com"]
}
```
或者
```
{
  "registry-mirrors": [
        "https://ung2thfc.mirror.aliyuncs.com",
        "https://registry.docker-cn.com",
        "http://hub-mirror.c.163.com",
        "https://docker.mirrors.ustc.edu.cn"
    ]
}
```
```
sudo systemctl daemon-reload
sudo systemctl restart docker
docker info
```

## 在dock安装ubuntu1604 [原来是为了在arch执行xsct, 不过看起来对ubunut多版本还是个很好的解决方案]
```
$ docker pull ubuntu
-- or "docker pull ubuntu:16.04"
$ docker run -d --name ubuntu_container --restart always -v /opt/:/opt/ -v /home/andreas/:/home/andreas/ -i -t ubuntu bash
$ docker exec -it ubuntu_container /bin/bash
```
下面在container执行
```
# apt update
# apt install lsb-release xvfb x11-utils dbus-x11 rlwrap locales libtinfo5 aptitude git make net-tools libncurses5-dev tftpd zlib1g-dev libssl-dev flex bison libselinux1 gnupg wget diffstat chrpath socat xterm autoconf libtool tar unzip texinfo zlib1g-dev gcc-multilib build-essential libsdl1.2-dev libglib2.0-dev screen pax gzip libboost-dev libboost-tools-dev libboost-timer-dev libcoinutils-dev libboost-all-dev libgtk-3-dev gtk3-nocsd
# dpkg-reconfigure locales
> choose en_US.UTF-8 UTF-8, at about number 149 ... 159
> and choose num 3, en_US.UTF-8
# dpkg-reconfigure dash
> choose no
# adduser andreas
> ...
# su andreas
$ cd /opt/Xilinx/Vitis/2020.1
$ source ./settings64.sh
$ xsct
```
host
```
docker ps -a
docker stop ubuntu_container
docker start ubuntu_container

sudo docker stop $(docker ps -a | awk '{ print $1}' | tail -n +2)
sudo systemctl stop docker.service 

sudo systemctl start docker.service 
sudo docker start $(docker ps -a | awk '{ print $1}' | tail -n +2)
```

## xsct LD_PRELOAD 告警解决
```
$ sudo grep -r LD_PRELOAD /etc $HOME
sudo apt-get purge gtk3-nocsd
```


* * *
# anydesk [abort]
安装在/opt/anydesk-6.1.1

建立服务配置

`sudo gedit /lib/systemd/system/anydesk.service`
```
[Unit]
Description=AnyDesk
Requires=network.target
After=systemd-user-sessions.service

[Service]
Type=simple
#ExecStart=/opt/anydesk-5.1.1/anydesk --service
ExecStart=/opt/anydesk-6.1.1/anydesk --service
PIDFile=/var/run/anydesk.pid
KillMode=mixed
TimeoutStopSec=30
User=root
LimitNOFILE=100000

[Install]
WantedBy=multi-user.target
```
运行服务
```
sudo systemctl enable anydesk.service
sudo systemctl start anydesk.service
```
`gedit /opt/anydesk-6.1.1/anydesk.desktop`
```
[Desktop Entry]
Type=Application
Name=AnyDesk
GenericName=AnyDesk
X-GNOME-FullName=AnyDesk
Exec=/opt/anydesk-6.1.1/anydesk %u
Icon=/opt/anydesk-6.1.1/icons/hicolor/scalable/apps/anydesk.svg
Terminal=false
TryExec=anydesk
Categories=Network;GTK;
MimeType=x-scheme-handler/anydesk;
Name[de_DE]=AnyDesk
```

* * *
# 迁移实际存储位置

根目录和/home的共同分区大小不够了，迁移实际存储位置

`/home/andreas/Documents/XilinxDocs`，复制到`/opt/Xilinx`

然后用软链接代替原位置
```
ln -s /opt/Xilinx/XilinxDocs/ ~/Documents/XilinxDocs
```
用baobab分析占用大户，删除多余或者转移位置


* * *
# 回滚 notepadqq

自己编译的notepadqq-git版本崩溃了，安装系统repo的吧，好像有点缺陷

那么安装ppa的版本吧
```
sudo add-apt-repository ppa:notepadqq-team/notepadqq
sudo apt-get update
sudo apt-get install notepadqq
```
好像也没有啥不同，如果想卸载就这样
```
sudo apt-get remove notepadqq notepadqq-common
sudo add-apt-repository --remove ppa:notepadqq-team/notepadqq
```

* * *
# 安装 labview2020和vesa驱动

通过PKGBUILD和makedeb产生labview2020的安装包，然后安装
添加~/.bashrc
```
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/natinst/LabVIEW-2020-64/AppLibs:/opt/natinst/niPythonInterface/lib64
```

```
sudo dpkg -i ni-software-2020-bionic_20.1.0.49152-0+f0_all.deb
```
然后update，然后安装ni*,libni*
```
The following additional packages will be installed:
  libni1045tr1 libniapxipm215 libnicmm1 libnicntdrv1 libnicpcie1 libnidaqmx libnidaqmx-devel libnidaqmx-doc libnidimu1 libnidrumc1 libnidrumc1-bin libnimru2u2 libnimxi1 libnimximgr1 libnimximgr1-data
  libnimximgr1-errors libnip2p1 libnipcibrd1 libnipcibrd1-bin libnipcibrd1-errors libnipxices1 libnipxicid1 libnipxiepmu15 libnipxigp15 libnipxirm1 libnipxisvc2 libniqpxi1 libnirocoapi1 libnismbus2
  libnismbus2-errors libnixlator1 libusb-ni1 nicurli nisslcerts nissli nixercesdelayloadi system-report
The following NEW packages will be installed:
  libni1045tr1 libniapxipm215 libnicmm1 libnicntdrv1 libnicpcie1 libnidaqmx libnidaqmx-devel libnidaqmx-doc libnidimu1 libnidrumc1 libnidrumc1-bin libnimru2u2 libnimxi1 libnimximgr1 libnimximgr1-data
  libnimximgr1-errors libnip2p1 libnipcibrd1 libnipcibrd1-bin libnipcibrd1-errors libnipxices1 libnipxicid1 libnipxiepmu15 libnipxigp15 libnipxirm1 libnipxisvc2 libniqpxi1 libnirocoapi1 libnismbus2
  libnismbus2-errors libnixlator1 libusb-ni1 ni-apal-errors ni-avahi-client ni-bds ni-bds-dkms ni-controllerdriver ni-controllerdriver-errors ni-controllerdriver-libs ni-daqmx ni-daqmx-dsa ni-daqmx-dsa-libs
  ni-daqmx-ef ni-daqmx-errors ni-daqmx-fsl-libs ni-daqmx-libs ni-daqmx-mio ni-daqmx-mio-libs ni-daqmx-nicartenum-dkms ni-daqmx-nicdcc-dkms ni-daqmx-nicdr-dkms ni-daqmx-nichenum-dkms ni-daqmx-nicmr-dkms
  ni-daqmx-nicondr-dkms ni-daqmx-nicsr-dkms ni-daqmx-nidmxf-dkms ni-daqmx-nidsar-dkms ni-daqmx-niesr-dkms ni-daqmx-nifdr-dkms ni-daqmx-nifresnelmbdc-dkms ni-daqmx-nifsl-dkms ni-daqmx-nihorbr-dkms
  ni-daqmx-nilms-dkms ni-daqmx-nimsdr-dkms ni-daqmx-niraptr-dkms ni-daqmx-nisdig-dkms ni-daqmx-nissr-dkms ni-daqmx-nistc2-dkms ni-daqmx-nistc3r-dkms ni-daqmx-nistcr-dkms ni-daqmx-nitior-dkms
  ni-daqmx-niwfr-dkms ni-daqmx-nixsr-dkms ni-daqmx-notices ni-dim ni-dim-dkms ni-dim-libs ni-dim-sysapi ni-euladepot ni-fpga-interface ni-kal ni-mdbg ni-mdbg-dkms ni-mdbg-errors ni-mru ni-mru-dkms ni-mxdf
  ni-mxdf-dkms ni-mxdf-errors ni-mximanager ni-mximanager-libs ni-mximanager-nicpciek-dkms ni-mxs ni-networkdiscoverysvc ni-orb ni-orb-dkms ni-orb-errors ni-orb-tools ni-p2p ni-p2p-devel ni-p2p-dkms
  ni-p2p-errors ni-pal ni-pal-dkms ni-pal-errors ni-pal-support ni-pxi-tools ni-pxihw-ni1045-dkms ni-pxihw-nicntdrv-dkms ni-pxihw-nimxi-dkms ni-pxihw-nipxicid-dkms ni-pxihw-nipxicmm-dkms
  ni-pxihw-nipxiethernet-dkms ni-pxihw-nipxim2-dkms ni-pxihw-nismbus-dkms ni-pxipf-errors ni-pxipf-nipxifp-dkms ni-pxipf-nipxigp-dkms ni-pxipf-nipxirm-bin ni-pxipf-nipxirm-dkms ni-pxiplatformframework
  ni-pxiplatformframework-data ni-pxiplatformhwsupport ni-pxiplatformhwsupport-bin ni-pxiplatformhwsupport-data ni-pxiplatformhwsupport-errors ni-pxiplatformhwsupport-libs ni-pxiplatformservices
  ni-pxiplatformservices-bin ni-pxiplatformservices-data ni-pxiplatformservices-libs ni-pxiplatformsoftware-errors ni-pxisa-compliance ni-qpxi ni-qpxi-libs ni-rio ni-rio-dkms ni-rio-fpga-ids ni-rio-server
  ni-roco ni-routing-errors ni-rtsi-libs ni-rtsi-pal-libs ni-service-locator ni-software-action-services ni-syncdomain-service ni-sysapi ni-syscfg-devel ni-syscfg-runtime ni-targetcfg ni-usrp-rio
  ni-usrp-rio-dkms ni-usrp-rio-libs ni-wsrepl ni-xlator nicurli nisslcerts nissli nixercesdelayloadi system-report
0 upgraded, 160 newly installed, 0 to remove and 19 not upgraded.
```

其实这时候还是没有visa和4882(GPIB)的驱动.

上面apt方式安装的所有包，另外做了一个PKGBUILD，全部makedeb打包成一个大的labview-debs-2020_0f1-1_amd64.deb，另外makepkg生成一个大的arch安装包


那么从<http://download.ni.com/ni-linux-desktop/2020.07/rpm/ni/lp151/>   这个是opensuse的
抓下来所有的rpm包，写个PKGBUILD来转换一下

PKGBUILD
```
# Maintainer: Andreas Zhang
# Contributor: Andreas Zhang <denglitsch@gmail.com>

_release='2020'
_short_release="${_release:2:4}"
_service_pack='0'
pkgname="labview-visa-${_release}"
pkgver="${_service_pack}f1"
pkgrel=1
pkgdesc='A system-design platform and development environment for a visual programming language from National Instruments.'
url="https://www.ni.com/labview/release-archive/${_release}/"
arch=('x86_64')
license=("custom:LabVIEW-${_release}")
depends=('xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils' 'shared-mime-info')
makedepends=('sed' 'libarchive')
options=('!strip') # Avoid time consuming operations.
source=("file://libivivisa0-7.0.0-1.x86_64.rpm"
        "file://libivivisa0-devel-7.0.0-1.x86_64.rpm"
        "file://libivivisa-confmgr0-7.0.0-1.x86_64.rpm"
        "file://libivivisa-utilities0-7.0.0-1.x86_64.rpm"
        "file://ni-visa-20.0.0.49152-0+f0.noarch.rpm"
        "file://ni-visa-config-20.0.0.49152-0+f0.x86_64.rpm"
        "file://ni-visa-ddw-20.0.0.49152-0+f0.x86_64.rpm"
        "file://ni-visa-devel-20.0.0.49152-0+f0.noarch.rpm"
        "file://ni-visa-doc-20.0.0.49152-0+f0.noarch.rpm"
        "file://ni-visa-errors-20.0.0.49152-0+f0.noarch.rpm"
        "file://ni-visa-headers-20.0.0.49152-0+f0.noarch.rpm"
        "file://ni-visa-interactive-control-20.0.0.49152-0+f0.x86_64.rpm"
        "file://ni-visa-labview-2020-support-20.0.0.49152-0+f0.x86_64.rpm"
        "file://ni-visa-labview-filter-dialog-20.0.0.49152-0+f0.noarch.rpm"
        "file://ni-visa-labview-io-control-20.0.0.49152-0+f0.x86_64.rpm"
        "file://ni-visa-labview-rc-20.0.0.49152-0+f0.noarch.rpm"
        "file://ni-visa-lxi-discovery-20.0.0.49152-0+f0.x86_64.rpm"
        "file://ni-visa-passport-enet-20.0.0.49152-0+f0.x86_64.rpm"
        "file://ni-visa-passport-enet-serial-20.0.0.49152-0+f0.x86_64.rpm"
        "file://ni-visa-passport-gpib-20.0.0.49152-0+f0.x86_64.rpm"
        "file://ni-visa-passport-pxi-20.0.0.49152-0+f0.x86_64.rpm"
        "file://ni-visa-passport-pxi-dkms-20.0.0.49152-0+f0.x86_64.rpm"
        "file://ni-visa-passport-remote-20.0.0.49152-0+f0.x86_64.rpm"
        "file://ni-visa-passport-serial-20.0.0.49152-0+f0.x86_64.rpm"
        "file://ni-visa-passport-usb-20.0.0.49152-0+f0.x86_64.rpm"
        "file://ni-visa-runtime-20.0.0.49152-0+f0.noarch.rpm"
        "file://ni-visa-server-20.0.0.49152-0+f0.x86_64.rpm"
        "file://libvisa-20.0.0.49152-0+f0.x86_64.rpm"
        "file://libvisa-data-20.0.0.49152-0+f0.noarch.rpm"
        "file://ni-visa-sysapi-20.0.0.49152-0+f0.x86_64.rpm")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd ${srcdir}
    for file in ${source[@]}; do if [ ${file: -4} == ".rpm" ]; then bsdtar -xf "${file#file://}"; fi; done
}
            
            
package() {
  mkdir -p "${pkgdir}/opt"
  cp -rp "${srcdir}/usr/local/natinst" "${pkgdir}/opt/"
  mkdir -p "${pkgdir}/usr/bin/"
  cp -rp "${srcdir}/usr/bin" "${pkgdir}/usr/"
  mkdir -p "${pkgdir}/usr/include/"
  cp -rp "${srcdir}/usr/include" "${pkgdir}/usr/"
  mkdir -p "${pkgdir}/usr/lib/"
  cp -rp "${srcdir}/usr/lib" "${pkgdir}/usr/"
  mkdir -p "${pkgdir}/usr/lib64/"
  cp -rp "${srcdir}/usr/lib64" "${pkgdir}/usr/"
  mkdir -p "${pkgdir}/usr/share/"
  cp -rp "${srcdir}/usr/share" "${pkgdir}/usr/"
  mkdir -p "${pkgdir}/usr/src/"
  cp -rp "${srcdir}/usr/src" "${pkgdir}/usr/"
  mkdir -p "${pkgdir}/etc"
  cp -rp "${srcdir}/etc" "${pkgdir}/"
  mkdir -p "${pkgdir}/var"
  cp -rp "${srcdir}/var" "${pkgdir}/"
}

# vim:set et sw=2 sts=2:
```
产生了labview-visa-2020_0f1-1_amd64.deb
```
sudo dpkg -i labview-visa-2020_0f1-1_amd64.deb
sudo dkms install -m NiViPciK -v 20.0.0f0
sudo /usr/lib/dkms/common.postinst NiViPciK 20.0.0f0
sudo dkms install -m NiRioSrv -v 20.0.1f0
sudo /usr/lib/dkms/common.postinst NiRioSrv 20.0.1f0
sudo /sbin/ldconfig
sudo -H pip3 install pyvisa -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install pyvisa-py -i https://mirrors.163.com/pypi/simple
sudo reboot
```
driverwizard是否正常

缺失liblvrt.so.20.0
```
sudo alien labview-2020-rte-20.0.0-1.x86_64.rpm
sudo dpkg -i labview-2020-rte_20.0.0-2_amd64.deb
sudo apt remove labview-2020-rte
```
```
cd /opt/natinst
$ find . -name "liblvrt.so*"
./LabVIEW-2020-64/AppLibs/liblvrt.so.20.0.0
./LabVIEW-2020-64/AppLibs/liblvrt.so
```

再strace driverwizard
```
cd /opt/natinst/LabVIEW-2020-64/AppLibs
sudo ln -s liblvrt.so.20.0.0 liblvrt.so.20.0
sudo ln -s ../resource/libniCPULib.so.20.0.0 libniCPULib.so
sudo mkdir English
sudo cp lvapp.rsc English/
sudo cp ../resource/tdtable.tdr .
```
driverwizard等几个起码能打开了

libvisa-20.0.0.49152-0+f0.x86_64.rpm

libvisa-data-20.0.0.49152-0+f0.noarch.rpm

添加到PKGBUILD很重要，已经更新

## 初始化一下有关的vesa driver配置
```
$ su
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/natinst/LabVIEW-2020-64/AppLibs:/opt/natinst/niPythonInterface/lib64:/opt/natinst/share/NI-VISA:/opt/natinst/LabVIEW-2020-64/resource
# visaconf
```


* * *
# 安装 sunlogin

## sunloginremote 5
没啥用，基本上只能用来访问远程桌面和绑定本机，绑定机器免密
```
sudo dpkg -i sunloginremote-5.1.0.36963-amd64.deb
/usr/local/sunloginremote/bin/sunloginremote
```

`cd /usr/local/bin`
`sudo gedit sunloginremote`
```
#!/bin/bash
cd /usr/local/sunloginremote/bin/
./sunloginremote
```
`sudo chmod +x sunloginremote`



## sunloginclient 11 (与 sunloginclient 9 冲突)

`$ sudo dpkg -i sunloginclient-11.0.0.36662-amd64.deb`

```
sudo dpkg -i SunloginClient_11.0.1.44968_amd64.deb
/etc/systemd/system/multi-user.target.wants/runsunloginclient.service → /etc/systemd/system/runsunloginclient.service
```
/usr/local/sunlogin/bin/sunloginclient  获取当前ID，PC端可以登录绑定ID
```
sudo systemctl enable runsunloginclient.service
sudo systemctl start runsunloginclient.service
```
更换lightdm之后就可以了。
```
dpkg -S /usr/local/sunlogin/bin/oray_rundaemon
sunloginclient: /usr/local/sunlogin/bin/oray_rundaemo

apt-cache showpkg sunloginclient
11.0.1.44968
```

## sunloginclient 9
```
$ cat /etc/orayconfig.conf
fastcode=k122163255
password=0975
```
```
http://127.0.0.1:30080
122163255
0975
```
## sunloginremote 1.6
只能用来访问远程桌面和绑定本机，绑定机器免密

## 安装更换登陆器为lightdm
```
sudo apt install lightdm 不要安装 lightdm-gtk-greeter
```
`$ cat /etc/lightdm/lightdm.conf`
```
[SeatDefaults]
greeter-setup-script=xhost +
```

然后启用lightdm登陆器
```
sudo dpkg-reconfigure lightdm
```

## gdm3登陆器有关设置[未验证]

/etc/gdm3/Init/Default添加一行 xhost + 到头部
```
#!/bin/sh
# Stolen from the debian kdm setup, aren't I sneaky
# Plus a lot of fun stuff added
#  -George

PATH="/usr/bin:$PATH"
OLD_IFS=$IFS

xhost +
......
```

/etc/gdm3/custom.conf
```
# GDM configuration storage
#
# See /usr/share/gdm/gdm.schemas for a list of available options.

[daemon]
# Uncoment the line below to force the login screen to use Xorg
WaylandEnable=false

# Enabling automatic login
#  AutomaticLoginEnable = true
#  AutomaticLogin = user1

# Enabling timed login
#  TimedLoginEnable = true
#  TimedLogin = user1
#  TimedLoginDelay = 10

[security]
DisallowTCP=false

[xdmcp]
Enable=true
DisplaysPerHost=10 

[chooser]

[debug]
# Uncomment the line below to turn on debugging
# More verbose logs
# Additionally lets the X server dump core if it crashes
#Enable=true
```

## 配置 ssh
```
/etc/ssh/ssh_config
ForwardX11 yes
ForwardX11Trusted yes
# systemctl restart sshd
```

* * *
# 按键精灵 xdotool
```
sudo apt install libxdo3 xdotool
```

* * *
# 轻量级的python ide
```
sudo apt install idle
```

* * *
# python 模块 有关
```
sudo -H pip3 install serial -i https://mirrors.163.com/pypi/simple
ERROR: Cannot uninstall 'PyYAML'. It is a distutils installed project and thus we cannot accurately determine which files belong to it which would lead to only a partial uninstall.
```
解决办法, --ignore-installed
```
sudo -H pip3 install serial -i https://mirrors.163.com/pypi/simple --ignore-installed pyyaml
```
以后遇到此类问题，都可以采用此种方法，先忽略掉出问题的包，然后在继续按装自己要安装的包

```
sudo -H pip3 install pyserial -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install PyQt5-stubs==5.15.2.0 -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install --no-deps PyQt5-stubs==5.15.2.0 -i https://mirrors.163.com/pypi/simple
```


* * *
# apt加速
apt临时加速(shadowsocks通过privoxy把socks5映射为http/https..,默认privoxy的端口8118)
```
sudo apt-get -o Acquire::http::proxy="http://127.0.0.1:8118/" upgrade
sudo apt-get -o Acquire::https::proxy="http://127.0.0.1:8118/" upgrade
sudo apt-get -o Acquire::http::proxy="http://127.0.0.1:8118/" install xxx
sudo apt-get -o Acquire::https::proxy="http://127.0.0.1:8118/" install xxx
```
新建~/apt_proxy_conf
`gedit ~/apt_proxy_conf`
```
Acquire::http::proxy "http://127.0.0.1:8118";
Acquire::ftp::proxy "http://127.0.0.1:8118";
Acquire::https::proxy "http://127.0.0.1:8118";
```
运行
```
sudo apt-get -c ~/apt_proxy_conf update
```


* * *
# qt5ct问题

inotify_add_watch("/home/andreas/.config/qt5ct") failed: "No such file or directory"

那么运行一下qt5ct,就产生了~/.config/qt5ct目录及下面的文件




* * *
# pyenv依赖
```
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev libedit-dev
```
- pyenv可以这样安装
```
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
```
安装脚本有可能会提示你手动把几行命令添加到shell的配置文件中,如果你用的是zsh的话，别忘了替换命令中的bash。将来如果要删除的话，需要在.zshrc文件中删除。如果你用oh-my-zsh的话，不需要在.zshrc中添加那几行（加了也没用），而是在.zshrc中启用pyenv插件


- 确定你想把 pyenv 安装在哪。推荐安装在 $HOME/.pyenv，但你也可以安装在任意位置。
```
$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```
- 定义你 PYENV_ROOT 的环境变量来指定你把 pyenv 仓库克隆到了哪，并把 $PYENV_ROOT/bin 添加到你的 $PATH 中，这样就能在命令行使用 pyenv 命令。
```
$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
```
- 设置启动 shell 时自动加载 pyenv 脚本。在 shell 配置文件的最后面加上 eval "$(pyenv init -)"
```
$ echo 'eval "$(pyenv init -)"' >> ~/.bashrc
OR
$ echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc
```
- 重启 shell，使脚本生效。
```
$ exec $SHELL
```
安装不同的 python 版本到 $(pyenv root)/versions 文件夹。

在 pyenv 安装之前的所有 python 版本都归为 system 版本。 （可以用 pyenv versions 查看当前安装的 python 版本）

在安装 python 之前，可以使用 pyenv install -l 查看当前可以安装哪些 python 版本。

然后使用 pyenv install 选择的版本 来安装你所选择的 python 版本。比如 pyenv install 3.6.1 安装 python 官网的版本

使用 git 更新 pyenv

如果你是按照上面的方法安装的 pyenv，那你可以使用 git 来更新

- 更新为最新的开发版
```
$ cd $(pyenv root)
$ git pull
```
- 更新为指定的版本
```
$ cd $(pyenv root)
$ git fetch
$ git tag
v0.1.0
$ git checkout v0.1.0
```
- 进行更新：
```
$ pyenv update
```
- 要卸载pyenv，直接删除目录即可:
```
$ rm -fr ~/.pyenv
```
- 别忘了把.bashrc中的这几行也一并删掉：
```
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```
- 完整卸载 pyenv:

pyenv 的根目录删除即可全部删除 pyenv（通过 pyenv install ... 安装的 python 版本都会删除）。
```
rm -rf $(pyenv root)
```

- 只是禁用 pyenv:

那么把 pyenv init 从 shell 的配置文件中移除，然后重启 shell 就行了（移除后 pyenv 命令仍然能使用，但是版本切换命令不会生效）

当执行命令的时候，系统会在环境变量中从左到右依次寻找匹配的命令并执行。环境变量中是一组以冒号:分隔的路径,pyenv的工作原理其实很简单，将它自己管理的Python目录插到环境变量的最前面，这样一来系统在搜索Python的时候第一个找到的就是pyenv管理的Python环境。这个插到最前面的路径就叫做垫片（shims）

- 选择Python版本

1.使用PYENV_VERSION环境变量(如果存在). 你可以使用pyenv shell 命令来在当前shell环境中设置该环境变量.

2.当前目录中应用程序指定的.python-version文件(如果存在). 你可以用pyenv local 命令来修改当前目录的.python-version文件.

3.自底向上搜索各层上级目录，找到的第一个.python-version, 直到到达文件系统根目录.

4.全局的$(pyenv root)/version文件. 可以使用 pyenv global 命令来修改. 如果全局版本文件不存在, pyenv假设你使用系统安装的Python. (换句话说就是未安装pyenv时环境变量中找到的Python.)

- pyenv常用命令

1.列出所有可安装的Python版本：
```
pyenv install -l|--list
```
2.安装某个Python：
```
pyenv install <version>
```
3.卸载某个Python，-f参数指定是否强制卸载，如果强制卸载的话不会弹出提示，而且如果版本不存在的话也不会显示错误信息：
```
pyenv uninstall [-f|--force] <version>
```
等同于直接删除 versions 文件夹下的对应 python 版本文件夹
4.列出所有已安装的Python，当前使用的Python会用星号标出：
```
$ pyenv versions
```
5.通过写~/.pyenv/version文件的方式设置全局Python：
```
$ pyenv global 2.7.6
```
6.通过在当前目录写.python-version文件的方式设置当前目录下的Python：
```
$ pyenv local 2.7.6
```
- 当不再需要本地Python的时候，用--unset来清除：
```
$ pyenv local --unset
```
7.指定当前shell使用的Python：
```
$ pyenv shell pypy-2.2.1
```
- 当不再需要的时候，用--unset来清除：
```
$ pyenv local --unset
```
更多见

<https://github.com/pyenv/pyenv/blob/master/COMMANDS.md>

## 安装 pyenv-virtualenv

pyenv-virtualenv 是 pyenv 的一个插件, 克隆 pyenv-virtual 仓库到 plugin 文件夹下

如果 pyenv 的安装目录不是 $HOME/.pyenv 需要确保克隆下来的仓库位于你所安装的 pyenv 目录下的 plugin 文件夹下

添加 pyenv virtualenv-init 到你的 shell 配置文件中，这样进入指定文件夹自动进入虚拟环境，离开文件夹退出虚拟环境。
```
$ echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
```
重启 shell
```
$ exec $SHELL
```
###创建 pyenv-virtualenv 虚拟环境
```
pyenv virtualenv [指定python版本] 虚拟环境名字
```
如果不指定 python 版本，则默认使用当前 pyenv version 的 python 版本。

创建的虚拟环境位于 $(pyenv root)/versions/ 下的指定 python 版本的文件夹中 envs/ 文件夹下

### 激活虚拟环境
#### 自动激活环境：
在 .bashrc 文件的最后添加 eval "$(pyenv virtualenv-init -)"，然后在 shell 中输入 exec "$SHELL" 重启 shell

在想要激活虚拟环境的文件夹中新建 .python-version 文件，并写入虚拟环境的名字（pyenv local python版本 该命令也是通过创建该文件来达到进入该文件夹后自动使用指定 python 版本的目的）

以后进入该的文件夹就会自动激活虚拟环境，离开该文件夹就会退出虚拟环境

#### 手动激活环境：
```
pyenv activate 虚拟环境名字
```
手动退出虚拟环境：
```
pyenv deactivate
```
### 删除虚拟环境：
有 2 种方法：

1.删除 $(pyenv root)/versions 和 $(pyenv root)/versions/{version}/envs 的相关文件夹即可。

2.命令行运行 pyenv uninstall 虚拟环境的名字





* * *
# 安装qtserialbus 和 modbus

- Overkill: get all qt-stuff
```
sudo apt install qml-module-qt-labs-folderlistmodel qml-module-qtquick-extras qml-module-qtquick-controls2 qt5-default libqt5quickcontrols2-5 qtquickcontrols2-5-dev qtcreator qtcreator-doc libqt5serialport5-dev build-essential qml-module-qt3d qt3d5-dev qtdeclarative5-dev qtconnectivity5-dev qtmultimedia5-dev
```
- To get rid of the private/qobject_p.h error
```
sudo apt-get install qtbase5-private-dev
```
- Build and install qtserialbus
```
git clone git://code.qt.io/qt/qtserialbus.git
cd qtserialbus
git checkout 5.9.8
qmake
make -j6
sudo make install
```

## 为了方便管理还是制作一个deb包
PKGBUILD
```
# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=qt5-serialbus-git
pkgver=5.9.8
pkgrel=1
pkgdesc="Qt5 serial bus module"
arch=('i686' 'x86_64')
url="https://www.qt.io/"
license=('FDL' 'GPL' 'LGPL3')
depends=('libqt5serialport5'
    'libqt5serialport5-dev')
makedepends=('git')
provides=('qt5-serialbus')
conflicts=('qt5-serialbus')
source=("git+https://code.qt.io/qt/qtserialbus.git#branch=5.9.8")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir"
  echo "$srcdir"
  echo "$PWD"
  mkdir -p "_build"
}

build() {
  cd "_build"

  qmake ../qtserialbus
  make
}

package() {
  cd "_build"

  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}
```
makedeb生产deb包,安装即可

## 打开qt5serialbus的debug信息
```
#include <QLoggingCategory>
main()添加
QLoggingCategory::setFilterRules(QStringLiteral("qt.modbus* = true"));
```

## fix master timeout bug

Master接收很快响应的情况状态切换不及时导致的假timeout错误

<https://bugreports.qt.io/browse/QTBUG-69188>

修改PKGBUILD增加一个patch文件

然后再编译一版, 就解决了



## 另一个不依赖qt的modbus库
```
sudo apt-get install libmodbus-dev libmodbus5
```
slave和master的测试代码已经实验存档


* * *
# tcl related
```
sudo apt install tclreadline
```
* * *
# 安装测试iverilog(icarus), gtkwave显示
```
sudo apt install iverilog verilog gtkwave
```
## 测试例子:
bcd2ex3.v
```
module bcd2ex3(A,B,C,D,W,X,Y,Z);
input A,B,C,D;
output W,X,Y,Z;
assign W = A|(B&C)|(B&D);
assign X = (~B&C)|(~B&D)|(B&~C&~D);
assign Y = ~(C^D);
assign Z = ~D;
endmodule
```
bcd2ex3_tb.v
```
module bcd2ex3_tb;
wire W,X,Y,Z;
reg A,B,C,D;
bcd2ex3 bcd2ex3_inst(A,B,C,D,W,X,Y,Z);

initial
begin
$dumpfile("dump1.vcd");
$dumpvars(0, bcd2ex3_tb);
$display("A B C D|W X Y Z");
$monitor(A," ",B," ",C," ",D,"|",W," ",X," ",Y," ",Z);
A = 0;
B = 0;
C = 0;
D = 0;
#5 A = 0; B = 0; C = 0; D = 0;
#5 A = 0; B = 0; C = 0; D = 1;
#5 A = 0; B = 0; C = 1; D = 0;
#5 A = 0; B = 0; C = 1; D = 1;
#5 A = 0; B = 1; C = 0; D = 0;
#5 A = 0; B = 1; C = 0; D = 1;
#5 A = 0; B = 1; C = 1; D = 0;
#5 A = 0; B = 1; C = 1; D = 1;
#5 A = 1; B = 0; C = 0; D = 0;
#5 A = 1; B = 0; C = 0; D = 1;
end
endmodule
```

1. cmd way

```
# compile
iverilog -o simple.vvp simple.v simple_tb.v
# run simulation
vvp simple.vvp
# show wave
gtkwave simple.vcd
```
2. Makefile way

Makefile
```
TARGET = bcd2ex3
TEST = $(TARGET)Test

GFLAGS = -S gtkwave.tcl
#GTKWAVE_OSX = /Applications/gtkwave.app/Contents/Resources/bin/gtkwave
GTKWAVE = /usr/bin/gtkwave

all: clean
	iverilog -g2005 -Wall -Wno-timescale -o $(TEST) $(TARGET).v $(TARGET)_tb.v
	vvp $(TEST)
	gtkwave $(GFLAGS) *.vcd 2>/dev/null || $(GTKWAVE) $(GFLAGS) *.vcd 2>/dev/null
clean:
	rm -f *.vcd
	rm -f *Test *test
```

3. tcl way

```
gtkwave dump1.vcd -W
```
gtkwave.tcl
```
# Add all signals
set nfacs [ gtkwave::getNumFacs ]
set all_facs [list]
for {set i 0} {$i < $nfacs } {incr i} {
    set facname [ gtkwave::getFacName $i ]
    lappend all_facs "$facname"
}
set num_added [ gtkwave::addSignalsFromList $all_facs ]
puts "num signals added: $num_added"

# zoom full
gtkwave::/Time/Zoom/Zoom_Full
```

* * *
# 安装ghdl
```
sudo add-apt-repository ppa:pgavin/ghdl
sudo apt-get update
sudo apt-get install ghdl
sudo apt-get install gtkwave
```

tips:

analyze
```
$ ghdl -a adder_tb.vhdl
```
build
```
$ ghdl -e adder_tb
```
run
```
$ ghdl -r adder_tb --vcd=adder.vcd
```
view
```
$ gtkwave adder.vcd
```

我艹,ppa没有?!
编译吧, 参考后面的topic把ada编译器降级为gcc7.5匹配版本

<https://github.com/ghdl/ghdl.git> 下载ghdl的开发版本
`git clone git@github.com:ghdl/ghdl.git`
```
$ ./configure --prefix=/usr/local
$ make
$ sudo make install
$ sudo make uninstall
```
有一些库会和原声deb包的冲突, 最好用PKGBUILD生成deb包



* * *
# 降级gnat(gnu-ada)为7
```
sudo aptitude install gnat gnat-gps
```
gnat-gps是一个ide
测试
file name: Calculator.ada
```
-- 
-- Integer calculator program. Takes lines of input consisting of 
-- <operator> <number>, and applies each one to a display value. The 
-- display value is printed at each step. The operator is one of =, 
-- +, -, *, /, or ^, which correspond to assign, add, subtract, multiply 
-- divide, and raise, respectively. The display value is initially zero. 
-- The program terminates on a input of q. 
-- 
with Text_IO; 
with Gnat.Io; use Gnat.Io; 
procedure Calc is 
    Op: Character;    -- Operation to perform. 
    Disp: Integer := 0;   -- Contents of the display. 
    In_Val: Integer;    -- Input value used to update the display. 
begin 
    loop 
     -- Print the display. 
     Put(Disp); 
     New_Line; 

     -- Promt the user. 
     Put("> "); 

     -- Skip leading blanks and read the operation. 
     loop 
     Get(Op); 
     exit when Op /= ' '; 
     end loop; 

     -- Stop when we're s'posed to. 
     exit when Op = 'Q' or Op = 'q'; 

     -- Read the integer value (skips leading blanks) and discard the 
     -- remainder of the line. 
     Get(In_Val); 
     Text_IO.Skip_Line; 

     -- Apply the correct operation. 
     case Op is 
     when '='  => Disp := In_Val; 
     when '+'  => Disp := Disp + In_Val; 
     when '-'  => Disp := Disp - In_Val; 
     when '*'  => Disp := Disp * In_Val; 
     when '/'  => Disp := Disp/In_Val; 
     when '^'  => Disp := Disp ** In_Val; 
     when '0'..'9' => Put_Line("Please specify an operation."); 
     when others => Put_Line("What is " & Op & "?"); 
     end case; 
    end loop; 
end Calc; 
```
compile:
```
gnatmake Calculator.ada
```
or
```
gcc -x ada -c Calculator.ada
```

* * *
# 编译一个GHDL的deb包
PKGBUILD
```
pkgname=ghdl
pkgver=2.0.0dev.r6924.g8d512a44b
pkgrel=1
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='VHDL simulator - GCC back-end'
url='https://github.com/ghdl/ghdl'
license=('GPL2')

provides=("ghdl=$pkgver")
conflicts=('ghdl')
makedepends=('git')
depends=('gnat')
options=(!emptydirs staticlibs)
source=(
	"ghdl::git://github.com/ghdl/ghdl.git"
)
sha256sums=(
	'SKIP'
)
pkgver() {
	cd "${srcdir}/ghdl"
	local _distver=`sed -n -e 's/^ghdl_version=.*"\(.*\)".*/\1/p' configure | tr -d '-'`
	local _gitrev=`git rev-list --count HEAD`
	local _githash=`git rev-parse --short HEAD`
	echo $_distver.r$_gitrev.g$_githash;
}
prepare() {
	cd "${srcdir}"
	cd "${srcdir}/ghdl"
	./configure \
		--prefix=/usr \
		--enable-libghdl \
		--enable-synth
}
build() {
	cd "${srcdir}/ghdl"
	make
}
package() {
    # Install VHDL libraries and runtime
	cd "${srcdir}/ghdl"
	make DESTDIR="${pkgdir}" install
	# Remove gcc-specific files, keep only what is related to ghdl
	cd "${pkgdir}"
	rm -rf "usr/include/libiberty"
	rm -rf "usr/share/locale"
	rm -rf "usr/share/man/man7"
	find "usr/lib" \
		-maxdepth 1 -mindepth 1 \
		-not -name 'gcc' \
		-not -name '*ghdl*' \
		-exec rm -rf {} +
	find "usr/bin" \
		-maxdepth 1 -mindepth 1 -not -name 'ghdl*' \
		-exec rm -rf {} +
	# In case it does not exist, create symlink libghdl.so
	local _gso=`ls "${pkgdir}/usr/lib/" | grep -e '^libghdl-.*\.so$' | head -n 1`
	if [[ -n "$_gso" ]] ; then
		ln -s "$_gso" "${pkgdir}/usr/lib/libghdl.so"
	fi
	# GTKWave has always installed binary ghwdump, now ghdl does it too
	# While awaiting for the two projects to agree, you can prevent install of ghwdump here
	rm -f "${pkgdir}/usr/bin/ghwdump"
}
```
ok, 可以用

## GHDL测试:
adder.vhd
```
 entity adder is
   -- i0, i1 and the carry-in ci are inputs of the adder.
   -- s is the sum output, co is the carry-out.
   port (i0, i1 : in bit; ci : in bit; s : out bit; co : out bit);
 end adder;
 
 architecture rtl of adder is
 begin
    --  This full-adder architecture contains two concurrent assignment.
    --  Compute the sum.
    s <= i0 xor i1 xor ci;
    --  Compute the carry.
    co <= (i0 and i1) or (i0 and ci) or (i1 and ci);
 end rtl;
```
adder_tb.vhd
```
     --  A testbench has no ports.
     entity adder_tb is
     end adder_tb;
     
     architecture behav of adder_tb is
        --  Declaration of the component that will be instantiated.
        component adder
          port (i0, i1 : in bit; ci : in bit; s : out bit; co : out bit);
        end component;
        --  Specifies which entity is bound with the component.
        for adder_0: adder use entity work.adder;
        signal i0, i1, ci, s, co : bit;
     begin
        --  Component instantiation.
        adder_0: adder port map (i0 => i0, i1 => i1, ci => ci,
                                 s => s, co => co);
     
        --  This process does the real job.
        process
           type pattern_type is record
              --  The inputs of the adder.
              i0, i1, ci : bit;
              --  The expected outputs of the adder.
              s, co : bit;
           end record;
           --  The patterns to apply.
           type pattern_array is array (natural range <>) of pattern_type;
           constant patterns : pattern_array :=
             (('0', '0', '0', '0', '0'),
              ('0', '0', '1', '1', '0'),
              ('0', '1', '0', '1', '0'),
              ('0', '1', '1', '0', '1'),
              ('1', '0', '0', '1', '0'),
              ('1', '0', '1', '0', '1'),
              ('1', '1', '0', '0', '1'),
              ('1', '1', '1', '1', '1'));
        begin
           --  Check each pattern.
           for i in patterns'range loop
              --  Set the inputs.
              i0 <= patterns(i).i0;
              i1 <= patterns(i).i1;
              ci <= patterns(i).ci;
              --  Wait for the results.
              wait for 1 ns;
              --  Check the outputs.
              assert s = patterns(i).s
                 report "bad sum value" severity error;
              assert co = patterns(i).co
                 report "bad carray out value" severity error;
           end loop;
           assert false report "end of test" severity note;
           --  Wait forever; this will finish the simulation.
           wait;
        end process;
     end behav;
```
gtkwave.tcl
```
# Add all signals
set nfacs [ gtkwave::getNumFacs ]
set all_facs [list]
for {set i 0} {$i < $nfacs } {incr i} {
    set facname [ gtkwave::getFacName $i ]
    lappend all_facs "$facname"
}
set num_added [ gtkwave::addSignalsFromList $all_facs ]
puts "num signals added: $num_added"

# zoom full
gtkwave::/Time/Zoom/Zoom_Full

# Print
set dumpname [ gtkwave::getDumpFileName ]
gtkwave::/File/Print_To_File PDF {Letter (8.5" x 11")} Minimal $dumpname.pdf
```
Makefile
```
TARGET = adder

all: clean
	ghdl -a --ieee=synopsys $(TARGET).vhd
	ghdl -a --ieee=synopsys $(TARGET)_tb.vhd
	ghdl -e --ieee=synopsys $(TARGET)_tb
	ghdl -r --ieee=synopsys $(TARGET)_tb --stop-time=1000ns --vcd=$(TARGET).vcd
	gtkwave -S gtkwave.tcl $(TARGET).vcd 2>/dev/null

clean:
	rm -f *~ *.cf *.vcd

```

* * *
# firefox 崩溃处理

Failed to open curl lib from binary, use libcurl.so instead

```
firefox -safe-mode
```
ok
但是禁用addon了也会崩溃
```
sudo aptitude install libcurl4 libcurl4-gnutls-dev
也不行
```
查询可用的降级版本
```
apt list -a firefox

Listing... Done
firefox/bionic-updates,bionic-security,now 95.0.1+build2-0ubuntu0.18.04.1 amd64 [installed]
firefox/bionic 59.0.2+build1-0ubuntu1 amd64

```

指定降级版本
```
sudo apt-get install firefox=59.0.2+build1-0ubuntu1
```
暂时这样解决吧

* * *
# chm文件查看

chm文件一定要放在英文路径,否则都打不开

wine的hh也可以
```
$ sudo apt install libchm1 xchm

$ sudo apt install kchmviewer
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  breeze-icon-theme docbook-xsl kde-runtime kde-runtime-data kde-style-breeze kde-style-breeze-qt4 kdelibs-bin kdelibs5-data kdelibs5-plugins kdoctools libattica0.4 libdlrestrictions1 libgpgme++2v5
  libkactivities6 libkcmutils4 libkde3support4 libkdeclarative5 libkdecore5 libkdesu5 libkdeui5 libkdewebkit5 libkdnssd4 libkemoticons4 libkf5style5 libkfile4 libkhtml5 libkio5 libkjsapi4 libkjsembed4
  libkmediaplayer4 libknewstuff3-4 libknotifyconfig4 libkntlm4 libkparts4 libkpty4 libkrosscore4 libktexteditor4 libkxmlrpcclient4 libntrack-qt4-1 libntrack0 libphonon4 libplasma3 libpolkit-qt-1-1 libqca2
  libqca2-plugins libsolid4 libstreamanalyzer0v5 libstreams0v5 libthreadweaver4 ntrack-module-libnl-0 phonon phonon-backend-gstreamer plasma-scriptengine-javascript
Suggested packages:
  dbtoepub docbook-xsl-doc-html | docbook-xsl-doc-pdf | docbook-xsl-doc-text | docbook-xsl-doc docbook-xsl-saxon fop libsaxon-java libxslthl-java xalan djvulibre-bin finger phonon-backend-vlc
The following NEW packages will be installed:
  breeze-icon-theme docbook-xsl kchmviewer kde-runtime kde-runtime-data kde-style-breeze kde-style-breeze-qt4 kdelibs-bin kdelibs5-data kdelibs5-plugins kdoctools libattica0.4 libdlrestrictions1 libgpgme++2v5
  libkactivities6 libkcmutils4 libkde3support4 libkdeclarative5 libkdecore5 libkdesu5 libkdeui5 libkdewebkit5 libkdnssd4 libkemoticons4 libkf5style5 libkfile4 libkhtml5 libkio5 libkjsapi4 libkjsembed4
  libkmediaplayer4 libknewstuff3-4 libknotifyconfig4 libkntlm4 libkparts4 libkpty4 libkrosscore4 libktexteditor4 libkxmlrpcclient4 libntrack-qt4-1 libntrack0 libphonon4 libplasma3 libpolkit-qt-1-1 libqca2
  libqca2-plugins libsolid4 libstreamanalyzer0v5 libstreams0v5 libthreadweaver4 ntrack-module-libnl-0 phonon phonon-backend-gstreamer plasma-scriptengine-javascript
```

* * *
# kmplayer
```
$ sudo apt install mplayer kmplayer vdr xawtv konqueror libdirectfb-extra mplayer-doc fping
```
```
 │ By default VDR is configured to use /var/lib/video to store recordings.   │ 
 │ You can either create this directory now, or change this behavior later   │ 
 │ by modifying the config file /etc/vdr/conf.d/00-vdr.conf.
```
```
sudo apt purge vdr
```

* * *
# altera quartus 11 / 18
```
$ /opt/altera/11.0/quartus/bin/quartus
quartus: error while loading shared libraries: libpng12.so.0: cannot open shared object file: No such file or directory
$ cd /opt/altera/11.0/quartus/linux64
$ cp /opt/modelsim/modeltech/linux_x86_64/libpng12.so.0* .
$ /opt/altera/11.0/quartus/bin/quartus --64bit
从另外系统的~/.local/share/Steam/ubuntu12_32/steam-runtime/lib/i386-linux-gnu/, 复制32bit的libpng12.so.0*
到/media/andreas/ea50f5dd-ef29-4c33-8662-6628b75bef651/altera/11.0/quartus/linux
cp /opt/modelsim/modeltech/linux_x86_64/libpng12.so.0* /opt/altera/18.1/quartus/linux64/
```
修改license的hostid

然后修改desktop文件

Quartus 11.0.desktop
```
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=Quartus 11.0
Comment=Quartus 11.0
Icon=/opt/altera/11.0/quartus/adm/quartusii.png
#Exec=/opt/altera/11.0/quartus/bin/quartus
Exec=env LM_LICENSE_FILE=/opt/modelsim/license.dat:/opt/altera/license.dat:/opt/lscc/license.dat:/opt/synopsys/synopsys.dat sh -c '/opt/altera/11.0/quartus/bin/quartus'
```
Quartus 11.0-64bit.desktop
```
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=Quartus 11.0 64bit
Comment=Quartus 11.0
Icon=/opt/altera/11.0/quartus/adm/quartusii.png
Exec=env LM_LICENSE_FILE=/opt/modelsim/license.dat:/opt/altera/license.dat:/opt/lscc/license.dat:/opt/synopsys/synopsys.dat sh -c '/opt/altera/11.0/quartus/bin/quartus --64bit'
```
Quartus 18.1.desktop
```
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=Quartus 18.1
Comment=Quartus 18.1
Icon=/opt/altera/18.1/quartus/adm/quartusii.png
#Exec=/opt/altera/18.1/quartus/bin/quartus
Exec=env LM_LICENSE_FILE=/opt/modelsim/license.dat:/opt/altera/license.dat:/opt/lscc/license.dat:/opt/synopsys/synopsys.dat sh -c '/opt/altera/18.1/quartus/bin/quartus'
```

* * *
# 一些deb包制作修改的官方文档和工具

<https://www.debian.org/doc/manuals/maint-guide/>

<https://www.debian.org/doc/devel-manuals#debmake-doc>

<https://packages.debian.org/search?keywords=packaging-tutorial>

<https://launchpad.net/ubuntu/+source/ubuntu-packaging-guide>

```
pull-lp-source
sudo apt install ubuntu-dev-tools
Suggested packages:
  bzr-doc bzrtools python-bzrlib.tests cowdancer gdebi-core python-apt-dbg
  python-apt-doc python-blinker-doc python-bzrlib-dbg python-kerberos
  python-paramiko python-pycurl python-testresources libcurl4-gnutls-dev
  python-pycurl-doc python3-pycurl-dbg debconf-utils debsums dlocate
  python3-urwid python3-gtkspellcheck emacs24-bin-common | emacs25-bin-common
  claws-mail
The following NEW packages will be installed:
  bzr bzr-builddeb debian-archive-keyring debian-keyring eatmydata
  libeatmydata1 libsys-cpuaffinity-perl libxdelta2 pbuilder pbzip2 pixz
  pristine-tar python-apt python-blinker python-bzrlib python-debian
  python-distro python-distro-info python-httplib2 python-jwt
  python-launchpadlib python-lazr.restfulclient python-lazr.uri
  python-oauthlib python-simplejson python-wadllib python3-debianbts
  python3-dns python3-pycurl python3-pysimplesoap python3-reportbug
  python3-ubuntutools reportbug ubuntu-dev-tools xdelta xdelta3
```

* * *
# 安装 gnat-2021-20210519-x86_64-linux-bin
```
export PATH=/opt/GNAT/2021/bin:$PATH
gnatstudio
```
这样就可以使用gnatstudio


* * *
# 临时修改系统时间 change the time temporarily in Ubuntu 18.04

tips:新版的ubuntu中，使用timedatectl 替换了ntpdate来进行时间管理

先关闭自动时间同步
```
timedatectl set-ntp no
```
然后修改 HH:MM:SS YYYY-MM-DD
```
timedatectl set-time 21:45:53
timedatectl set-time 2019-04-10
```
也可以修改时区
```
timedatectl list-timezones
timedatectl list-timezones | grep keyword
timedatectl set-timezone Region/Location
timedatectl set-timezone UTC
```
Set Hardware Clock to Sync to Local Timezone
```
timedatectl set-local-rtc 1
```
Set the Hardware Clock to Sync with UTC, 一般这个是默认状态
```
timedatectl set-local-rtc 0
```
查看硬件时间
```
sudo hwclock -r
既然是临时修改,就不要sudo hwclock -w
```
这个topic的诱因是vivado2017.4~2021.2的vtc在2022年之后timestamp-overflow问题
<https://support.xilinx.com/s/question/0D52E00006uxnnFSAQ/2022-timestamp-overflow-error-2201011128-is-an-invalid-argument-please-specify-an-integer-value?language=en_US>
<https://support.xilinx.com/s/question/0D52E00006uxy49SAA/vivado-fails-to-export-ips-with-the-error-message-bad-lexical-cast-source-type-value-could-not-be-interpreted-as-target?language=en_US>
<https://support.xilinx.com/s/question/0D52E00006uxy49SAA/vivado-fails-to-export-ips-with-the-error-message-bad-lexical-cast-source-type-value-could-not-be-interpreted-as-target?language=en_US>
最好的办法是修改时间的办法来规避
```
timedatectl set-ntp no
sudo date -s "20190405 14:31:00"
```
用完了恢复时间同步
```
timedatectl set-ntp yes
```

## 官方释放了一个patch

<https://support.xilinx.com/s/article/76960?language=en_US>

解压到/opt/Xilinx
那么有这个目录/opt/Xilinx/y2k22_patch
```
cd /opt/Xilinx
export LD_LIBRARY_PATH=$PWD/Vivado/2020.1/tps/lnx64/python-2.7.16/lib/
./Vivado/2020.1/tps/lnx64/python-2.7.16/bin/python2.7 y2k22_patch/patch.py
```
输出
```
[2022-01-18] INFO: This script (version: 1.2) patches Xilinx Tools for HLS Y2k22 bug for the following release: 
		2014.*, 2015.*, 2016.*, 2017.*, 2018.*, 2019.*, 2020.* and 2021.*
[2022-01-18] UPDATE: /opt/Xilinx/Vivado/2017.4/common/scripts
[2022-01-18] COPY: /opt/Xilinx/y2k22_patch/automg_patch_20220104.tcl  to /opt/Xilinx/Vivado/2017.4/common/scripts/automg_patch_20220104.tcl 
[2022-01-18] UPDATE: /opt/Xilinx/Vivado/2018.3/common/scripts
[2022-01-18] COPY: /opt/Xilinx/y2k22_patch/automg_patch_20220104.tcl  to /opt/Xilinx/Vivado/2018.3/common/scripts/automg_patch_20220104.tcl 
[2022-01-18] UPDATE: /opt/Xilinx/Vitis/2020.1/common/scripts
[2022-01-18] COPY: /opt/Xilinx/y2k22_patch/automg_patch_20220104.tcl  to /opt/Xilinx/Vitis/2020.1/common/scripts/automg_patch_20220104.tcl 
[2022-01-18] UPDATE: /opt/Xilinx/Vivado/2020.1/common/scripts
[2022-01-18] COPY: /opt/Xilinx/y2k22_patch/automg_patch_20220104.tcl  to /opt/Xilinx/Vivado/2020.1/common/scripts/automg_patch_20220104.tcl 

```
* * *
# synplify open slow 启动慢的问题

/etc/hosts for arch
```
#
# /etc/hosts: static lookup table for host names
#

#<ip-address>	<hostname.domain.org>	<hostname>
127.0.0.1	localhost.localdomain	archbang andy
::1		localhost.localdomain	localhost andy
127.0.0.1 	licensing.ultraedit.com
127.0.0.1 	srv1.updates.synopsys.com
127.0.0.1 	srv2.updates.synopsys.com
127.0.0.1 	srv1.sw.synopsys.com
127.0.0.1 	srv2.sw.synopsys.com
127.0.0.1 	srv3.sw.synopsys.com

# End of file

```
/etc/hosts for ubuntu1804
```
127.0.0.1	localhost
127.0.1.1	Vostro-5880
127.0.0.1 	licensing.ultraedit.com
127.0.0.1 	srv1.updates.synopsys.com
127.0.0.1 	srv2.updates.synopsys.com
127.0.0.1 	srv1.sw.synopsys.com
127.0.0.1 	srv2.sw.synopsys.com
127.0.0.1 	srv3.sw.synopsys.com

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

```

* * *
# synopsys 要添加到环境变量的
```
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
...
...
export LM_LICENSE_FILE=/opt/questasim/license.dat:/opt/modelsim/license.dat:/opt/altera/license.dat:/opt/lscc/license.dat:/opt/synopsys/synopsys.dat
export PATH=$PATH:/opt/questasim/questasim/bin:/opt/questasim/questasim/linux_x86_64:/opt/modelsim/modeltech/bin:/opt/modelsim/modeltech/linux_x86_64:/opt/altera/11.0/quartus/bin:/opt/altera/11.0/nios2eds/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/altera/11.0/quartus/dsp_builder/bin64:/opt/altera/11.0/quartus/dspba/Blocksets/BaseBlocks/linux64:/opt/natinst/LabVIEW-2020-64/AppLibs:/opt/natinst/niPythonInterface/lib64:/opt/natinst/share/NI-VISA:/opt/natinst/LabVIEW-2020-64/resource
#export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libgtk3-nocsd.so.0

export DVE_HOME=/opt/synopsys/vcs/O-2018.09-SP2
#export DVE_HOME=/opt/synopsys/vcs/O-2018.09-SP2/gui/dve
export VCS_HOME=/opt/synopsys/vcs/O-2018.09-SP2
export VCS_MX_HOME=/opt/synopsys/vcs-mx/O-2018.09-SP2
export LD_LIBRARY_PATH=/opt/synopsys/verdi/Verdi_O-2018.09-SP2/share/PLI/VCS/LINUX64:/opt/synopsys/verdi/Verdi_O-2018.09-SP2/share/PLI/lib/LINUX64:$LD_LIBRARY_PATH
export VERDI_HOME=/opt/synopsys/verdi/Verdi_O-2018.09-SP2
export SCL_HOME=/opt/synopsys/scl/2018.06
#export VCS_TARGET_ARCH=linux64

#dve
export PATH=$PATH:$VCS_HOME/gui/dve/bin
alias dve="dve -full64"

#VCS
export PATH=$PATH:$VCS_MX_HOME/bin:$VCS_HOME/bin
#alias vcs="vcs -full64"
alias vcs="vcs -full64 -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed"
#alias vcs="vcs -full64 -cpp g++-5 -cc gcc-5 -LDFLAGS -Wl,--no-as-needed"

#VERDI
export PATH=$PATH:$VERDI_HOME/bin
alias verdi="verdi -full64"

#scl
export PATH=$PATH:$SCL_HOME/linux64/bin
export VCS_ARCH_OVERRIDE=linux
#export VCS_TARGET_ARCH=amd64
export VCS_TARGET_ARCH=linux64

#LICENCE
#export LM_LICENSE_FILE=27000@localhost.localdomain
#alias lmg_synopsys="lmgrd -c /opt/synopsys/scl/2018.06/admin/license/Synopsys.dat"
```
其他的
```
cp /opt/modelsim/modeltech/linux_x86_64/libpng12.so.0* /opt/synopsys/verdi/Verdi_O-2018.09-SP2/platform/linux64/bin
sudo apt install libstdc++5 libstdc++-5-dev
```

* * *
# questasim

```
export PATH=$PATH:/opt/questasim/questasim/linux_x86_64:/opt/questasim/questasim/bin:/opt/modelsim/modeltech/bin:/opt/modelsim/modeltech/linux_x86_64:/opt/altera/11.0/quartus/bin:/opt/altera/11.0/nios2eds/bin
export LM_LICENSE_FILE=/opt/questasim/license.dat:/opt/modelsim/license.dat:/opt/altera/license.dat:/opt/lscc/license.dat:/opt/synopsys/synopsys.dat
```
```
export LM_LICENSE_FILE=/opt/questasim/license.dat:/opt/modelsim/license.dat:/opt/altera/license.dat:/opt/lscc/license.dat:/opt/synopsys/synopsys.dat
export PATH=$PATH:/opt/questasim/questasim/bin:/opt/questasim/questasim/linux_x86_64:/opt/modelsim/modeltech/bin:/opt/modelsim/modeltech/linux_x86_64:/opt/altera/11.0/quartus/bin:/opt/altera/11.0/nios2eds/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/altera/11.0/quartus/dsp_builder/bin64:/opt/altera/11.0/quartus/dspba/Blocksets/BaseBlocks/linux64:/opt/natinst/LabVIEW-2020-64/AppLibs:/opt/natinst/niPythonInterface/lib64:/opt/natinst/share/NI-VISA:/opt/natinst/LabVIEW-2020-64/resource
```


* * *
# synopsys vcs run problems
```
sudo apt install gcc-4.8 gcc-4.8-multilib g++-4.8 g++-4.8-multilib
sudo apt install gcc-5 gcc-5-multilib g++-5 g++-5-multilib
sudo update-alternatives --config gcc
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 100
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 100
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 101
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 101
```
g++-4.8: error: unrecognized command line option '-no-pie'
需要这样换成4.8的gcc才能避免
```
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
```
编译通过但是simv运行有类似这样的问题

Dumping VCS Annotated Stack: Process VmPeak: 347276 kb, VmSize: 281740 kb System Free Memory: 1506056 kb, System Free Swap: 2074876 kb No context available

还是license有问题

按pubkey1.6进行patch
```
./pubkey_verify -y && ./synopsys_checksum -y
```
然后把Synopsys.src时间修改比如2030

scl_keygen.exe产生,然后把产生的lic用fix.bat补全,这样的lic可以然simv正常运行

```
$ lmgrd -c /opt/synopsys/synopsys_vcs.dat
$ export LM_LICENSE_FILE=27000@Vostro-5880
```
这样就可以用原有的static lic运行synplify, 需要的时候执行上面两条命令来运行vcs和dve

## 使用完记得gcc换回7,不然其他工具会出问题...


* * *
# docker synopsys 真方便
/etc/docker/daemon.json，加上如下的键值:
```
{
  "registry-mirrors": ["https://registry.docker-cn.com"]
}
```
重启docker服务
```
sudo systemctl daemon-reload
sudo systemctl restart docker
```

拉取docker镜像, 并运行一个容器
```
mkdir ~/mydata
docker pull phyzli/ubuntu18.04_xfce4_vnc4server_synopsys2016
docker run -it -p 5902:5902 -p 1234:22 --hostname lizhen --mac-address 02:42:ac:11:00:02 -v /home/andreas/mydata:/mnt/mydata phyzli/ubuntu18.04_xfce4_vnc4server_synopsys2016
```
配置vnc, 因为export的是5902端口,所以是:2
```
vncserver -geometry 1920x1080 :2
```
vncviewer，配置连接，地址是127.0.0.1:5902, 连接密码为 zhenchen
passwd 创建root密码, 就可以ssh登陆
```
ssh -p 1234 root@127.0.0.1
```
交换文件用scp也行
```
scp -P 1234 root@127.0.0.1:/usr/synopsys2016.tar.gz .
```

exit 会退出容器

启动容器 docker start [容器id]

启动容器后进入容器 docker exec -it [容器id] bash


phyzli这家伙制作的其他几个镜像
```
docker pull phyzli/centos8_xfce4_tigervnc_virtuosoic617_mmsim15_calibre2015
docker pull phyzli/centos8_xfce4_tigervnc_hspice2016
docker pull phyzli/centos8_xfce4_tigervnc_hspice2010
docker pull phyzli/ubuntu18.04_xfce4_vnc4server_synopsys
docker pull phyzli/ubuntu20.04_xfce4_tigervnc_alsrac
```

* * *
# iperf

```
sudo apt install iperf
```

* * *
# Openbox 的 双屏 display settings 不生效
交换左右上下, openbox用monitor-settings(lxrandr)可以, mate-display-properties在openbox不行
在unity环境是可以的,()
也可以直接用xrandr命令
xrandr -q
查询出屏幕名称和支持的 分辨率/频率
然后
sudo xrandr --auto --output HDMI-0 --mode 1920x1080 --right-of HDMI-1-1


* * *
# 修复retext的fcitx不能用的问题成功
```
查找安装包有关文件解开后的路径
dpkg -L fcitx-frontend-qt5
dpkg -L retext
sudo cp /usr/lib/x86_64-linux-gnu/qt5/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so /usr/local/lib/python3.6/dist-packages/PyQt5/Qt/plugins/platforminputcontexts
```


* * *
# 安装一些个杂七杂八的玩意
```
sudo apt  install simplescreenrecorder
sudo apt install vym
sudo apt install zsh zsh-doc
export http_proxy="127.0.0.1:8118"
export https_proxy="127.0.0.1:8118"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo apt install umbrello
sudo apt install neovim nodejs filezilla filezilla-common ipython ipython3 npm lrzsz putty dia meld ctags cscope openssh-server cmake extra-cmake-modules fcitx-libs-dev git subversion snapd tree curl wget build-essential dkms linux-headers-$(uname -r)
sudo snap install cheat
sudo npm install -g terminalizer
sudo apt install flameshot
sudo npm install ttystudio -g
sudo apt install -y byzanz
sudo snap install typora
sudo apt install -y texlive-full
sudo apt install pandoc pandoc-citeproc
fcitx fcitx-table fcitx-googlepinyin
pip3 install pyqt5
pip3 install Markups
sudo apt install python-markdown
sudo apt install python-docutils
sudo apt install python-enchant
sudo apt install retext
sudo apt install kchmviewer evince
wget http://tw.archive.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb
sudo dpkg -i libpng12-0_1.2.54-1ubuntu1_amd64.deb
wget http://kdl.cc.ksosoft.com/wps-community/download/6757/wps-office_10.1.0.6757_amd64.deb
sudo dpkg -i wps-office_10.1.0.6757_amd64.deb
http://pan.baidu.com/s/1skQIJE1
sudo dpkg -i symbol-fonts_1.2_all.deb
sudo apt install deadbeef vlc
sudo apt install audacity
sudo add-apt-repository ppa:peek-developers/stable
sudo apt update
sudo apt install peek

```
```
sudo apt install -y texlive-full
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  aglfn asymptote asymptote-doc biber chktex cm-super cm-super-minimal context
  context-modules dvidvi dvipng feynmf fonts-adf-accanthis fonts-adf-berenis
  fonts-adf-gillius fonts-adf-universalis fonts-arphic-bkai00mp
  fonts-arphic-bsmi00lp fonts-arphic-gbsn00lp fonts-arphic-gkai00mp
  fonts-baekmuk fonts-cabin fonts-comfortaa fonts-croscore
  fonts-crosextra-caladea fonts-crosextra-carlito fonts-ebgaramond
  fonts-ebgaramond-extra fonts-freefont-otf fonts-gfs-artemisia
  fonts-gfs-baskerville fonts-gfs-bodoni-classic fonts-gfs-complutum
  fonts-gfs-didot fonts-gfs-didot-classic fonts-gfs-gazis
  fonts-gfs-neohellenic fonts-gfs-olga fonts-gfs-porson fonts-gfs-solomos
  fonts-gfs-theokritos fonts-go fonts-hosny-amiri fonts-ipaexfont-gothic
  fonts-ipaexfont-mincho fonts-junicode fonts-linuxlibertine fonts-lobster
  fonts-lobstertwo fonts-noto-hinted fonts-oflb-asana-math fonts-open-sans
  fonts-roboto-hinted fonts-sil-gentiumplus fonts-sil-gentiumplus-compact
  fonts-unfonts-core fonts-unfonts-extra fragmaster lacheck latex-cjk-all
  latex-cjk-chinese latex-cjk-chinese-arphic-bkai00mp
  latex-cjk-chinese-arphic-bsmi00lp latex-cjk-chinese-arphic-gbsn00lp
  latex-cjk-chinese-arphic-gkai00mp latex-cjk-common latex-cjk-japanese
  latex-cjk-japanese-wadalab latex-cjk-korean latex-cjk-thai latexdiff latexmk
  lcdf-typetools libautovivification-perl libbtparse1
  libbusiness-isbn-data-perl libbusiness-isbn-perl libbusiness-ismn-perl
  libbusiness-issn-perl libclass-factory-util-perl libclass-singleton-perl
  libdata-compare-perl libdata-uniqid-perl libdate-simple-perl
  libdatetime-calendar-julian-perl libdatetime-format-builder-perl
  libdatetime-format-strptime-perl libdatetime-locale-perl libdatetime-perl
  libdatetime-timezone-perl libdevel-caller-perl libdevel-lexalias-perl
  libdist-checkconflicts-perl libemail-date-format-perl libemf1
  libencode-eucjpms-perl libencode-hanextra-perl libencode-jis2k-perl
  libeval-closure-perl libfile-slurper-perl libipc-shareable-perl
  liblingua-translit-perl liblist-allutils-perl liblist-someutils-perl
  liblog-dispatch-perl liblog-log4perl-perl libmime-charset-perl
  libmime-lite-perl libmime-types-perl libosp5 libostyle1c2
  libpackage-deprecationmanager-perl libpadwalker-perl
  libparams-validationcompiler-perl libperlio-utf8-strict-perl libplot2c2
  libpstoedit0c2a libregexp-common-perl libscalar-list-utils-perl libsombok3
  libspecio-perl libtext-bibtex-perl libtext-csv-perl libtext-csv-xs-perl
  libtext-roman-perl libtie-cycle-perl libunicode-collate-perl
  libunicode-linebreak-perl libxml-libxml-simple-perl libxml-libxslt-perl
  libxml-writer-perl openjade pfb2t1c2pfb prerex ps2eps pstoedit psutils
  purifyeps python3-pil.imagetk texlive-bibtex-extra texlive-extra-utils
  texlive-font-utils texlive-fonts-extra texlive-fonts-extra-doc
  texlive-fonts-extra-links texlive-fonts-recommended-doc
  texlive-formats-extra texlive-games texlive-generic-recommended
  texlive-humanities texlive-humanities-doc texlive-lang-arabic
  texlive-lang-chinese texlive-lang-cjk texlive-lang-cyrillic
  texlive-lang-czechslovak texlive-lang-english texlive-lang-european
  texlive-lang-french texlive-lang-german texlive-lang-greek
  texlive-lang-italian texlive-lang-japanese texlive-lang-korean
  texlive-lang-other texlive-lang-polish texlive-lang-portuguese
  texlive-lang-spanish texlive-latex-base-doc texlive-latex-extra-doc
  texlive-latex-recommended-doc texlive-luatex texlive-metapost
  texlive-metapost-doc texlive-music texlive-pictures-doc texlive-pstricks
  texlive-pstricks-doc texlive-publishers texlive-publishers-doc
  texlive-science texlive-science-doc texlive-xetex vprerex
Suggested packages:
  gv perl-tk fontforge context-nonfree context-doc-nonfree auctex hbf-cns40-b5
  hbf-jfs56 hbf-kanji48 libgd-barcode-perl libscalar-properties-perl
  libdbd-csv-perl liblog-dispatch-filerotate-perl librrds-perl libxml-dom-perl
  libpod2-base-perl libmojolicious-perl libtest-fatal-perl python-pil-doc
  python3-pil.imagetk-dbg xindy
Recommended packages:
  fonts-freefont
The following NEW packages will be installed:
  aglfn asymptote asymptote-doc biber chktex cm-super cm-super-minimal context
  context-modules dvidvi dvipng feynmf fonts-adf-accanthis fonts-adf-berenis
  fonts-adf-gillius fonts-adf-universalis fonts-arphic-bkai00mp
  fonts-arphic-bsmi00lp fonts-arphic-gbsn00lp fonts-arphic-gkai00mp
  fonts-baekmuk fonts-cabin fonts-comfortaa fonts-croscore
  fonts-crosextra-caladea fonts-crosextra-carlito fonts-ebgaramond
  fonts-ebgaramond-extra fonts-freefont-otf fonts-gfs-artemisia
  fonts-gfs-baskerville fonts-gfs-bodoni-classic fonts-gfs-complutum
  fonts-gfs-didot fonts-gfs-didot-classic fonts-gfs-gazis
  fonts-gfs-neohellenic fonts-gfs-olga fonts-gfs-porson fonts-gfs-solomos
  fonts-gfs-theokritos fonts-go fonts-hosny-amiri fonts-ipaexfont-gothic
  fonts-ipaexfont-mincho fonts-junicode fonts-linuxlibertine fonts-lobster
  fonts-lobstertwo fonts-noto-hinted fonts-oflb-asana-math fonts-open-sans
  fonts-roboto-hinted fonts-sil-gentiumplus fonts-sil-gentiumplus-compact
  fonts-unfonts-core fonts-unfonts-extra fragmaster lacheck latex-cjk-all
  latex-cjk-chinese latex-cjk-chinese-arphic-bkai00mp
  latex-cjk-chinese-arphic-bsmi00lp latex-cjk-chinese-arphic-gbsn00lp
  latex-cjk-chinese-arphic-gkai00mp latex-cjk-common latex-cjk-japanese
  latex-cjk-japanese-wadalab latex-cjk-korean latex-cjk-thai latexdiff latexmk
  lcdf-typetools libautovivification-perl libbtparse1
  libbusiness-isbn-data-perl libbusiness-isbn-perl libbusiness-ismn-perl
  libbusiness-issn-perl libclass-factory-util-perl libclass-singleton-perl
  libdata-compare-perl libdata-uniqid-perl libdate-simple-perl
  libdatetime-calendar-julian-perl libdatetime-format-builder-perl
  libdatetime-format-strptime-perl libdatetime-locale-perl libdatetime-perl
  libdatetime-timezone-perl libdevel-caller-perl libdevel-lexalias-perl
  libdist-checkconflicts-perl libemail-date-format-perl libemf1
  libencode-eucjpms-perl libencode-hanextra-perl libencode-jis2k-perl
  libeval-closure-perl libfile-slurper-perl libipc-shareable-perl
  liblingua-translit-perl liblist-allutils-perl liblist-someutils-perl
  liblog-dispatch-perl liblog-log4perl-perl libmime-charset-perl
  libmime-lite-perl libmime-types-perl libosp5 libostyle1c2
  libpackage-deprecationmanager-perl libpadwalker-perl
  libparams-validationcompiler-perl libperlio-utf8-strict-perl libplot2c2
  libpstoedit0c2a libregexp-common-perl libscalar-list-utils-perl libsombok3
  libspecio-perl libtext-bibtex-perl libtext-csv-perl libtext-csv-xs-perl
  libtext-roman-perl libtie-cycle-perl libunicode-collate-perl
  libunicode-linebreak-perl libxml-libxml-simple-perl libxml-libxslt-perl
  libxml-writer-perl openjade pfb2t1c2pfb prerex ps2eps pstoedit psutils
  purifyeps python3-pil.imagetk texlive-bibtex-extra texlive-extra-utils
  texlive-font-utils texlive-fonts-extra texlive-fonts-extra-doc
  texlive-fonts-extra-links texlive-fonts-recommended-doc
  texlive-formats-extra texlive-full texlive-games texlive-generic-recommended
  texlive-humanities texlive-humanities-doc texlive-lang-arabic
  texlive-lang-chinese texlive-lang-cjk texlive-lang-cyrillic
  texlive-lang-czechslovak texlive-lang-english texlive-lang-european
  texlive-lang-french texlive-lang-german texlive-lang-greek
  texlive-lang-italian texlive-lang-japanese texlive-lang-korean
  texlive-lang-other texlive-lang-polish texlive-lang-portuguese
  texlive-lang-spanish texlive-latex-base-doc texlive-latex-extra-doc
  texlive-latex-recommended-doc texlive-luatex texlive-metapost
  texlive-metapost-doc texlive-music texlive-pictures-doc texlive-pstricks
  texlive-pstricks-doc texlive-publishers texlive-publishers-doc
  texlive-science texlive-science-doc texlive-xetex vprerex
0 upgraded, 185 newly installed, 0 to remove and 15 not upgraded.
Need to get 2,324 MB of archives.
After this operation, 4,200 MB of additional disk space will be used.

```

* * *
# Typora 激活 (不好使，不如用vs code)
```
sudo pip install --upgrade pip -i https://mirrors.163.com/pypi/simple
sudo pip3 install --upgrade pip -i https://mirrors.163.com/pypi/simple

//git clone https://github.com/Mas0nShi/typoraCracker.git
git clone git@github.com:WittonBell/typoraCracker.git
cd typoraCracker
pip install -r requirements.txt ##这一步都不通, 后面记录参考而已;conda这步可以（3.10）
python typora.py --help

//python typora.py /snap/typora/current/typora/resources/app.asar .
python typora.py /usr/share/typora/resources/app.asar .
执行完毕后会生成 dec_app 文件夹

拷贝仓库中的 License.js 许可证
cp ./example/patch/License.js ./dec_app/

重新生成 app.asar
python typora.py -u ./dec_app/ .
cp /snap/typora/current/typora/resources/app.asar /snap/typora/current/typora/resources/app.asar.bak
替换 app.asar
mv ./app.asar /snap/typora/current/typora/resources/app.asar

生成序列号
node ./example/keygen.js

snap安装的不知道这样行不行


查找snap有关路径
mount | grep snapd
```


* * *
# music-dl
```
sudo -H pip3.8 install pymusic-dl
music-dl -k "特别的爱给特别的你" -n 20
```


* * *
# 安装feeluown及插件
准备工作参考官方文档
```
sudo apt-get install libmpv1
sudo apt-get install python3-pyqt5
sudo apt-get install python3-pyqt5.qtopengl
sudo apt-get install python3-dbus
sudo apt-get install python3-dbus.mainloop.pyqt5

sudo apt-get install fcitx-frontend-qt5
sudo apt-get install netcat
sudo apt-get install mp3info
```
3.6的也可以pip比较旧版本的(不建议)
```
sudo -H pip3.6 install pyopengl feeluown fuo-local fuo-netease fuo-qqmusic -i https://mirrors.163.com/pypi/simple

feeluown -h

feeluown-genicon
```

最新的需要python3.8及以上版本, python简直是版本地狱的最佳示范.....
```
sudo -H pip3.6 list
sudo -H pip3.6 uninstall feeluown fuo-local fuo-netease fuo-qqmusic

sudo apt install python3.8
sudo apt install python3.8:any
```

安装pip3.8
```
sudo -H python3.8 -m pip install pip==21.3.1 -i https://mirrors.163.com/pypi/simple
pip3 -V
```
安装feeluown及插件, pyqt修复fcitx
```
//sudo -H pip3.8 install pyopengl pyqt5 pyqtwebengine feeluown fuo-local fuo-netease fuo-qqmusic fuo-kuwo -i https://mirrors.163.com/pypi/simple
sudo -H pip3.8 install feeluown==3.8.3 fuo-local fuo-netease fuo-qqmusic fuo-kuwo --upgrade --proxy=http://127.0.0.1:8118
sudo -H pip3.8 install feeluown==3.8.3 fuo-dl fuo-local fuo-netease fuo-ytmusic fuo-qqmusic fuo-kuwo fuo-xiami fuo-bilibili fuo-ytmusic --upgrade 
sudo -H pip3.8 install feeluown==3.8.4 fuo-dl fuo-local fuo-netease fuo-ytmusic fuo-qqmusic fuo-kuwo fuo-xiami fuo-ytmusic --upgrade 
sudo -H pip3.8 install feeluown==3.8.4 pyqt5-plugins PyQt5-stubs pyqt5-tools qt5-applications qt5-tools  fuo-dl fuo-local fuo-netease fuo-ytmusic fuo-qqmusic fuo-kuwo fuo-xiami fuo-ytmusic --upgrade  --proxy=http://127.0.0.1:8118

bilibili插件安装似乎出错了，fuck it，不用这货

3.8.3不支持所有插件

fuo-dl                        0.3
fuo-kuwo                      0.1.6
fuo-local                     0.3
fuo-netease                   0.9.2
fuo-qqmusic                   0.5.1
fuo-xiami                     0.2.4
fuo-ytmusic                   0.1.1

3.8.4 除了 xiami 都可以

3.8.8 已知在本机环境 歌词 加载不了

sudo cp /usr/lib/x86_64-linux-gnu/qt5/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so /usr/local/lib/python3.8/dist-packages/PyQt5/Qt5/plugins/platforminputcontexts

ls /usr/local/lib/python3.8/dist-packages/PyQt5/Qt5/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so

应该要安装pyqt5-plugins这几个，不然输入法切不出来
```
看来以后通过pip安装了pyqt就要把libfcitxplatforminputcontextplugin.so这个插件复制进来

## 如果出错
```
sudo -H pip3 uninstall pyopengl pyqt5 pyqtwebengine feeluown fuo-local fuo-netease fuo-qqmusic fuo-kuwo PyQt5-sip PyQt5-Qt5 PyQtWebEngine-Qt5 mutagen packaging janus requests pydantic tomlkit qasync fuzzywuzzy marshmallow pycryptodome beautifulsoup4 typing-extensions

sudo -H pip3.8 install feeluown==3.8.4 fuo-dl fuo-local fuo-netease fuo-ytmusic fuo-qqmusic fuo-kuwo fuo-xiami fuo-ytmusic pydantic==1.9.2 importlib-metadata==4.6.0 importlib-resources==5.2.2 --upgrade 

pip3 show xxx

pip3 list | grep feeluown

pip3 list | grep fuo

feeluown -d

```

再安装一个下载插件(如果fuo-dl不能pip安装)
```
git clone git@github.com:feeluown/feeluown-download.git
cd feeluown-download
sudo python3.8 setup.py build (实际上install就可以)
sudo python3.8 setup.py install
下载位置在~/.FeelUOwn/songs
```

## 试安装是否成功
```
feeluown -h
```

## 生成桌面图标
```
feeluown-genicon
```
直接双击桌面 FeelUOwn 图标，这时启动 GUI/Daemon 混合模式

##  Daemon 模式
```
feeluown -nw    # 使用 Daemon 模式启动 feeluown


fuo status  # 查看播放器状态
fuo search 周杰伦  # 搜索歌曲
fuo play fuo://netease/songs/470302665
fuo pause
fuo resume

nc localhost 23333  # 使用netcat连接Daemon
# 输入 `status` 命令，可以查看播放器状态
# 输入 `fuo play fuo://netease/songs/470302665` 可以播放音乐
```

## 本地library
可以把歌曲拖入，但是删除要去编辑
```
~/.FeelUOwn/collections/library.fuo
```
## 开启调试模式
```
feeluown -d
```

## 配置文件

In `~/.fuorc`

```
import os


# 自定义配置
#config.THEME = 'dark'
config.COLLECTIONS_DIR = '~/.FeelUOwn/songs'
config.AUDIO_SELECT_POLICY = '>>>'


# 一个小功能：切换歌曲时，发送系统通知
def notify_song_changed(song):
    if song is not None:
        title = song.title_display
        artists_name = song.artists_name_display
        song_str = f'{title}-{artists_name}'
        os.system(f'notify-send "{song_str}"')

when('app.playlist.song_changed', notify_song_changed)

# 让编辑器识别这是一个 Python 文件
#
# Local Variables:
# mode: python
# End:
#
# vim: ft=python

# config.ytmusic.HTTP_PROXY='http://127.0.0.1:8118' # 报错了

def load_plugin_rcfiles(plugin):
    if plugin.name == 'fuo_local':
        #config.fuo_local.MUSIC_FOLDERS = [os.path.expanduser('~') + '/Music']
        config.fuo_local.MUSIC_FOLDERS = [os.path.expanduser('~') + '/Music', '/home/andreas/.FeelUOwn/songs']
        config.fuo_local.MUSIC_FORMATS = ['mp3', 'ogg', 'wma', 'm4a', 'm4v', 'mp4', 'flac']

when('app.plugin_mgr.about_to_enable', load_plugin_rcfiles, use_symbol=True, aioqueue=False)
```



* * *
# music players
```
sudo apt install audacious audacious-dev audacious-plugins audacious-plugins-data
sudo add-apt-repository ppa:osd-lyrics/ppa
aptitude search osdlyrics
sudo apt-get install amarok amarok-common amarok-utils
sudo apt install rhythmbox-plugin-llyrics rhythmbox-plugin-equalizer rhythmbox-dev 
sudo add-apt-repository ppa:fossfreedom/rhythmbox-plugins
aptitude search lyrics
sudo add-apt-repository ppa:alexey-smirnov/deadbeef
sudo apt-get install deadbeef
sudo apt install pkg-config libtag1-dev libicu-dev libcue-dev libtag1-dev libavutil-dev libavcodec-dev libavformat-dev libdtkcore-dev qt5-qmake libqt5svg5-dev qttools5-dev-tools qtmultimedia5-dev libkf5codecs-dev libdtkwidget-dev
sudo apt install libdtkcore-bin libdtkwm-dev libdtkwm2

```
* * *
# RTL8761 驱动
```
#wget https://mpow.s3-us-west-1.amazonaws.com/mpow_MPBH456AB_driver+for+Linux.tgz
wget https://mpow.s3-us-west-1.amazonaws.com/20201202_mpow_BH456A_driver+for+Linux.7z
7z x 20201202_mpow_BH456A_driver+for+Linux.7z
#tar -zxvf mpow_MPBH456AB_driver+for+Linux.tgz
#cd 20200610_LINUX_BT_DRIVER/rtkbt-firmware/lib/firmware/rtlbt/
cd 20201202_LINUX_BT_DRIVER/rtkbt-firmware/lib/firmware/rtlbt/
cp rtl8761b_config rtl8761b_config.bin
cp rtl8761b_fw rtl8761b_fw.bin
#cd ../../../../
sudo make install INTERFACE=all
ls /lib/firmware/rtl_bt/
ls /lib/modules/5.4.0-99-generic/kernel/drivers/bluetooth
```
重新插拔
```
sudo blueman-manager
sudo dmesg |egrep -i bluetooth


https://fichiers.touslesdrivers.com/64900/mpow_MPBH456AB_driver%2Bfor%2BLinux.zip
sudo apt install bluetooth bluez bluez-cups bluez-tools btscanner gnome-bluetooth python-bluez pulseaudio-module-bluetooth blueman rfkill
sudo apt-get install linux-modules-extra-5.4.0-99-generic --reinstall
sudo service bluetooth restart
sudo rfkill unblock bluetooth
sudo rfkill list
sudo modprobe -r btusb && sudo modprobe btusb

/lib/firmware/rtl_bt
/lib/modules/`uname -r`/kernel/drivers/bluetooth/
/lib/modules/5.4.0-99-generic/kernel/drivers/bluetooth

//sudo apt install linux-generic-hwe-18.04

//sudo apt install mokutil
//$ sudo mokutil --disable-validation
//password length: 8~16
//input password: 
//input password again: 
//比如8个8
//sudo reboot
//电脑重启，出现蓝屏，按任意键，出现四个选项：选择change secure boot state
//Continue boot
//Change Secure Boot state
//Enroll key from disk
//Enroll hash from disk
//出现Enter password character (num)
//这个num可能是1.3.5.4各个字母，代表的是你之前输入密码的第几个字母(比如8)，然后然后把这个字母输入就好了
//Disable Secure Boot
//选择yes
//回到最开始页面，选择reboot
```

<https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel>
```
$ uname -r
5.4.0-104-generic
sudo apt install linux-source  # downloads into system directory
sudo apt source linux-source  # downloads into working directory
sudo apt-get source linux-source
apt-cache search linux-source
apt-cache showsrc linux
git clone git://kernel.ubuntu.com/ubuntu/ubuntu-<release codename>.git
git clone git://kernel.ubuntu.com/ubuntu/ubuntu-bionic.git ## 用这个命令吧

//sudo apt build-dep linux linux-image-generic
sudo apt-get build-dep linux linux-image-unsigned-$(uname -r) # sudo apt-get build-dep linux linux-image-$(uname -r)
sudo apt-get install libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf
sudo apt-get install git
打开源
deb-src http://archive.ubuntu.com/ubuntu bionic main
deb-src http://archive.ubuntu.com/ubuntu bionic-updates main

apt-get source linux-image-unsigned-$(uname -r)
或者
git clone git://kernel.ubuntu.com/ubuntu/ubuntu-bionic.git

Modifying the configuration:
chmod a+x debian/rules
chmod a+x debian/scripts/*
chmod a+x debian/scripts/misc/*
LANG=C fakeroot debian/rules clean
LANG=C fakeroot debian/rules editconfigs # you need to go through each (Y, Exit, Y, Exit..) or get a complaint about config later

Building the kernel:
LANG=C fakeroot debian/rules clean
# quicker build:
LANG=C fakeroot debian/rules binary-headers binary-generic binary-perarch
# if you need linux-tools or lowlatency kernel, run instead:
LANG=C fakeroot debian/rules binary

cd ..
ls *.deb
    linux-headers-4.8.0-17_4.8.0-17.19_all.deb
    linux-headers-4.8.0-17-generic_4.8.0-17.19_amd64.deb
    linux-image-4.8.0-17-generic_4.8.0-17.19_amd64.deb

sudo dpkg -i linux*4.8.0-17.19*.deb
sudo reboot
```

上面是参考, 下面是实际修复过程
```
$ uname -r
5.4.0-105-generic
```
下载内核源码
```
git clone git://kernel.ubuntu.com/ubuntu/ubuntu-bionic.git
如果网络状态不好,只clone一层(shallow clone + single branch)
git clone --depth 1 --single-branch --branch master git://kernel.ubuntu.com/ubuntu/ubuntu-bionic.git

拉取当前分支更多层
git fetch --depth=10

添加其他分支(get access to all the branches)
git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
或者
git remote set-branches origin '*'

取消浅克隆
git fetch --unshallow

如果先 取消浅克隆，然后再添加其他分支 还需要fetch一遍("git fetch","git fetch --all","git fetch -v"都行)

取回tag
git fetch --tags

git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
git fetch --all
git pull --all

git checkout -b tmp Ubuntu-hwe-5.4-5.4.0-105.119_18.04.1
```
根据<https://gist.github.com/rometsch/dfd24fb09c85c1ad2f25223dc1481aaa>修改
```
diff -Naur a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -131,12 +131,19 @@ static const struct id_table ic_id_table[] = {
 	  .cfg_name = "rtl_bt/rtl8821c_config" },
 
 	/* 8761A */
-	{ IC_MATCH_FL_LMPSUBV, RTL_ROM_LMP_8761A, 0x0,
+	{ IC_INFO(RTL_ROM_LMP_8761A, 0xa),
 	  .config_needed = false,
 	  .has_rom_version = true,
 	  .fw_name  = "rtl_bt/rtl8761a_fw.bin",
 	  .cfg_name = "rtl_bt/rtl8761a_config" },
 
+	/* 8761B */
+	{ IC_INFO(RTL_ROM_LMP_8761A, 0xb),
+	  .config_needed = false,
+	  .has_rom_version = true,
+	  .fw_name  = "rtl_bt/rtl8761bu_fw.bin",
+	  .cfg_name = "rtl_bt/rtl8761bu_config" },
+
 	/* 8822C with USB interface */
 	{ IC_INFO(RTL_ROM_LMP_8822B, 0xc),
 	  .config_needed = false,
@@ -256,6 +263,7 @@ static int rtlbt_parse_firmware(struct hci_dev *hdev,
 		{ RTL_ROM_LMP_8723B, 9 },	/* 8723D */
 		{ RTL_ROM_LMP_8821A, 10 },	/* 8821C */
 		{ RTL_ROM_LMP_8822B, 13 },	/* 8822C */
+		{ RTL_ROM_LMP_8761A, 14 },	/* 8761B */
 	};
 
 	min_size = sizeof(struct rtl_epatch_header) + sizeof(extension_sig) + 3;
diff -Naur a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -367,6 +367,9 @@ static const struct usb_device_id blacklist_table[] = {
 	{ USB_DEVICE(0x13d3, 0x3459), .driver_info = BTUSB_REALTEK },
 	{ USB_DEVICE(0x13d3, 0x3494), .driver_info = BTUSB_REALTEK },
 
+	/* Additional Realtek 8761BU Bluetooth devices */
+	{ USB_DEVICE(0x2550, 0x8761), .driver_info = BTUSB_REALTEK },
+
 	/* Additional Realtek 8723BU Bluetooth devices */
 	{ USB_DEVICE(0x7392, 0xa611), .driver_info = BTUSB_REALTEK },
 
```

备份原始的蓝牙驱动
```
sudo cp -r /lib/modules/$(uname -r)/kernel/drivers/bluetooth /lib/modules/$(uname -r)/kernel/drivers/bluetooth_bak
```

get the current kernels config
```
make oldconfig
make prepare
make scripts
```
build and install the bluetooth module
```
cd drivers/bluetooth
make -C /lib/modules/$(uname -r)/build M=$(pwd) modules
/lib/modules/5.4.0-105-generic/kernel/drivers/bluetooth
sudo cp *.ko /lib/modules/$(uname -r)/kernel/drivers/bluetooth
sudo modprobe -r btusb && sudo modprobe btusb
```
replug 蓝牙适配器, 就可以了

sudo dmesg
```
[90416.399982] usb 1-7: new full-speed USB device number 31 using xhci_hcd
[90416.528039] usb 1-7: Device not responding to setup address.
[90416.736014] usb 1-7: Device not responding to setup address.
[90416.943988] usb 1-7: device not accepting address 31, error -71
[90419.431968] usb 1-7: new full-speed USB device number 33 using xhci_hcd
[90419.589227] usb 1-7: New USB device found, idVendor=2550, idProduct=8761, bcdDevice= 2.00
[90419.589229] usb 1-7: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[90419.589230] usb 1-7: Product: Bluetooth Radio
[90419.589230] usb 1-7: Manufacturer: Realtek
[90419.589231] usb 1-7: SerialNumber: 00E04C239987
[90419.595514] Bluetooth: hci1: RTL: examining hci_ver=0a hci_rev=000b lmp_ver=0a lmp_subver=8761
[90419.596503] Bluetooth: hci1: RTL: rom_version status=0 version=1
[90419.596504] Bluetooth: hci1: RTL: loading rtl_bt/rtl8761bu_fw.bin
[90419.596539] Bluetooth: hci1: RTL: loading rtl_bt/rtl8761bu_config.bin
[90419.596553] Bluetooth: hci1: RTL: cfg_sz 6, total sz 22614
[90419.714645] Bluetooth: hci1: RTL: fw version 0x099a2885
[90419.875726] usb 1-7: USB disconnect, device number 33
[90420.191963] usb 1-7: new full-speed USB device number 34 using xhci_hcd
[90420.345576] usb 1-7: New USB device found, idVendor=2550, idProduct=8761, bcdDevice= 2.00
[90420.345578] usb 1-7: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[90420.345579] usb 1-7: Product: Bluetooth Radio
[90420.345580] usb 1-7: Manufacturer: Realtek
[90420.345580] usb 1-7: SerialNumber: 00E04C239987
[90420.352468] Bluetooth: hci1: RTL: examining hci_ver=0a hci_rev=000b lmp_ver=0a lmp_subver=8761
[90420.353488] Bluetooth: hci1: RTL: rom_version status=0 version=1
[90420.353490] Bluetooth: hci1: RTL: loading rtl_bt/rtl8761bu_fw.bin
[90420.353528] Bluetooth: hci1: RTL: loading rtl_bt/rtl8761bu_config.bin
[90420.353546] Bluetooth: hci1: RTL: cfg_sz 6, total sz 22614
[90420.471577] Bluetooth: hci1: RTL: fw version 0x099a2885

```

* * *
# pulseaudio and pulsemixer
```
sudo apt install xfce4-pulseaudio-plugin pulseaudio-utils pulseaudio-module-zeroconf pulseaudio-module-raop pulseaudio-module-lirc pulseaudio-module-jack pulseaudio-module-gconf pulseaudio-module-bluetooth pulseaudio-esound-compat pulseaudio-equalizer pulseaudio-dlna gstreamer1.0-pulseaudio liquidsoap-plugin-pulseaudio mkchromecast-pulseaudio osspd-pulseaudio projectm-pulseaudio pulsemixer
sudo apt install pasystray
```


* * *
# ubuntu turn off eee(Energy Efficient Ethernet ) 关闭以太网节能模式

on board rtl8211e link down each several seconds, 
板载的rtl8211e几秒就link down,

win10在设备管理器的高级里可以关闭太网节能模式

这里ubuntu的pc可以这样关闭网卡的eee
```
sudo apt install ethtool
sudo ethtool --set-eee eth0 eee off
```

为实现自动关闭, 可以添加一个服务, 我这里需要关闭的网卡名称是eth0, 原始的可能是类似enp0s31f6这样的名称

sudo gedit /usr/bin/eth0_eee_off
```
#!/bin/sh
sudo ethtool --set-eee eth0 eee off
```
sudo chmod +x /usr/bin/eth0_eee_off
sudo gedit /etc/systemd/system/eth0_eee_off.service
```
[Unit]
Description=Turn off EEE on interface

[Service]
Type=oneshot
ExecStart=/usr/bin/eth0_eee_off

[Install]
WantedBy=multi-user.target
```

`sudo systemctl enable eth0_eee_off.service`
`sudo systemctl start eth0_eee_off.service`

* * *
# ssd Structure needs cleaning
```
sudo apt install xfsprogs
sudo fsck -vcfy /dev/sdb4
sudo xfs_repair /dev/sdb4
```

* * *
# 115 linux 版
```
wget https://down.115.com/client/115pc/lin/115pc_1.0.1.6.deb
sudo dpkg -i 115pc_1.0.1.6.deb

cd /usr/local/bin
sudo gedit 115
-----
sh /usr/local/115/115.sh
-----
sudo chmod +x 115
```

* * *
# 网络速度慢?
```
sudo apt install libssl1.0-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libfilezilla23 linux-hwe-5.4-headers-5.4.0-94
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  nodejs nodejs-dev
The following packages will be REMOVED:
  libcurl4-openssl-dev libssl-dev
The following NEW packages will be installed:
  libssl1.0-dev
The following packages will be upgraded:
  nodejs nodejs-dev

sudo apt install libfilezilla24 linux-hwe-5.4-headers-5.4.0-94
sudo apt remove linux-image-unsigned-5.3.0-1041-gke
sudo apt remove linux-image-generic-hwe-18.04 linux-image-5.4.0-42-generic linux-image-5.4.0-73-generic linux-image-5.4.0-74-generic
sudo apt remove linux-headers-generic-hwe-18.04 linux-headers-5.4.0-73-generic linux-headers-5.4.0-70-generic linux-headers-5.4.0-90-generic linux-headers-5.4.0-42-generic linux-headers-5.4.0-80-generic linux-headers-5.4.0-74-generic
sudo apt remove linux-modules-5.4.0-80-generic linux-modules-5.4.0-74-generic linux-modules-5.4.0-42-generic linux-modules-5.4.0-73-generic
sudo apt remove linux-hwe-5.4-headers-5.4.0-4* linux-hwe-5.4-headers-5.4.0-7* linux-hwe-5.4-headers-5.4.0-8* linux-hwe-5.4-headers-5.4.0-90

sudo apt autoremove

当前保留的有
linux-base
linux-headers-5.4.0-107-generic        
linux-image-5.4.0-105-generic          
linux-libc-dev-arm64-cross             
linux-modules-extra-5.4.0-105-generic
linux-firmware                         
linux-hwe-5.4-headers-5.4.0-105        
linux-image-5.4.0-107-generic          
linux-modules-5.4.0-105-generic        
linux-modules-extra-5.4.0-107-generic
linux-headers-5.4.0-105-generic        
linux-hwe-5.4-headers-5.4.0-107        
linux-libc-dev                         
linux-modules-5.4.0-107-generic        
linux-sound-base

```

* * *
# google-chrome
```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt -f install

$ ls -l /usr/bin/google-chrome
lrwxrwxrwx 1 root root 31 4月  11 15:13 /usr/bin/google-chrome -> /etc/alternatives/google-chrome
andreas@Vostro-5880:~
$ ls -l /usr/bin/google-chrome-stable 
lrwxrwxrwx 1 root root 32 4月   2 02:38 /usr/bin/google-chrome-stable -> /opt/google/chrome/google-chrome
andreas@Vostro-5880:~
$ sudo update-alternatives --config  google-chrome
[sudo] password for andreas: 
There is only one alternative in link group google-chrome (providing /usr/bin/google-chrome): /usr/bin/google-chrome-stable
Nothing to configure.
```


* * *
# opera看起来有问题了. 一直无法加载完网页, firefox/chrome可以
```
新建config目录, 看起来没有啥问题, 估计是什么插件兼容性问题
opera://extensions
找到问题出在 ad block, 这个TM自带的呀....
```

* * *
# dkms 自动依赖解决 ubuntu可以arch不行, 分析不同
```
/usr/src
/lib/modules/5.4.0-107-generic/updates/dkms
/etc/kernel/postinst.d
/usr/lib/dkms
如何给archlinux移植一个/usr/lib/dkms/common.postinst
```


* * *
# samba
```
sudo apt install smbclient nautilus-share samba samba-common smbclient system-config-samba winbind cifs-utils
```
## 添加samba用户和密码
```
sudo smbpasswd -a andreas
```
## 修改配置文件
sudo gedit /etc/samba/smb.conf
```
[global]
allow insecure wide links = yes
unix extensions = no
...
[exchange]
    comment = Network Logon Service
    path = /home/andreas/workdir/exchange
    guest ok = yes
    read only = no
    writeable = yes
    browseable = yes

[figkey]
    comment = Network Logon Service
    path = /home/andreas/workdir/figkey
    guest ok = yes
    read only = yes
    writeable = no
    browseable = yes

[software]
    comment = Network Logon Service
    path = /media/andreas/M4A/software
    guest ok = yes
    read only = yes
    writeable = no
    browseable = yes

[boards]
    comment = Network Logon Service
    path = /media/andreas/M4A/开发板资料
    guest ok = yes
    read only = yes
    writeable = no
    browseable = yes

[reference]
    comment = Network Logon Service
    path = /media/andreas/M4A/参考资料
    guest ok = yes
    read only = yes
    writeable = no
    browseable = yes

[rk3588]
    comment = Network Logon Service
    path = /opt/rk3588
    guest ok = yes
    read only = yes
    writeable = no
    browseable = yes
    follow symlinks = yes
    wide links = yes

[tmp]
	only user = yes
	comment = Network Logon Service
	valid users = andreas
	browseable = yes
	path = /opt/tmp

[sss]
	user = andreas,@andreas
	revalidate = yes
	path = /opt/porno
	only user = yes
	read list = andreas,@andreas
	valid users = andreas,@andreas

[mov]
	write list = andreas,@andreas
	writeable = yes
	read list = andreas,@andreas
	valid users = andreas,@andreas
	user = andreas,@andreas
	path = /ext_drv/mov
	only user = yes
	revalidate = yes

```
## 重启服务
```
sudo /etc/init.d/nmbd restart
sudo /etc/init.d/smbd restart
```
==
```
sudo service smbd restart
sudo service nmbd restart
```

* * *
# 设置默认浏览器
```
sudo update-alternatives --config x-www-browser
sudo update-alternatives --config gnome-www-browser
```
都选opera

* * *
# update vivado/vitis from 2020.1 to 2020.2

`sudo gedit /usr/local/bin/vivado`
```
#!/bin/bash
/opt/Xilinx/Vivado/2020.2/bin/vivado
```
`sudo gedit /usr/local/bin/vitis`
```
#!/bin/bash
/opt/Xilinx/Vitis/2020.2/bin/vitis 
```

* * *
# opencv and gstreamer
```
sudo apt install libopencv-dev opencv-data opencv-doc python-opencv python3-opencv
sudo apt install python3-gi python3-gst-1.0 python3-tk
sudo -H pip3.6 install -i https://mirrors.163.com/pypi/simple opencv-contrib-python opencv-python
pip3 show opencv-contrib-python
sudo -H pip3.6 install -i https://mirrors.163.com/pypi/simple gst gobject tkVideo
apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
```
```
pkg-config opencv --modversion
pkg-config opencv --libs
sudo find / -iname "*opencv*"
sudo find / -iname "*opencv*" > opencv_find.txt
```
```
/usr/include/opencv
/usr/include/opencv2
/usr/lib/x86_64-linux-gnu/libopencv_core.so
...
```

* * *
# html编辑器
```
sudo snap install kompozer
sudo apt install bluefish
```
不要用snap安装
```
sudo snap remove --purge kompozer
```


* * *
# projectlibre and ganttproject

看起来和openproj一样啊

配置文件从~/.openproj复制到~/.projectlibre

java-version
```
java version "1.8.0_291"
Java(TM) SE Runtime Environment (build 1.8.0_291-b10)
Java HotSpot(TM) 64-Bit Server VM (build 25.291-b10, mixed mode)
```
run.conf
```
#Auto-generated parameters
AUTO_CONFIGURATION="1"
JAVA_EXE="/usr/lib/jvm/jdk1.8.0_291/bin/java"
OS_NAME="Linux"
OS_ID="Ubuntu"
OS_RELEASE="18.04"
JAVA_OPTS="-Djava.vendor=Sun -Xms128m -Xmx768m"
LOG_LEVEL="DEBUG"
LOG_FILE="/dev/null"
```
`sudo apt install planner`

ganttproject界面不喜欢, 不过用来转换格式也可, 但是看起来通用xml

openproject看起来更现代一些
```
wget -qO- https://dl.packager.io/srv/opf/openproject/key | sudo apt-key add -
sudo wget -O /etc/apt/sources.list.d/openproject.list https://dl.packager.io/srv/opf/openproject/stable/12/installer/ubuntu/18.04.repo
sudo apt-get update
sudo apt-get install openproject
```

* * *
# c program flowchart tools
```
sudo apt-get install cflow graphviz gawk
wget -c https://raw.githubusercontent.com/zirandu/linux-0.11-lab/master/tools/tree2dotx
wget -c https://raw.githubusercontent.com/zirandu/linux-0.11-lab/raw/master/tools/callgraph
sudo cp tree2dotx /usr/local/bin
sudo cp tree2svg /usr/local/bin
sudo cp callgraph /usr/local/bin
sudo cp calltree /usr/local/bin
sudo chmod +x /usr/local/bin/{tree2dotx,tree2svg,callgraph,calltree}

```
生成调用图
```
callgraph -f main -d ./file.c -b firefox
指定分析file.c文件中的main函数，并使用firefox显示图片，也可以使用其他浏览器。生成的函数
调用关系图默认保存为main.file_c.svg
```
```
指定函数所在文件（或者指定函数搜索路径）
使用 -d 选项
砍掉不感兴趣的函数分支
callgraph -f main -d file.c -F printf -b firefox
同时指定多个函数分支：
callgraph -f main -d file.c -F “printf test3 test2” -b firefox
指定函数调用深度：
用 -D 命令可以指定：callgraph -f main -d file.c -D 2 -b firefox
```


* * *
# 零星安装
```
sudo apt-get install libgtk2.0-0:i386 libsm6:i386
```
对sdk2017.4木有用, 还是崩溃, 后来又不崩溃了, 不知道咋回事.


# vunit
```
sudo -H pip3 install vunit_hdl -i https://mirrors.163.com/pypi/simple
```



* * *
# kicad 6
```
sudo add-apt-repository --yes ppa:kicad/kicad-6.0-releases
sudo apt update
sudo apt install --install-recommends kicad
```

* * *
# 设置默认浏览器 default browser
```
xdg-settings get default-web-browser
xdg-settings set default-web-browser opera.desktop
```
界面是
```
mate-default-applications-properties
```

对于链接下面两个无效
```
sudo update-alternatives --config x-www-browser
sudo update-alternatives --config gnome-www-browser 
```

效果是
For Opera the file ~/.config/mimeapps.list must contains:
```
[Default Applications]
x-scheme-handler/http=opera-browser.desktop
text/html=opera-browser.desktop
text/xml=opera-browser.desktop
application/xhtml_xml=opera-browser.desktop
image/webp=opera-browser.desktop
x-scheme-handler/https=opera-browser.desktop
x-scheme-handler/ftp=opera-browser.desktop

[Added Associations]
text/html=opera-browser.desktop;
text/xml=opera-browser.desktop;
application/xhtml_xml=opera-browser.desktop;
image/webp=opera-browser.desktop;
x-scheme-handler/https=opera-browser.desktop;
x-scheme-handler/ftp=opera-browser.desktop;
Try it (must be open in Opera, if it installed)
```
```
xdg-open somehtmlfile.html
```
For Chrome the file ~/.config/mimeapps.list must contains:
```
[Default Applications]
x-scheme-handler/http=google-chrome.desktop
text/html=google-chrome.desktop
text/xml=google-chrome.desktop
application/xhtml_xml=google-chrome.desktop
image/webp=google-chrome.desktop
x-scheme-handler/https=google-chrome.desktop
x-scheme-handler/ftp=google-chrome.desktop

[Added Associations]
text/html=google-chrome.desktop;
text/xml=google-chrome.desktop;
application/xhtml_xml=google-chrome.desktop;
image/webp=google-chrome.desktop;
x-scheme-handler/https=google-chrome.desktop;
x-scheme-handler/ftp=google-chrome.desktop;
Try it (must be open in Chrome, if it installed)
```
```
xdg-open somehtmlfile.html
```
And so on (Firefox, or something else).

You need only override desire mimetypes. But I recommend use GUI for it. It will be reduce amount of errors.

It is actual for me system and will be change from system to system, from desktop environment to desktop environment, and so on.


* * *
# 添加一些pip模块
```
sudo -H pip3.6 install pandas -i https://mirrors.163.com/pypi/simple
sudo -H pip3.6 install pyexcel-xls -i https://mirrors.163.com/pypi/simple
sudo -H pip3.6 install pyttsx3 -i https://mirrors.163.com/pypi/simple
sudo -H pip2 install xlrd -i https://mirrors.163.com/pypi/simple
sudo -H pip2 install pyexcel-xls -i https://mirrors.163.com/pypi/simple
sudo -H pip3.8 install -U Pillow -i https://mirrors.163.com/pypi/simple
sudo -H pip3.8 install pandas -i https://mirrors.163.com/pypi/simple
sudo -H pip3.8 install pyexcel-xls -i https://mirrors.163.com/pypi/simple
sudo -H pip3.8 install pyttsx3 -i https://mirrors.163.com/pypi/simple
```


* * *
# opera 更新
opera-stable : Depends: libgcc-s1 (>= 3.0)
```
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt update
sudo apt --fix-broken install
```

* * *
# apt 体系选择和报错处理
```
Fetched 166 kB in 5s (31.3 kB/s)                         
Reading package lists... Done
Building dependency tree       
Reading state information... Done
119 packages can be upgraded. Run 'apt list --upgradable' to see them.
N: Skipping acquire of configured file 'contrib/binary-i386/Packages' as repository 'http://download.virtualbox.org/virtualbox/debian bionic InRelease' doesn't support architecture 'i386'
```
可以
```
$ cd /etc/apt
$ grep virtualbox *
grep: apt.conf.d: Is a directory
grep: auth.conf.d: Is a directory
grep: preferences.d: Is a directory
sources.list:deb http://download.virtualbox.org/virtualbox/debian bionic contrib
sources.list:# deb-src http://download.virtualbox.org/virtualbox/debian bionic contrib
grep: sources.list.d: Is a directory
sources.list.save:deb http://download.virtualbox.org/virtualbox/debian bionic contrib
sources.list.save:# deb-src http://download.virtualbox.org/virtualbox/debian bionic contrib
grep: trusted.gpg: binary file matches
grep: trusted.gpg~: binary file matches
grep: trusted.gpg.d: Is a directory
$ sudo gedit /etc/apt/sources.list
deb http://download.virtualbox.org/virtualbox/debian bionic contrib
修改为
deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib
```

还可以
```
dpkg --print-foreign-architectures
dpkg --print-architecture
sudo dpkg --remove-architecture i386
```

* * *
# mdict-utils
```
$ md5sum /usr/local/bin/pip*
4c8e7e5df4f991acadd5c9e1088e7aa7  /usr/local/bin/pip
4c8e7e5df4f991acadd5c9e1088e7aa7  /usr/local/bin/pip3
6c7d719f8a8cecd99d4327b3c776957e  /usr/local/bin/pip3.6
4c8e7e5df4f991acadd5c9e1088e7aa7  /usr/local/bin/pip3.8
$ sudo rm /usr/local/bin/pip3
$ sudo rm /usr/local/bin/pip
$ sudo cp /usr/local/bin/pip3.6 /usr/local/bin/pip
$ sudo cp /usr/local/bin/pip3.6 /usr/local/bin/pip3

sudo -H pip3 install --upgrade pip -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install mdict-utils -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install pyglossary -i https://mirrors.163.com/pypi/simple
pyglossary --ui=gtk
```

* * *
# epub mobi 电子书阅读 calibre
```
sudo apt install calibre coffeescript python-apsw-doc python-markdown-doc python-paste python-webob-doc coffeescript-doc python-egenix-mxdatetime libapache2-mod-wsgi libapache2-mod-python libapache2-mod-scgi libjs-mochikit python-pastedeploy python-pastescript python-pastewebkit python-flup
```

***
# upgrate

`sudo apt list --upgradable`
```
libgcc1/bionic 1:11.1.0-1ubuntu1~18.04.1 amd64 [upgradable from: 1:8.4.0-1ubuntu1~18.04]
nodejs/bionic-updates 8.10.0~dfsg-2ubuntu0.4 amd64 [upgradable from: 8.10.0~dfsg-2ubuntu0.2]
nodejs-dev/bionic-updates 8.10.0~dfsg-2ubuntu0.4 amd64 [upgradable from: 8.10.0~dfsg-2ubuntu0.2]
 
apt-cache policy libgcc1:i386
apt-cache policy libgcc1
sudo aptitude install libgcc1
     Remove the following packages:                               
1)     libgcc1:i386 [1:8.4.0-1ubuntu1~18.04 (bionic-updates, now)]
```

`$ apt list --upgradable`
```
Listing... Done
nodejs/bionic-updates 8.10.0~dfsg-2ubuntu0.4 amd64 [upgradable from: 8.10.0~dfsg-2ubuntu0.2]
nodejs-dev/bionic-updates 8.10.0~dfsg-2ubuntu0.4 amd64 [upgradable from: 8.10.0~dfsg-2ubuntu0.2]
```

`$ sudo aptitude install nodejs`
```
The following packages will be upgraded: 
  nodejs 
1 packages upgraded, 0 newly installed, 0 to remove and 1 not upgraded.
Need to get 4,796 kB of archives. After unpacking 0 B will be used.
The following packages have unmet dependencies:
 nodejs-dev : Depends: nodejs (= 8.10.0~dfsg-2ubuntu0.2) but 8.10.0~dfsg-2ubuntu0.4 is to be installed
The following actions will resolve these dependencies:

     Remove the following packages:             
1)     node-gyp [3.6.2-1ubuntu1 (bionic, now)]  
2)     nodejs-dev [8.10.0~dfsg-2ubuntu0.2 (now)]
3)     npm [3.5.2-0ubuntu4 (bionic, now)] 
```

`sudo aptitude install nodejs-dev`
```
The following NEW packages will be installed:
  libssl1.0-dev{ab} nodejs-dev 
0 packages upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 1,717 kB of archives. After unpacking 8,662 kB will be used.
The following packages have unmet dependencies:
 libcurl4-openssl-dev : Conflicts: libssl1.0-dev but 1.0.2n-1ubuntu5.10 is to be installed
 libssl-dev : Conflicts: libssl1.0-dev but 1.0.2n-1ubuntu5.10 is to be installed
 libssl1.0-dev : Conflicts: libssl-dev but 1.1.1n-0ubuntu1~18.04.sav0 is installed
The following actions will resolve these dependencies:

     Remove the following packages:                    
1)     libcurl4-openssl-dev [7.82.0-2~18.04.sav0 (now)]
2)     libssl-dev [1.1.1n-0ubuntu1~18.04.sav0 (now)] 
```
```
apt-cache policy libssl-dev
apt-cache policy libssl1.1
apt-cache policy libssl1.1:i386
apt-cache policy libssl1.0-dev
apt-cache policy libssl1.0
apt-cache policy libssl1.0.0
dpkg -L libssl1.0.0
```
安装 `libssl-dev libssl1.1 libssl1.1:i386 libssl1.0.0`，不安装 `libssl1.0-dev`
安装i386体系的deb包需要先
`sudo dpkg --add-architecture i386 && sudo apt-get update`


* * *
# query installed debs 查询已安装的deb包
```
dpkg-query -l linux-image-*
```

* * *
# 修改 proxychains 配置
`sudo gedit /etc/proxychains.conf`
```
[ProxyList]
# add proxy here ...
# meanwile
# set to "v2ray"
socks5 	127.0.0.1 10808
```
测试代理
`proxychains curl www.google.com`
加速github
`proxychains git clone https://github.com/xxx/xxx.git`


* * *
# 设置默认的 gpg keyserver 公钥服务器

$HOME/.gnupg/gpg.conf 权限可以设为 600 ，内容是
```
#keyserver hkp://subkeys.pgp.net
keyserver hkp://keyserver.ubuntu.com
#keyserver hkp://keyserver.ubuntu.com:80
```
就能用默认服务器了

`$ gpg --search-keys 42050C1F6E922E77`
```
gpg: data source: http://162.213.33.9:11371
(1) Andreas Zhang <denglitsch@gmail.com>
263 bit EDDSA key 42050C1F6E922E77, created: 2022-09-21
Keys 1-1 of 1 for "42050C1F6E922E77". Enter number(s), N)ext, or Q)uit >
```

* * *
# grub
```
$ cd /boot/grub
$ sudo chmod 777 grub.cfg
```
```
#
# DO NOT EDIT THIS FILE
#
# It is automatically generated by grub-mkconfig using templates
# from /etc/grub.d and settings from /etc/default/grub
#

### BEGIN /etc/grub.d/00_header ###
if [ -s $prefix/grubenv ]; then
  set have_grubenv=true
  load_env
fi
if [ "${next_entry}" ] ; then
   set default="${next_entry}"
   set next_entry=
   save_env next_entry
   set boot_once=true
else
   set default="0"
fi

if [ x"${feature_menuentry_id}" = xy ]; then
  menuentry_id_option="--id"
else
  menuentry_id_option=""
fi

export menuentry_id_option

if [ "${prev_saved_entry}" ]; then
  set saved_entry="${prev_saved_entry}"
  save_env saved_entry
  set prev_saved_entry=
  save_env prev_saved_entry
  set boot_once=true
fi

function savedefault {
  if [ -z "${boot_once}" ]; then
    saved_entry="${chosen}"
    save_env saved_entry
  fi
}
function recordfail {
  set recordfail=1
  if [ -n "${have_grubenv}" ]; then if [ -z "${boot_once}" ]; then save_env recordfail; fi; fi
}
function load_video {
  if [ x$feature_all_video_module = xy ]; then
    insmod all_video
  else
    insmod efi_gop
    insmod efi_uga
    insmod ieee1275_fb
    insmod vbe
    insmod vga
    insmod video_bochs
    insmod video_cirrus
  fi
}

if [ x$feature_default_font_path = xy ] ; then
   font=unicode
else
insmod part_gpt
insmod ext2
if [ x$feature_platform_search_hint = xy ]; then
  search --no-floppy --fs-uuid --set=root  eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63
else
  search --no-floppy --fs-uuid --set=root eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63
fi
    font="/usr/share/grub/unicode.pf2"
fi

if loadfont $font ; then
  set gfxmode=auto
  load_video
  insmod gfxterm
  set locale_dir=$prefix/locale
  set lang=en_US
  insmod gettext
fi
terminal_output gfxterm
if [ "${recordfail}" = 1 ] ; then
  set timeout=30
else
  if [ x$feature_timeout_style = xy ] ; then
    set timeout_style=hidden
    set timeout=0
  # Fallback hidden-timeout code in case the timeout_style feature is
  # unavailable.
  elif sleep --interruptible 0 ; then
    set timeout=0
  fi
fi
### END /etc/grub.d/00_header ###

### BEGIN /etc/grub.d/05_debian_theme ###
set menu_color_normal=white/black
set menu_color_highlight=black/light-gray
if background_color 44,0,30,0; then
  clear
fi
### END /etc/grub.d/05_debian_theme ###

### BEGIN /etc/grub.d/10_linux ###
function gfxmode {
	set gfxpayload="${1}"
	if [ "${1}" = "keep" ]; then
		set vt_handoff=vt.handoff=1
	else
		set vt_handoff=
	fi
}
if [ "${recordfail}" != 1 ]; then
  if [ -e ${prefix}/gfxblacklist.txt ]; then
    if hwmatch ${prefix}/gfxblacklist.txt 3; then
      if [ ${match} = 0 ]; then
        set linux_gfx_mode=keep
      else
        set linux_gfx_mode=text
      fi
    else
      set linux_gfx_mode=text
    fi
  else
    set linux_gfx_mode=keep
  fi
else
  set linux_gfx_mode=text
fi
export linux_gfx_mode
menuentry 'Ubuntu' --class ubuntu --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-simple-eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63' {
	recordfail
	load_video
	gfxmode $linux_gfx_mode
	insmod gzio
	if [ x$grub_platform = xxen ]; then insmod xzio; insmod lzopio; fi
	insmod part_gpt
	insmod ext2
	if [ x$feature_platform_search_hint = xy ]; then
	  search --no-floppy --fs-uuid --set=root  eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63
	else
	  search --no-floppy --fs-uuid --set=root eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63
	fi
        linux	/boot/vmlinuz-5.4.0-107-generic root=UUID=eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63 ro net.ifnames=0 biosdevname=0 quiet splash $vt_handoff
	initrd	/boot/initrd.img-5.4.0-107-generic
}
submenu 'Advanced options for Ubuntu' $menuentry_id_option 'gnulinux-advanced-eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63' {
	menuentry 'Ubuntu, with Linux 5.4.0-107-generic' --class ubuntu --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-5.4.0-107-generic-advanced-eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63' {
		recordfail
		load_video
		gfxmode $linux_gfx_mode
		insmod gzio
		if [ x$grub_platform = xxen ]; then insmod xzio; insmod lzopio; fi
		insmod part_gpt
		insmod ext2
		if [ x$feature_platform_search_hint = xy ]; then
		  search --no-floppy --fs-uuid --set=root  eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63
		else
		  search --no-floppy --fs-uuid --set=root eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63
		fi
		echo	'Loading Linux 5.4.0-107-generic ...'
	        linux	/boot/vmlinuz-5.4.0-107-generic root=UUID=eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63 ro net.ifnames=0 biosdevname=0 quiet splash $vt_handoff
		echo	'Loading initial ramdisk ...'
		initrd	/boot/initrd.img-5.4.0-107-generic
	}
	menuentry 'Ubuntu, with Linux 5.4.0-107-generic (recovery mode)' --class ubuntu --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-5.4.0-107-generic-recovery-eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63' {
		recordfail
		load_video
		insmod gzio
		if [ x$grub_platform = xxen ]; then insmod xzio; insmod lzopio; fi
		insmod part_gpt
		insmod ext2
		if [ x$feature_platform_search_hint = xy ]; then
		  search --no-floppy --fs-uuid --set=root  eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63
		else
		  search --no-floppy --fs-uuid --set=root eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63
		fi
		echo	'Loading Linux 5.4.0-107-generic ...'
	        linux	/boot/vmlinuz-5.4.0-107-generic root=UUID=eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63 ro recovery nomodeset dis_ucode_ldr net.ifnames=0 biosdevname=0
		echo	'Loading initial ramdisk ...'
		initrd	/boot/initrd.img-5.4.0-107-generic
	}
	menuentry 'Ubuntu, with Linux 5.4.0-105-generic' --class ubuntu --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-5.4.0-105-generic-advanced-eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63' {
		recordfail
		load_video
		gfxmode $linux_gfx_mode
		insmod gzio
		if [ x$grub_platform = xxen ]; then insmod xzio; insmod lzopio; fi
		insmod part_gpt
		insmod ext2
		if [ x$feature_platform_search_hint = xy ]; then
		  search --no-floppy --fs-uuid --set=root  eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63
		else
		  search --no-floppy --fs-uuid --set=root eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63
		fi
		echo	'Loading Linux 5.4.0-105-generic ...'
	        linux	/boot/vmlinuz-5.4.0-105-generic root=UUID=eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63 ro net.ifnames=0 biosdevname=0 quiet splash $vt_handoff
		echo	'Loading initial ramdisk ...'
		initrd	/boot/initrd.img-5.4.0-105-generic
	}
	menuentry 'Ubuntu, with Linux 5.4.0-105-generic (recovery mode)' --class ubuntu --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-5.4.0-105-generic-recovery-eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63' {
		recordfail
		load_video
		insmod gzio
		if [ x$grub_platform = xxen ]; then insmod xzio; insmod lzopio; fi
		insmod part_gpt
		insmod ext2
		if [ x$feature_platform_search_hint = xy ]; then
		  search --no-floppy --fs-uuid --set=root  eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63
		else
		  search --no-floppy --fs-uuid --set=root eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63
		fi
		echo	'Loading Linux 5.4.0-105-generic ...'
	        linux	/boot/vmlinuz-5.4.0-105-generic root=UUID=eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63 ro recovery nomodeset dis_ucode_ldr net.ifnames=0 biosdevname=0
		echo	'Loading initial ramdisk ...'
		initrd	/boot/initrd.img-5.4.0-105-generic
	}
}

### END /etc/grub.d/10_linux ###

### BEGIN /etc/grub.d/20_linux_xen ###

### END /etc/grub.d/20_linux_xen ###

### BEGIN /etc/grub.d/20_memtest86+ ###
### END /etc/grub.d/20_memtest86+ ###

### BEGIN /etc/grub.d/30_os-prober ###
menuentry 'Arch Linux (rolling) (on /dev/sdb1)' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-simple-4be7143e-a6ab-4c1d-8456-e571b77a1014' {
	recordfail
	load_video
	gfxmode $linux_gfx_mode
	insmod gzio
	if [ x$grub_platform = xxen ]; then insmod xzio; insmod lzopio; fi
	insmod part_msdos
	insmod ext2
	#set root='hd1,msdos1'
	if [ x$feature_platform_search_hint = xy ]; then
	  search --no-floppy --fs-uuid --set=root --hint-bios=hd1,msdos1 --hint-efi=hd1,msdos1 --hint-baremetal=ahci1,msdos1  4be7143e-a6ab-4c1d-8456-e571b77a1014
	else
	  search --no-floppy --fs-uuid --set=root 4be7143e-a6ab-4c1d-8456-e571b77a1014
	fi
	linux /boot/vmlinuz-linux root=UUID=4be7143e-a6ab-4c1d-8456-e571b77a1014 rw net.ifnames=0 biosdevname=0 loglevel=3 quiet
	initrd /boot/intel-ucode.img /boot/initramfs-linux.img
}
submenu 'Advanced options for Arch Linux (rolling) (on /dev/sdb1)' $menuentry_id_option 'osprober-gnulinux-advanced-4be7143e-a6ab-4c1d-8456-e571b77a1014' {
	menuentry 'Arch Linux (on /dev/sdb1)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-linux--4be7143e-a6ab-4c1d-8456-e571b77a1014' {
		insmod part_msdos
		insmod ext2
		#set root='hd1,msdos1'
		if [ x$feature_platform_search_hint = xy ]; then
		  search --no-floppy --fs-uuid --set=root --hint-bios=hd1,msdos1 --hint-efi=hd1,msdos1 --hint-baremetal=ahci1,msdos1  4be7143e-a6ab-4c1d-8456-e571b77a1014
		else
		  search --no-floppy --fs-uuid --set=root 4be7143e-a6ab-4c1d-8456-e571b77a1014
		fi
		linux /boot/vmlinuz-linux root=UUID=4be7143e-a6ab-4c1d-8456-e571b77a1014 rw net.ifnames=0 biosdevname=0 loglevel=3 quiet
		initrd /boot/intel-ucode.img /boot/initramfs-linux.img
	}
	menuentry 'Arch Linux, with Linux linux (on /dev/sdb1)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-linux--4be7143e-a6ab-4c1d-8456-e571b77a1014' {
		insmod part_msdos
		insmod ext2
		#set root='hd1,msdos1'
		if [ x$feature_platform_search_hint = xy ]; then
		  search --no-floppy --fs-uuid --set=root --hint-bios=hd1,msdos1 --hint-efi=hd1,msdos1 --hint-baremetal=ahci1,msdos1  4be7143e-a6ab-4c1d-8456-e571b77a1014
		else
		  search --no-floppy --fs-uuid --set=root 4be7143e-a6ab-4c1d-8456-e571b77a1014
		fi
		linux /boot/vmlinuz-linux root=UUID=4be7143e-a6ab-4c1d-8456-e571b77a1014 rw net.ifnames=0 biosdevname=0 loglevel=3 quiet
		initrd /boot/intel-ucode.img /boot/initramfs-linux.img
	}
	menuentry 'Arch Linux, with Linux linux (fallback initramfs) (on /dev/sdb1)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-linux--4be7143e-a6ab-4c1d-8456-e571b77a1014' {
		insmod part_msdos
		insmod ext2
		#set root='hd1,msdos1'
		if [ x$feature_platform_search_hint = xy ]; then
		  search --no-floppy --fs-uuid --set=root --hint-bios=hd1,msdos1 --hint-efi=hd1,msdos1 --hint-baremetal=ahci1,msdos1  4be7143e-a6ab-4c1d-8456-e571b77a1014
		else
		  search --no-floppy --fs-uuid --set=root 4be7143e-a6ab-4c1d-8456-e571b77a1014
		fi
		linux /boot/vmlinuz-linux root=UUID=4be7143e-a6ab-4c1d-8456-e571b77a1014 rw net.ifnames=0 biosdevname=0 loglevel=3 quiet
		initrd /boot/initramfs-linux-fallback.img
	}
	menuentry 'Arch Linux, with Linux linux-lts (on /dev/sdb1)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-linux-lts--4be7143e-a6ab-4c1d-8456-e571b77a1014' {
		insmod part_msdos
		insmod ext2
		#set root='hd1,msdos1'
		if [ x$feature_platform_search_hint = xy ]; then
		  search --no-floppy --fs-uuid --set=root --hint-bios=hd1,msdos1 --hint-efi=hd1,msdos1 --hint-baremetal=ahci1,msdos1  4be7143e-a6ab-4c1d-8456-e571b77a1014
		else
		  search --no-floppy --fs-uuid --set=root 4be7143e-a6ab-4c1d-8456-e571b77a1014
		fi
		linux /boot/vmlinuz-linux-lts root=UUID=4be7143e-a6ab-4c1d-8456-e571b77a1014 rw net.ifnames=0 biosdevname=0 loglevel=3 quiet
		initrd /boot/intel-ucode.img /boot/initramfs-linux.img
	}
	menuentry 'Arch Linux, with Linux linux-lts (fallback initramfs) (on /dev/sdb1)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-linux-lts--4be7143e-a6ab-4c1d-8456-e571b77a1014' {
		insmod part_msdos
		insmod ext2
		#set root='hd1,msdos1'
		if [ x$feature_platform_search_hint = xy ]; then
		  search --no-floppy --fs-uuid --set=root --hint-bios=hd1,msdos1 --hint-efi=hd1,msdos1 --hint-baremetal=ahci1,msdos1  4be7143e-a6ab-4c1d-8456-e571b77a1014
		else
		  search --no-floppy --fs-uuid --set=root 4be7143e-a6ab-4c1d-8456-e571b77a1014
		fi
		linux /boot/vmlinuz-linux-lts root=UUID=4be7143e-a6ab-4c1d-8456-e571b77a1014 rw net.ifnames=0 biosdevname=0 loglevel=3 quiet
		initrd /boot/initramfs-linux-lts-fallback.img
	}
}

menuentry 'Debian GNU/Linux 10 (buster) (on /dev/sdc1)' --class debian --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-simple-3702fe4a-d5cc-435a-8875-1b5ac9a9a7be' {
	insmod part_msdos
	insmod ext2
	#set root='hd2,msdos1'
	if [ x$feature_platform_search_hint = xy ]; then
	  search --no-floppy --fs-uuid --set=root --hint-bios=hd2,msdos1 --hint-efi=hd2,msdos1 --hint-baremetal=ahci2,msdos1  3702fe4a-d5cc-435a-8875-1b5ac9a9a7be
	else
	  search --no-floppy --fs-uuid --set=root 3702fe4a-d5cc-435a-8875-1b5ac9a9a7be
	fi
	linux /boot/vmlinuz-4.19.0-10-amd64 root=UUID=3702fe4a-d5cc-435a-8875-1b5ac9a9a7be ro net.ifnames=0 biosdevname=0 quiet
	initrd /boot/initrd.img-4.19.0-10-amd64
}
submenu 'Advanced options for Debian GNU/Linux 10 (buster) (on /dev/sdc1)' $menuentry_id_option 'osprober-gnulinux-advanced-3702fe4a-d5cc-435a-8875-1b5ac9a9a7be' {
	menuentry 'Debian GNU/Linux (on /dev/sdc1)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-4.19.0-10-amd64--3702fe4a-d5cc-435a-8875-1b5ac9a9a7be' {
		insmod part_msdos
		insmod ext2
		#set root='hd2,msdos1'
		if [ x$feature_platform_search_hint = xy ]; then
		  search --no-floppy --fs-uuid --set=root --hint-bios=hd2,msdos1 --hint-efi=hd2,msdos1 --hint-baremetal=ahci2,msdos1  3702fe4a-d5cc-435a-8875-1b5ac9a9a7be
		else
		  search --no-floppy --fs-uuid --set=root 3702fe4a-d5cc-435a-8875-1b5ac9a9a7be
		fi
		linux /boot/vmlinuz-4.19.0-10-amd64 root=UUID=3702fe4a-d5cc-435a-8875-1b5ac9a9a7be ro net.ifnames=0 biosdevname=0 quiet
		initrd /boot/initrd.img-4.19.0-10-amd64
	}
	menuentry 'Debian GNU/Linux, with Linux 4.19.0-10-amd64 (on /dev/sdc1)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-4.19.0-10-amd64--3702fe4a-d5cc-435a-8875-1b5ac9a9a7be' {
		insmod part_msdos
		insmod ext2
		#set root='hd2,msdos1'
		if [ x$feature_platform_search_hint = xy ]; then
		  search --no-floppy --fs-uuid --set=root --hint-bios=hd2,msdos1 --hint-efi=hd2,msdos1 --hint-baremetal=ahci2,msdos1  3702fe4a-d5cc-435a-8875-1b5ac9a9a7be
		else
		  search --no-floppy --fs-uuid --set=root 3702fe4a-d5cc-435a-8875-1b5ac9a9a7be
		fi
		linux /boot/vmlinuz-4.19.0-10-amd64 root=UUID=3702fe4a-d5cc-435a-8875-1b5ac9a9a7be ro net.ifnames=0 biosdevname=0 quiet
		initrd /boot/initrd.img-4.19.0-10-amd64
	}
	menuentry 'Debian GNU/Linux, with Linux 4.19.0-10-amd64 (recovery mode) (on /dev/sdc1)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/boot/vmlinuz-4.19.0-10-amd64-root=UUID=3702fe4a-d5cc-435a-8875-1b5ac9a9a7be ro single net.ifnames=0 biosdevname=0-3702fe4a-d5cc-435a-8875-1b5ac9a9a7be' {
		insmod part_msdos
		insmod ext2
		#set root='hd2,msdos1'
		if [ x$feature_platform_search_hint = xy ]; then
		  search --no-floppy --fs-uuid --set=root --hint-bios=hd2,msdos1 --hint-efi=hd2,msdos1 --hint-baremetal=ahci2,msdos1  3702fe4a-d5cc-435a-8875-1b5ac9a9a7be
		else
		  search --no-floppy --fs-uuid --set=root 3702fe4a-d5cc-435a-8875-1b5ac9a9a7be
		fi
		linux /boot/vmlinuz-4.19.0-10-amd64 root=UUID=3702fe4a-d5cc-435a-8875-1b5ac9a9a7be ro single net.ifnames=0 biosdevname=0
		initrd /boot/initrd.img-4.19.0-10-amd64
	}
}

set timeout_style=menu
if [ "${timeout}" = 0 ]; then
  set timeout=10
fi
### END /etc/grub.d/30_os-prober ###

### BEGIN /etc/grub.d/30_uefi-firmware ###
menuentry 'System setup' $menuentry_id_option 'uefi-firmware' {
	fwsetup
}
### END /etc/grub.d/30_uefi-firmware ###

### BEGIN /etc/grub.d/40_custom ###
# This file provides an easy way to add custom menu entries.  Simply type the
# menu entries you want to add after this comment.  Be careful not to change
# the 'exec tail' line above.
### END /etc/grub.d/40_custom ###

### BEGIN /etc/grub.d/41_custom ###
if [ -f  ${config_directory}/custom.cfg ]; then
  source ${config_directory}/custom.cfg
elif [ -z "${config_directory}" -a -f  $prefix/custom.cfg ]; then
  source $prefix/custom.cfg;
fi
### END /etc/grub.d/41_custom ###

```
```
$ sudo chmod 444 grub.cfg
```

* * *
# 关于 /swapfile

查看系统是否有交换分区：

`sudo swapon --show`

free命令用来查看空闲的内存空间，其中包括交换分区的空间。

`free -h`

检查当前磁盘的使用情况：

`df -h`

创建swap文件

使用以下命令创建swapfile

`sudo fallocate -l 8G /swapfile`

经过测试，OpenSuSE系统要使用以下命令才能成功创建swapfile

`sudo dd if=/dev/zero of=/swapfile count=4096 bs=1MiB`

使用以下命令查看是否正确创建。

`ls -lh /swapfile`

结果应该类似下面这样：

```
-rw-r--r-- 1 root root 8.0G Apr 26 17:04 /swapfile
```

修改swapfile权限

`sudo chmod 600 /swapfile`

查看效果

`ls -lh /swapfile`

结果应该类似下面这样：
```
-rw------- 1 root root 8.0G Apr 26 17:04 /swapfile
```
激活交换空间

`sudo mkswap /swapfile`
`sudo swapon /swapfile`

之后使用以下命令查看使用成功开启交换空间：

`sudo swapon --show`

结果类似下面这样：
```
NAME      TYPE SIZE USED PRIO

/swapfile file   8G   0B   -1
```
添加到fstab

这样每次开机系统就会自动吧swapfile挂载为交换空间。 首先请自行备份fstab文件。 然后把以下配置添加到fstab文件末尾。
```
/swapfile none swap sw 0 0
```
或者直接使用以下命令：

`sudo cp /etc/fstab /etc/fstab.bak`

`echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab`


* * *
# 安装i4tools
<https://d-updater.i4.cn/i4linux/deb/i4tools_v1.0.055.deb>

`sh /usr/share/i4tools/i4toolslinux.sh`

`sudo gedit /usr/local/bin/i4toolslinux`
```
sh /usr/share/i4tools/i4toolslinux.sh
```
`sudo chmod +x /usr/local/bin/i4toolslinux`

可以查看微信记录 备份后 wechat 可查看聊天记录


* * *
# 安装steam
```
sudo add-apt-repository multiverse
sudo apt install steam
```
下面没有验证
```
sudo dpkg --add-architecture i386
sudo apt install wget gdebi-core libgl1-mesa-glx:i386
//sudo apt install libxtst6:i386 libxrandr2:i386 libgtk2.0-0:i386 libsm6:i386 libpulse0:i386 ffmpeg:i386
sudo apt install steam-installer
```
也可以
```
wget -O ~/steam.deb http://media.steampowered.com/client/installer/steam.deb
sudo gdebi ~/steam.deb
```
or
Download deb from <https://store.steampowered.com/about/>
```
$ sudo dpkg -i steam_latest.deb
```

运行报错
```
$ steam
[2022-10-09 13:29:38] Startup - updater built Oct  6 2022 23:32:04
[2022-10-09 13:29:38] Startup - Steam Client launched with: '/home/andreas/.steam/ubuntu12_32/steam'
SteamUpdateUI: An X Error occurred
X Error of failed request:  GLXBadContext
SteamUpdateUI: An X Error occurred
X Error of failed request:  BadValue (integer parameter out of range for operation)
Major opcode of failed request:  155 (GLX)
Minor opcode of failed request:  3 (X_GLXCreateContext)
Value in failed request:  0x0
Serial number of failed request:  51
xerror_handler: X failed, continuing
Major opcode of failed request:  155 (GLX)
Minor opcode of failed request:  6 (X_GLXIsDirect)
Serial number of failed request:  52
xerror_handler: X failed, continuing
Looks like steam didn't shutdown cleanly, scheduling immediate update check
[2022-10-09 13:29:38] Failed to load cached hosts file (File 'update_hosts_cached.vdf' not found), using defaults
[2022-10-09 13:29:38] Using the following download hosts for Public, Realm steamglobal
[2022-10-09 13:29:38] 1. http://media.steampowered.com, /client/, Realm 'steamglobal', weight was 1, source = 'baked in'
[2022-10-09 13:29:38] Checking for update on startup
[2022-10-09 13:29:38] Checking for available updates...
[2022-10-09 13:29:38] Downloading manifest: http://media.steampowered.com/client/steam_client_ubuntu12
[2022-10-09 13:29:38] Manifest download: send request
[2022-10-09 13:29:38] Manifest download: waiting for download to finish
[2022-10-09 13:29:38] Manifest download: finished
[2022-10-09 13:29:38] Download skipped: /client/steam_client_ubuntu12 version 1665100899, installed version 1665100899, existing pending version 0
[2022-10-09 13:29:38] Nothing to do
[2022-10-09 13:29:38] Verifying installation...
[2022-10-09 13:29:38] Performing checksum verification of executable files
[2022-10-09 13:29:39] Verification complete
```
尝试安装
libnvidia-common-470 libnvidia-gl-470:i386
```
$ sudo ubuntu-drivers devices
WARNING:root:_pkg_get_support nvidia-driver-390: package has invalid Support Legacyheader, cannot determine support level
== /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0 ==
modalias : pci:v000010DEd00001287sv00001028sd0000108Bbc03sc00i00
vendor   : NVIDIA Corporation
model    : GK208B [GeForce GT 730]
driver   : nvidia-driver-418-server - distro non-free
driver   : nvidia-driver-470-server - distro non-free
driver   : nvidia-340 - distro non-free
driver   : nvidia-driver-390 - distro non-free
driver   : nvidia-driver-440 - third-party non-free
driver   : nvidia-driver-460 - third-party non-free
driver   : nvidia-driver-450-server - distro non-free
driver   : nvidia-driver-470 - distro non-free recommended
driver   : xserver-xorg-video-nouveau - distro free builtin
```
查nvidia-driver-xxx和nvidia-utils-xxx
`apt list --installed | grep nvidia-driver`
`apt list --installed | grep nvidia-utils`

```
sudo aptitude install libnvidia-gl-470:i386
The following actions will resolve these dependencies:

      Remove the following packages:                                                                                    
1)      cuda [11.2.2-1 (<NULL>, now)]                                                                                   
2)      cuda-11-2 [11.2.2-1 (<NULL>, now)]                                                                              
3)      cuda-demo-suite-11-2 [11.2.152-1 (<NULL>, now)]                                                                 
4)      cuda-drivers [460.32.03-1 (<NULL>, now)]                                                                        
5)      cuda-drivers-460 [460.32.03-1 (<NULL>, now)]                                                                    
6)      cuda-runtime-11-2 [11.2.2-1 (<NULL>, now)]                                                                      
7)      libnvidia-common-460 [460.32.03-0ubuntu1 (<NULL>, now)]                                                         
8)      nvidia-compute-utils-460 [460.32.03-0ubuntu1 (<NULL>, now)]                                                     

      Install the following packages:                                                                                   
9)      libnvidia-cfg1-470 [470.141.03-0ubuntu0.18.04.1 (bionic-updates)]                                               
10)     libnvidia-compute-470 [470.141.03-0ubuntu0.18.04.1 (bionic-updates)]                                            
11)     libnvidia-decode-470 [470.141.03-0ubuntu0.18.04.1 (bionic-updates)]                                             
12)     libnvidia-encode-470 [470.141.03-0ubuntu0.18.04.1 (bionic-updates)]                                             
13)     libnvidia-extra-470 [470.141.03-0ubuntu0.18.04.1 (bionic-updates)]                                              
14)     libnvidia-fbc1-470 [470.141.03-0ubuntu0.18.04.1 (bionic-updates)]                                               
15)     libnvidia-gl-470 [470.141.03-0ubuntu0.18.04.1 (bionic-updates)]                                                 
16)     libnvidia-ifr1-470 [470.141.03-0ubuntu0.18.04.1 (bionic-updates)]                                               
17)     nvidia-compute-utils-470 [470.141.03-0ubuntu0.18.04.1 (bionic-updates)]                                         
18)     nvidia-dkms-470 [470.141.03-0ubuntu0.18.04.1 (bionic-updates)]                                                  
19)     nvidia-driver-470 [470.141.03-0ubuntu0.18.04.1 (bionic-updates)]                                                
20)     nvidia-kernel-common-470 [470.141.03-0ubuntu0.18.04.1 (bionic-updates)]                                         
21)     nvidia-kernel-source-470 [470.141.03-0ubuntu0.18.04.1 (bionic-updates)]                                         
22)     nvidia-utils-470 [470.141.03-0ubuntu0.18.04.1 (bionic-updates)]                                                 
23)     xserver-xorg-video-nvidia-470 [470.141.03-0ubuntu0.18.04.1 (bionic-updates)]                                    

      Keep the following packages at their current version:                                                             
24)     libnvidia-gl-470:i386 [Not Installed]                                                                           

      Upgrade the following packages:                                                                                   
25)     libnvidia-cfg1-460 [460.32.03-0ubuntu1 (<NULL>, now) -> 470.141.03-0ubuntu0.18.04.1 (bionic-updates)]           
26)     libnvidia-compute-460 [460.32.03-0ubuntu1 (<NULL>, now) -> 470.141.03-0ubuntu0.18.04.1 (bionic-updates)]        
27)     libnvidia-decode-460 [460.32.03-0ubuntu1 (<NULL>, now) -> 470.141.03-0ubuntu0.18.04.1 (bionic-updates)]         
28)     libnvidia-encode-460 [460.32.03-0ubuntu1 (<NULL>, now) -> 470.141.03-0ubuntu0.18.04.1 (bionic-updates)]         
29)     libnvidia-extra-460 [460.32.03-0ubuntu1 (<NULL>, now) -> 470.141.03-0ubuntu0.18.04.1 (bionic-updates)]          
30)     libnvidia-fbc1-460 [460.32.03-0ubuntu1 (<NULL>, now) -> 470.141.03-0ubuntu0.18.04.1 (bionic-updates)]           
31)     libnvidia-gl-460 [460.32.03-0ubuntu1 (<NULL>, now) -> 470.141.03-0ubuntu0.18.04.1 (bionic-updates)]             
32)     libnvidia-ifr1-460 [460.32.03-0ubuntu1 (<NULL>, now) -> 470.141.03-0ubuntu0.18.04.1 (bionic-updates)]           
33)     nvidia-dkms-460 [460.32.03-0ubuntu1 (<NULL>, now) -> 470.141.03-0ubuntu0.18.04.1 (bionic-updates)]              
34)     nvidia-driver-460 [460.32.03-0ubuntu1 (<NULL>, now) -> 470.141.03-0ubuntu0.18.04.1 (bionic-updates)]            
35)     nvidia-kernel-common-460 [460.32.03-0ubuntu1 (<NULL>, now) -> 470.141.03-0ubuntu0.18.04.1 (bionic-updates)]     
36)     nvidia-kernel-source-460 [460.32.03-0ubuntu1 (<NULL>, now) -> 470.141.03-0ubuntu0.18.04.1 (bionic-updates)]     
37)     nvidia-utils-460 [460.32.03-0ubuntu1 (<NULL>, now) -> 470.141.03-0ubuntu0.18.04.1 (bionic-updates)]             
38)     xserver-xorg-video-nvidia-460 [460.32.03-0ubuntu1 (<NULL>, now) -> 470.141.03-0ubuntu0.18.04.1 (bionic-updates)]

      Leave the following dependencies unresolved:                                                                      
39)     nvidia-driver-470 recommends libnvidia-compute-470:i386 (= 470.141.03-0ubuntu0.18.04.1)                         
40)     nvidia-driver-470 recommends libnvidia-decode-470:i386 (= 470.141.03-0ubuntu0.18.04.1)                          
41)     nvidia-driver-470 recommends libnvidia-encode-470:i386 (= 470.141.03-0ubuntu0.18.04.1)                          
42)     nvidia-driver-470 recommends libnvidia-ifr1-470:i386 (= 470.141.03-0ubuntu0.18.04.1)                            
43)     nvidia-driver-470 recommends libnvidia-fbc1-470:i386 (= 470.141.03-0ubuntu0.18.04.1)                            
44)     nvidia-driver-470 recommends libnvidia-gl-470:i386 (= 470.141.03-0ubuntu0.18.04.1)                              



Accept this solution? [Y/n/q/?] y


cuda-nsight-compute-10-2 : Depends: nsight-compute which is a virtual package, provided by:
                                     - nsight-compute-2020.3.1 (2020.3.1.4-1), but it is not going to be installed
                                     - nsight-compute-2019.5.0 (2019.5.0.14-1), but it is not going to be installed



The following NEW packages will be installed:
  libnvidia-compute-470{a} 
The following packages will be REMOVED:
  cuda{a} cuda-11-2{a} cuda-command-line-tools-11-2{u} cuda-compiler-11-2{u} cuda-cudart-dev-11-2{u} cuda-cuobjdump-11-2{u} cuda-cupti-11-2{u} cuda-cupti-dev-11-2{u} cuda-cuxxfilt-11-2{u} 
  cuda-demo-suite-11-2{a} cuda-documentation-11-2{u} cuda-driver-dev-11-2{u} cuda-drivers{a} cuda-drivers-460{a} cuda-gdb-11-2{u} cuda-libraries-11-2{u} cuda-libraries-dev-11-2{u} cuda-memcheck-11-2{u} 
  cuda-nsight-11-2{u} cuda-nsight-compute-11-2{u} cuda-nsight-systems-11-2{u} cuda-nvcc-11-2{u} cuda-nvdisasm-11-2{u} cuda-nvml-dev-11-2{u} cuda-nvprof-11-2{u} cuda-nvprune-11-2{u} cuda-nvrtc-11-2{u} 
  cuda-nvrtc-dev-11-2{u} cuda-nvtx-11-2{u} cuda-nvvp-11-2{u} cuda-runtime-11-2{a} cuda-samples-11-2{u} cuda-sanitizer-11-2{u} cuda-toolkit-11-2{u} cuda-tools-11-2{u} cuda-visual-tools-11-2{u} 
  libcublas-11-2{u} libcublas-dev-11-2{u} libcufft-dev-11-2{u} libcurand-11-2{u} libcurand-dev-11-2{u} libcusolver-11-2{u} libcusolver-dev-11-2{u} libcusparse-11-2{u} libcusparse-dev-11-2{u} libnpp-11-2{u} 
  libnpp-dev-11-2{u} libnvidia-cfg1-460{u} libnvidia-common-460{a} libnvidia-compute-460{u} libnvidia-decode-460{u} libnvidia-encode-460{u} libnvidia-extra-460{u} libnvidia-fbc1-460{u} libnvidia-gl-460{u} 
  libnvidia-ifr1-460{u} libnvjpeg-11-2{u} libnvjpeg-dev-11-2{u} nsight-systems-2020.4.3{u} nvidia-compute-utils-460{a} nvidia-dkms-460{u} nvidia-driver-460{u} nvidia-kernel-common-460{u} 
  nvidia-kernel-source-460{u} nvidia-modprobe{u} nvidia-prime{u} nvidia-settings{u} nvidia-utils-460{u} screen-resolution-extra{u} xserver-xorg-video-nvidia-460{u} 
0 packages upgraded, 1 newly installed, 70 to remove and 0 not upgraded.
Need to get 31.5 MB of archives. After unpacking 4,170 MB will be freed.

Get: 1 https://mirrors.163.com/ubuntu bionic-updates/restricted amd64 libnvidia-compute-470 amd64 470.141.03-0ubuntu0.18.04.1 [31.5 MB]
Fetched 31.5 MB in 3min 6s (169 kB/s)                                                                                                                                                                              
(Reading database ... 928673 files and directories currently installed.)
Removing cuda (11.2.2-1) ...
Removing cuda-11-2 (11.2.2-1) ...
Removing cuda-toolkit-11-2 (11.2.2-1) ...
Removing alternatives
Removing cuda-tools-11-2 (11.2.2-1) ...
Removing cuda-command-line-tools-11-2 (11.2.2-1) ...
Removing cuda-compiler-11-2 (11.2.2-1) ...
Removing cuda-visual-tools-11-2 (11.2.2-1) ...
Removing cuda-documentation-11-2 (11.2.154-1) ...
Removing cuda-samples-11-2 (11.2.152-1) ...
Removing cuda-gdb-11-2 (11.2.152-1) ...
Removing cuda-cuobjdump-11-2 (11.2.152-1) ...
Removing cuda-cupti-dev-11-2 (11.2.152-1) ...
Removing cuda-cupti-11-2 (11.2.152-1) ...
Removing cuda-cuxxfilt-11-2 (11.2.152-1) ...
Removing cuda-demo-suite-11-2 (11.2.152-1) ...
Removing cuda-libraries-dev-11-2 (11.2.2-1) ...
Removing cuda-runtime-11-2 (11.2.2-1) ...
Removing cuda-drivers (460.32.03-1) ...
Removing cuda-drivers-460 (460.32.03-1) ...
Removing cuda-libraries-11-2 (11.2.2-1) ...
Removing cuda-memcheck-11-2 (11.2.152-1) ...
Removing cuda-nsight-11-2 (11.2.152-1) ...
Removing cuda-nsight-compute-11-2 (11.2.2-1) ...
Removing cuda-nsight-systems-11-2 (11.2.2-1) ...
Removing cuda-nvcc-11-2 (11.2.152-1) ...
Removing cuda-nvdisasm-11-2 (11.2.152-1) ...
Removing cuda-nvml-dev-11-2 (11.2.152-1) ...
Removing cuda-nvprof-11-2 (11.2.152-1) ...
Removing cuda-nvprune-11-2 (11.2.152-1) ...
Removing cuda-nvrtc-dev-11-2 (11.2.152-1) ...
Removing cuda-nvrtc-11-2 (11.2.152-1) ...
Removing cuda-nvtx-11-2 (11.2.152-1) ...
Removing cuda-nvvp-11-2 (11.2.152-1) ...
Removing cuda-sanitizer-11-2 (11.2.152-1) ...
Removing libcublas-dev-11-2 (11.4.1.1043-1) ...
Removing libcublas-11-2 (11.4.1.1043-1) ...
Removing libcufft-dev-11-2 (10.4.1.152-1) ...
Removing libcurand-dev-11-2 (10.2.3.152-1) ...
Removing libcurand-11-2 (10.2.3.152-1) ...
Removing libcusolver-dev-11-2 (11.1.0.152-1) ...
Removing libcusolver-11-2 (11.1.0.152-1) ...
Removing libcusparse-dev-11-2 (11.4.1.1152-1) ...
Removing libcusparse-11-2 (11.4.1.1152-1) ...
Removing libnpp-dev-11-2 (11.3.2.152-1) ...
Removing libnpp-11-2 (11.3.2.152-1) ...
Removing nvidia-driver-460 (460.32.03-0ubuntu1) ...
Removing xserver-xorg-video-nvidia-460 (460.32.03-0ubuntu1) ...
Removing libnvidia-cfg1-460:amd64 (460.32.03-0ubuntu1) ...
Removing libnvidia-ifr1-460:amd64 (460.32.03-0ubuntu1) ...
Removing libnvidia-gl-460:amd64 (460.32.03-0ubuntu1) ...
Removing libnvidia-common-460 (460.32.03-0ubuntu1) ...
Removing libnvidia-encode-460:amd64 (460.32.03-0ubuntu1) ...
Removing libnvidia-decode-460:amd64 (460.32.03-0ubuntu1) ...
Removing nvidia-utils-460 (460.32.03-0ubuntu1) ...
Removing libnvidia-extra-460:amd64 (460.32.03-0ubuntu1) ...
Removing libnvidia-fbc1-460:amd64 (460.32.03-0ubuntu1) ...
Removing libnvjpeg-dev-11-2 (11.4.0.152-1) ...
Removing libnvjpeg-11-2 (11.4.0.152-1) ...
Removing nsight-systems-2020.4.3 (2020.4.3.7-10543b6) ...
update-alternatives: removing manually selected alternative - switching nsys to auto mode
Removing nvidia-compute-utils-460 (460.32.03-0ubuntu1) ...
Removing nvidia-dkms-460 (460.32.03-0ubuntu1) ...
Removing all DKMS Modules
Done.
INFO:Disable nvidia
DEBUG:Parsing /usr/share/ubuntu-drivers-common/quirks/put_your_quirks_here
DEBUG:Parsing /usr/share/ubuntu-drivers-common/quirks/dell_latitude
DEBUG:Parsing /usr/share/ubuntu-drivers-common/quirks/lenovo_thinkpad
update-initramfs: deferring update (trigger activated)
Removing nvidia-kernel-common-460 (460.32.03-0ubuntu1) ...
update-initramfs: deferring update (trigger activated)
Removing nvidia-kernel-source-460 (460.32.03-0ubuntu1) ...
Removing nvidia-modprobe (460.32.03-0ubuntu1) ...
Removing nvidia-prime (0.8.16~0.18.04.1) ...
Removing nvidia-settings (470.57.01-0ubuntu0.18.04.1) ...
Removing screen-resolution-extra (0.17.3) ...
Removing cuda-cudart-dev-11-2 (11.2.152-1) ...
Removing cuda-driver-dev-11-2 (11.2.152-1) ...
Removing libnvidia-compute-460:amd64 (460.32.03-0ubuntu1) ...
Selecting previously unselected package libnvidia-compute-470:amd64.
(Reading database ... 921953 files and directories currently installed.)
Preparing to unpack .../libnvidia-compute-470_470.141.03-0ubuntu0.18.04.1_amd64.deb ...
Unpacking libnvidia-compute-470:amd64 (470.141.03-0ubuntu0.18.04.1) ...
Setting up libnvidia-compute-470:amd64 (470.141.03-0ubuntu0.18.04.1) ...
Processing triggers for gnome-menus (3.13.3-11ubuntu1.1) ...
Processing triggers for dbus (1.12.2-1ubuntu1.3) ...
Processing triggers for mime-support (3.60ubuntu1) ...
Processing triggers for desktop-file-utils (0.23-1ubuntu3.18.04.2) ...
Processing triggers for initramfs-tools (0.130ubuntu3.13) ...
update-initramfs: Generating /boot/initrd.img-5.4.0-107-generic
Processing triggers for bamfdaemon (0.5.3+18.04.20180207.2-0ubuntu1) ...
Rebuilding /usr/share/applications/bamf-2.index...
Processing triggers for libc-bin (2.27-3ubuntu1.6) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
                                         
Current status: 0 (-14) upgradable.

$ sudo aptitude install libnvidia-gl-470:i386
The following NEW packages will be installed:
  libnvidia-common-470{a} libnvidia-gl-470:i386 
0 packages upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 21.2 MB of archives. After unpacking 76.4 MB will be used.
Do you want to continue? [Y/n/?] y
Get: 1 https://mirrors.163.com/ubuntu bionic-updates/restricted amd64 libnvidia-common-470 all 470.141.03-0ubuntu0.18.04.1 [10.5 kB]
Get: 2 https://mirrors.163.com/ubuntu bionic-updates/restricted i386 libnvidia-gl-470 i386 470.141.03-0ubuntu0.18.04.1 [21.2 MB]
Fetched 21.2 MB in 2min 26s (145 kB/s)                                                                                                                                                                             
Selecting previously unselected package libnvidia-common-470.
(Reading database ... 921971 files and directories currently installed.)
Preparing to unpack .../libnvidia-common-470_470.141.03-0ubuntu0.18.04.1_all.deb ...
Unpacking libnvidia-common-470 (470.141.03-0ubuntu0.18.04.1) ...
Selecting previously unselected package libnvidia-gl-470:i386.
Preparing to unpack .../libnvidia-gl-470_470.141.03-0ubuntu0.18.04.1_i386.deb ...
Unpacking libnvidia-gl-470:i386 (470.141.03-0ubuntu0.18.04.1) ...
Setting up libnvidia-common-470 (470.141.03-0ubuntu0.18.04.1) ...
Setting up libnvidia-gl-470:i386 (470.141.03-0ubuntu0.18.04.1) ...
Processing triggers for libc-bin (2.27-3ubuntu1.6) ...


$ sudo aptitude install nvidia-driver-470
The following NEW packages will be installed:
  libnvidia-cfg1-470{a} libnvidia-compute-470:i386{a} libnvidia-decode-470{a} libnvidia-decode-470:i386{a} libnvidia-encode-470{a} libnvidia-encode-470:i386{a} libnvidia-extra-470{a} libnvidia-fbc1-470{a} 
  libnvidia-fbc1-470:i386{a} libnvidia-gl-470{a} libnvidia-ifr1-470{a} libnvidia-ifr1-470:i386{a} nvidia-compute-utils-470{a} nvidia-dkms-470{a} nvidia-driver-470 nvidia-kernel-common-470{a} 
  nvidia-kernel-source-470{a} nvidia-prime{a} nvidia-settings{a} nvidia-utils-470{a} screen-resolution-extra{a} xserver-xorg-video-nvidia-470{a} 
0 packages upgraded, 22 newly installed, 0 to remove and 0 not upgraded.
Need to get 217 MB/218 MB of archives. After unpacking 577 MB will be used.
Do you want to continue? [Y/n/?] y




```
删掉的参考这里
<https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=18.04&target_type=deb_local>
最新的是
```
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda-repo-ubuntu1804-11-8-local_11.8.0-520.61.05-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-11-8-local_11.8.0-520.61.05-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu1804-11-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda


$ sudo apt-get install cuda
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following package was automatically installed and is no longer required:
  nsight-compute-2020.3.1
Use 'sudo apt autoremove' to remove it.
The following additional packages will be installed:
  cuda-11-8 cuda-cccl-11-8 cuda-command-line-tools-11-8 cuda-compiler-11-8 cuda-cudart-11-8 cuda-cudart-dev-11-8 cuda-cuobjdump-11-8 cuda-cupti-11-8 cuda-cupti-dev-11-8 cuda-cuxxfilt-11-8 cuda-demo-suite-11-8
  cuda-documentation-11-8 cuda-driver-dev-11-8 cuda-drivers cuda-drivers-520 cuda-gdb-11-8 cuda-libraries-11-8 cuda-libraries-dev-11-8 cuda-memcheck-11-8 cuda-nsight-11-8 cuda-nsight-compute-11-8
  cuda-nsight-systems-11-8 cuda-nvcc-11-8 cuda-nvdisasm-11-8 cuda-nvml-dev-11-8 cuda-nvprof-11-8 cuda-nvprune-11-8 cuda-nvrtc-11-8 cuda-nvrtc-dev-11-8 cuda-nvtx-11-8 cuda-nvvp-11-8 cuda-profiler-api-11-8
  cuda-runtime-11-8 cuda-sanitizer-11-8 cuda-toolkit-11-8 cuda-toolkit-11-8-config-common cuda-tools-11-8 cuda-visual-tools-11-8 gds-tools-11-8 libcublas-11-8 libcublas-dev-11-8 libcufft-11-8 libcufft-dev-11-8
  libcufile-11-8 libcufile-dev-11-8 libcurand-11-8 libcurand-dev-11-8 libcusolver-11-8 libcusolver-dev-11-8 libcusparse-11-8 libcusparse-dev-11-8 libnpp-11-8 libnpp-dev-11-8 libnvidia-cfg1-520
  libnvidia-common-520 libnvidia-compute-520 libnvidia-compute-520:i386 libnvidia-decode-520 libnvidia-decode-520:i386 libnvidia-encode-520 libnvidia-encode-520:i386 libnvidia-extra-520 libnvidia-fbc1-520
  libnvidia-fbc1-520:i386 libnvidia-gl-520 libnvjpeg-11-8 libnvjpeg-dev-11-8 nsight-compute-2022.3.0 nsight-systems-2022.4.2 nvidia-compute-utils-520 nvidia-dkms-520 nvidia-driver-520 nvidia-kernel-common-520
  nvidia-kernel-source-520 nvidia-modprobe nvidia-settings nvidia-utils-520 xserver-xorg-video-nvidia-520
Recommended packages:
  libnvidia-gl-520:i386
The following packages will be REMOVED:
  libnvidia-cfg1-470 libnvidia-common-470 libnvidia-compute-470 libnvidia-compute-470:i386 libnvidia-decode-470 libnvidia-decode-470:i386 libnvidia-encode-470 libnvidia-encode-470:i386 libnvidia-extra-470
  libnvidia-fbc1-470 libnvidia-fbc1-470:i386 libnvidia-gl-470 libnvidia-gl-470:i386 libnvidia-ifr1-470 libnvidia-ifr1-470:i386 nvidia-compute-utils-470 nvidia-dkms-470 nvidia-driver-470
  nvidia-kernel-common-470 nvidia-kernel-source-470 nvidia-utils-470 xserver-xorg-video-nvidia-470
The following NEW packages will be installed:
  cuda cuda-11-8 cuda-cccl-11-8 cuda-command-line-tools-11-8 cuda-compiler-11-8 cuda-cudart-11-8 cuda-cudart-dev-11-8 cuda-cuobjdump-11-8 cuda-cupti-11-8 cuda-cupti-dev-11-8 cuda-cuxxfilt-11-8
  cuda-demo-suite-11-8 cuda-documentation-11-8 cuda-driver-dev-11-8 cuda-drivers cuda-drivers-520 cuda-gdb-11-8 cuda-libraries-11-8 cuda-libraries-dev-11-8 cuda-memcheck-11-8 cuda-nsight-11-8
  cuda-nsight-compute-11-8 cuda-nsight-systems-11-8 cuda-nvcc-11-8 cuda-nvdisasm-11-8 cuda-nvml-dev-11-8 cuda-nvprof-11-8 cuda-nvprune-11-8 cuda-nvrtc-11-8 cuda-nvrtc-dev-11-8 cuda-nvtx-11-8 cuda-nvvp-11-8
  cuda-profiler-api-11-8 cuda-runtime-11-8 cuda-sanitizer-11-8 cuda-toolkit-11-8 cuda-toolkit-11-8-config-common cuda-tools-11-8 cuda-visual-tools-11-8 gds-tools-11-8 libcublas-11-8 libcublas-dev-11-8
  libcufft-11-8 libcufft-dev-11-8 libcufile-11-8 libcufile-dev-11-8 libcurand-11-8 libcurand-dev-11-8 libcusolver-11-8 libcusolver-dev-11-8 libcusparse-11-8 libcusparse-dev-11-8 libnpp-11-8 libnpp-dev-11-8
  libnvidia-cfg1-520 libnvidia-common-520 libnvidia-compute-520 libnvidia-compute-520:i386 libnvidia-decode-520 libnvidia-decode-520:i386 libnvidia-encode-520 libnvidia-encode-520:i386 libnvidia-extra-520
  libnvidia-fbc1-520 libnvidia-fbc1-520:i386 libnvidia-gl-520 libnvjpeg-11-8 libnvjpeg-dev-11-8 nsight-compute-2022.3.0 nsight-systems-2022.4.2 nvidia-compute-utils-520 nvidia-dkms-520 nvidia-driver-520
  nvidia-kernel-common-520 nvidia-kernel-source-520 nvidia-modprobe nvidia-utils-520 xserver-xorg-video-nvidia-520
The following packages will be upgraded:
  nvidia-settings
1 upgraded, 78 newly installed, 22 to remove and 1 not upgraded.
Need to get 0 B/3,061 MB of archives.
After this operation, 6,820 MB of additional disk space will be used.
Do you want to continue? [Y/n] n


$ sudo apt-get install nvidia-driver-520 [vostro 5880 目前最合适的是470版本，不要安装520的]
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libnvidia-cfg1-520 libnvidia-common-520 libnvidia-compute-520 libnvidia-compute-520:i386 libnvidia-decode-520 libnvidia-decode-520:i386 libnvidia-encode-520 libnvidia-encode-520:i386 libnvidia-extra-520
  libnvidia-fbc1-520 libnvidia-fbc1-520:i386 libnvidia-gl-520 nvidia-compute-utils-520 nvidia-dkms-520 nvidia-kernel-common-520 nvidia-kernel-source-520 nvidia-utils-520 xserver-xorg-video-nvidia-520
Recommended packages:
  libnvidia-gl-520:i386
The following packages will be REMOVED:
  libnvidia-cfg1-470 libnvidia-common-470 libnvidia-compute-470 libnvidia-compute-470:i386 libnvidia-decode-470 libnvidia-decode-470:i386 libnvidia-encode-470 libnvidia-encode-470:i386 libnvidia-extra-470
  libnvidia-fbc1-470 libnvidia-fbc1-470:i386 libnvidia-gl-470 libnvidia-gl-470:i386 libnvidia-ifr1-470 libnvidia-ifr1-470:i386 nvidia-compute-utils-470 nvidia-dkms-470 nvidia-driver-470
  nvidia-kernel-common-470 nvidia-kernel-source-470 nvidia-utils-470 xserver-xorg-video-nvidia-470
The following NEW packages will be installed:
  libnvidia-cfg1-520 libnvidia-common-520 libnvidia-compute-520 libnvidia-compute-520:i386 libnvidia-decode-520 libnvidia-decode-520:i386 libnvidia-encode-520 libnvidia-encode-520:i386 libnvidia-extra-520
  libnvidia-fbc1-520 libnvidia-fbc1-520:i386 libnvidia-gl-520 nvidia-compute-utils-520 nvidia-dkms-520 nvidia-driver-520 nvidia-kernel-common-520 nvidia-kernel-source-520 nvidia-utils-520
  xserver-xorg-video-nvidia-520
0 upgraded, 19 newly installed, 22 to remove and 2 not upgraded.
Need to get 0 B/348 MB of archives.
After this operation, 159 MB of additional disk space will be used.
Do you want to continue? [Y/n] n
Abort.

libnvidia-gl-520:i386 libnvidia-ifr1-520 libnvidia-ifr1-520:i386 ?
```
`$ sudo apt-get install nvidia-driver-470`
`$ sudo apt-get install libnvidia-gl-470:i386`
这样opengl就好了

glxinfo

glxgears

kicad

steam

Universe Sandbox


## 处理 更新 nvidia-driver-460 为 nvidia-driver-470 发生的 cuda 依赖错误

`apt-cache showpkg` #查看可⽤的package版本

`aptitude upgrade libvte9=xxx`强制将包升级到指定版本

`aptitude upgrade libvte9=1:0.14.1-0ubuntu1`

`aptitude hold libvte9` #来保持这个包的状态，避免在以后upgrade过程中被升回feisty的版本

`aptitude unhold libvte9` #可以清除包的hold标志

```
sudo apt-get install nvidia-driver-470 libnvidia-gl-470:i386
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.4.4/local_installers/cuda-repo-ubuntu1804-11-4-local_11.4.4-470.82.01-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-11-4-local_11.4.4-470.82.01-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu1804-11-4-local/7fa2af80.pub
sudo rm /etc/apt/sources.list.d/cuda-ubuntu1804-11-8-local.list [旧包删掉，清除apt的多余list，然后update，就好了]
sudo apt-get update
sudo apt-get install cuda
//sudo apt-get install nvidia-gds
//sudo reboot
sudo apt autoremove


$ sudo apt-get install cuda
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following package was automatically installed and is no longer required:
  nsight-compute-2020.3.1
Use 'sudo apt autoremove' to remove it.
The following additional packages will be installed:
  cuda-11-4 cuda-cccl-11-4 cuda-command-line-tools-11-4 cuda-compiler-11-4 cuda-cudart-11-4 cuda-cudart-dev-11-4 cuda-cuobjdump-11-4 cuda-cupti-11-4 cuda-cupti-dev-11-4 cuda-cuxxfilt-11-4 cuda-demo-suite-11-4
  cuda-documentation-11-4 cuda-driver-dev-11-4 cuda-drivers cuda-drivers-470 cuda-gdb-11-4 cuda-libraries-11-4 cuda-libraries-dev-11-4 cuda-memcheck-11-4 cuda-nsight-11-4 cuda-nsight-compute-11-4
  cuda-nsight-systems-11-4 cuda-nvcc-11-4 cuda-nvdisasm-11-4 cuda-nvml-dev-11-4 cuda-nvprof-11-4 cuda-nvprune-11-4 cuda-nvrtc-11-4 cuda-nvrtc-dev-11-4 cuda-nvtx-11-4 cuda-nvvp-11-4 cuda-runtime-11-4
  cuda-samples-11-4 cuda-sanitizer-11-4 cuda-toolkit-11-4 cuda-toolkit-11-4-config-common cuda-tools-11-4 cuda-visual-tools-11-4 gds-tools-11-4 libcublas-11-4 libcublas-dev-11-4 libcufft-11-4 libcufft-dev-11-4
  libcufile-11-4 libcufile-dev-11-4 libcurand-11-4 libcurand-dev-11-4 libcusolver-11-4 libcusolver-dev-11-4 libcusparse-11-4 libcusparse-dev-11-4 libnpp-11-4 libnpp-dev-11-4 libnvjpeg-11-4 libnvjpeg-dev-11-4
  liburcu6 nsight-compute-2021.2.2 nsight-systems-2021.3.2 nvidia-modprobe nvidia-settings
The following NEW packages will be installed:
  cuda cuda-11-4 cuda-cccl-11-4 cuda-command-line-tools-11-4 cuda-compiler-11-4 cuda-cudart-11-4 cuda-cudart-dev-11-4 cuda-cuobjdump-11-4 cuda-cupti-11-4 cuda-cupti-dev-11-4 cuda-cuxxfilt-11-4
  cuda-demo-suite-11-4 cuda-documentation-11-4 cuda-driver-dev-11-4 cuda-drivers cuda-drivers-470 cuda-gdb-11-4 cuda-libraries-11-4 cuda-libraries-dev-11-4 cuda-memcheck-11-4 cuda-nsight-11-4
  cuda-nsight-compute-11-4 cuda-nsight-systems-11-4 cuda-nvcc-11-4 cuda-nvdisasm-11-4 cuda-nvml-dev-11-4 cuda-nvprof-11-4 cuda-nvprune-11-4 cuda-nvrtc-11-4 cuda-nvrtc-dev-11-4 cuda-nvtx-11-4 cuda-nvvp-11-4
  cuda-runtime-11-4 cuda-samples-11-4 cuda-sanitizer-11-4 cuda-toolkit-11-4 cuda-toolkit-11-4-config-common cuda-tools-11-4 cuda-visual-tools-11-4 gds-tools-11-4 libcublas-11-4 libcublas-dev-11-4 libcufft-11-4
  libcufft-dev-11-4 libcufile-11-4 libcufile-dev-11-4 libcurand-11-4 libcurand-dev-11-4 libcusolver-11-4 libcusolver-dev-11-4 libcusparse-11-4 libcusparse-dev-11-4 libnpp-11-4 libnpp-dev-11-4 libnvjpeg-11-4
  libnvjpeg-dev-11-4 liburcu6 nsight-compute-2021.2.2 nsight-systems-2021.3.2 nvidia-modprobe
The following packages will be upgraded:
  nvidia-settings
1 upgraded, 60 newly installed, 0 to remove and 1 not upgraded.
Need to get 52.2 kB/2,227 MB of archives.
After this operation, 5,627 MB of additional disk space will be used.
Do you want to continue? [Y/n] y

```

deb可以在
<https://developer.download.nvidia.cn/compute/cuda/repos/ubuntu1804/x86_64/>
找类似cuda-compat-11-4_470.82.01-1_amd64.deb这样的玩意可以得到完整包名


## 配置cuda环境（参考）##

<https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#post-installation-actions>


`sudo gedit /etc/profile`
文末添加：
```
export CUDA_HOME=/usr/local/cuda
export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
```
然后
`source /etc/profile`

`gedit ~/.bashrc`
文末添加：
```
### cuda path
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH 
```
然后
`source ~/.bashrc`

`sudo gedit /etc/ld.so.conf`
文末添加：
```
/usr/local/cuda/lib64
```
`sudo ldconfig`
`nvcc -V`
此时和 nvidia-smi 的cuda一致。
```
andreas@Vostro-5880:/media/andreas/M4B/开发板资料/Nvidia/JetPack
$ nvcc -V
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2021 NVIDIA Corporation
Built on Mon_Oct_11_21:27:02_PDT_2021
Cuda compilation tools, release 11.4, V11.4.152
Build cuda_11.4.r11.4/compiler.30521435_0
andreas@Vostro-5880:/media/andreas/M4B/开发板资料/Nvidia/JetPack
$ nvidia-smi
Sun Oct  9 17:03:18 2022       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 470.141.03   Driver Version: 470.141.03   CUDA Version: 11.4     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  NVIDIA GeForce ...  Off  | 00000000:01:00.0 N/A |                  N/A |
| 30%   36C    P8    N/A /  N/A |    247MiB /  2002MiB |     N/A      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+


nvidia-smi -l 5
```

本身ubuntu的repo有 nvidia-cuda-toolkit 比较老旧
`apt-cache showpkg nvidia-cuda-toolkit`
`apt-cache showpkg nsight-compute`
`$ sudo apt install nvidia-cuda-toolkit`
```
[sudo] password for andreas: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following package was automatically installed and is no longer required:
  nsight-compute-2020.3.1
Use 'sudo apt autoremove' to remove it.
The following additional packages will be installed:
  libaccinj64-9.1 libcublas9.1 libcudart9.1 libcufft9.1 libcufftw9.1 libcuinj64-9.1 libcurand9.1 libcusolver9.1 libcusparse9.1 libnppc9.1 libnppial9.1 libnppicc9.1 libnppicom9.1 libnppidei9.1 libnppif9.1
  libnppig9.1 libnppim9.1 libnppist9.1 libnppisu9.1 libnppitc9.1 libnpps9.1 libnvblas9.1 libnvgraph9.1 libnvrtc9.1 libnvtoolsext1 libnvvm3 libthrust-dev libvdpau-dev nvidia-cuda-dev nvidia-cuda-doc
  nvidia-cuda-gdb nvidia-opencl-dev nvidia-profiler nvidia-visual-profiler ocl-icd-opencl-dev opencl-c-headers
Suggested packages:
  libvdpau-doc libcupti-dev nvidia-driver libpoclu-dev
Recommended packages:
  libnvcuvid1
The following NEW packages will be installed:
  libaccinj64-9.1 libcublas9.1 libcudart9.1 libcufft9.1 libcufftw9.1 libcuinj64-9.1 libcurand9.1 libcusolver9.1 libcusparse9.1 libnppc9.1 libnppial9.1 libnppicc9.1 libnppicom9.1 libnppidei9.1 libnppif9.1
  libnppig9.1 libnppim9.1 libnppist9.1 libnppisu9.1 libnppitc9.1 libnpps9.1 libnvblas9.1 libnvgraph9.1 libnvrtc9.1 libnvtoolsext1 libnvvm3 libthrust-dev libvdpau-dev nvidia-cuda-dev nvidia-cuda-doc
  nvidia-cuda-gdb nvidia-cuda-toolkit nvidia-opencl-dev nvidia-profiler nvidia-visual-profiler ocl-icd-opencl-dev opencl-c-headers
0 upgraded, 37 newly installed, 0 to remove and 1 not upgraded.
Need to get 772 MB of archives.
After this operation, 1,774 MB of additional disk space will be used.
Do you want to continue? [Y/n] n
Abort.
```

* * *
# deepin 的迅雷、wechat和qq
`sudo dpkg -r udis86`
其实docker的qq这几个就好了

* * *
# 星空图stellarium
```
sudo apt install stellarium
```

* * *
# Jupyter Notebook

`cd <somewhere>`
`$ jupyter notebook`

```
sudo -H pip3 install --upgrade \
                        pip \
                        setuptools \
                        numpy
sudo -H pip3 install parsel -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install pillow -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install pyecharts -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install jupyter -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install ipykernel -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install prompt-toolkit -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install prompt-toolkit==1.0.5 -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install snapshot_phantomjs -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install wordcloud -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install you-get -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install progressbar -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install configure -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install spacy -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install notedown -i https://mirrors.163.com/pypi/simple
//sudo -H pip3 install pybullet -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install torch torchvision -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install tensorflow -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install scrapy -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install gluoncv -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install mxnet -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install d2l==1.0.0a1.post0
sudo -H pip3 install tensorflow-probability
mkdir d2l-en && cd d2l-en
curl https://d2l.ai/d2l-en.zip -o d2l-en.zip
unzip d2l-en.zip && rm d2l-en.zip
jupyter notebook
```
```
$ sudo -H pip3 install tensorflow -i https://mirrors.163.com/pypi/simple
[sudo] password for andreas: 
/usr/lib/python3/dist-packages/secretstorage/dhcrypto.py:15: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography and will be removed in a future release.
  from cryptography.utils import int_from_bytes
Looking in indexes: https://mirrors.163.com/pypi/simple
Collecting tensorflow
  Downloading https://mirrors.163.com/pypi/packages/fe/e2/20b693b5cc699f8116075379d57c4628502f58f96aa759209b77be047882/tensorflow-2.6.2-cp36-cp36m-manylinux2010_x86_64.whl (458.3 MB)
     |████████████████████████████████| 458.3 MB 45 kB/s             
Collecting gast==0.4.0
  Downloading https://mirrors.163.com/pypi/packages/b6/48/583c032b79ae5b3daa02225a675aeb673e58d2cb698e78510feceb11958c/gast-0.4.0-py3-none-any.whl (9.8 kB)
Collecting six~=1.15.0
  Downloading https://mirrors.163.com/pypi/packages/ee/ff/48bde5c0f013094d729fe4b0316ba2a24774b3ff1c52d924a8a4cb04078a/six-1.15.0-py2.py3-none-any.whl (10 kB)
Collecting wrapt~=1.12.1
  Downloading https://mirrors.163.com/pypi/packages/82/f7/e43cefbe88c5fd371f4cf0cf5eb3feccd07515af9fd6cf7dbf1d1793a797/wrapt-1.12.1.tar.gz (27 kB)
  Preparing metadata (setup.py) ... done
Collecting astunparse~=1.6.3
  Downloading https://mirrors.163.com/pypi/packages/2b/03/13dde6512ad7b4557eb792fbcf0c653af6076b81e5941d36ec61f7ce6028/astunparse-1.6.3-py2.py3-none-any.whl (12 kB)
Requirement already satisfied: numpy~=1.19.2 in /usr/local/lib/python3.6/dist-packages (from tensorflow) (1.19.5)
Collecting h5py~=3.1.0
  Downloading https://mirrors.163.com/pypi/packages/70/7a/e53e500335afb6b1aade11227cdf107fca54106a1dca5c9d13242a043f3b/h5py-3.1.0-cp36-cp36m-manylinux1_x86_64.whl (4.0 MB)
     |████████████████████████████████| 4.0 MB 770 kB/s            
Collecting google-pasta~=0.2
  Downloading https://mirrors.163.com/pypi/packages/a3/de/c648ef6835192e6e2cc03f40b19eeda4382c49b5bafb43d88b931c4c74ac/google_pasta-0.2.0-py3-none-any.whl (57 kB)
     |████████████████████████████████| 57 kB 43 kB/s              
Collecting tensorflow-estimator<2.7,>=2.6.0
  Downloading https://mirrors.163.com/pypi/packages/c8/54/1b2f1e22a2670546cc02e4df1b80425edaee02133173bb91aa0f6d3d0293/tensorflow_estimator-2.6.0-py2.py3-none-any.whl (462 kB)
     |████████████████████████████████| 462 kB 223 kB/s            
Collecting clang~=5.0
  Downloading https://mirrors.163.com/pypi/packages/32/12/e17c1220f8ca587add2e076ebb28b6c4551fcc730e3c69a5f49679ad28e9/clang-5.0.tar.gz (30 kB)
  Preparing metadata (setup.py) ... done
Collecting keras-preprocessing~=1.1.2
  Downloading https://mirrors.163.com/pypi/packages/79/4c/7c3275a01e12ef9368a892926ab932b33bb13d55794881e3573482b378a7/Keras_Preprocessing-1.1.2-py2.py3-none-any.whl (42 kB)
     |████████████████████████████████| 42 kB 137 kB/s             
Collecting flatbuffers~=1.12.0
  Downloading https://mirrors.163.com/pypi/packages/eb/26/712e578c5f14e26ae3314c39a1bdc4eb2ec2f4ddc89b708cf8e0a0d20423/flatbuffers-1.12-py2.py3-none-any.whl (15 kB)
Collecting absl-py~=0.10
  Downloading https://mirrors.163.com/pypi/packages/6f/30/9447db7fb0ff3e56a3462cb1c005e44c8291bfcb58a0150e098d1f6d0ddd/absl_py-0.14.0-py3-none-any.whl (131 kB)
     |████████████████████████████████| 131 kB 767 kB/s            
Collecting opt-einsum~=3.3.0
  Downloading https://mirrors.163.com/pypi/packages/bc/19/404708a7e54ad2798907210462fd950c3442ea51acc8790f3da48d2bee8b/opt_einsum-3.3.0-py3-none-any.whl (65 kB)
     |████████████████████████████████| 65 kB 84 kB/s            
Requirement already satisfied: protobuf>=3.9.2 in /usr/lib/python3/dist-packages (from tensorflow) (3.12.4)
Collecting tensorboard<2.7,>=2.6.0
  Downloading https://mirrors.163.com/pypi/packages/a0/20/a59a30c32330e4ff704faa4273b251db042d495e0c367bcdf045c6fe26e9/tensorboard-2.6.0-py3-none-any.whl (5.6 MB)
     |████████████████████████████████| 5.6 MB 1.1 MB/s            
Collecting grpcio<2.0,>=1.37.0
  Downloading https://mirrors.163.com/pypi/packages/2f/fa/37e126905ec086714d6c320ee08d7728baa243798889270a85042826877a/grpcio-1.41.1-cp36-cp36m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (3.9 MB)
     |████████████████████████████████| 3.9 MB 744 kB/s            
Collecting keras<2.7,>=2.6.0
  Downloading https://mirrors.163.com/pypi/packages/5a/38/04d9b7fb53acdf861df2c4505fa96b06c779817a511e94b8882d284ba360/keras-2.6.0-py2.py3-none-any.whl (1.3 MB)
     |████████████████████████████████| 1.3 MB 733 kB/s            
Requirement already satisfied: typing-extensions~=3.7.4 in /usr/local/lib/python3.6/dist-packages (from tensorflow) (3.7.4.3)
Collecting wheel~=0.35
  Using cached https://mirrors.163.com/pypi/packages/65/63/39d04c74222770ed1589c0eaba06c05891801219272420b40311cd60c880/wheel-0.36.2-py2.py3-none-any.whl (35 kB)
Requirement already satisfied: termcolor~=1.1.0 in /usr/local/lib/python3.6/dist-packages (from tensorflow) (1.1.0)
Collecting cached-property
  Downloading https://mirrors.163.com/pypi/packages/48/19/f2090f7dad41e225c7f2326e4cfe6fff49e57dedb5b53636c9551f86b069/cached_property-1.5.2-py2.py3-none-any.whl (7.6 kB)
Collecting google-auth-oauthlib<0.5,>=0.4.1
  Downloading https://mirrors.163.com/pypi/packages/b1/0e/0636cc1448a7abc444fb1b3a63655e294e0d2d49092dc3de05241be6d43c/google_auth_oauthlib-0.4.6-py2.py3-none-any.whl (18 kB)
Requirement already satisfied: requests<3,>=2.21.0 in /usr/local/lib/python3.6/dist-packages (from tensorboard<2.7,>=2.6.0->tensorflow) (2.25.1)
Requirement already satisfied: markdown>=2.6.8 in /usr/lib/python3/dist-packages (from tensorboard<2.7,>=2.6.0->tensorflow) (2.6.9)
Collecting tensorboard-data-server<0.7.0,>=0.6.0
  Downloading https://mirrors.163.com/pypi/packages/60/f9/802efd84988bffd9f644c03b6e66fde8e76c3aa33db4279ddd11c5d61f4b/tensorboard_data_server-0.6.1-py3-none-manylinux2010_x86_64.whl (4.9 MB)
     |████████████████████████████████| 4.9 MB 1.3 MB/s            
Collecting tensorboard-plugin-wit>=1.6.0
  Downloading https://mirrors.163.com/pypi/packages/1a/c1/499e600ba0c618b451cd9c425ae1c177249940a2086316552fee7d86c954/tensorboard_plugin_wit-1.8.0-py3-none-any.whl (781 kB)
     |████████████████████████████████| 781 kB 622 kB/s            
Collecting setuptools>=41.0.0
  Using cached https://mirrors.163.com/pypi/packages/eb/0a/d86dd882b2087570ab9cb86c67e720e1bef7532597b467c2909b3930af3c/setuptools-60.3.0-py3-none-any.whl (953 kB)
Requirement already satisfied: werkzeug>=0.11.15 in /usr/lib/python3/dist-packages (from tensorboard<2.7,>=2.6.0->tensorflow) (0.14.1)
Collecting google-auth<2,>=1.6.3
  Downloading https://mirrors.163.com/pypi/packages/fb/7a/1b3eb54caee1b8c73c2c3645f78a382eca4805a301a30c64a078e736e446/google_auth-1.35.0-py2.py3-none-any.whl (152 kB)
     |████████████████████████████████| 152 kB 1.8 MB/s            
Collecting rsa<5,>=3.1.4
  Downloading https://mirrors.163.com/pypi/packages/e9/93/0c0f002031f18b53af7a6166103c02b9c0667be528944137cc954ec921b3/rsa-4.7.2-py3-none-any.whl (34 kB)
Collecting cachetools<5.0,>=2.0.0
  Downloading https://mirrors.163.com/pypi/packages/ea/c1/4740af52db75e6dbdd57fc7e9478439815bbac549c1c05881be27d19a17d/cachetools-4.2.4-py3-none-any.whl (10 kB)
Requirement already satisfied: pyasn1-modules>=0.2.1 in /usr/local/lib/python3.6/dist-packages (from google-auth<2,>=1.6.3->tensorboard<2.7,>=2.6.0->tensorflow) (0.2.8)
Collecting requests-oauthlib>=0.7.0
  Downloading https://mirrors.163.com/pypi/packages/a3/12/b92740d845ab62ea4edf04d2f4164d82532b5a0b03836d4d4e71c6f3d379/requests_oauthlib-1.3.0-py2.py3-none-any.whl (23 kB)
Requirement already satisfied: certifi>=2017.4.17 in /usr/lib/python3/dist-packages (from requests<3,>=2.21.0->tensorboard<2.7,>=2.6.0->tensorflow) (2018.1.18)
Requirement already satisfied: urllib3<1.27,>=1.21.1 in /usr/local/lib/python3.6/dist-packages (from requests<3,>=2.21.0->tensorboard<2.7,>=2.6.0->tensorflow) (1.26.12)
Requirement already satisfied: chardet<5,>=3.0.2 in /usr/lib/python3/dist-packages (from requests<3,>=2.21.0->tensorboard<2.7,>=2.6.0->tensorflow) (3.0.4)
Requirement already satisfied: idna<3,>=2.5 in /usr/lib/python3/dist-packages (from requests<3,>=2.21.0->tensorboard<2.7,>=2.6.0->tensorflow) (2.6)
Requirement already satisfied: pyasn1<0.5.0,>=0.4.6 in /usr/local/lib/python3.6/dist-packages (from pyasn1-modules>=0.2.1->google-auth<2,>=1.6.3->tensorboard<2.7,>=2.6.0->tensorflow) (0.4.8)
Collecting oauthlib>=3.0.0
  Downloading https://mirrors.163.com/pypi/packages/e8/5d/9dd1c29e5a786525f6342f6c1d812ed2e37edc653ad297048c1668988053/oauthlib-3.1.1-py2.py3-none-any.whl (146 kB)
     |████████████████████████████████| 146 kB 619 kB/s            
Collecting setuptools>=41.0.0
  Using cached https://mirrors.163.com/pypi/packages/8e/16/8f64922c8d7cd7ec193b145c9b11ad281064ff8604452ba19a6d5bbd7ed9/setuptools-60.2.0-py3-none-any.whl (953 kB)
  Using cached https://mirrors.163.com/pypi/packages/d3/6b/9ba419f861fef1eb624f77fcb2c081ccac6f11e363bcf47bee6a4d2d5e0d/setuptools-60.1.1-py3-none-any.whl (952 kB)
  Using cached https://mirrors.163.com/pypi/packages/75/cd/178028262e067ed10011779e8de4c12821de3dc1598de42920988ebd412d/setuptools-60.1.0-py3-none-any.whl (952 kB)
  Using cached https://mirrors.163.com/pypi/packages/ff/27/92a1a57aff92dac23df4a6867be19e29449f52fb05e17de9b1d64e61ebe1/setuptools-60.0.5-py3-none-any.whl (953 kB)
  Using cached https://mirrors.163.com/pypi/packages/4f/e6/8502336aa2f185b1d9ca56f2fb5048e138c2322262aa45c09c3b5b40012e/setuptools-60.0.4-py3-none-any.whl (952 kB)
  Using cached https://mirrors.163.com/pypi/packages/df/0d/706cb6888df0dfe7f5a3dc4b1b8c39b949386ef28e66cd989d6d5c16b8ca/setuptools-60.0.3-py3-none-any.whl (952 kB)
  Using cached https://mirrors.163.com/pypi/packages/8a/ff/593e863da0712038adb7272172bb2d3ae61b1350094fee9d875674bd9ffd/setuptools-60.0.2-py3-none-any.whl (952 kB)
  Using cached https://mirrors.163.com/pypi/packages/c1/b1/f775e1cce396e9e6905fc61af075f5b4110376306ed92e6dc1a4b79c91af/setuptools-60.0.1-py3-none-any.whl (952 kB)
  Using cached https://mirrors.163.com/pypi/packages/f9/73/a1e8254ee8604a7f8598f5b7c09d587b329ad2727f410a210f26c9595b7a/setuptools-60.0.0-py3-none-any.whl (952 kB)
  Using cached https://mirrors.163.com/pypi/packages/8d/25/88b377b99ffb4ad0fc44ff5735fd6be605b2183f743d1ff5c10b7790cea5/setuptools-59.8.0-py3-none-any.whl (952 kB)
  Using cached https://mirrors.163.com/pypi/packages/4f/27/b51cc9cebfd53b168b8a187c844e7a67dc523dda76be9b46d532815df284/setuptools-59.7.0-py3-none-any.whl (952 kB)
  Using cached https://mirrors.163.com/pypi/packages/b0/3a/88b210db68e56854d0bcf4b38e165e03be377e13907746f825790f3df5bf/setuptools-59.6.0-py3-none-any.whl (952 kB)
Building wheels for collected packages: clang, wrapt
  Building wheel for clang (setup.py) ... done
  Created wheel for clang: filename=clang-5.0-py3-none-any.whl size=32138 sha256=c45501252940c6c4250781aea9d2a542378ae75792badc9d5bcaa898172c2694
  Stored in directory: /root/fe/wheels/ec/a9/12/087d69e91487891648f3939464ded26746f686b03daf507db9
  Building wheel for wrapt (setup.py) ... done
  Created wheel for wrapt: filename=wrapt-1.12.1-cp36-cp36m-linux_x86_64.whl size=69376 sha256=d0fcd982be34667eb49031e63413c3f8aa3861c5f64484eda7b9ffa6b34b2f97
  Stored in directory: /root/.cache/pip/wheels/1f/06/08/d93e1998b76829b1b785863b7ad22095e6608744e04118c094
Successfully built clang wrapt
Installing collected packages: six, setuptools, rsa, oauthlib, cachetools, requests-oauthlib, google-auth, wheel, tensorboard-plugin-wit, tensorboard-data-server, grpcio, google-auth-oauthlib, cached-property, absl-py, wrapt, tensorflow-estimator, tensorboard, opt-einsum, keras-preprocessing, keras, h5py, google-pasta, gast, flatbuffers, clang, astunparse, tensorflow
  Attempting uninstall: six
    Found existing installation: six 1.11.0
    Uninstalling six-1.11.0:
      Successfully uninstalled six-1.11.0
  Attempting uninstall: setuptools
    Found existing installation: setuptools 39.0.1
    Uninstalling setuptools-39.0.1:
      Successfully uninstalled setuptools-39.0.1
  Attempting uninstall: oauthlib
    Found existing installation: oauthlib 2.0.6
    Uninstalling oauthlib-2.0.6:
      Successfully uninstalled oauthlib-2.0.6
  Attempting uninstall: wheel
    Found existing installation: wheel 0.30.0
    Uninstalling wheel-0.30.0:
      Successfully uninstalled wheel-0.30.0
  Attempting uninstall: wrapt
    Found existing installation: wrapt 1.9.0
ERROR: Cannot uninstall 'wrapt'. It is a distutils installed project and thus we cannot accurately determine which files belong to it which would lead to only a partial uninstall.
andreas@Vostro-5880:~/Downloads

$ sudo -H pip3 install -U --ignore-installed wrapt enum34 simplejson netaddr -i https://mirrors.163.com/pypi/simple
/usr/lib/python3/dist-packages/secretstorage/dhcrypto.py:15: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography and will be removed in a future release.
  from cryptography.utils import int_from_bytes
Looking in indexes: https://mirrors.163.com/pypi/simple
Collecting wrapt
  Using cached wrapt-1.12.1-cp36-cp36m-linux_x86_64.whl
Collecting enum34
  Downloading https://mirrors.163.com/pypi/packages/63/f6/ccb1c83687756aeabbf3ca0f213508fcfb03883ff200d201b3a4c60cedcc/enum34-1.1.10-py3-none-any.whl (11 kB)
Collecting simplejson
  Downloading https://mirrors.163.com/pypi/packages/73/96/1e6b19045375890068d7342cbe280dd64ae73fd90b9735b5efb8d1e044a1/simplejson-3.17.2-cp36-cp36m-manylinux2010_x86_64.whl (127 kB)
     |████████████████████████████████| 127 kB 73 kB/s            
Collecting netaddr
  Downloading https://mirrors.163.com/pypi/packages/ff/cd/9cdfea8fc45c56680b798db6a55fa60a22e2d3d3ccf54fc729d083b50ce4/netaddr-0.8.0-py2.py3-none-any.whl (1.9 MB)
     |████████████████████████████████| 1.9 MB 673 kB/s            
Collecting importlib-resources
  Downloading https://mirrors.163.com/pypi/packages/f2/6c/2f3b930513bb971172ffceb63cf4e910944e57451724e69b1dec97cfefa6/importlib_resources-5.2.2-py3-none-any.whl (27 kB)
Collecting zipp>=3.1.0
  Downloading https://mirrors.163.com/pypi/packages/92/d9/89f433969fb8dc5b9cbdd4b4deb587720ec1aeb59a020cf15002b9593eef/zipp-3.5.0-py3-none-any.whl (5.7 kB)
Installing collected packages: zipp, importlib-resources, wrapt, simplejson, netaddr, enum34
Successfully installed enum34-1.1.10 importlib-resources-5.2.2 netaddr-0.8.0 simplejson-3.17.2 wrapt-1.14.1 zipp-3.5.0
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv

$ sudo -H pip3 install tensorflow -i https://mirrors.163.com/pypi/simple 
/usr/lib/python3/dist-packages/secretstorage/dhcrypto.py:15: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography and will be removed in a future release.
  from cryptography.utils import int_from_bytes
Looking in indexes: https://mirrors.163.com/pypi/simple
Collecting tensorflow
  Using cached https://mirrors.163.com/pypi/packages/fe/e2/20b693b5cc699f8116075379d57c4628502f58f96aa759209b77be047882/tensorflow-2.6.2-cp36-cp36m-manylinux2010_x86_64.whl (458.3 MB)
Requirement already satisfied: six~=1.15.0 in /usr/local/lib/python3.6/dist-packages (from tensorflow) (1.15.0)
Requirement already satisfied: wheel~=0.35 in /usr/local/lib/python3.6/dist-packages (from tensorflow) (0.36.2)
Collecting gast==0.4.0
  Using cached https://mirrors.163.com/pypi/packages/b6/48/583c032b79ae5b3daa02225a675aeb673e58d2cb698e78510feceb11958c/gast-0.4.0-py3-none-any.whl (9.8 kB)
Collecting google-pasta~=0.2
  Using cached https://mirrors.163.com/pypi/packages/a3/de/c648ef6835192e6e2cc03f40b19eeda4382c49b5bafb43d88b931c4c74ac/google_pasta-0.2.0-py3-none-any.whl (57 kB)
Collecting tensorflow-estimator<2.7,>=2.6.0
  Using cached https://mirrors.163.com/pypi/packages/c8/54/1b2f1e22a2670546cc02e4df1b80425edaee02133173bb91aa0f6d3d0293/tensorflow_estimator-2.6.0-py2.py3-none-any.whl (462 kB)
Collecting astunparse~=1.6.3
  Using cached https://mirrors.163.com/pypi/packages/2b/03/13dde6512ad7b4557eb792fbcf0c653af6076b81e5941d36ec61f7ce6028/astunparse-1.6.3-py2.py3-none-any.whl (12 kB)
Collecting h5py~=3.1.0
  Using cached https://mirrors.163.com/pypi/packages/70/7a/e53e500335afb6b1aade11227cdf107fca54106a1dca5c9d13242a043f3b/h5py-3.1.0-cp36-cp36m-manylinux1_x86_64.whl (4.0 MB)
Collecting keras-preprocessing~=1.1.2
  Using cached https://mirrors.163.com/pypi/packages/79/4c/7c3275a01e12ef9368a892926ab932b33bb13d55794881e3573482b378a7/Keras_Preprocessing-1.1.2-py2.py3-none-any.whl (42 kB)
Requirement already satisfied: absl-py~=0.10 in /usr/local/lib/python3.6/dist-packages (from tensorflow) (0.14.0)
Requirement already satisfied: protobuf>=3.9.2 in /usr/lib/python3/dist-packages (from tensorflow) (3.12.4)
Requirement already satisfied: termcolor~=1.1.0 in /usr/local/lib/python3.6/dist-packages (from tensorflow) (1.1.0)
Collecting flatbuffers~=1.12.0
  Using cached https://mirrors.163.com/pypi/packages/eb/26/712e578c5f14e26ae3314c39a1bdc4eb2ec2f4ddc89b708cf8e0a0d20423/flatbuffers-1.12-py2.py3-none-any.whl (15 kB)
Collecting tensorboard<2.7,>=2.6.0
  Using cached https://mirrors.163.com/pypi/packages/a0/20/a59a30c32330e4ff704faa4273b251db042d495e0c367bcdf045c6fe26e9/tensorboard-2.6.0-py3-none-any.whl (5.6 MB)
Requirement already satisfied: grpcio<2.0,>=1.37.0 in /usr/local/lib/python3.6/dist-packages (from tensorflow) (1.41.1)
Collecting wrapt~=1.12.1
  Using cached wrapt-1.12.1-cp36-cp36m-linux_x86_64.whl
Requirement already satisfied: typing-extensions~=3.7.4 in /usr/local/lib/python3.6/dist-packages (from tensorflow) (3.7.4.3)
Requirement already satisfied: numpy~=1.19.2 in /usr/local/lib/python3.6/dist-packages (from tensorflow) (1.19.5)
Collecting clang~=5.0
  Using cached clang-5.0-py3-none-any.whl
Collecting keras<2.7,>=2.6.0
  Using cached https://mirrors.163.com/pypi/packages/5a/38/04d9b7fb53acdf861df2c4505fa96b06c779817a511e94b8882d284ba360/keras-2.6.0-py2.py3-none-any.whl (1.3 MB)
Collecting opt-einsum~=3.3.0
  Using cached https://mirrors.163.com/pypi/packages/bc/19/404708a7e54ad2798907210462fd950c3442ea51acc8790f3da48d2bee8b/opt_einsum-3.3.0-py3-none-any.whl (65 kB)
Requirement already satisfied: cached-property in /usr/local/lib/python3.6/dist-packages (from h5py~=3.1.0->tensorflow) (1.5.2)
Requirement already satisfied: setuptools>=41.0.0 in /usr/local/lib/python3.6/dist-packages (from tensorboard<2.7,>=2.6.0->tensorflow) (59.6.0)
Requirement already satisfied: requests<3,>=2.21.0 in /usr/local/lib/python3.6/dist-packages (from tensorboard<2.7,>=2.6.0->tensorflow) (2.25.1)
Requirement already satisfied: markdown>=2.6.8 in /usr/lib/python3/dist-packages (from tensorboard<2.7,>=2.6.0->tensorflow) (2.6.9)
Requirement already satisfied: tensorboard-plugin-wit>=1.6.0 in /usr/local/lib/python3.6/dist-packages (from tensorboard<2.7,>=2.6.0->tensorflow) (1.8.0)
Requirement already satisfied: werkzeug>=0.11.15 in /usr/lib/python3/dist-packages (from tensorboard<2.7,>=2.6.0->tensorflow) (0.14.1)
Requirement already satisfied: google-auth<2,>=1.6.3 in /usr/local/lib/python3.6/dist-packages (from tensorboard<2.7,>=2.6.0->tensorflow) (1.35.0)
Requirement already satisfied: tensorboard-data-server<0.7.0,>=0.6.0 in /usr/local/lib/python3.6/dist-packages (from tensorboard<2.7,>=2.6.0->tensorflow) (0.6.1)
Requirement already satisfied: google-auth-oauthlib<0.5,>=0.4.1 in /usr/local/lib/python3.6/dist-packages (from tensorboard<2.7,>=2.6.0->tensorflow) (0.4.6)
Requirement already satisfied: cachetools<5.0,>=2.0.0 in /usr/local/lib/python3.6/dist-packages (from google-auth<2,>=1.6.3->tensorboard<2.7,>=2.6.0->tensorflow) (4.2.4)
Requirement already satisfied: pyasn1-modules>=0.2.1 in /usr/local/lib/python3.6/dist-packages (from google-auth<2,>=1.6.3->tensorboard<2.7,>=2.6.0->tensorflow) (0.2.8)
Requirement already satisfied: rsa<5,>=3.1.4 in /usr/local/lib/python3.6/dist-packages (from google-auth<2,>=1.6.3->tensorboard<2.7,>=2.6.0->tensorflow) (4.7.2)
Requirement already satisfied: requests-oauthlib>=0.7.0 in /usr/local/lib/python3.6/dist-packages (from google-auth-oauthlib<0.5,>=0.4.1->tensorboard<2.7,>=2.6.0->tensorflow) (1.3.0)
Requirement already satisfied: certifi>=2017.4.17 in /usr/lib/python3/dist-packages (from requests<3,>=2.21.0->tensorboard<2.7,>=2.6.0->tensorflow) (2018.1.18)
Requirement already satisfied: urllib3<1.27,>=1.21.1 in /usr/local/lib/python3.6/dist-packages (from requests<3,>=2.21.0->tensorboard<2.7,>=2.6.0->tensorflow) (1.26.12)
Requirement already satisfied: chardet<5,>=3.0.2 in /usr/lib/python3/dist-packages (from requests<3,>=2.21.0->tensorboard<2.7,>=2.6.0->tensorflow) (3.0.4)
Requirement already satisfied: idna<3,>=2.5 in /usr/lib/python3/dist-packages (from requests<3,>=2.21.0->tensorboard<2.7,>=2.6.0->tensorflow) (2.6)
Requirement already satisfied: pyasn1<0.5.0,>=0.4.6 in /usr/local/lib/python3.6/dist-packages (from pyasn1-modules>=0.2.1->google-auth<2,>=1.6.3->tensorboard<2.7,>=2.6.0->tensorflow) (0.4.8)
Requirement already satisfied: oauthlib>=3.0.0 in /usr/local/lib/python3.6/dist-packages (from requests-oauthlib>=0.7.0->google-auth-oauthlib<0.5,>=0.4.1->tensorboard<2.7,>=2.6.0->tensorflow) (3.1.1)
Installing collected packages: wrapt, tensorflow-estimator, tensorboard, opt-einsum, keras-preprocessing, keras, h5py, google-pasta, gast, flatbuffers, clang, astunparse, tensorflow
  Attempting uninstall: wrapt
    Found existing installation: wrapt 1.14.1
    Uninstalling wrapt-1.14.1:
      Successfully uninstalled wrapt-1.14.1
Successfully installed astunparse-1.6.3 clang-5.0 flatbuffers-1.12 gast-0.4.0 google-pasta-0.2.0 h5py-3.1.0 keras-2.6.0 keras-preprocessing-1.1.2 opt-einsum-3.3.0 tensorboard-2.6.0 tensorflow-2.6.2 tensorflow-estimator-2.6.0 wrapt-1.12.1
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
```
```
$ pip3 list
/usr/lib/python3/dist-packages/secretstorage/dhcrypto.py:15: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography and will be removed in a future release.
  from cryptography.utils import int_from_bytes
Package                       Version
----------------------------- -----------------
absl-py                       0.14.0
altgraph                      0.17
apturl                        0.5.2
argon2-cffi                   20.1.0
asgiref                       3.4.1
asn1crypto                    0.24.0
astroid                       1.6.0
astunparse                    1.6.3
async-generator               1.10
asyncio                       3.4.3
attrs                         21.4.0
Automat                       20.2.0
beautifulsoup4                4.6.0
bencoder                      0.2.0
bencoder.pyx                  2.0.1
bleach                        3.3.1
blessings                     1.7
blinker                       1.4
blis                          0.7.4
Brlapi                        0.6.6
bs4                           0.0.1
cached-property               1.5.2
cachetools                    4.2.4
catalogue                     2.0.6
certifi                       2018.1.18
cffi                          1.14.6
chardet                       3.0.4
cilimao-cli                   1.0
clang                         5.0
click                         7.1.2
colorama                      0.3.7
command-not-found             0.3
configparser                  5.0.2
configure                     0.5
constantly                    15.1.0
contextvars                   2.4
crayons                       0.4.0
cryptography                  38.0.1
cssselect                     1.1.0
cupshelpers                   1.0
cycler                        0.10.0
cymem                         2.0.5
dataclasses                   0.8
decorator                     4.1.2
defer                         1.0.6
defusedxml                    0.7.1
devscripts                    2.20.2-18.04.sav0
distro                        1.3.0
distro-info                   1.0+18.04sav1
docopt                        0.6.2
docutils                      0.14
entrypoints                   0.3
enum34                        1.1.10
feedparser                    5.2.1
feeluown                      3.8.3
filelock                      3.4.1
fire                          0.4.0
Flask                         0.12.2
flatbuffers                   1.12
future                        0.18.2
fuzzywuzzy                    0.18.0
galternatives                 0.92.2
gast                          0.4.0
gitdb2                        2.0.3
GitPython                     2.1.8
gobject                       0.1.0
google-auth                   1.35.0
google-auth-oauthlib          0.4.6
google-pasta                  0.2.0
gpg                           1.10.0
gpustat                       0.6.0
graphviz                      0.5.2
greenlet                      0.4.12
grpcio                        1.41.1
gst                           0.1.0
h11                           0.12.0
h5py                          3.1.0
html5lib                      0.999999999
httplib2                      0.20.2
hyperlink                     21.0.0
idna                          2.6
imageio                       2.9.0
imageio-ffmpeg                0.4.4
immutables                    0.15
importlib-metadata            4.6.0
importlib-resources           5.2.2
incremental                   21.3.0
ipykernel                     5.5.6
ipython                       5.5.0
ipython_genutils              0.2.0
ipywidgets                    7.6.3
iso8601                       0.1.16
isort                         4.3.4
itemadapter                   0.7.0
itemloaders                   1.0.6
itsdangerous                  0.24
janus                         0.6.1
Jinja2                        2.10
jmespath                      0.10.0
jsonschema                    3.2.0
jupyter                       1.0.0
jupyter-client                7.0.6
jupyter-console               6.4.0
jupyter-core                  4.7.1
jupyterlab-pygments           0.1.2
jupyterlab-widgets            1.0.0
kazam                         1.4.5
keras                         2.6.0
Keras-Preprocessing           1.1.2
keyring                       10.6.0
keyrings.alt                  3.0
kiwisolver                    1.3.1
language-selector             0.1
launchpadlib                  1.10.7
lazr.restfulclient            0.14.2
lazr.uri                      1.0.3
lazy-object-proxy             1.3.1
libscrc                       1.7.1
logilab-common                1.4.1
louis                         3.5.0
lxml                          4.2.1
macaroonbakery                1.1.3
Mako                          1.0.7
Markdown                      2.6.9
Markups                       2.0.1
MarkupSafe                    1.0
marshmallow                   3.13.0
mate-tweak                    18.4.16
matplotlib                    2.2.4
mccabe                        0.6.1
mdict-utils                   1.0.11
meld                          3.18.0
meson                         0.61.2
mistune                       0.8.4
MouseInfo                     0.1.3
msgpack                       0.5.6
murmurhash                    1.0.5
mutagen                       1.45.1
nbclient                      0.5.3
nbconvert                     6.0.7
nbformat                      5.1.3
neovim                        0.2.0
nest-asyncio                  1.5.1
netaddr                       0.8.0
netifaces                     0.10.4
notebook                      6.4.6
notedown                      1.5.1
numpy                         1.19.5
nvidia-ml-py3                 7.352.0
oauth                         1.0.1
oauthlib                      3.1.1
olefile                       0.45.1
onboard                       1.4.1
opencv-contrib-python         4.5.4.58
opencv-python                 4.5.4.58
opt-einsum                    3.3.0
packaging                     21.0
pandas                        1.1.5
pandoc-attributes             0.1.7
pandocfilters                 1.4.3
parse                         1.19.0
parsel                        1.6.0
pathy                         0.6.1
pexpect                       4.2.1
pickleshare                   0.7.4
Pillow                        8.3.2
pip                           21.3.1
preshed                       3.0.5
prettytable                   2.1.0
progressbar                   2.5
prometheus-client             0.11.0
prompt-toolkit                1.0.5
Protego                       0.2.1
protobuf                      3.12.4
psutil                        5.8.0
ptyprocess                    0.7.0
pulsemixer                    1.4.0
py3dns                        3.1.1
pyasn1                        0.4.8
pyasn1-modules                0.2.8
PyAutoGUI                     0.9.52
pycairo                       1.16.2
PyChromecast                  0.8.1
pycparser                     2.20
pycrypto                      2.6.1
pycryptodome                  3.10.1
pycups                        1.9.73
pycurl                        7.43.0.1
pydantic                      1.8.2
PyDispatcher                  2.0.6
pyecharts                     1.9.0
pyenchant                     2.0.0
PyGetWindow                   0.0.9
pyglossary                    4.2.0
Pygments                      2.11.1
PyGObject                     3.26.1
pyinotify                     0.9.6
pyinstaller                   4.3
pyinstaller-hooks-contrib     2021.1
PyJWT                         1.5.3
pylint                        1.8.3
pymacaroons                   0.13.0
PyMsgBox                      1.0.9
PyNaCl                        1.1.2
PyOpenGL                      3.1.5
pyOpenSSL                     22.1.0
pyparsing                     2.4.7
pyperclip                     1.8.2
PyQt5                         5.15.2
pyqt5-plugins                 5.15.2.2.2
PyQt5-sip                     12.8.1
PyQt5-stubs                   5.15.2.0
pyqt5-tools                   5.15.2.3.2
pyquery                       1.4.3
PyRect                        0.1.4
pyRFC3339                     1.0
pyrsistent                    0.17.3
PyScreeze                     0.1.28
pyserial                      3.5
PySimpleSOAP                  1.16.2
python-apt                    1.6.5+ubuntu0.7
python-dateutil               2.8.1
python-debian                 0.1.32
python-debianbts              2.7.2
python-dotenv                 0.17.1
python-magic                  0.4.16
python-xlib                   0.20
python3-xlib                  0.15
PyTweening                    1.0.3
pytz                          2018.3
PyVISA                        1.11.3
PyVISA-py                     0.5.2
pywebcopy                     6.3.0
pyxattr                       0.6.0
pyxdg                         0.25
PyYAML                        5.4.1
pyzmq                         22.1.0
qasync                        0.22.0
qt5-applications              5.15.2.2.2
qt5-tools                     5.15.2.1.2
qtconsole                     5.2.2
QtPy                          1.11.2
queuelib                      1.6.2
redis                         3.5.3
reportbug                     7.1.8ubuntu1
reportlab                     3.4.0
requests                      2.25.1
requests-file                 1.5.1
requests-oauthlib             1.3.0
requests-unixsocket           0.1.5
roman                         2.0.0
rsa                           4.7.2
scipy                         1.1.0
scour                         0.38.2
Scrapy                        2.6.3
screen-resolution-extra       0.0.0
SecretStorage                 2.3.1
selenium                      3.141.0
Send2Trash                    1.8.0
serial                        0.0.97
service-identity              21.1.0
setproctitle                  1.1.10
setuptools                    59.6.0
simplegeneric                 0.8.1
simplejson                    3.17.2
six                           1.15.0
smart-open                    5.2.1
smmap2                        2.0.3
snapshot-phantomjs            0.0.3
some-package                  0.1
spacy                         3.1.4
spacy-legacy                  3.0.8
srsly                         2.4.2
ssh-import-id                 5.7
system-service                0.3
systemd-python                234
tensorboard                   2.6.0
tensorboard-data-server       0.6.1
tensorboard-plugin-wit        1.8.0
tensorflow                    2.6.2
tensorflow-estimator          2.6.0
termcolor                     1.1.0
terminado                     0.12.1
testpath                      0.4.4
textile                       3.0.0
thinc                         8.0.12
tkVideo                       0.1
tldextract                    3.1.2
tomlkit                       0.7.0
tornado                       6.1
torrent-cli                   0.0.9
tqdm                          4.62.3
traitlets                     4.3.2
Twisted                       22.4.0
typer                         0.3.2
typing-extensions             3.7.4.3
ubuntu-advantage-tools        27.11.2
ubuntu-dev-tools              0.175-18.04.2
ubuntu-drivers-common         0.0.0
ufw                           0.36
unattended-upgrades           0.1
unidiff                       0.5.4
unity-scope-calculator        0.1
unity-scope-chromiumbookmarks 0.1
unity-scope-colourlovers      0.1
unity-scope-devhelp           0.1
unity-scope-firefoxbookmarks  0.1
unity-scope-manpages          0.1
unity-scope-openclipart       0.1
unity-scope-texdoc            0.1
unity-scope-tomboy            0.1
unity-scope-virtualbox        0.1
unity-scope-yelp              0.1
unity-scope-zotero            0.1
unity-tweak-tool              0.0.7
urllib3                       1.26.12
usb-creator                   0.3.3
uvicorn                       0.14.0
virtualenv                    15.1.0
w3lib                         1.22.0
wadllib                       1.3.2
wasabi                        0.8.2
wcwidth                       0.1.7
webdriver-manager             3.5.1
webencodings                  0.5
Werkzeug                      0.14.1
wheel                         0.36.2
widgetsnbextension            3.5.1
wordcloud                     1.8.1
wrapt                         1.12.1
wxPython                      4.0.1
xdot                          0.9
xkit                          0.0.0
you-get                       0.4.1545
youtube_dl                    2018.3.14
zeroconf                      0.19.1
zipp                          3.5.0
zope.interface                5.5.0
WARNING: You are using pip version 21.3.1; however, version 22.2.2 is available.
You should consider upgrading via the '/usr/bin/python3 -m pip install --upgrade pip' command.
```
```
$ sudo -H pip3 install --upgrade pip -i https://mirrors.163.com/pypi/simple
/usr/lib/python3/dist-packages/secretstorage/dhcrypto.py:15: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography and will be removed in a future release.
  from cryptography.utils import int_from_bytes
Looking in indexes: https://mirrors.163.com/pypi/simple
Requirement already satisfied: pip in /usr/local/lib/python3.6/dist-packages (21.3.1)
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
```

* * *
# freecad

```
$ sudo apt  install freecad
[sudo] password for andreas: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  fonts-lyx libcoin80v5 libjs-jquery-ui liboce-foundation11 liboce-modeling11 liboce-ocaf-lite11 liboce-ocaf11 liboce-visualization11 libpyside1.2 libshiboken1.2v5 libsoqt4-20 libspnav0 libzipios++0v5
  pyside-tools python-backports.functools-lru-cache python-collada python-cycler python-matplotlib python-matplotlib-data python-pivy python-ply python-pyside python-pyside.phonon python-pyside.qtcore
  python-pyside.qtdeclarative python-pyside.qtgui python-pyside.qthelp python-pyside.qtnetwork python-pyside.qtopengl python-pyside.qtscript python-pyside.qtsql python-pyside.qtsvg python-pyside.qttest
  python-pyside.qtuitools python-pyside.qtwebkit python-pyside.qtxml python-qt4-gl python-subprocess32 python-tk python-tz ttf-bitstream-vera
Suggested packages:
  povray libopenal0a libsimage-dev libjs-jquery-ui-docs spacenavd python-cycler-doc python-cairocffi python-excelerator python-matplotlib-doc python-nose python-scipy python-tornado python-traits ttf-staypuft
  python-ply-doc tix python-tk-dbg
The following NEW packages will be installed:
  fonts-lyx freecad libcoin80v5 libjs-jquery-ui liboce-foundation11 liboce-modeling11 liboce-ocaf-lite11 liboce-ocaf11 liboce-visualization11 libpyside1.2 libshiboken1.2v5 libsoqt4-20 libspnav0 libzipios++0v5
  pyside-tools python-backports.functools-lru-cache python-collada python-cycler python-matplotlib python-matplotlib-data python-pivy python-ply python-pyside python-pyside.phonon python-pyside.qtcore
  python-pyside.qtdeclarative python-pyside.qtgui python-pyside.qthelp python-pyside.qtnetwork python-pyside.qtopengl python-pyside.qtscript python-pyside.qtsql python-pyside.qtsvg python-pyside.qttest
  python-pyside.qtuitools python-pyside.qtwebkit python-pyside.qtxml python-qt4-gl python-subprocess32 python-tk python-tz ttf-bitstream-vera
0 upgraded, 42 newly installed, 0 to remove and 1 not upgraded.
Need to get 54.4 MB of archives.
After this operation, 239 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
```

* * *
# spice
```
sudo apt install ngspice gnucap electric gwave gspiceui libxpm-dev cksfv golang golang-go
```
编译安装gaw3和ltspice，已经制作了deb包。


* * *
# latex (texlive-full)
texlive-full和texlive-20xx其实是不同版本的，iso的一般比repo的新, 一般用repo的就行， 而且另外可以安装MiKTeX
```
$ sudo apt-get install texlive-full librsvg2-bin fonts-freefont-otf fonts-freefont-ttf perl perl-doc xzdec texlive-latex-recommended
$ sudo apt-get install texlive-lang-german texlive-lang-french texlive-lang-italian texlive-lang-japanese texlive-lang-korean texlive-lang-english texlive-lang-european texlive-lang-cjk texlive-lang-all texlive-full texlive-xetex texlive-binaries texlive-base texlive
$ sudo apt-get install texlive latexmk texlive-extra-utils texlive-lang-chinese --assume-yes --quiet
$ sudo apt-get install texlive-latex-base texlive-latex-extra latex-cjk-all latexmk
$ sudo apt-get install lyx texstudio texmaker texworks texify latexmk
$ sudo apt-get -y install fontconfig xfonts-utils
$ sudo apt-get install texlive-lang-all texlive-fonts-extra
```
texlive image 下载
```
http://mirrors.ustc.edu.cn/CTAN/systems/texlive/Images/
```
删除原先版本
```
sudo rm -rf /usr/local/texlive/20xx
rm -rf ~/.texlive20xx
```
mount iso 之后呢
```
sudo apt-get install perl-tk
sudo ./install-tl --gui perltk
//sudo perl install-tl -gui
确认安装位置
/usr/local/texlive/2022
ref
https://tug.org/texlive/doc/texlive-en/texlive-en.html#installation
```
进入texlive默认安装目录

`cd /usr/local/texlive`

//下载并运行升级脚本 [不确定会不会造成破坏]
```
sudo wget http://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh
sudo chmod +x update-tlmgr-latest.sh
sh update-tlmgr-latest.sh -- --upgrade

```
切换仓库
```
tlmgr repository list
tlmgr option repository http://mirrors.ustc.edu.cn/CTAN/systems/texlive/tlnet/
tlmgr update --self --all
tlmgr update --reinstall-forcibly-removed --all     命令进行强制继续升级

更新字体缓存
luaotfload-tool -fu
sudo mktexlsr

//安装完整版texlive（时间一两个小时左右，不要让shell断开）
//tlmgr install scheme-full
```
##光盘版本（2022）安装后
```
For Bourne-compatible shells such as bash, and using Intel x86 GNU/Linux and the TeX Live default directory setup as an example, the ﬁle to edit might be $HOME/.profile (or another ﬁle sourced by .profile), and the lines to add would look like this:   //一般不写在/etc/profile
PATH=/usr/local/texlive/2022/bin/x86_64-linux:$PATH; export PATH 
MANPATH=/usr/local/texlive/2022/texmf-dist/doc/man:$MANPATH; export MANPATH 
INFOPATH=/usr/local/texlive/2022/texmf-dist/doc/info:$INFOPATH; export INFOPATH

For csh or tcsh, the ﬁle to edit is typically $HOME/.cshrc, and the lines to add might look like:
setenv PATH /usr/local/texlive/2022/bin/x86_64-linux:$PATH 
setenv MANPATH /usr/local/texlive/2022/texmf-dist/doc/man:$MANPATH 
setenv INFOPATH /usr/local/texlive/2022/texmf-dist/doc/info:$INFOPATH


sudo cp /usr/local/texlive/2022/texmf-var/fonts/conf/texlive-fontconfig.conf /etc/fonts/conf.d/09-texlive.conf
用ln -s 也行

fc-cache -fsv
sudo fc-cache -fsv

tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet

sudo gedit /etc/manpath.config
添加
MANPATH_MAP /usr/local/texlive/2022/bin/x86_64-linux \ 
            /usr/local/texlive/2022/texmf-dist/doc/man

$ tlmgr --version
tlmgr revision 62273 (2022-02-28 09:52:17 +0100)
tlmgr using installation: /usr/local/texlive/2022
TeX Live (https://tug.org/texlive) version 2022

$ sudo tlmgr --version
[sudo] password for andreas: 
(running on Debian, switching to user mode!)
tlmgr revision 46207 (2018-01-04 19:34:36 +0100)
tlmgr using installation: /usr/share/texlive
TeX Live (http://tug.org/texlive) version 2017

$ tlmgr init-usertree

$ tlmgr repository list
List of repositories (with tags if set):
	https://mirror.ctan.org/systems/texlive/tlnet (main)

$ tlmgr option repository http://mirrors.ustc.edu.cn/CTAN/systems/texlive/tlnet/
You don't have permission to change the installation in any way,
specifically, the directory /usr/local/texlive/2022/tlpkg/ is not writable.
Please run this program as administrator, or contact your local admin.
tlmgr: An error has occurred. See above messages. Exiting.
	
$ cd /usr/local/texlive/2022/
$ sudo chmod 777 tlpkg/ -R      [不建议这么干]
$ tlmgr option repository http://mirrors.ustc.edu.cn/CTAN/systems/texlive/tlnet/
tlmgr: setting default package repository to http://mirrors.ustc.edu.cn/CTAN/systems/texlive/tlnet/
tlmgr: updating /usr/local/texlive/2022/tlpkg/texlive.tlpdb
chmod(436,/usr/local/texlive/2022/tlpkg/texlive.tlpdb) failed: Operation not permitted at /usr/local/texlive/2022/tlpkg/TeXLive/TLUtils.pm line 1319.

$ sudo tlmgr repository list
(running on Debian, switching to user mode!)
List of repositories (with tags if set):
    https://mirror.ctan.org/systems/texlive/tlnet (main)

$ tlmgr repository list
List of repositories (with tags if set):
	http://mirrors.ustc.edu.cn/CTAN/systems/texlive/tlnet/ (main)

$ tlmgr install beamer

干脆用root账户去更新（不好）
su
PATH=/usr/local/texlive/2022/bin/x86_64-linux:$PATH; export PATH 
MANPATH=/usr/local/texlive/2022/texmf-dist/doc/man:$MANPATH; export MANPATH 
INFOPATH=/usr/local/texlive/2022/texmf-dist/doc/info:$INFOPATH; export INFOPATH
tlmgr update --self
tlmgr --version
tlmgr option repository http://mirrors.ustc.edu.cn/CTAN/systems/texlive/tlnet/
tlmgr repository list
tlmgr install beamer

最好使用usermode
$ tlmgr repository list --usermode
List of repositories (with tags if set):
    https://mirror.ctan.org/systems/texlive/tlnet (main)

$ tlmgr install beamer --usermode
tlmgr: package repository http://mirrors.ustc.edu.cn/CTAN/systems/texlive/tlnet (verified)
[1/1, ??:??/??:??] install: beamer [3021k]
running mktexlsr ...
done running mktexlsr.

$ tlmgr --verify-repo=none install dirtree --usermode
```

##系统原生repo版本（2017）
```
$ tlmgr init-usertree
$ tlmgr --version
(running on Debian, switching to user mode!)
tlmgr revision 46207 (2018-01-04 19:34:36 +0100)
tlmgr using installation: /usr/share/texlive
TeX Live (http://tug.org/texlive) version 2017


tlmgr repository add ftp://tug.org/historic/systems/texlive/2017/tlnet-final
tlmgr repository list
tlmgr repository remove http://mirror.ctan.org/systems/texlive/tlnet
tlmgr option repository ftp://tug.org/historic/systems/texlive/2017/tlnet-final
$ tlmgr install beamer
(running on Debian, switching to user mode!)
TeX Live 2017 is frozen forever and will no
longer be updated.  This happens in preparation for a new release.

If you're interested in helping to pretest the new release (when
pretests are available), please read http://tug.org/texlive/pretest.html.
Otherwise, just wait, and the new release will be ready in due time.
tlmgr: package repository ftp://tug.org/historic/systems/texlive/2017/tlnet-final (verified)
[1/1, ??:??/??:??] install: beamer [161k]
running mktexlsr ...
done running mktexlsr.
tlmgr: package log updated: /home/andreas/texmf/web2c/tlmgr.log
```

如果是高版本的tlmgr
```
tlmgr --verify-repo=none install dirtree
I added the --verify-repo parameter to avoid get this error: tlmgr: unexpected return value from verify_checksum: -5 for main repository
```

<https://tex.stackexchange.com/questions/137428/tlmgr-cannot-setup-tlpdb>

`tlmgr install xxx` 如果出现这样的错误

(running on Debian, switching to user mode!) cannot setup TLPDB in /home/USER/texmf at /usr/bin/tlmgr line 5308.

要初始化tlmgr仓库

```
$ tlmgr init-usertree
```

安装了perl-tk就可以用图形化tlmgr了
```
sudo tlmgr --gui
tlmgr --gui
```
卸载
```
sudo tlmgr uninstall
tlmgr --gui
```

texlive-full它的各种配置文件啊、环境变量啊，都放在哪里呢？使用tlmgr conf命令即可查看
```
tlmgr conf
```

Installing code2000 package.
```
    Download the package from its respective link http://www.fonts2u.com/code2000.font
    Copy code2000.ttf to /usr/share/fonts/
    fc-cache -fv to refresh font list.
```
texmaker / texstudio 选 xelatex

下载和安装英文字体
```
wget -O source-serif-pro.zip https://www.fontsquirrel.com/fonts/download/source-serif-pro
unzip source-serif-pro -d source-serif-pro
sudo mv source-serif-pro /usr/share/fonts/opentype/

wget -O source-sans-pro.zip https://www.fontsquirrel.com/fonts/download/source-sans-pro
unzip source-sans-pro -d source-sans-pro
sudo mv source-sans-pro /usr/share/fonts/opentype/

wget -O source-code-pro.zip https://www.fontsquirrel.com/fonts/download/source-code-pro
unzip source-code-pro -d source-code-pro
sudo mv source-code-pro /usr/share/fonts/opentype/

sudo fc-cache -f -v
sudo mktexlsr
fc-cache -f -v
```

思源等宽: source-han-mono


思源黑体: source-han-sans
<https://raw.githubusercontent.com/zzrichard/source-han-serif/release/OTF/SourceHanSerifJ_EL-M.zip>
<https://raw.githubusercontent.com/zzrichard/source-han-serif/release/OTF/SourceHanSerifJ_SB-H.zip>
<https://raw.githubusercontent.com/zzrichard/source-han-serif/release/OTF/SourceHanSerifK_EL-M.zip>
<https://raw.githubusercontent.com/zzrichard/source-han-serif/release/OTF/SourceHanSerifK_SB-H.zip>
<https://raw.githubusercontent.com/zzrichard/source-han-serif/release/OTF/SourceHanSerifSC_EL-M.zip>
<https://raw.githubusercontent.com/zzrichard/source-han-serif/release/OTF/SourceHanSerifSC_SB-H.zip>
<https://raw.githubusercontent.com/zzrichard/source-han-serif/release/OTF/SourceHanSerifTC_EL-M.zip>
<https://raw.githubusercontent.com/zzrichard/source-han-serif/release/OTF/SourceHanSerifTC_SB-H.zip>

思源宋体: source-han-serif
<https://raw.githubusercontent.com/zzrichard/source-han-sans/release/OTF/SourceHanSansTC.zip>
<https://raw.githubusercontent.com/zzrichard/source-han-sans/release/OTF/SourceHanSansSC.zip>
<https://raw.githubusercontent.com/zzrichard/source-han-sans/release/OTF/SourceHanSansK.zip>
<https://raw.githubusercontent.com/zzrichard/source-han-sans/release/OTF/SourceHanSansJ.zip>



For system wide installation, copy the fonts to /usr/share/fonts and run sudo fc-cache to rebuild the font cache, 

or for user local installation, make sure ~/.fonts exists, copy them into there, then rebuild the font cache.

ref

<https://github.com/Pal3love/Source-Han-TrueType>
```
unzip SourceHanSansSC.zip
unzip SourceHanSerifSC_EL-M.zip
unzip SourceHanSerifSC_SB-H.zip

sudo mv SourceHanSansSC SourceHanSerifSC_EL-M SourceHanSerifSC_SB-H /usr/share/fonts/opentype/
unzip source-serif-pro -d source-serif-pro
sudo mv source-serif-pro /usr/share/fonts/opentype/
unzip source-sans-pro -d source-sans-pro
sudo mv source-sans-pro /usr/share/fonts/opentype/
unzip source-code-pro -d source-code-pro
sudo mv source-code-pro /usr/share/fonts/opentype/
sudo fc-cache -f -v
sudo mktexlsr
fc-cache -f -v
```

复制这几个字体到~/.fonts
```
ls ~/.fonts
simfang.ttf
simhei.ttf
simkai.ttf
simli.ttf
simsunb.ttf
simsun.ttc
simyou.ttf
msyhbd.ttc
```
查看系统中文字体
```
fc-list :lang=zh-cn
fc-list | grep sim
```

查看系统字体缓存
```
fc-cache -fv
sudo fc-cache -fv
sudo mktexlsr

cd ~/.fonts
mkfontdir
mkfontscale
fc-cache
fc-cache -fv
```
到字体目录后，建立字体索引信息，更新字体缓存
```
mkfontscale && mkfontdir && fc-cache -fv

--目前没有复制到系统字体的truetype下并在目录下执行
--/usr/share/fonts/truetype
--mkfontdir
--mkfontscale
--fc-cache
```
测试
```
$ tex --version
```
//安装CJK宏包
```
git clone https://github.com/CTeX-org/ctex-kit.git
cd ctex-kit/CJKpunct/tex/latex/CJK
sudo cp -r ./CJKpunct /usr/share/texmf/tex/latex/CJK/
sudo texhash #安装CJKpunct宏包
```

中文字体测试
```
sudo gedit /usr/share/texlive/texmf-dist/tex/latex/ctex/config/ctexopts.cfg
enable
\keys_set:nn { ctex / option } { fontset = windowsnew }
and then
sudo texhash
sudo mktexlsr
```
test.tex
```
\documentclass{ctexart}  
\begin{document}  
	你好， Latex！\\
	Welcome to the world of Tex!\\  
	{\heiti 这是黑体}\\  
	{\songti 这是宋体}\\  
	{\fangsong 这是仿宋}\\  
	{\kaishu 这是楷书}\\  
	{\lishu 这是隶书}\\  
	{\youyuan 这是幼圆}\\  
\end{document}
```
一般隶书、幼圆不支持如果没有修改ctexopts.cfg


* * *
# librecad
```
$ sudo apt-get install librecad
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libmuparser2v5 librecad-data
The following NEW packages will be installed:
  libmuparser2v5 librecad librecad-data
0 upgraded, 3 newly installed, 0 to remove and 1 not upgraded.
```

* * *
# geda

geda不如qucs新，凑合吧
```
sudo apt-get install geda pcb gerbv geda-utils geda-examples geda-gschem geda-xgsch2pcb
sudo apt-get install geda-utils geda-xgsch2pcb pcb geda-gschem gerbv geda geda-examples geda-gattrib geda-gnetlist geda-gsymcheck pcb-common pcb-gtk geda-doc geda-symbols libgeda42 libgeda-common
$ gschem
$ pcb
$ gsymcheck
$ gerbv
$ iverilog
$ gtkwave
```

* * *
# 将word文档转化为纯文本，效果并不好
```
$ sudo apt-get install pandoc
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  pandoc-data
Suggested packages:
  pandoc-citeproc wkhtmltopdf
The following NEW packages will be installed:
  pandoc pandoc-data
0 upgraded, 2 newly installed, 0 to remove and 1 not upgraded.
```

* * *
# webmin
```
$ sudo apt-get install libauthen-pam-perl
$ sudo dpkg -i webmin_2.001_all.deb
$ sudo /usr/share/webmin/changepass.pl /etc/webmin root [密码]
Password for Webmin user root updated successfully
```
说明：
root是webmin的用户名，不是OS的
xxx为密码
/etc/webmin是webmin的配置目录
```
https://localhost:10000
```

* * *
# ubuntu 启动u盘简单制作

dd 添加进度监测
```
sudo dd if=ubuntu-20.04.5-desktop-amd64.iso | pv | sudo dd of=/dev/sdc bs=4M
```
or
```
sudo dd if=ubuntu-20.04.5-desktop-amd64.iso of=/dev/sdc bs=4M

sudo watch -n 5 pkill -USR1 ^dd$
or
sudo watch -n 5 pkill -USR1 -x dd
```

or 图形化
```
(sudo pv -n /dev/sdX | dd of=/dev/sdY bs=4M conv=notrunc,noerror) 2>&1 | dialog --gauge "dd process bar" 10 70 0
```
or

如果你使用的是GNU版本的dd，并且coreutils版本高于8.24，那么可以使用status选项。例如：
```
sudo dd if=/dev/sdX of=/dev/sdY status=progress
```
or

用Etcher

or

用usb-creator-gtk
```
/usr/bin/python3 /usr/bin/usb-creator-gtk
```
ref
```
xzcat ubuntu-18.04.5-preinstalled-server-arm64+raspi4.img.xz | sudo dd bs=4M of=/dev/sdc
```

* * *
# grub 修复
尝试进入已有系统
```
> insmod part_gpt
> insmod ext2
> search --no-floppy --fs-uuid --set=root eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63
> linux	/boot/vmlinuz-5.4.0-107-generic root=UUID=eb6dc6eb-5f94-4835-a1d3-1a1cf9b68f63 ro net.ifnames=0 biosdevname=0 > quiet splash $vt_handoff
> initrd	/boot/initrd.img-5.4.0-107-generic
```
能进入系统就可以对默认位置修复
```
//sudo update-grub
//sudo update-grub2
sudo grub-install /dev/nvme0
```

修复u盘的
```
lsblk | grep "disk"
sudo e2fsck -f /dev/sdc2
sudo tune2fs -U d95060c0-a012-4df5-8208-b0eb6c5678c7 /dev/sdc2
[and then mount]
cd /media/andreas/d95060c0-a012-4df5-8208-b0eb6c5678c7
su
mount -o bind /dev dev
chroot .
mount -t proc proc /proc
mount -t sysfs sysfs /sys
mount -t devpts devpts /dev/pts
mkdir -p /run/lock
mount -t tmpfs tmpfs /run/lock
mount /dev/sdx2 /home
mount /dev/sdx3 /opt
apt install grub-efi
update-initramfs -u
mount -t vfat /dev/sdx1 /boot/efi/
grub-mkconfig -o /boot/grub/grub.cfg
grub-install --target=x86_64-efi /dev/sdx --efi-directory=/boot/efi/ --boot-directory=/boot --removable
```
## grub menu timeout

修改/boot/grub/grub.cfg的
`set timeout_style = menu`
然后set timeout=5


## 硬盘速度监测
```
sudo iostat -d 1
sudo iostat -dx /dev/sdc 5
```
## sync进度检测
```
watch -d grep -e Dirty: -e Writeback: /proc/meminfo
```

## dpkg强制卸载 
```
dpkg -r --force-all xxx
```

grub-efi才支持UEFI-mode, grub-pc只支持legacy-mode

To check the kernel tainted state in kernel logs:

`journalctl -k | grep taint`

To check the kernel tainted state at runtime:

`cat /proc/sys/kernel/tainted `     // if 0 then kernel is not tainted, else it is.

for u2004

`/usr/libexec/gnome-initial-setup --existing-user`

for u1804

`/usr/lib/gnome-initial-setup/gnome-initial-setup --existing-user`


```
sudo dmesg -l crit,err
```

* * *
# tar 打包解压通过 progress 显示进度
```
$ sudo apt install progress

$ tar czf test.tar.gz /home/snail/ | progress  -m  $!
```

* * *
#  nmon
```
sudo apt install nmon
NMON=ld nmon -s1
```

* * *
# exfat
`$ sudo apt-get install exfat-utils`
```
[sudo] password for andreas: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  exfat-fuse
The following NEW packages will be installed:
  exfat-fuse exfat-utils
```

* * *
# 安装一些python的wheel
常用 PyPI 镜像 更新为 <https://pypi.tuna.tsinghua.edu.cn/simple>
比较接近官方镜像 <https://pypi.python.org/simple>

常用操作
```
sudo -H pip3 install --upgrade \
                        pip \
                        sip \
                        setuptools \
                        pipenv

sudo -H python3 -m pip install --upgrade pip \
                                        sip \
                                        setuptools \
                                        pipenv

sudo -H pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade --force-reinstall \
                        pip \
                        sip \
                        setuptools \
                        pipenv

sudo -H python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip \
                                        sip \
                                        setuptools \
                                        pipenv


sudo -H pip2 install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade \
                        pip \
                        setuptools \
                        pipenv

$ cd [somewhere]
$ jupyter notebook
$ jupyter notebook --port [nnnn]
```
安装升级等常用命令

```
仅换源安装
sudo -H pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple xxx yyy zzz --trusted-host mirrors.163.com

sudo -H pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple xxx yyy zzz

模块升级
sudo -H pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade xxx yyy zzz

强制重装
sudo -H pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple xxx yyy zzz --force-reinstall

sudo -H pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simplee --upgrade xxx yyy zzz --force-reinstall

sudo -H pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade --force-reinstall xxx

原生系统模块冲突可以 --force 或 --ignore-installed
sudo -H pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade xxx yyy zzz --ignore-installed

sudo -H pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade --ignore-installed markdown

指定版本
sudo -H pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple 'xxxx<2.0.0,>=1.0.15' --force-reinstall

sudo -H pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple 'xxxx==1.0.15' --force-reinstall
```
常用模块

`numpy scipy imageio matplotlib spacy stumpy pillow parsel pyecharts ipython jupyter PyQt5 pyqt5-stubs pyqt5-tools pyqt5-plugins opencv-contrib-python opencv-python pandas tensorflow torch mxnet gluoncv tvm`


修复gluoncv等
```
sudo apt install git build-essential libopenblas-dev python3-pip python3-scipy python3-pil python3-matplotlib

sudo -H pip3 uninstall mxnet gluoncv
sudo -H pip3 install mxnet gluoncv -i https://pypi.tuna.tsinghua.edu.cn/simple

也可以
sudo -H pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple mxnet gluoncv --force-reinstall

matplotlib必须降级，否则mxnet+gluoncv运行失败
sudo -H pip3 install -i https://mirrors.163.com/pypi/simple "matplotlib==2.2.4"

据说 opencv-python 更新到最新也可能有问题。

```

修复jupyter: ImportError_ cannot import name ‘create_prompt_application‘

just reinstall the ipython, that will solve the 'prompt-toolkit' problem automatically.
```
//sudo -H pip3 install 'prompt-toolkit<2.0.0,>=1.0.15' --force-reinstall
sudo -H pip3 install --upgrade ipython
```

换源指定单次安装源
```
pip install <包名> -i http://pypi.v2ex.com/simple
```

指定全局安装源
```
$ pip3 config list -v
For variant 'global', will try loading '/etc/xdg/xdg-openbox/pip/pip.conf'
For variant 'global', will try loading '/etc/xdg/pip/pip.conf'
For variant 'global', will try loading '/etc/pip.conf'
For variant 'user', will try loading '/home/andreas/.pip/pip.conf'
For variant 'user', will try loading '/home/andreas/.config/pip/pip.conf'
For variant 'site', will try loading '/usr/pip.conf'
```

在unix和macos，配置文件为：$HOME/.pip/pip.conf

在windows上，配置文件为：%HOME%\pip\pip.ini

```
[global]
timeout = 6000
index-url = http://pypi.douban.com/simple/
[install]
use-mirrors = true
mirrors = https://pypi.douban.com/simple/
trusted-host = pypi.douban.com
```
或者
```
[global]
index-url=https://mirrors.aliyun.com/pypi/simple/
[install]
trusted-host=mirrors.aliyun.com
```

再查看是否生效
```
$ pip3 config list -v
```

运行环境 debug
```
LD_DEBUG=files python -c "import cv2 ; img = cv2.imread('myimage.png',0) ; cv2.imshow('image',img) ; cv2.waitKey(0)"
```

或者有关qt，xcb 错误，下面这样可以列出更详细的信息
```
export QT_DEBUG_PLUGINS=1
```


当前的 modules
```
absl-py                       0.15.0
altgraph                      0.17
appdirs                       1.4.4
apturl                        0.5.2
argon2-cffi                   20.1.0
arrow                         1.2.3
asgiref                       3.4.1
asn1crypto                    0.24.0
astroid                       1.6.0
astunparse                    1.6.3
async-generator               1.10
asyncio                       3.4.3
attrs                         21.4.0
autocfg                       0.0.8
Automat                       20.2.0
backcall                      0.2.0
beautifulsoup4                4.6.0
bencoder                      0.2.0
bencoder.pyx                  2.0.1
bleach                        3.3.1
blessings                     1.7
blinker                       1.4
blis                          0.7.9
Brlapi                        0.6.6
Brotli                        1.0.9
bs4                           0.0.1
cached-property               1.5.2
cachetools                    4.2.4
catalogue                     2.0.8
certifi                       2022.9.24
cffi                          1.15.1
chardet                       5.0.0
charset-normalizer            2.0.12
cilimao-cli                   1.0
clang                         5.0
click                         7.1.2
cloudpickle                   2.2.0
colorama                      0.3.7
command-not-found             0.3
confection                    0.0.3
configparser                  5.0.2
configure                     0.5
constantly                    15.1.0
contextvars                   2.4
crayons                       0.4.0
cryptography                  38.0.1
cssselect                     1.1.0
cupshelpers                   1.0
cycler                        0.11.0
cymem                         2.0.7
d2l                           1.0.0a1.post0
dataclasses                   0.8
decorator                     5.1.1
defer                         1.0.6
defusedxml                    0.7.1
devscripts                    2.20.2-18.04.sav0
distlib                       0.3.6
distro                        1.8.0
distro-info                   1.0+18.04sav1
dm-tree                       0.1.7
docopt                        0.6.2
docutils                      0.14
entrypoints                   0.3
enum34                        1.1.10
feedparser                    5.2.1
feeluown                      3.8.3
filelock                      3.4.1
fire                          0.4.0
Flask                         0.12.2
flatbuffers                   1.12
future                        0.18.2
fuzzywuzzy                    0.18.0
galternatives                 0.92.2
gast                          0.4.0
gitdb2                        2.0.3
GitPython                     2.1.8
gluoncv                       0.10.5.post0
gobject                       0.1.0
google-auth                   1.35.0
google-auth-oauthlib          0.4.6
google-pasta                  0.2.0
gpg                           1.10.0
gpustat                       0.6.0
graphviz                      0.8.4
greenlet                      0.4.12
grpcio                        1.48.2
gst                           0.1.0
gym                           0.21.0
h11                           0.12.0
h5py                          3.1.0
html5lib                      0.999999999
httplib2                      0.20.4
hyperlink                     21.0.0
idna                          3.4
imageio                       2.15.0
imageio-ffmpeg                0.4.4
immutables                    0.19
importlib-metadata            4.8.3
importlib-resources           5.4.0
incremental                   21.3.0
inform                        1.27.0
ipykernel                     5.5.6
ipython                       7.16.3
ipython-genutils              0.2.0
ipywidgets                    7.6.3
iso8601                       0.1.16
isort                         4.3.4
itemadapter                   0.7.0
itemloaders                   1.0.6
itsdangerous                  0.24
janus                         0.6.1
jedi                          0.17.2
jeepney                       0.7.1
Jinja2                        3.0.3
jmespath                      0.10.0
jsonschema                    3.2.0
jupyter                       1.0.0
jupyter-client                7.0.6
jupyter-console               6.4.0
jupyter-core                  4.7.1
jupyterlab-pygments           0.1.2
jupyterlab-widgets            1.0.0
kazam                         1.4.5
keras                         2.6.0
Keras-Preprocessing           1.1.2
keyring                       23.4.1
keyrings.alt                  3.0
kiwisolver                    1.3.1
langcodes                     3.3.0
language-selector             0.1
launchpadlib                  1.10.17
lazr.restfulclient            0.14.5
lazr.uri                      1.0.6
lazy-object-proxy             1.3.1
libscrc                       1.7.1
llvmlite                      0.36.0
logilab-common                1.4.1
louis                         3.5.0
lxml                          4.2.1
macaroonbakery                1.1.3
Mako                          1.0.7
Markdown                      3.3.7         // 改回2.6.9，否则retext不能预览
Markups                       2.0.1
MarkupSafe                    2.0.1
marshmallow                   3.13.0
mate-tweak                    18.4.16
matplotlib                    2.2.4
matplotlib-inline             0.1.6
mccabe                        0.6.1
mdict-utils                   1.0.11
meld                          3.18.0
meson                         0.61.2
mistune                       0.8.4
MouseInfo                     0.1.3
msgpack                       0.5.6
murmurhash                    1.0.9
mutagen                       1.45.1
mxnet                         1.9.1
nbclient                      0.5.3
nbconvert                     6.0.7
nbformat                      5.1.3
neovim                        0.2.0
nest-asyncio                  1.5.1
netaddr                       0.8.0
netifaces                     0.10.4
notebook                      6.4.6
notedown                      1.5.1
numba                         0.53.1
numpy                         1.19.5
nvidia-ml-py3                 7.352.0
oauth                         1.0.1
oauthlib                      3.2.2
olefile                       0.45.1
onboard                       1.4.1
opencv-contrib-python         4.5.4.58
opencv-python                 4.5.4.58
opt-einsum                    3.3.0
packaging                     21.3
pandas                        1.1.5
pandoc-attributes             0.1.7
pandocfilters                 1.4.3
parse                         1.19.0
parsel                        1.6.0
parso                         0.7.1
pathy                         0.6.2
pbr                           5.7.0
pexpect                       4.8.0
pickleshare                   0.7.5
Pillow                        8.4.0
pip                           21.3.1
pipenv                        2022.4.8
platformdirs                  2.4.0
portalocker                   2.6.0
preshed                       3.0.8
prettytable                   2.1.0
progressbar                   2.5
prometheus-client             0.11.0
prompt-toolkit                3.0.31
Protego                       0.2.1
protobuf                      3.19.6
psutil                        5.8.0
ptyprocess                    0.7.0
pulsemixer                    1.4.0
py3dns                        3.1.1
pyasn1                        0.4.8
pyasn1-modules                0.2.8
PyAutoGUI                     0.9.52
pycairo                       1.16.2
PyChromecast                  0.8.1
pycparser                     2.21
pycrypto                      2.6.1
pycryptodome                  3.10.1
pycups                        1.9.73
pycurl                        7.43.0.1
pydantic                      1.9.2
PyDispatcher                  2.0.6
pyecharts                     1.9.0
pyenchant                     2.0.0
PyGetWindow                   0.0.9
pyglossary                    4.2.0
Pygments                      2.13.0
PyGObject                     3.26.1
pyinotify                     0.9.6
pyinstaller                   4.3
pyinstaller-hooks-contrib     2021.1
PyJWT                         1.5.3
pylint                        1.8.3
pymacaroons                   0.13.0
PyMsgBox                      1.0.9
PyNaCl                        1.1.2
PyOpenGL                      3.1.5
pyOpenSSL                     22.1.0
pyparsing                     3.0.9
pyperclip                     1.8.2
PyQt5                         5.15.2
pyqt5-plugins                 5.15.2.2.2
PyQt5-Qt5                     5.15.2
PyQt5-sip                     12.8.1
PyQt5-stubs                   5.15.2.0
pyqt5-tools                   5.15.2.3.2
pyquery                       1.4.3
PyRect                        0.1.4
pyRFC3339                     1.0
pyrsistent                    0.17.3
PyScreeze                     0.1.28
pyserial                      3.5
PySimpleSOAP                  1.16.2
python-apt                    1.6.5+ubuntu0.7
python-dateutil               2.8.2
python-debian                 0.1.32
python-debianbts              2.7.2
python-dotenv                 0.20.0
python-magic                  0.4.16
python-xlib                   0.20
python3-xlib                  0.15
PyTweening                    1.0.3
pytz                          2022.5
PyVISA                        1.11.3
PyVISA-py                     0.5.2
pywebcopy                     6.3.0
pyxattr                       0.6.0
pyxdg                         0.25
PyYAML                        6.0
pyzmq                         22.1.0
qasync                        0.22.0
qt5-applications              5.15.2.2.2
qt5-tools                     5.15.2.1.2
qtconsole                     5.2.2
QtPy                          1.11.2
quantiphy                     2.18.0
queuelib                      1.6.2
redis                         3.5.3
reportbug                     7.1.8ubuntu1
reportlab                     3.4.0
requests                      2.27.1
requests-file                 1.5.1
requests-oauthlib             1.3.1
requests-unixsocket           0.1.5
roman                         2.0.0
rsa                           4.9
scipy                         1.5.4
scour                         0.38.2
Scrapy                        2.6.3
screen-resolution-extra       0.0.0
SecretStorage                 3.3.3
selenium                      3.141.0
Send2Trash                    1.8.0
serial                        0.0.97
service-identity              21.1.0
setproctitle                  1.1.10
setuptools                    59.6.0
simplegeneric                 0.8.1
simplejson                    3.17.2
sip                           6.5.1
six                           1.16.0
smart-open                    5.2.1
smmap2                        2.0.3
snapshot-phantomjs            0.0.3
some-package                  0.1
spacy                         3.4.2
spacy-legacy                  3.0.10
spacy-loggers                 1.0.3
srsly                         2.4.5
ssh-import-id                 5.7
stumpy                        1.10.2
system-service                0.3
systemd-python                234
tensorboard                   2.6.0
tensorboard-data-server       0.6.1
tensorboard-plugin-wit        1.8.1
tensorflow                    2.6.2
tensorflow-estimator          2.6.0
tensorflow-probability        0.18.0
termcolor                     1.1.0
terminado                     0.12.1
testpath                      0.4.4
testresources                 2.0.1
textile                       3.0.0
thinc                         8.1.5
tkVideo                       0.1
tldextract                    3.1.2
toml                          0.10.2
tomlkit                       0.7.0
torch                         1.10.1
torchvision                   0.11.2
tornado                       6.1
torrent-cli                   0.0.9
tqdm                          4.64.1
traitlets                     4.3.3
tvm                           1.0.0
Twisted                       22.4.0
typer                         0.4.2
typing_extensions             4.1.1
ubuntu-advantage-tools        27.11.2
ubuntu-dev-tools              0.175-18.04.2
ubuntu-drivers-common         0.0.0
ufw                           0.36
unattended-upgrades           0.1
unidiff                       0.5.4
unity-scope-calculator        0.1
unity-scope-chromiumbookmarks 0.1
unity-scope-colourlovers      0.1
unity-scope-devhelp           0.1
unity-scope-firefoxbookmarks  0.1
unity-scope-manpages          0.1
unity-scope-openclipart       0.1
unity-scope-texdoc            0.1
unity-scope-tomboy            0.1
unity-scope-virtualbox        0.1
unity-scope-yelp              0.1
unity-scope-zotero            0.1
unity-tweak-tool              0.0.7
urllib3                       1.26.12
usb-creator                   0.3.3
uvicorn                       0.14.0
virtualenv                    20.16.6
virtualenv-clone              0.5.7
w3lib                         1.22.0
wadllib                       1.3.6
wasabi                        0.10.1
wcwidth                       0.2.5
webdriver-manager             3.5.1
webencodings                  0.5
Werkzeug                      2.0.3
wheel                         0.37.1
widgetsnbextension            3.5.1
wordcloud                     1.8.1
wrapt                         1.12.1
wxPython                      4.0.1
xdot                          0.9
xkit                          0.0.0
yacs                          0.1.8
you-get                       0.4.1545
youtube_dl                    2018.3.14
zeroconf                      0.19.1
zipp                          3.6.0
zope.interface                5.5.0
```



* * *
# 7zip 加密压缩
```
7z a -r -pABC12345 -mhe=on  ../test.7z *
7z a -r -p'ABC12345' -mhe=on  ../test.7z *
```
```
a=添加files到archive
-r递归子文件夹
-pABC12345 密码设置为ABC12345，最好设置20个字符以上
-mhe=on  让文件名也加密，因为听说zip别人可以通过一个明文文件破解，所以不能让别人看到文件名去找明文文件
../test.7z，将压缩后文件放到这个压缩文件夹上一级目录，防止 压缩时冲突
```
```
7z a -sdel -t7z -mx9 -aoa $folders.7z $folders
```

* * *
# 制作ISO镜像 和 刻录CD和DVD镜像

制作ISO
```
$ mkisofs -V LabelName -J -jcharset=utf8 -r -o /TargetImage.iso /home/my-data-dir
```
CD和DVD镜像的刻录

查看设备
```
$ cdrecord -scanbus
```
一般是1,0,0

刻录CD/DVD镜像
```
# cdrecord -v -dev=1,0,0 /TargetImage.iso
```

* * *
# 安装 anaconda

see <https://docs.anaconda.com/anaconda/install/linux/>
```
$ sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 fish
$ bash Anaconda3-2022.10-Linux-x86_64.sh

yes|yes
如果没有init
可以这样
$ source ~/anaconda3/bin/activate
$ conda init

modified      /home/andreas/anaconda3/condabin/conda
modified      /home/andreas/anaconda3/bin/conda
modified      /home/andreas/anaconda3/bin/conda-env
no change     /home/andreas/anaconda3/bin/activate
no change     /home/andreas/anaconda3/bin/deactivate
no change     /home/andreas/anaconda3/etc/profile.d/conda.sh
no change     /home/andreas/anaconda3/etc/fish/conf.d/conda.fish
no change     /home/andreas/anaconda3/shell/condabin/Conda.psm1
no change     /home/andreas/anaconda3/shell/condabin/conda-hook.ps1
no change     /home/andreas/anaconda3/lib/python3.9/site-packages/xontrib/conda.xsh
no change     /home/andreas/anaconda3/etc/profile.d/conda.csh
modified      /home/andreas/.bashrc

```
实际上在.bashrc添加了
```
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/andreas/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/andreas/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/andreas/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/andreas/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
```
在~/anaconda3/condabin/conda里面是第一行
```
#!/home/andreas/anaconda3/bin/python
```

其他影响：
conda base环境引起了gitk的字体变化，还是sans但是无法显示全部中文，字体怪异。推出base环境就恢复正常。
最好的办法，正常不启用base环境，就是~/.bashrc下面这个添加的部分注释掉，需要的时候
`$ source ~/anaconda3/bin/activate`
或者
`$ source ~/anaconda3/bin/activate <env_name>`
<env_name>就是在~/anaconda3/envs内的目录名

如果conda在环境变量里,也可以
`conda activate`
或者
`conda activate <env_name>`
退出环境
`conda dectivate`


生效环境变量
```
re-open terminal 或者source ~/.bashrc
$ conda --version
$ conda list
$ conda --help
$ conda -h
$ which conda
$ conda info
```
To use conda with fish shel
```
$ conda init fish
```
~/.config/fish/config.fish
```
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/anaconda/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
```


using the GUI (.pkg) installer
```
$ anaconda-navigator
```

update pkg or all pkg
```
$ conda update conda anaconda-navigator
$ conda update --update-all
or
$ conda update --all
or
$ conda upgrade --all

```

`gedit ~/.condarc`

uninstall
```
rm -rf ~/.condarc ~/.conda ~/.continuum ~/anaconda3
修改~/.bashrc
```

查看之前安装的镜像
```
$ conda config --show channels
默认是
channels:
  - defaults
```

删除所有的镜像源，恢复到默认
```
$ conda config --remove-key channels 
```
删除指定的镜像源
```
$ conda config --remove channels [urls]
```
配置国内镜像源[网速可以的话不设置也行]
```
$ conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
$ conda config --set show_channel_urls yes
$ conda config --show channels
channels:
- https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
- defaults
```
可以修改~/.condarc
```
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch-lts: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
```
然后运⾏ conda clean -i 清除索引缓存，保证⽤的是镜像站提供的索引。
//然后运⾏ `conda create -n myenv numpy`


创建运行环境
```
$ conda create -y -n some_pip_test python=3.7 imagesize=1.0
$ conda create --name snakes python=3.9
```
active运行环境
```
$ conda activate some_pip_test
$ conda activate snakes // conda 4.6之前的版本是 $ source activate snakes
```
确认当前env环境
```
$ conda info --envs
$ conda-env list
```
deactive当前运行环境
```
$ conda deactivate  // conda 4.6之前的版本是 $ source deactivate
```
active运行环境后用升级模块 先`conda activate <some_pip_env>`哦
```
$ pip install -U imagesize
```
确认当前环境python版本
```
$ python --version
```
查询当前环境已经安装的包
```
$ conda list
```

查看conda环境中tensorrt的版本和来源
```
pip list | grep tensorrt
tensorrt                 8.6.1.post1
tensorrt-bindings        8.6.1
tensorrt-libs            8.6.1

conda list | grep tensorrt
tensorrt                  8.6.1.post1              pypi_0    pypi
tensorrt-bindings         8.6.1                    pypi_0    pypi
tensorrt-libs             8.6.1                    pypi_0    pypi
```

删除自定义env（谨慎操作）
```
$ conda remove -n some_pip_test --all
```


重命名环境
conda 其实没有重命名指令，实现重命名是通过 clone 完成的，分两步：

①先 clone 一份 new name 的环境

②删除 old name 的环境

如，将nlp重命名成tf2

克隆出新环境
```
conda create -n tf2 --clone nlp
```
到原环境生成pip和conda列表
```
pip freeze > requirements.txts
conda list -e > requirements.txt                
```
删除原环境
```
conda remove -n nlp --all
```
进入目标环境还原conda和pip列表
```
conda install --yes --file requirements.txt
pip install -r requirements.txt
```

精确查找
```
$ conda search --full-name <package_full_name>
```
模糊查找
```
$ conda search <text>
```
在指定环境中安装包
```
$ conda install --name <env_name> <package_name>
$ conda install --name python3 pandas
```
在当前环境中安装包
```
$ conda install <package_name>
```
使用pip安装包

是否需要启用？
```
$ conda config --set pip_interop_enabled True
```
```
$ pip install <package_name>
```
```
1. pip只是包管理器，无法对环境进行管理。因此如果想在指定环境中使用pip进行安装包，则需
要先切换到指定环境中，再使用pip命令安装包。
2. pip无法更新python，因为pip并不将python视为包。
3. pip可以安装一些conda无法安装的包；conda也可以安装一些pip无法安装的包。因此当使用
一种命令无法安装包时，可以尝试用另一种命令。
```
当使用 conda install 无法进行安装时，可以考虑从Anaconda.org中获取安装包的命令，并进行安装

<https://anaconda.org>

卸载指定环境中的包
```
$ conda remove --name <env_name> <package_name>
$ conda remove --name python3 pandas
```
卸载当前环境中的包
```
$ conda remove <package_name>
```

更新所有包(在安装Anaconda之后执行上述命令更新Anaconda中的所有包至最新版本，便于使用)
```
$ conda update --all
或
$ conda upgrade --all
```

更新指定包
```
$ conda update <package_name>
或
$ conda upgrade <package_name>
```
更新多个指定包，则包名以空格隔开，向后排列。如： `conda update pandas numpy matplotlib` 即更新pandas、numpy、matplotlib包


## conda的虚拟环境添加到jupyter notebook
以新建的虚拟环境为例
```
conda create -n myenv python=3.8
conda activate myenv
conda install numpy
conda install ipykernel
python -m ipykernel install --user --name=myenv # 这里名字可以和conda环境名不同
jupyter notebook    # 一般 new 下面就可以新建一个用conda环境的 kernel 的 jupyter 文件了
```
卸载
```
删除 ~/.local/share/jupyter/kernels/ 下面的对应文件夹就可以
```


## ActivePython配置管理
<https://platform.activestate.com/yxgi5>

* * *
# pip down
比如 <https://pypi.org/project/mxnet-cu102>，在 download files 就可以获得直接下载链接和hash

`/home/andreas/.cache/pip` 内有缓存文件，但是文件名是校验码，路径是文件名前5个字符,类似位置win在`C:\Users\Administrator\AppData\Local\pip\cache\`

离线下载，比如 packages 是目标目录
```
python -m pip download --only-binary :all: --dest . --no-cache <package_name>

pip download -d “Downloads” pymysql

pip download -d packages -r requirements.txt

pip download open3d=0.12 -i https://pypi.tuna.tsinghua.edu.cn/simple/ -d ./open3d_dabao

pip download \
--only-binary=:all: \ # 对于包以及包的依赖包，都使⽤⼆进制
--platform linux_x86_64 \ # 指定系统环境
-d \home\packs # 下载的⽂件的存储⽬录
-r requirement.txt # 指定要下载的包
实际使⽤中，会发现⼀些包找不到，⽐如tornado，会报错
pip download \
--no-binary=:all: \ # 使⽤⾮⼆进制包安装
tornado==6.0 \
-d pkg/
```

将下载的包的名字输出到requirements.txt中
```
ls open3d_dabao >requirements.txt
```
离线安装，比如本地目录packages内有需要的wheels
```
pip install --no-index --find-links=packages -r requirements.txt
pip install packages/PyMySQL-0.9.3-py2.py3-none-any.whl
pip install --no-index --find-links=open3d_dabao -r requirements.txt
sudo pip3 install -r /xxxx/xxxx/requirement.txt --no-index --find-links /xxxx/xxxxx/xxxxx/（存放下载好的包的⽬录）
```
在线安装多包
```
pip install -r requirements.txt
pip install pymysql xxxxx
```


* * *
# activestate

First-time Download & Installation:
`sh <(curl -q https://platform.activestate.com/dl/cli/_pdli01/install.sh) -c'state activate --default yxgi5/Python-3.9.14-Ubuntu-18.04'`

Get the Latest Changes:
`state pull`

Install a package:
`state install <xxx>`

Remove a package:
`state uninstall <xxx>`

Install multiple packages:
`state import path/to/file`

Search for a package:
`state search date`

Push your local changes:
`state push`

Pull in remote changes:
`state pull`

Activate by project name:
`state activate yxgi5/Python-3.9.14-Ubuntu-18.04`

Set virtual environment as global default:
`state activate --default`

`gedit ~/.bashrc`
```
# -- START ACTIVESTATE INSTALLATION
export PATH="/home/andreas/.local/ActiveState/StateTool/release/bin:$PATH"
# -- STOP ACTIVESTATE INSTALLATION
# -- START ACTIVESTATE DEFAULT RUNTIME ENVIRONMENT
export PATH="/home/andreas/.cache/activestate/bin:$PATH"
# -- STOP ACTIVESTATE DEFAULT RUNTIME ENVIRONMENT
```

Run a script defined in your activestate.yaml file:
`state run hello "world!"`

Authenticate:
`state auth`

Get help about the State Tool:
`state --help`

Get help about a specific command:
`state activate --help`

Update the State Tool:
`state update`

删除的时候
`state clean uninstall --force`
删除
```
~/.local/ActiveState/
~/.config/activestate/
~/.cache/activestate/
```
修改
`~/.bashrc`





* * *
# 更新安装 smath

修改了0.98的deb包，smath-mod



* * *
# convert ps to pdf
```
sudo apt-get install ghostscript
ps2pdf myfile.ps myfile.pdf
```


* * *
# 安装 octave

`$ sudo apt install octave`
```
[sudo] password for andreas: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  epstool gnuplot-data gnuplot-qt libcxsparse3 libglpk40 liboctave4 libqrupdate1 libqscintilla2-qt5-13 libqscintilla2-qt5-l10n octave-common octave-doc
Suggested packages:
  gnuplot-doc libiodbc2-dev default-libmysqlclient-dev liboctave-dev
The following NEW packages will be installed:
  epstool gnuplot-data gnuplot-qt libcxsparse3 libglpk40 liboctave4 libqrupdate1 libqscintilla2-qt5-13 libqscintilla2-qt5-l10n octave octave-common octave-doc
0 upgraded, 12 newly installed, 0 to remove and 10 not upgraded.
Need to get 19.3 MB of archives.
After this operation, 78.8 MB of additional disk space will be used.
```

* * *
# 安装 freemat
`$ sudo apt install freemat`
```
[sudo] password for andreas: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  freemat-data freemat-help
The following NEW packages will be installed:
  freemat freemat-data freemat-help
0 upgraded, 3 newly installed, 0 to remove and 10 not upgraded.
Need to get 11.2 MB of archives.
After this operation, 88.7 MB of additional disk space will be used.
```

* * *
# alist for PikPak,Baiduyun,etc.

<https://alist.nn.ci/guide/>

Install for Linux-x86_64 platform
```
curl -fsSL "https://alist.nn.ci/v2.sh" | bash -s install
```
update​
```
curl -fsSL "https://nn.ci/alist.sh-v2" | bash -s update
```
Uninstall​
```
curl -fsSL "https://alist.nn.ci/v2.sh" | bash -s uninstall
```
The default installation is in `/opt/alist`

Daemon​
`vim /usr/lib/systemd/system/alist.service` add the following content, where path_alist is the path where alist is located
```
[Unit]
Description=alist
After=network.target
 
[Service]
Type=simple
WorkingDirectory=path_alist
ExecStart=path_alist/alist-xxxx -conf data/config.json
Restart=on-failure
 
[Install]
WantedBy=multi-user.target
Then systemctl daemon-reload, now you can use these commands to manage the program:
```
Then `systemctl daemon-reload`, now you can use these commands to manage the program:
- Start: `systemctl start alist`
- Shut down: `systemctl stop alist`
- Self-start: `systemctl enable alist`
- Status: `systemctl status alist`
- Restart: `systemctl restart alist`


<http://localhost:5244/@manage>

按<https://alist.nn.ci/guide/>设置好网盘

Mount Path是界面显示的目录，比如几个网盘就要区分 baiduyun_xxx,

Root folder path是网盘的内部路径，被加载到Mount Path

makedeb制作了一个deb包，已经有alist.service，postinstall脚本没有修改，需要手动加载
百度包
`curl -L -X GET 'YOUR_LINK' -H 'User-Agent: pan.baidu.com' `

```
curl -L -X GET 'http://localhost:5244/d/baiduyun_yxgi12/2022082106.tar' -H 'User-Agent: pan.baidu.com'
```

```
/opt/alist/alist admin  # 这里查的密码如果不能登录管理面板，如下
/opt/alist/data/data.db 里查看的admin密码才是对的
```

* * *
# snap常用操作
Snap是Canonical推出的一种新的软件打包格式，彻底解决linux依赖性的问题，Snap 软件包拥有更加稳定和安全的特性。snap也就是安装snap软件包的命令。

## 如何使用snap
如果您正在运行Ubuntu 16.04 LTS或更高版本，您可以在命令行中使用snap。

列出计算机上所有snap安装情况：
```
sudo snap list
```
在应用商店中查找snap：
```
sudo snap find <软件包名>
```
安装Snap软件：
```
sudo snap install <snap软件包名>
```
更新Snap软件：
```
sudo snap refresh <snap软件包名>
```
更新所有的snap软件包：
```
sudo snap refresh all
```
要将Snap还原到以前安装的版本：
```
sudo snap revert <snap软件包名>
```
卸载snap软件：
```
sudo snap remove <snap软件包名>
```
更加详细Snap命令介绍

Fedora上怎样使用Snap
```
sudo dnf install snapd
```

***
# time zoom

Run 'dpkg-reconfigure tzdata' if you wish to change it


* * *
# git config
```
$ git config --global core.editor "vim"
$ git config --global user.name "Andreas Zhang"
$ git config --global user.email denglitsch@gmail.com
$ git config --list
user.name=Andreas Zhang
user.email=denglitsch@gmail.com
core.editor=vim
$ cat ~/.gitconfig 
[user]
	name = Andreas Zhang
	email = denglitsch@gmail.com
[core]
	editor = vim
$ git config --list --show-origin
user.name=Andreas Zhang
user.email=denglitsch@gmail.com
core.editor=vim
```


***
# redis-server.service 启动修复
```
sudo journalctl -u redis-server.service --no-pager

12月 08 13:51:42 Vostro-5880 redis-server[17609]: *** FATAL CONFIG FILE ERROR ***
12月 08 13:51:42 Vostro-5880 redis-server[17609]: Reading the configuration file, at line 171
12月 08 13:51:42 Vostro-5880 redis-server[17609]: >>> 'logfile /var/log/redis/redis-server.log'
12月 08 13:51:42 Vostro-5880 redis-server[17609]: Can't open the log file: Permission denied
```
```
$ grep ReadWriteDirectories /etc/systemd/system/redis.service
ReadWriteDirectories=-/var/lib/redis
ReadWriteDirectories=-/var/log/redis
ReadWriteDirectories=-/var/run/redis
ReadWriteDirectories=-/etc/redis

$ mount | grep 'ro,'
$ cat /lib/systemd/system/redis-server.service
```
```
$ sudo sed -n '171p' /etc/redis/redis.conf
logfile /var/log/redis/redis-server.log
```
```
$ ls -l /var/log/ | grep redis
```
没有这个目录及文件，创建

```
$ sudo mkdir -p redis
$ sudo touch /var/log/redis/redis-server.log
$ sudo systemctl start redis-server.service
$ journalctl -xe
$ sudo journalctl -u redis-server.service --no-pager
12月 08 13:51:58 Vostro-5880 redis-server[17830]: *** FATAL CONFIG FILE ERROR ***
12月 08 13:51:58 Vostro-5880 redis-server[17830]: Reading the configuration file, at line 171
12月 08 13:51:58 Vostro-5880 redis-server[17830]: >>> 'logfile /var/log/redis/redis-server.log'
12月 08 13:51:58 Vostro-5880 redis-server[17830]: Can't open the log file: Permission denied
```
权限据查应该是
```
# ls -l /var/log/ | grep redis
drwxr-s---  2 redis         adm         4096 Sep 18 11:50 redis
```
那么按这个要求设置权限
```
$ sudo chown redis:adm -R /var/log/redis/
$ sudo chmod 2750 -R /var/log/redis/
$ ll /var/log/ | grep redis
drwsr-s---  2 redis       adm            4096 12月  8 13:51 redis/
$ sudo systemctl start redis-server.service 
```
就好了


***
# 删除 cheat / cheatsheet
<https://github.com/cheat/cheat>
```
$ sudo snap remove --purge cheat
```

***
# 删除 snap gradle
```
$ sudo snap remove --purge gradle
```

# 删除 snap
```
$ snap list
Name                  Version             Rev    Tracking         Publisher   Notes
bare                  1.0                 5      latest/stable    canonical✓  base
core                  16-2.57.6           14399  latest/stable    canonical✓  core
core18                20221103            2632   latest/stable    canonical✓  base
core20                20221123            1738   latest/stable    canonical✓  base
core22                20220902            310    latest/stable    canonical✓  base
gnome-3-34-1804       0+git.3556cb3       77     latest/stable/…  canonical✓  -
gnome-3-38-2004       0+git.6f39565       119    latest/stable    canonical✓  -
gnome-42-2204         0+git.c271a86       44     latest/stable    canonical✓  -
gnome-calculator      41.1-4-g5c9869a58c  920    latest/stable/…  canonical✓  -
gnome-characters      42.0                781    latest/stable/…  canonical✓  -
gnome-logs            42.0                115    latest/stable/…  canonical✓  -
gnome-system-monitor  42.0                181    latest/stable/…  canonical✓  -
gtk-common-themes     0.1-81-g442e511     1535   latest/stable/…  canonical✓  -
gtk2-common-themes    0.1                 13     latest/stable    canonical✓  -
snapd                 2.57.6              17883  latest/stable    canonical✓  snapd
```
删掉snap容器
```
sudo snap remove --purge gtk2-common-themes
sudo snap remove --purge gtk-common-themes
sudo snap remove --purge gnome-3-34-1804
sudo snap remove --purge gnome-3-38-2004
sudo snap remove --purge gnome-42-2204
sudo snap remove --purge gnome-calculator
sudo snap remove --purge gnome-characters
sudo snap remove --purge gnome-logs
sudo snap remove --purge gnome-system-monitor
sudo snap remove --purge bare
sudo snap remove --purge core18
sudo snap remove --purge core20
sudo snap remove --purge core22

sudo service snapd restart
df
sudo umount /snap/core/14399
sudo snap remove --purge core
sudo snap remove --purge snapd
```
删掉有关服务
```
sudo systemctl stop snapd.aa-prompt-listener.service
sudo systemctl stop snapd.apparmor.service
sudo systemctl stop snapd.autoimport.service
sudo systemctl stop snapd.core-fixup.service
sudo systemctl stop snapd.failure.service
sudo systemctl stop snapd.recovery-chooser-trigger.service
sudo systemctl stop snapd.seeded.service
sudo systemctl stop snapd.service
sudo systemctl stop snapd.snap-repair.service
sudo systemctl stop snapd.snap-repair.timer
sudo systemctl stop snapd.socket
sudo systemctl stop snapd.system-shutdown.service

sudo systemctl disable snapd.aa-prompt-listener.service
sudo systemctl disable snapd.apparmor.service
sudo systemctl disable snapd.autoimport.service
sudo systemctl disable snapd.core-fixup.service
sudo systemctl disable snapd.failure.service
sudo systemctl disable snapd.recovery-chooser-trigger.service
sudo systemctl disable snapd.seeded.service
sudo systemctl disable snapd.service
sudo systemctl disable snapd.snap-repair.service
sudo systemctl disable snapd.snap-repair.timer
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.system-shutdown.service

Removed /etc/systemd/system/multi-user.target.wants/snapd.aa-prompt-listener.service.
Removed /etc/systemd/system/multi-user.target.wants/snapd.apparmor.service.
Removed /etc/systemd/system/multi-user.target.wants/snapd.autoimport.service.
Removed /etc/systemd/system/multi-user.target.wants/snapd.core-fixup.service.
Removed /etc/systemd/system/multi-user.target.wants/snapd.recovery-chooser-trigger.service.
Removed /etc/systemd/system/cloud-final.service.wants/snapd.seeded.service.
Removed /etc/systemd/system/multi-user.target.wants/snapd.seeded.service.
Removed /etc/systemd/system/multi-user.target.wants/snapd.service.
Removed /etc/systemd/system/timers.target.wants/snapd.snap-repair.timer.
Removed /etc/systemd/system/sockets.target.wants/snapd.socket.
Removed /etc/systemd/system/final.target.wants/snapd.system-shutdown.service.

ll /etc/systemd/system/default.target.wants/
sudo rm /etc/systemd/system/default.target.wants/snap* -rf
```
删掉snapd
```
sudo apt purge snapd
sudo apt remove --purge --assume-yes snapd gnome-software-plugin-snap
rm -rf ~/snap/
sudo rm -rf /var/cache/snapd/ 
```
确保不再安装snap
`sudo gedit /etc/apt/preferences.d/nosnap.pref`
```
Package: snapd
Pin: release a=*
Pin-Priority: -10
```
补上几个删掉的玩意
```
sudo apt install gnome-calculator gnome-characters gnome-logs gnome-system-monitor
实际上只缺gnome-characters
sudo apt install gnome-themes-ubuntu
```

恢复安装snap
```
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update && sudo apt upgrade
sudo snap install snap-store
sudo apt install firefox
```


***
# apt降级软件包 apt保持特定版本
```
apt-cache showpkg <package-name>列出所有可用的版本
apt-get install <pkg>=<version>
sudo aptitude install <pkg>=<version>
apt-mark hold <package-name> 将软件包“保留”为当前版本，以防止自动升级
还可以在/etc/apt/preferences.d/写pref文件来通过Pin-Priority控制是否升级
```
```
sudo apt update
apt list --upgradable
sudo aptitude hold cuda cuda-drivers cuda-drivers-470 nvidia-compute-utils-470 nvidia-dkms-470 nvidia-driver-470 nvidia-kernel-common-470 nvidia-kernel-source-470 nvidia-modprobe nvidia-settings nvidia-utils-470 libcudnn8 libcudnn8-dev opera-stable
sudo apt upgrade

The following packages have been kept back:
  cuda cuda-drivers cuda-drivers-470 libcudnn8 libcudnn8-dev libnvidia-cfg1-470 libnvidia-compute-470 libnvidia-compute-470:i386 libnvidia-decode-470 libnvidia-decode-470:i386 libnvidia-encode-470
  libnvidia-encode-470:i386 libnvidia-extra-470 libnvidia-fbc1-470 libnvidia-fbc1-470:i386 libnvidia-gl-470 libnvidia-gl-470:i386 libnvidia-ifr1-470 libnvidia-ifr1-470:i386 nvidia-compute-utils-470
  nvidia-dkms-470 nvidia-driver-470 nvidia-kernel-common-470 nvidia-kernel-source-470 nvidia-modprobe nvidia-settings nvidia-utils-470 opera-stable xserver-xorg-video-nvidia-470
```


***
# apt 有关记录
模拟安装（了解安装时会发生什么）
```
apt-get -s install <package-name>
apt-get -s upgrade <package-name>
apt-get -s upgrade

aptitude -V -s install <package-name>
aptitude -V -s upgrade <package-name>
```

显示软件包的细节或者简要信息（即使它没有被安装）
```
apt search <package-name>
apt-cache showpkg <package-name>

apt show <package-name>             # 显示包的详细信息，包括依赖（可以是存在但没有安装的包）

dpkg -l                             # 查询已经安装的所有软件包
dpkg -l | grep -i 关键字             # 可以查找已安装的某个包

apt policy <package-name>           # 显示包的来源
apt-cache policy <package-name>     # 显示包的来源
apt-show-versions <package-name>    # 已经安装了给定的软件包
apt-show-versions -a <package-name> # 打印给定软件包的所有可用版本

apt list <package-name>             # 已经安装的包简要信息
apt list -a <package-name>          # 所有可用安装包简要信息
apt --installed list                # 列出所有已安装的包

aptitude versions <package-name>    # 所有可用安装包简要信息

apt download <package-name>         # 可以不安装只下载某个包的 deb（但不会下载它的依赖！）

apt-cache depends <package-name>    # 依赖什么
apt-cache rdepends <package-name>   # 被什么依赖
aptitude why <package-name>         # 被什么依赖

sudo apt upgrade 自动更新所有包，但并不删除已存在的包，
sudo apt dist-upgrade 或者等效的 sudo apt full-upgrade 更激进，会删除已有的包，可能会更新内核，可能造成一些破坏．

sudo apt clean 和 sudo apt autoclean 可以清除缓存（例如下载的 deb 安装包等，后者清的没那么干净）


sudo apt install <package-name>     # 为安装包时安装包/ 已安装包时升级包
sudo apt-get --reinstall install <package-name>     # 重新安装包

sudo apt-get remove <package-name>  # 不完全卸载包
sudo apt-get --purge remove <package-name>          # 完全卸载包

sudo apt-get upgrade                # 将所有软件包(包括内核)升级到最高版本(不包括标记为hold的包)

sudo apt-get -f install             # 安装中途退出后继续安装
sudo apt-get update                 # 修改仓库配置后重新构建缓存
sudo apt-get clean                  # 清理本地缓存 
sudo apt-get autoclean              # 清空重复的低版本的软件包
```

本地数据库文件
```
/var/lib/dpkg
/var/lib/apt
/var/cache/apt/archives 下载后的deb文件存放位置
```
客户端配置
```
/etc/apt/sources.list   文件
/etc/apt/sources.list.d 目录中的文件
```
客户端配置内容
```
deb http://us.archive.ubuntu.com/ubuntu/ xenial main restricted                  
deb-src http://us.archive.ubuntu.com/ubuntu/ xenial main restricted

每一行 格式如下  : {必选} [可选]
{deb/deb-src} {URL} {发行版代号及扩展} {分类1} [分类2] [分类3] [分类4]
每一个字段解释如下
{deb/deb-src} : deb 表示二进制可执行文件 deb-src 表示包的源代码
{URL} 		  : 仓库地址
{发行版代号及扩展}    :  
				发行版代号: 16.04为 xenial  12.04为focal
				另外还有 扩展 xenial-security xenial-updates xenial-proposed xenial-backports
{分类1} 		  : 和分类2 分类3 分类4 一样
				从 main restricted universe multiverse 中4选1
				main 包是免费的/开源的，并受 ubuntu 官方的支持
				restricted 包含各种设备的专用驱动程序
				universe 包是免费的/开源的，由社区支持
				multiverse 由于法律/版权问题，这些软件包受到限制
		
分类1...分类4 在 apt update 过程中是怎么被解析的?
apt 将 软件分类4类(main restricted universe multiverse)
如果一行中只有一类,那么意思是只包括该类的软件包
如果一行中只有4类,那么意思是包括所有类的软件包
http://us.archive.ubuntu.com/ubuntu/indices/ 中 有 一些文件
每个文件描述了一类软件包
 
在这些文件中
override.xenial.main 对应 deb http://us.archive.ubuntu.com/ubuntu/ xenial main 
override.xenial.restricted 对应 deb http://us.archive.ubuntu.com/ubuntu/ xenial  restricted

override.xenial.main.src 对应 deb-src http://us.archive.ubuntu.com/ubuntu/ xenial main 
override.xenial.restricted.src 对应 deb-src http://us.archive.ubuntu.com/ubuntu/ xenial restricted

```
|   |自由软件|非自由软件|
|---|---|---|
|官方支持的|Main|Restricted|
|非官方支持的|Universe|Multiverse|

服务器仓库内容
```
可以这么说,apt 只有一个仓库,但是 仓库 按级别分类
	1.第1级别(xxxx yyyy zzzz 分别为不同版本的发行版代号)
		xxxx
		yyyy
		zzzz
	2.第2级别
		deb
		deb-src
	3.第3级别 (xxxx为发行版代号)
		xxxx
		xxxx-security
		xxxx-updates
		xxxx-proposed
		xxxx-backports
	4.第4级别
		main
		restricted
		universe
		multiverse
所以一个发行版共 1*2*5*4=40个类

在 http://us.archive.ubuntu.com/ubuntu/indices/  中 xenial 发行版相关的文件共80个
	其中 5(第3级别的类数目)*4(每个第3级别类由4个文件描述) = 20 个文件
	其中 5(第3级别的类数目)*4(第4级别的类数目)*3(第2级别的类数目+1(1为debian-installer))= 60 个文件

```

客户端更改仓库配置
```
一般来说我们只更改 链接就行,不需要更改其他内容
sudo sed -i 's/us.archive.ubuntu/mirrors.aliyun/' /etc/apt/sources.list
ubuntu可选的 配置 : https://wiki.ubuntu.org.cn/模板:16.04source
// 阿里云的镜像站点攘括了很多 镜像 , 网址: https://developer.aliyun.com/mirror/

```

包依赖问题
```
the following pakages have unmet depencies
xxx:
	....
	....
解决方案:
sudo apt-get install aptitude
sudo aptitude  install xxx // 该命令有交互模式,会给你提供一个方案,如果你不喜欢(n),他会再给你提供方案

```

aptitude search 使用
```
aptitude search vim -F "%c %p %d %V"
-F 用于指定应使用哪种格式来显示输出，
%c – 包的状态（已安装或未安装），
%p – 包的名称，
%d – 包的简介，
%V – 包的版本。
```

使用apt-show-versions
```
sudo apt install apt-show-versions
apt-show-versions <package-name1> <package-name2> <package-name3> 
apt-show-versions <package-name>    # 已经安装了给定的软件包
apt-show-versions -a <package-name> # 打印给定软件包的所有可用版本
```

自定安装了啥
```
apt-mark showauto
apt-mark showauto <package-name>
apt-mark showhold
```

PPA

<https://itsfoss.com/ppa-guide/>
```
添加 ppa
sudo add-apt-repository ppa:dr-akulavich/lighttable
然后就可以 update 和 install 了．
添加 ppa 并不会改变 sources.list，而是会在 /etc/apt/sources.list.d 添加两个文件，一个 .list 文件，一个 .list.save
上面例子添加PPA的网址是 http://ppa.launchpad.net/dr-akulavich/lighttable/ubuntu/
```

Remove Old PPA
```
sudo apt-get autoremove --purge PACKAGENAME
sudo apt-get install ppa-purge
sudo add-apt-repository -remove ppa:someppa/ppa
sudo apt-get autoclean
```


```
sudo apt remove <package-name>      # 不会清除它依赖的包，但是会清除依赖它的包！
sudo apt autoremove                 # 清除没有被依赖的, 被自动安装的包
==
sudo apt autoremove <package-name>
```


列出所有手动安装的包
```
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)
```
列出所有没有被依赖的包（无论是怎么安装的）

<https://askubuntu.com/questions/1114733/how-do-i-list-all-packages-that-no-package-depends-on>
```
dpkg-query --show --showformat='${Package}\t${Status}\n' | tac | awk '/installed$/ {print $1}' | xargs apt-cache rdepends --installed | tac | awk '{ if (/^ /) ++deps; else if (!/:$/) { if (!deps) print; deps = 0 } }'
```

注意这里面有一些重要的系统包（包括 linux 内核）如果不是自己装的包要删除时要小心．

<https://askubuntu.com/questions/2389/how-to-list-manually-installed-packages>
```
comm -23 <(aptitude search '~i !~M' -F '%p' | sed "s/ *$//" | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)
```
`/var/lib/apt/extended_states` 文件储存了哪些包是自动安装的哪些是手动安装的


查询可升级的包
```
sudo apt update
apt list --upgradable
```

第三方的 source 添加
```
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
```

apt-clone

<https://ubunlog.com/en/apt-clone-copia-seguridad-paquetes/>
```
sudo apt-clone clone --with-dpkg-repack <文件夹>    # 可以把本机所有安装包备份到文件夹中的一个压缩文件．
apt-clone info 备份文件.gz                          # 可以查看包的信息
sudo apt-clone restore 备份文件.gz                  # 可以进行恢复（注意一定要相同架构相同 ubuntu 版本）
直接解压备份文件即可得到所有备份的 deb，可单独用 sudo apt install xxx.deb 安装
sudo apt-clone restore 备份文件.gz --destination <某文件夹>     # 把包安装到某个文件夹（使用 chroot）．
aptic 软件据说也有类似的功能
```

dpkg
```
dpkg -l | grep -i 关键字                           # 可以查找已安装的某个包
sudo dpkg -i 名字.deb                             # 安装 deb 安装包，其中 名字 可以带 *．完了以后用 sudo apt install -fy 安装缺失的依赖包（dpkg 不自动安装依赖）．
sudo apt install *.deb                           # 会自动安装依赖
sudo apt remove 包 或者 dpkg --remove 包 卸载，dpkg --purge 包 可以连配置文件一起卸载．
dpkg -S 文件 查看该文件是哪个包安装的．例如 dpkg -S /bin/gcc
$ dpkg -S /bin/ls
coreutils: /bin/ls

apt-file search 文件 查看该文件是哪个包安装的．
$ apt-file search alsa/asoundlib.h
libasound2-dev: /usr/include/alsa/asoundlib.h
libdssialsacompat-dev: /usr/include/dssi/alsa/asoundlib.h

dpkg -f 文件名.deb [field名] 查看 deb 的某个属性，如果省略 field名 则查看所有属性
sudo apt show *.deb 同样可以检查包的信息．
要卸载某个 .deb 包中的所有包，用 sudo dpkg -r $(dpkg -f 文件名.deb Package)（不支持 *）
dpkg -L 包名 查询对应的已安装的包有什么文件（安装后位置）
apt-file list 包名 查询对应的已安装的包有什么文件（安装后位置）
dpkg -s 包名 查询安装版本及依赖
```
dpkg-deb
```
dpkg-deb -I xxx.deb 查看信息
dpkg-deb -c xxx.deb 列出所有要安装的文件和路径．这和安装完以后用 dpkg -L 包名 列出的文件一样．
deb 文件其实就是一个压缩包，里面包含所有需要安装的文件，以及一些配置文件．
```

Snap

<https://www.howtogeek.com/660193/how-to-work-with-snap-packages-on-linux/>
```
snap 基本就是一些微小的 container 每个都包含所有的依赖文件，使用虚拟硬盘以解决不同的包使用同一个 dependency 的不同版本．
snap list 列出所有的安装包（注意 Ubuntu Software 中安装的未必都是 snap）
snap find 关键词 搜索包
或者到 snap 官网，查找软件，然后按 install 就会得到安装命令，例如 snap install code --classic 安装 vscode
如果不加 --classic，会出现如下错误 error: This revision of snap "code" was published using classic confinement and thus may perform arbitrary system changes outside of the security sandbox that snaps are usually confined to, which may put your system at risk. If you understand and want to proceed repeat the command including --classic.
snap version 查看版本
snap remove 删除包
snap run 软件名 运行某个软件，也可以直接 软件名 运行（在目录 /usr/snap/bin 下）
```

understanding the output of "apt-cache policy"
```
The *** just means installed, as far as I know. Once it has been installed, you see both 500 and 100, corresponding to the version in the archives and the locally installed version respectively.
500 and 100 are the priority numbers. To learn more about them, I recommend man apt_preferences. 500 corresponds to installable, 100 means installed.
```

***
# doxygen
<http://www.doxygen.nl/>
```
sudo apt install doxygen doxygen-gui doxygen-latex
```
使用doxywizard配置路径及build extract，dot graph啥的直接产生doxygen风格的文档及调用图

doxygen风格注释语法参考官方manual


***
# cscope + tceetree
<https://github.com/mihais/tceetree>
```
#列出cscope需要分析的文件
find . -name "*.[c|h]" > cscope.files

#生成标签
cscope -Rcbkq
或
cscope -b -c -R

#分析标签，生成dot
tceetree -f -o filename.dot  # f选项带文件名

#生成图形 png svg pdf等，函数调用不建议png，放不下
dot -Tpdf -O filename.dot -o filename.pdf
dot -Tpng -O tceetree.out
```


***
# cppman 离线帮助
```
sudo apt install cppman
cppman std::thread
默认是在线请求 cppreference.com / cplusplus.com 的内容，可以花半小时一次性全部缓存到本地，提供离线帮助
cppman -c
```


***
# mc 命令行编辑器（比vim emacs弱 比nano强点）
```
sudo apt install mc

The following additional packages will be installed:
  mc-data
Suggested packages:
  dbview djvulibre-bin gv links | w3m | lynx odt2txt python-boto
```

***
# icdiff 分屏显示 diff（看起来比直接用diff好使） 
```
sudo apt install icdiff
```


***
# ncdu 磁盘空间分析程序（命令行下类似baobab的玩意）
```
sudo apt install ncdu
```


***
# glances
htop 代替 top，glances 代替 htop
```
sudo apt install glances

The following additional packages will be installed:
  golang-docker-credential-helpers python3-bottle python3-docker
  python3-dockerpycreds python3-influxdb python3-ply python3-pyasn1
  python3-pycryptodome python3-pysmi python3-pysnmp4 python3-pystache
  python3-websocket
Suggested packages:
  glances-doc python-ply-doc
```


***
# ranger 命令行浏览/预览文件或网页
```
sudo apt install ranger

The following additional packages will be installed:
  w3m w3m-img
Suggested packages:
  atool caca-utils highlight cmigemo dict dict-wn dictd libsixel-bin mpv
  w3m-el

```


***
# dstat
代替vmstat,能输出比 vmstat 更加 美观，整洁，强大的内容
```
sudo apt install dstat
```


***
# tmux multitail 多重 tail
终端软件里一个tab显示多窗

multitail 比 tmux + tail 强多了，操作也比 tmux 方便 
```
sudo apt install tmux multitail
```


***
# bropages 用例为主的帮助系统
man 以外的帮助系统有很多，除去 cheat, tldr 外，还有一款有意思的帮助系统 -- bro，它是以用例为主的帮助，所有用例都是由用户提供，并且由用户投票筛选出来的
```
sudo apt install ruby ruby-dev
The following additional packages will be installed:
  ruby2.5-dev ruby2.5-doc

sudo gem install bropages
bro cut
```


***
# winehq
<https://wiki.winehq.org/Ubuntu>
```
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/bionic/winehq-bionic.sources
sudo apt update
sudo apt install --install-recommends winehq-staging
wget https://dl.winehq.org/wine/wine-gecko/2.47.2/wine-gecko-2.47.2-x86.msi
wget https://dl.winehq.org/wine/wine-gecko/2.47.2/wine-gecko-2.47.2-x86_64.msi
wget https://dl.winehq.org/wine/wine-mono/7.4.0/wine-mono-7.4.0-x86.msi
mkdir -p ~/.cache/wine
cp wine-gecko/2.47.2/wine-gecko-2.47.2-x86.msi ~/.cache/wine
cp wine-gecko/2.47.2/wine-gecko-2.47.2-x86_64.msi ~/.cache/wine
cp wine-gecko/2.47.2/wine-mono-7.4.0-x86.msi ~/.cache/wine
export WINEPREFIX=$HOME/.wine-x64/
export WINEARCH=win64
export LANG=zh_CN.UTF-8
alias wine='env LC_ALL=zh_CN.UTF-8 LANG=zh_CN.UTF-8 WINEARCH=win64 WINEPREFIX=$HOME/.wine-x64 wine'
winecfg
cd ~/.cache/wine
wine msiexec /i wine-gecko-2.47.3-x86.msi
wine msiexec /i wine-gecko-2.47.3-x86_64.msi
wine uninstaller
```


# Ubuntu下让date命令显示英语日期

no effect
`$ env LANG=en_US.UTF-8 date`

`$ cat /etc/default/locale`
```
#  File generated by update-locale
LANG="en_US.UTF-8"
LC_NUMERIC="zh_CN.UTF-8"
LC_TIME="zh_CN.UTF-8"
LC_MONETARY="zh_CN.UTF-8"
LC_PAPER="zh_CN.UTF-8"
LC_NAME="zh_CN.UTF-8"
LC_ADDRESS="zh_CN.UTF-8"
LC_TELEPHONE="zh_CN.UTF-8"
LC_MEASUREMENT="zh_CN.UTF-8"
LC_IDENTIFICATION="zh_CN.UTF-8"
```
`sudo sed -e 's/^LC_TIME.*/LC_TIME="en_US.UTF-8"/' -i /etc/default/locale`

then take effect after re-login

<https://www.cnblogs.com/majestyking/p/11522868.html>
<https://www.linuxdiyf.com/linux/29771.html>



***
# bitarray-2.3.4
<https://pypi.org/project/bitarray/>
```
sudo -H pip3 install bitarray -i https://mirrors.163.com/pypi/simple
source ~/anaconda3/bin/activate python3.10
conda install bitarray
conda update -n base -c defaults conda
conda update conda anaconda-navigator
conda update --update-all
conda upgrade --all
```
```
sudo -H pip3 install pilkit -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install scikit-image==0.17.2 -i https://mirrors.163.com/pypi/simple
source ~/anaconda3/bin/activate python3.10
conda install -c conda-forge scikit-image scikit-build scikit-learn
```


***
# 安装 nutstore

```
$ sudo apt install libnautilus-extension-dev
$ pkg-config --cflags libnautilus-extension
```
从 aur 下载 nutstore 的 PKGBUILD 文件，修改编译
```
# Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=nutstore-experimental
pkgver=5.1.7
pkgrel=1
pkgdesc='Nutstore experimental version.'
arch=(x86_64)
url='https://www.jianguoyun.com/'
license=(custom)
depends=(
#    libappindicator-gtk3
#    libnotify
    python-gobject
#    webkit2gtk
)
optdepends=('nautilus-nutstore: Nautilus plugin')
provides=(nutstore)
conflicts=(nutstore)
source=(nutstore license)
source_x86_64=("https://pkg-cdn.jianguoyun.com/static/exe/ex/$pkgver/nutstore_client-$pkgver-linux-x86_64-public.tar.gz")
sha256sums=('a4aa358d45b306cbeac449f2256f00a5b81a95197394eba7efa96eaae820cf5b'
            'd320e071403cdad44881beb880f5ccfa8ec0a625718a9f572dce0cc9fff81ade')
sha256sums_x86_64=('b55d3ab8744da92151949ab088171cfae1f80464b356fd1720f24be0708f15c4')

build() {
    cd $srcdir/gnome-config
    sed -i '/Exec=/s|~/\.nutstore/dist/bin/nutstore-pydaemon.py|/usr/bin/nutstore|' menu/nutstore-menu.desktop
    sed -i '/Exec=/s|~/\.nutstore/dist|/opt/nutstore|' autostart/nutstore-daemon.desktop
    cd $srcdir/bin
    sed -i '/gvfs-set-attribute/s|gvfs-set-attribute|gio set|' nutstore-pydaemon.py
    python -m compileall .
}

package() {
    cd $srcdir
    install -D -m755 nutstore $pkgdir/usr/bin/nutstore
    install -D -m644 license $pkgdir/usr/share/licenses/nutstore/license
    rm nutstore license *.tar.gz
    mkdir -p $pkgdir/opt/nutstore && cp -aR ./ $pkgdir/opt/nutstore
    install -D -m644 gnome-config/menu/nutstore-menu.desktop $pkgdir/usr/share/applications/nutstore.desktop
    install -D -m644 app-icon/nutstore.png $pkgdir/usr/share/icons/hicolor/512x512/apps/nutstore.png
}
```
```nautilus-nutstore
$ makedeb
```
## nautilus-nutstore
```
# Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=nautilus-nutstore
pkgver=5.1.7
pkgrel=1
pkgdesc='Nutstore integration for Nautilus.'
arch=(x86_64)
url='https://www.jianguoyun.com/'
license=(CCPL:by-nd GPL2)
depends=(libnautilus-extension-dev nutstore)
source=("https://www.jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz")
sha256sums=('545e0d393f3e529d0c0a8f51fe652749a1067f84c78dfb445ffb6023c5a7bfa1')

build() {
    cd $srcdir/nutstore_linux_src_installer
    ./configure || return 1
    make || return 1
}

package() {
    cd $srcdir/nutstore_linux_src_installer
    make DESTDIR=$pkgdir install
    install -D -m 644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
```

<https://github.com/chrisjbillington/git-nautilus-icons>

<https://aur.archlinux.org/packages/git-nautilus-icons>

```
$ sudo apt-get install python-gi python-{nautilus,nemo,caja} python-pathlib python-enum34 python-pip
```


***
# Baloo 关闭 index
<https://wiki.archlinux.org/index.php/Baloo>
<https://forum.manjaro.org/t/solved-baloo-file-extractor-using-100-cpu/70737/5>
<https://community.kde.org/Baloo>
<https://wiki.gentoo.org/wiki/Baloo>
<https://zh.opensuse.org/Baloo>


一层一层找下去
```
du -h --max-depth=1 /home/username
```
```
#检查状态
balooctl status
#立即停止
balooctl suspend
#禁用框架
balooctl disable
```
如果不想停用，可以编辑 `~/.config/baloofilerc` ，在里面添加 exclude folders 一项来忽略某些目录，加速 baloo index 速度


***
# proftpd 一个 tfp server
proftpd 是 webmin 推荐使用的，和vsftpd是冲突的
```
sudo apt install proftpd proftpd-doc
```


***
# gitlab-ce (太占资源了，直接用gitlab.com)

映射目录
```
/home/docker/gitlab         权限root:root
```
映射端口
```
443-->443
80-->8091
22-->2222
```
docker 安装 gitlab-ce
```
docker pull gitlab/gitlab-ce
```
运行容器
```
docker run -d -p 443:443 \
	-p 8091:80 -p 2222:22 \
	--name gitlab \
	--restart always \
	-v /home/docker/gitlab/config:/etc/gitlab \
	-v /home/docker/gitlab/logs:/var/log/gitlab \
	-v /home/docker/gitlab/data:/var/opt/gitlab \
	gitlab/gitlab-ce
```
查看 登录用户 root 的初始密码
```
docker exec -it gitlab cat /etc/gitlab/initial_root_password
sudo cat /home/docker/gitlab/config/initial_root_password
```

修改配置
```
sudo gedit /home/docker/gitlab/config/gitlab.rb
```
```
external_url 'http://192.168.0.100'
gitlab_rails['gitlab_ssh_host'] = '192.168.0.100'
gitlab_rails['gitlab_shell_ssh_port'] = 2222 # 此端口是run时22端口映射的222端口

gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.qq.com"
gitlab_rails['smtp_port'] = 465
gitlab_rails['smtp_user_name'] = "253951005@qq.com"
gitlab_rails['smtp_password'] = "hgdgnlpnqosebggf" # qq邮箱的 设置->账户 smtp设置里
gitlab_rails['smtp_domain'] = "smtp.qq.com"
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = true
# gitlab_rails['smtp_pool'] = false
gitlab_rails['gitlab_email_from'] = '253951005@qq.com'
```
登入容器shell
```
sudo docker exec -it gitlab bash
```
容器shell内 更新容器 apt repo
```
apt update
apt install postfix
```
容器shell内 生效配置
```
gitlab-ctl reconfigure
```
容器shell 测试邮件发送
```
gitlab-rails console

Notify.test_email('zhaoguo.zhang@figkey.com', '邮件标题', '邮件正文').deliver_now
```




***
# git-lfs

git clone xxx 之后出现
```
Cloning into 'Hi06701A'...
remote: Enumerating objects: 46882, done.
remote: Total 46882 (delta 0), reused 0 (delta 0), pack-reused 46882
Receiving objects: 100% (46882/46882), 351.60 MiB | 173.00 KiB/s, done.
Resolving deltas: 100% (3890/3890), done.
git-lfs filter-process: line 1: git-lfs: command not found
fatal: the remote end hung up unexpectedly
warning: Clone succeeded, but checkout failed.
You can inspect what was checked out with 'git status'
and retry with 'git restore --source=HEAD :/'
```
```
git config --system core.longpaths true
git restore --source=HEAD :/
```
提示找不到 git-lfs
```
sudo apt install git-lfs
cd [clone-dir]
git lfs install
```
```
$ git lfs install
Updated git hooks.
Git LFS initialized.
```
```
$ echo $(git --exec-path)
/usr/lib/git-core
```

下面命令奇慢无比
```
git restore --source=HEAD :/
```
```
git reset --hard
```
If you intentionally removed git-lfs, and don't want to install it back as other answers suggest, your way out is:
```
git config --global --remove-section filter.lfs
```

## git-lfs tips

1. Download and install the Git command line extension. Once downloaded and installed, set up Git LFS for your user account by running:
```
git lfs install
```
You only need to run this once per user account.

2. In each Git repository where you want to use Git LFS, select the file types you'd like Git LFS to manage (or directly edit your .gitattributes). You can configure additional file extensions at anytime.
```
git lfs track "*.psd"
```
跟踪文件夹中的所有文件
```
忽略文件夹中的所有文件(包含文件夹)
// git lfs track "Pods/TXLiteAVSDK_Professional/**"
git lfs track "dir/**"
忽略文件夹中的文件(不包含文件夹)
git lfs track "dir/*"
```
执行完上面的命令后，会生成一个.gitattributes文件，要将其上传到远程gitee仓库

Now make sure .gitattributes is tracked:
```
git add .gitattributes
git commit -m '提交 .gitattributes 文件'
git push origin master（如果提交不了，后面可以加一个-f）
```
配置提交后就可正常上传文件
```
git add -A   提交所有 或指定当前大文件提交
git commit -m "大文件"
git push origin master -f
```
上传报错Message: LFS only supported repository in paid enterprise.: exit status 128, 解决方法：
```
rm .git/hooks/pre-push
git push -u origin "master"
```
报错message：WARNING: Authentication error: Authentication required: LFS only supported repository in paid enterprise.解决办法
```
git config lfs.https://gitee.com/{your_gitee}/{your_repo}.git/info/lfs.locksverify false
```
报错信息：Remote “origin” does not support the LFS locking API. Consider disabling it with:…
```
git lfs push origin master --all
```
## git 回退
1. 查看提交记录获取commit_id
```
git log
```
2. 回退命令
```
git reset --hard HEAD^` 回退到上个版本
git reset --hard HEAD~3` 回退到前3次提交之前，以此类推，回退到n次提交之前
git reset --hard commit_id` 退到/进到 指定[commit]的sha码
```
3. 强推到远程仓库
```
git push origin HEAD --force
```


***
# 本机缓存清理
```
~/.cache/pip
~/.cache/angrysearch
~/.cache/tracker/mata.db       [其实这里没有，如果有就删]
~/.cache/vmware/drag_and_drop  [其实这里没有，如果有就删]
```
Tracker is used (by gnome) to index files to make them searchable and appear automatically in some programs (like Rhythmbox for music files, etc). More info from the Ubuntu wiki on it here https://wiki.ubuntu.com/Tracker.

You can do a hard reset of the tags database and restart all the tracker processes with this command:
```
tracker reset -r
```
这会像跟踪程序守护进程kill那样杀死所有进程，但它也会删除所有进程数据库。重新启动跟踪器存储将重新创建数据库。

Use `tracker daemon -t` to terminate and `tracker daemon -s` to start the processes.

check the status,
```
tracker status
```
## ~/.cache 大文件清理
逐级排查，即进入逐步进入占用空间大的文件夹，然后删除
```
sudo -i //进入root模式
du -h max-depth=1   //查看各文件占用的内存
cd ./目录名称    //进入占用内存大的文件下查看情况
```
文件管理器里删除完一定要清空回收站，例如
```
sudo rm -fr /root/.local/share/Trash/
sudo rm -fr ~/.local/share/Trash/
sudo rm -fr /opt/.Trash-1000/
```
## 清除cache缓存
先进入root模式
```
sudo -i
```
仅清除页面缓存（PageCache）
```
echo 1 > /proc/sys/vm/drop_caches
```
清除目录项和inode
```
echo 2 > /proc/sys/vm/drop_caches
```
清除页面缓存，目录项和inode
```
echo 3 > /proc/sys/vm/drop_caches
```
## 清除arp缓存
```
arp -n|awk '/^[1-9]/ {print "arp -d "$1}' | sh
for((ip=2;ip<255;ip++));do arp -d 192.168.0.$ip &>/dev/null;done
```


***
# 百度插件更新后获取API链接
```
https://d.pcs.baidu.com/file/27bc4e6499bd212d76fc513e2c2c227c?fid=1100873503712-250528-144130801647605&dstime=1675390432&rt=sh&sign=FDtAERVJouK-DCb740ccc5511e5e8fedcff06b081203-PTvly6C1Xx8%2FV8kIm8JlHMZWpxk%3D&expires=8h&chkv=1&chkbd=0&chkpc=&dp-logid=8845700870123587901&dp-callid=0&shareid=21224254387&r=777438278&resvsflag=1-12-0-1-1-1&vuk=81288970&file_type=0
```
```
curl -L -C - "https://d.pcs.baidu.com/file/27bc4e6499bd212d76fc513e2c2c227c?fid=1100873503712-250528-144130801647605&dstime=1675389666&rt=sh&sign=FDtAERVJouK-DCb740ccc5511e5e8fedcff06b081203-Gn4A2CyM%2BMFe%2BGGYWc4u1vyq7zg%3D&expires=8h&chkv=1&chkbd=0&chkpc=&dp-logid=8845495149683191085&dp-callid=0&shareid=21224254387&r=115101242&resvsflag=1-12-0-1-1-1&vuk=81288970&file_type=0" -o "Qt5.9 C++开发指南例程源码.zip" -A "pan.baidu.com" -b "BDUSS=TZ0cXZraUxCUG5WRmFTZjFhN1VHaVVUQmNoSjVDVnBvSTBMMjZMeDJENXI5d05rSVFBQUFBJCQAAAAAAAAAAAEAAAARBNXceXhnaWxpa2UxMgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGtq3GNratxjb"
```


* * *
# 修改mac地址
```
sudo gedit /etc/rc.local
```
```
#!/bin/sh
#ifconfig eth0 hw ether e0:d5:5e:f8:a6:7a
ifconfig eth0 hw ether 00:d8:61:a6:62:b7
exit 0
```
```
sudo chmod +x /etc/rc.local
```


***
# edid-generator
```
git clone git@github.com:akatrevorjay/edid-generator.git
sudo apt install zsh edid-decode automake dos2unix
wget https://www.deltacast.tv/media/1145/EEDID_Editor_1.4.00_Setup_Win64.zip
```


***
# 汉英辞典-星际译王
```
sudo apt install stardict espeak-data libespeak1 libestools2.5 stardict-common stardict-gnome stardict-plugin stardict-plugin-espeak stardict-plugin-festival

sudo apt purge --auto-remove stardict
```


***
# webp 图片转换
```
sudo apt-get install webp

可以使用如下命令将 JPG 或 PNG 转换为 WEBP
cwebp -q [图像质量] [JPEG/PNG文件名] -o [WebP文件名]

使用如下命令或将 WEBP 图片转换成 PNG
dwebp [WebP文件名] -o [PNG文件名]
```
```
sudo apt install libwebp-dev libgdk-pixbuf2.0-dev
sudo apt install libwebp-dev libgdk-pixbuf2.0-dev libgtk-3-dev meson build-essential
```
```
# Maintainer: Andeas Zhang
_name="webp-pixbuf-loader"
pkgname="${_name}-git"
pkgdesc="WebM GDK Pixbuf Loader library - Git version"
pkgver=0.2.4.r0.ga350141
pkgrel=1
url="https://github.com/aruiz/webp-pixbuf-loader"
license=("GPL")
depends=("libgdk-pixbuf2.0-dev" "libwebp-dev")
makedepends=("meson" "git")
arch=("i686" "x86_64" "i486" "pentium4" "aarch64" "armv7h")
conflicts=("${_name}")
#source=("${_name}::git+${url}.git")
source=("${_name}::git+ssh://git@github.com/aruiz/webp-pixbuf-loader.git")
sha256sums=("SKIP")

pkgver() {
	cd "${_name}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_name}"
	meson build
	ninja -C build
}

package() {
	cd "$srcdir/${_name}"
	DESTDIR="${pkgdir}" ninja -C build install
}
```
比较好的的办法
```
lximage-qt 或 Gwenview Qview gThumb LibreOffice 打开并另存
```
---
***
# emacs
```
$ sudo apt install emacs25
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  emacs25-bin-common emacs25-common emacs25-el liblockfile-bin liblockfile1
  libm17n-0 libotf0 m17n-db
Suggested packages:
  emacs25-common-non-dfsg m17n-docs
```

---
***
# 文件权限查找并修改
```
$ find . -type f -perm -o=r+w -exec chmod 755 {} \;
$ find . -type f -perm -o=r+w -exec chmod o+x {} \;
//$ sudo chmod -R a+w /var/www
//$ sudo find /var/www -type d -exec chmod 755 {} \;
//$ sudo find /var/www -type f -exec chmod 666 {} \;
```


---
***
# gpac(MP4Box) mediainfo libmp4v2
```
sudo apt install gpac gpac-modules-base libgpac4 libgpac-dev
sudo apt install libmp4v2-dev mediainfo mediainfo-gui libmediainfo0v5 libtinyxml2-6 libzen0v5
```
```
$ MP4Box -v -add test.h264:FMT=AVC -fps 30 -new output1.mp4
$ MP4Box -v -add test.h265:FMT=HEVC -fps 30 -new output2.mp4

播放mp4（可以选vlc）
ffplay output_h265.mp4
检测视频信息
ffprobe output_h265.mp4
mediainfo output_h265.mp4
MP4Box -info file
提取 h264数据
ffmpeg -i 001.mp4 -codec copy -bsf: h264_mp4toannexb -f h264 001.h264
保留编码格式
ffmpeg -i test.mp4 -vcodec copy -an test_copy.h264
ffmpeg -i test.mp4 -acodec copy -vn test.aac
强制编码格式
ffmpeg -i test.mp4 -vcodec libx264 -an test.h264
ffmpeg -i test.mp4 -vcodec libx265 -an test.h265
ffmpeg -i 1920x1080.mp4 -vcodec libx265  -preset ultrafast -x265-params "bframes=0"  out.h265  #去除B帧
ffmpeg -i test.mp4 -acodec libmp3lame -vn test.mp3
ffmpeg -i juren.mp4 -c:v hevc -c:a copy juren-h265.mp4
保留封装格式
ffmpeg -i test.mp4 -acodec copy -vn audio.mp4
ffmpeg -i test.mp4 -vcodec copy -an video.mp4
查看 FFmpeg 支持的编解码标准
ffmpeg -codecs
ffmpeg -codecs > codecs.txt
打包
ffmpeg -f h264 -i xxx.h264 -vcodec copy xxx.mp4
ffmpeg -i test.h265 -vcodec copy xx4x.mp4
ffmpeg -i encoded.265 -c copy out.mp
ffmpeg -i input.h265 -c:v libx264 -crf 23 output.mp4 # -crf参数表示质量，从0到51可以选择，数字越小质量越好，23是一个常用的质量值
ffmpeg -f hevc -i test.h265 -vcodec copy xxx1.mp4
ffmpeg -f hevc -i test.h265 -vcodec copy -x265-params crf=25 xxx1.mp4
ffmpeg -i test.h265 -c:v libx265 -an -x265-params crf=25 xxx1.mp4
ffmpeg -i test.h265 -c:v libx265 -c:a copy -x265-params crf=25 xxx1.mp4 # With audio
# Using MP4Box
MP4Box -add test.h265 out.mp4
MP4Box -add xxx.h264 out.mp4 -inter 500
# With audio
MP4Box -add {INPUT}#audio -add raw.265 out.mp4
MP4Box -add file.mpg#audio new_file.mp4

转换h264为h265
ffmpeg -f h264 -i xxx.h264 -vcodec libx265 -an xxx.h265
ffmpeg -i xxx.h265 -vcodec copy xxx.mp4
ffmpeg -i cuc_ieschool.h265 -pix_fmt yuv444p test444p.yuv

FLV 转 MP4
ffmpeg -i juren.flv juren.mp4
FLV 转 MP4 不进行编解码
ffmpeg -i juren.mp4 -c copy juren.flv
ffmpeg -f flv -i juren.flv -c copy juren.mp4
FLV 转 TS
ffmpeg -i juren.flv juren.ts
MP4 转 FLV
ffmpeg -i juren.mp4 juren.flv

https://www.jianshu.com/p/5702783153df

提取AAC
ffmpeg -i test.mp4 -acodec copy -vn output.aac
ffmpeg 提取 yuv 数据
ffmpeg -i out.mp4 -an -c:v rawvideo -pix_fmt yuv420p out.yuv
播放yuv文件
ffplay -s 2880x1800 -pix_fmt uyvy422 screen.yuv
提取 pcm 数据
ffmpeg -i 1.mp4 -vn -ar 44100 -ac 2 -f s16le out.pcm
播放 pcm 数据
ffplay -ac 2 -ar 44100 -f s16le out.pcm
提取 rgb 数据(提取17分15秒~17分30秒)
ffmpeg -ss 00:17:15 -t 00:00:15-i 12.mkv -pix_fmt rgb24  11.rgb
去掉视频中的音频
ffmpeg -i input.mp4 -vcodec copy -an output.mp4
提取视频中的音频
ffmpeg -i input.mp4 -acodec copy -vn output.mp3
音视频合成
ffmpeg -y –i input.mp4 –i input.mp3 –vcodec copy –acodec copy output.mp4
剪切视频
ffmpeg -ss 0:1:30 -t 0:0:20 -i input.mp4 -vcodec copy -acodec copy output.mp4
视频截图
ffmpeg –i test.mp4 –f image2 -t 0.001 -s 320x240 image-%3d.jpg
视频分解为图片
ffmpeg –i test.mp4 –r 1 –f image2 image-%3d.jpg
将图片合成视频
ffmpeg -f image2 -i image%d.jpg output.mp4
视频拼接
ffmpeg -f concat -i filelist.txt -c copy output.mp4
将视频转为gif
ffmpeg -i input.mp4 -ss 0:0:30 -t 10 -s 320x240 -pix_fmt rgb24 output.gif
将视频前30帧转为gif
ffmpeg -i input.mp4 -vframes 30 -f gif output.gif
旋转视频
ffmpeg -i input.mp4 -vf rotate=PI/2 output.mp4
缩放视频
ffmpeg -i input.mp4 -vf scale=iw/2:-1 output.mp4
视频变速
ffmpeg -i input.mp4 -filter:v setpts=0.5*PTS output.mp4
音频变速
ffmpeg -i input.mp3 -filter:a atempo=2.0 output.mp3
音视频同时变速，但是音视频为互倒关系
ffmpeg -i input.mp4 -filter_complex "[0:v]setpts=0.5*PTS[v];[0:a]atempo=2.0[a]" -map "[v]" -map "[a]" output.mp4
视频添加水印
ffmpeg -i input.mp4 -i logo.jpg -filter_complex [0:v][1:v]overlay=main_w-overlay_w-10:main_h-overlay_h-10[out] -map [out] -map 0:a -codec:a copy output.mp4


ffmpeg -y -r 25.0 -f rawvideo -s 1920x1080 -pix_fmt uyvy422 -i input.avi -vcodec copy -pix_fmt yuv420p -f avi -r 25 -s 1920x1080 output.avi
ffmpeg -y -pix_fmt yuv420p -s 1920x1080 -r 30 -i ldr_420.yuv -f rawvideo -pix_fmt yuv444p -s 1920x1080 -r 30 ldr_444.yuv

$ ffmpeg -y -r 25.0 -f rawvideo -s 480x272 -pix_fmt yuv444p -i output_yuv444.yuv -pix_fmt yuv420p -f rawvideo -r 25 -s 480x272 out1_yuv420p.yuv
$ ffmpeg -y -r 25.0 -f rawvideo -s 480x272 -pix_fmt yuv444p -i output_yuv444.yuv -pix_fmt yuv420p -f rawvideo -r 25 -s 800x450 out2_yuv420p.yuv
ffmpeg -y -r 30.0 -f rawvideo -s 384x384 -pix_fmt yuv420p -i test.264 -vcodec copy -pix_fmt yuv420p -f rawvideo -r 25 -s 384x384 out1_yuv420p.yuv
ffmpeg -y -r 30.0 -s 384x384 -pix_fmt yuv420p -i test.YUV -pix_fmt yuv420p -f h264 -r 30 -s 384x384 out1_yuv420p.264
ffmpeg -y -r 25.0 -f rawvideo -s 384x384 -pix_fmt yuv420p -i test.YUV -pix_fmt yuv420p -f h264 -r 25 -s 384x384 out2_yuv420p.264
ffmpeg -y -r 25.0 -f rawvideo -s 384x384 -pix_fmt yuv420p -i test.YUV -pix_fmt yuv420p -f mp4 -r 25 -s 384x384 out2_yuv420p.mp4
ffmpeg -s 384x384 -i test.YUV -c:v libx265 -preset medium -crf 28 -c:a aac -b:a 128k output_h265.mp4
ffplay -vf "hflip,vflip" -i test1.mp4
ffmpeg -i test1.mp4 -vf "rotate=PI:bilinear=0,format=yuv420p" -metadata:s:v rotate=0 -codec:v libx264 -codec:a copy test1_output.mp4
ffmpeg -i test1.mp4 -vf "rotate=45*(PI/180),format=yuv420p" -metadata:s:v rotate=0 -codec:v libx264 -codec:a copy output_rotate.mp4
https://superuser.com/questions/578321/how-to-rotate-a-video-180-with-ffmpeg
ffmpeg -s 384x384 -i test.YUV -c:v libx265 -preset medium -b:a 128k output_h265.265
```

---
***
# sudo-gdb
add to /etc/sudoers
```
andreas ALL=(root) NOPASSWD:/usr/bin/gdb
```
/usr/bin/sudo-gdb
```
#!/bin/bash
sudo gdb $@
```
```
sudo chmod a+x /usr/bin/sudo-gdb
```
这样eclipse和qtcreater都可以在sudo权限运行gdb
如果只是run，qtcreator要在
```
In the Tab General under **System** Group there is a Terminal Option.
The default value is set to /usr/bin/xterm -e . Replace it with /usr/bin/xterm -e sudo or /usr/bin/gnome-terminal -x sudo
```

# ~/.gitconfig
```
[user]
	name = Andreas Zhang
	email = denglitsch@gmail.com
[core]
	autocrlf = false    
	longpaths = true
	fileMode = false
	autocrl = false
[color]
	ui = auto
[commit]
	gpgsign = false
[http]
	sslVerify = false
	postBuffer = 2000000000
[https]
	proxy = socks5://127.0.0.1:10808
	postBuffer = 2000000000
[ssh]
	postBuffer = 1048576000
[filter "lfs"]
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
	required = true
[merge]
	ff = false
[pull]
	ff = true

```

# ~/.bashrc
```
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


export LM_LICENSE_FILE=/opt/questasim/license.dat:/opt/modelsim/license.dat:/opt/altera/license.dat:/opt/lscc/license.dat:/opt/synopsys/synopsys.dat
export PATH=$PATH:/opt/questasim/questasim/bin:/opt/questasim/questasim/linux_x86_64:/opt/modelsim/modeltech/bin:/opt/modelsim/modeltech/linux_x86_64:/opt/altera/11.0/quartus/bin:/opt/altera/11.0/nios2eds/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/altera/11.0/quartus/dsp_builder/bin64:/opt/altera/11.0/quartus/dspba/Blocksets/BaseBlocks/linux64:/opt/natinst/LabVIEW-2020-64/AppLibs:/opt/natinst/niPythonInterface/lib64:/opt/natinst/share/NI-VISA:/opt/natinst/LabVIEW-2020-64/resource
#export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libgtk3-nocsd.so.0

#export DVE_HOME=/opt/synopsys/vcs/O-2018.09-SP2
export DVE_HOME=/opt/synopsys/vcs/O-2018.09-SP2/gui/dve
export VCS_HOME=/opt/synopsys/vcs/O-2018.09-SP2
export VCS_MX_HOME=/opt/synopsys/vcs-mx/O-2018.09-SP2
#export LD_LIBRARY_PATH=/opt/synopsys/verdi/Verdi_O-2018.09-SP2/share/PLI/VCS/LINUX64:/opt/synopsys/verdi/Verdi_O-2018.09-SP2/share/PLI/lib/LINUX64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/synopsys/verdi/Verdi_O-2018.09-SP2/share/PLI/VCS/LINUX64:/opt/synopsys/verdi/Verdi_O-2018.09-SP2/share/PLI/lib/LINUX64
export VERDI_HOME=/opt/synopsys/verdi/Verdi_O-2018.09-SP2
export SCL_HOME=/opt/synopsys/scl/2018.06

#dve
PATH=$PATH:$VCS_HOME/gui/dve/bin
alias dve="dve -full64"

#VCS
PATH=$PATH:$VCS_MX_HOME/bin:$VCS_HOME/bin
alias vcs="vcs -full64 -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed"
#alias vcs="vcs -full64 -cpp g++-5 -cc gcc-5 -LDFLAGS -Wl,--no-as-needed"

#VERDI
PATH=$PATH:$VERDI_HOME/bin
alias verdi="verdi -full64"

#scl
PATH=$PATH:$SCL_HOME/linux64/bin
export VCS_ARCH_OVERRIDE=linux
#export VCS_TARGET_ARCH=amd64
export VCS_TARGET_ARCH=linux64

#LICENCE
#export LM_LICENSE_FILE=27000@Vostro-5880
#alias lmg_synopsys="lmgrd -c /opt/synopsys/synopsys.dat"

### cuda path
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH


PATH=/usr/local/texlive/2022/bin/x86_64-linux:$PATH; export PATH 
MANPATH=/usr/local/texlive/2022/texmf-dist/doc/man:$MANPATH; export MANPATH 
INFOPATH=/usr/local/texlive/2022/texmf-dist/doc/info:$INFOPATH; export INFOPATH


# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/andreas/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/andreas/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/andreas/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/andreas/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<


alias wine='env LC_ALL="zh_CN.UTF-8" LANG="zh_CN.UTF-8" WINEARCH=win64 WINEPREFIX="/home/andreas/.wine-x64" wine'

```

---
***
# gstreamer

https://gstreamer.freedesktop.org/documentation/tutorials/index.html

https://gstreamer.freedesktop.org/documentation/tutorials/basic/index.html

https://gstreamer.freedesktop.org/documentation/installing/on-linux.html

官方已经用gstreamer1.0来演示tutorials
```
$ sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio

$ pkg-config --cflags --libs gstreamer-1.0
-pthread -I/usr/include/gstreamer-1.0 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -lgstreamer-1.0 -lgobject-2.0 -lglib-2.0
```
```
git clone https://gitlab.freedesktop.org/gstreamer/gstreamer
cd gstreamer/subprojects/gst-docs/examples/tutorials
gcc basic-tutorial-1.c -o basic-tutorial-1 `pkg-config --cflags --libs gstreamer-1.0`
```
```
$ sudo apt-get install gstreamer0.10-qapt
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  apt-xapian-index gstreamer-qapt libqapt3 libqapt3-runtime python3-xapian
Suggested packages:
  app-install-data xapian-doc

```
## 一般gst命令
```
gst-launch-1.0 uridecodebin uri=https://gstreamer.freedesktop.org/data/media/sintel_trailer-480p.webm ! videoconvert ! autovideosink
gst-launch-1.0 uridecodebin uri=https://gstreamer.freedesktop.org/data/media/sintel_trailer-480p.webm ! audioconvert ! autoaudiosink
gst-launch-1.0 souphttpsrc location=https://gstreamer.freedesktop.org/data/media/sintel_trailer-480p.webm ! decodebin ! autovideosink
//gst-launch-1.0 filesrc location=f:\\media\\sintel\\sintel_trailer-480p.webm ! decodebin ! autovideosink
gst-launch-1.0 filesrc location=./sintel_trailer-480p.webm ! decodebin ! autovideosink
gst-launch-1.0 audiotestsrc ! vorbisenc ! oggmux ! filesink location=test.ogg
gst-launch-1.0 videotestsrc ! videoconvert ! autovideosink
gst-launch-1.0 audiotestsrc ! audioconvert ! autoaudiosink
gst-launch-1.0 videotestsrc ! video/x-raw,framerate=30/1 ! videorate ! video/x-raw,framerate=1/1 ! videoconvert ! autovideosink
gst-launch-1.0 uridecodebin uri=https://gstreamer.freedesktop.org/data/media/sintel_trailer-480p.webm ! videoscale ! video/x-raw,width=178,height=100 ! videoconvert ! autovideosink
gst-launch-1.0 uridecodebin uri=http://docs.gstreamer.com/media/sintel_trailer-480p.webm ! queue ! videoscale ! video/x-raw,width=320,height=200 ! videoconvert ! autovideosink
gst-launch-1.0 uridecodebin uri=https://gstreamer.freedesktop.org/data/media/sintel_trailer-480p.webm ! audioresample ! audio/x-raw,rate=4000 ! audioconvert ! autoaudiosink
gst-launch-1.0 audiotestsrc ! tee name=t ! queue ! audioconvert ! autoaudiosink t. ! queue ! wavescope ! videoconvert ! autovideosink
gst-launch-1.0 videotestsrc ! video/x-raw, format=GRAY8 ! videoconvert ! autovideosink
gst-launch-1.0 audiotestsrc num-buffers=1000 ! fakesink sync=false
gst-launch-1.0 audiotestsrc ! identity drop-probability=0.1 ! audioconvert ! autoaudiosink
```


---
***
# Change the number of the partition from sdx1 to sdx2
保存分区表 backup the disk partition table
```
# sfdisk --dump /dev/sdx > sdx.bkp
# cp sdx.bkp sdx.new 
```
编辑分区表

from
```
# partition table of /dev/sdx
unit: sectors

/dev/sdx1 : start=  1026048, size=975747120, Id=83
/dev/sdx2 : start=     2048, size=   204800, Id=83
/dev/sdx3 : start=   206848, size=   819200, Id= b
/dev/sdx4 : start=        0, size=        0, Id= 0
```
to
```
# partition table of /dev/sdx
unit: sectors

/dev/sdx1 : start=     2048, size=   204800, Id=83
/dev/sdx2 : start=   206848, size=   819200, Id= b
/dev/sdx3 : start=  1026048, size=975747120, Id=83
/dev/sdx4 : start=        0, size=        0, Id= 0
```
throw it back to the disk partition table (carefull)
```
# sfdisk /dev/sdx < sdx.new
```
If the last command does not work, change it for
```
# sfdisk --no-reread --force /dev/sdx < sdx.new
```


---
***
# goldendict
```
sudo apt-get install goldendict goldendict-wordnet
```


---
***
# youdao-dict报错
youdao-dict_6.0.0-0_ubuntu_amd64.deb
```
Traceback (most recent call last):
  File "/usr/bin/youdao-dict", line 27, in <module>
    from dae.daeclient import DAEClient
  File "/usr/share/youdao-dict/dae/daeclient.py", line 36, in <module>
    from dae.window import Window
  File "/usr/share/youdao-dict/dae/window.py", line 29, in <module>
    from dae.webview import WebView
  File "/usr/share/youdao-dict/dae/webview.py", line 27, in <module>
    from dae.webpage import WebPage
  File "/usr/share/youdao-dict/dae/webpage.py", line 27, in <module>
    from PyQt5.QtWebKitWidgets import QWebPage, QWebInspector
ValueError: PyCapsule_GetPointer called with incorrect name

```

PYTHONPATH环境变量
```
export PYTHONPATH=$PYTHONPATH:/usr/lib/python3/dist-packages
```
然后运行,ok
<https://github.com/yomun/youdaodict_5.5>
```
如果依赖软件包安装完后,
还是会出现 ModuleNotFoundError: No module named 'PyQt5.QtWebKitWidgets'
先检查是否用 pip3 安装了 PyQt5, 如有就卸载

如还不行, 建议加入 PYTHONPATH 环境变量

$ python3
Python 3.6.7 (default, Oct 22 2018, 11:32:17) 
[GCC 8.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import os
>>> print(os.sys.path)
['', '/usr/lib/python36.zip', '/usr/lib/python3.6', '/usr/lib/python3.6/lib-dynload',
 '/usr/lib/python3/dist-packages']

选一个以上可用的路径为 $PYTHONPATH

$ su root
$ gedit /usr/share/applications/youdao-dict.desktop

### Exec=youdao-dict %f
Exec=env PYTHONPATH=/usr/lib/python3/dist-packages youdao-dict %f

也可以在 ~/.bashrc 或 ~/.profile 加入

$ su $USERNAME
$ gedit ~/.bashrc 或 gedit ~/.profile

export PYTHONPATH=$PYTHONPATH:/usr/lib/python3/dist-packages    # 已经是系统维护的，不是现在的pip3.6所在的dist-packages 目录

然后运行

$ source ~/.bashrc 或 source ~/.profile
$ youdao-dict
```


---
***
# xunlei dingtalk
```
com.xunlei.download_1.0.0.1_amd64.deb
com.alibabainc.dingtalk_1.3.0.20214_amd64.deb
```


---
# pip 整理
```
python3 -m pip install --upgrade pip
/root/.cache/pip/wheels
sudo ls /root/.cache/pip/wheels

sudo apt install python3-pyqt5 python3-pyqt5.qtopengl python3-pyqt5.qtsvg python3-dbus python3-dbus.mainloop.pyqt5 python3-pyqt5.qtopengl python3-pyqt5.qtwebengine python3-pyqt5.qtwebkit --reinstall

sudo -H pip3.6 install PyQt5==5.15.2 pyqtwebengine==5.15.2 pyqt5-tools pyqt5-plugins --upgrade --proxy=http://127.0.0.1:8118
```


---
***
# inxi
```
sudo apt install inxi
inxi -Fxxxrz
```


---
***
# libdw-dev
```
sudo aptitude install libdw-dev
     Downgrade the following packages:                                                 
1)     libdw1 [0.176-1.1~18.04.sav0 (now) -> 0.170-0.4ubuntu0.1 (bionic-updates)]      
2)     libelf-dev [0.176-1.1~18.04.sav0 (now) -> 0.170-0.4ubuntu0.1 (bionic-updates)]  
3)     libelf1 [0.176-1.1~18.04.sav0 (now) -> 0.170-0.4ubuntu0.1 (bionic-updates)]     
4)     libelf1:i386 [0.176-1.1~18.04.sav0 (now) -> 0.170-0.4ubuntu0.1 (bionic-updates)]

sudo apt-get install libunwind8-dev
sudo apt --fix-broken install
sudo update-initramfs -u -k all

sudo apt-get build-dep linux

The following NEW packages will be installed:
  asciidoc asciidoc-base asciidoc-common dh-systemd docbook-dsssl
  docbook-utils kernel-wedge libaudit-dev libcap-ng-dev libnewt-dev
  libsgmls-perl makedumpfile opensp python-alabaster python-babel
  python-babel-localedata python-docutils python-imagesize python-jinja2
  python-markupsafe python-roman python-sphinx python-sphinx-rtd-theme sgmlspl
  sphinx-common xmlto

sudo apt-get build-dep linux linux-image-unsigned-$(uname -r)

The following NEW packages will be installed:
  dwarves libcap-dev

$ apt list --installed | grep linux

```


---
***
# doxygen
```
sudo apt-get install doxygen doxygen-gui graphviz graphviz-doc
```


---
***
# /etc/udev/rules.d/
10-local.rules
```
#Lattice
SUBSYSTEM=="usb",ACTION=="add",ATTRS{idVendor}=="1134",ATTRS{idProduct}=="8001",MODE=="0660",GROUP=="andreas",SYMLINK+="lattice-%n"
#FTDI
SUBSYSTEM=="usb",ACTION=="add",ATTRS{idVendor}=="0403",ATTRS{idProduct}=="6010",MODE=="0666",GROUP=="andreas",SYMLINK+="ftdi-%n"
SUBSYSTEM=="usb",ATTRS{idVendor}=="0403",ATTRS{idProduct}=="6010",RUN+="/bin/sh -c 'basename %p > /sys/bus/usb/drivers/ftdi_sio/unbind'"
```
改进后
```
#Lattice
SUBSYSTEM=="usb",ACTION=="add",ATTRS{idVendor}=="1134",ATTRS{idProduct}=="8001",MODE=="0660",GROUP=="plugdev",SYMLINK+="lattice-%n"
#FTDI
SUBSYSTEM=="usb",ACTION=="add",ATTRS{idVendor}=="0403",ATTRS{idProduct}=="6010",MODE=="0666",GROUP=="plugdev",SYMLINK+="ftdi-%n"
SUBSYSTEM=="usb",ATTRS{idVendor}=="0403",ATTRS{idProduct}=="6010",RUN+="/bin/sh -c 'rmmod ftdi_sio && rmmod usbserial'"
SUBSYSTEM=="usb",ACTION=="add",ATTRS{idVendor}=="0403",ATTRS{idProduct}=="6014",MODE=="0666",GROUP=="plugdev",SYMLINK+="ftdi-%n"
SUBSYSTEM=="usb",ATTRS{idVendor}=="0403",ATTRS{idProduct}=="6014",RUN+="/bin/sh -c 'rmmod ftdi_sio && rmmod usbserial'"
```


39-i4tools.rules
```
SUBSYSTEM=="usb", ATTRS{idVendor}=="05ac", ATTRS{idProduct}=="1281", TAG+="uaccess"
SUBSYSTEM=="usb", ATTRS{idVendor}=="05ac", ATTRS{idProduct}=="1282", TAG+="uaccess"
SUBSYSTEM=="usb", ATTRS{idVendor}=="05ac", ATTRS{idProduct}=="1283", TAG+="uaccess"
SUBSYSTEM=="usb", ATTRS{idVendor}=="05ac", ATTRS{idProduct}=="1227", TAG+="uaccess"
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ENV{PRODUCT}=="5ac/12[0-9a-f][0-9a-f]/*|5ac/1901/*|5ac/8600/*", MODE=0666

# Some user need to "reload rules", use this command:
# sudo udevadm control --reload-rules && udevadm trigger
```
39-usbmuxd.rules
```
# usbmuxd (Apple Mobile Device Muxer listening on /var/run/usbmuxd)

# systemd should receive all events relating to device
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ENV{PRODUCT}=="5ac/12[0-9a-f][0-9a-f]/*", TAG+="systemd"

# Initialize iOS devices into "deactivated" USB configuration state and activate usbmuxd
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ENV{PRODUCT}=="5ac/12[0-9a-f][0-9a-f]/*", ACTION=="add", ENV{USBMUX_SUPPORTED}="1", ATTR{bConfigurationValue}="0", OWNER="usbmux", ENV{SYSTEMD_WANTS}="usbmuxd.service"

# Make sure properties don't get lost when bind action is called
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ENV{PRODUCT}=="5ac/12[0-9a-f][0-9a-f]/*", ACTION=="bind", ENV{USBMUX_SUPPORTED}="1", OWNER="usbmux", ENV{SYSTEMD_WANTS}="usbmuxd.service"

# Exit usbmuxd when the last device is removed
#SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ENV{PRODUCT}=="5ac/12[0-9a-f][0-9a-f]/*", ACTION=="remove", RUN+="/usr/sbin/usbmuxd -x"
```
49-stlinkv1.rules
```
# stm32 discovery boards, with onboard st/linkv1
# ie, STM32VL.

SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3744", \
    MODE="660", GROUP="plugdev", TAG+="uaccess", ENV{ID_MM_DEVICE_IGNORE}="1", \
    SYMLINK+="stlinkv1_%n"
```
49-stlinkv2-1.rules
```
# stm32 nucleo boards, with onboard st/linkv2-1
# ie, STM32F0, STM32F4.

SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", \
    MODE="660", GROUP="plugdev", TAG+="uaccess", ENV{ID_MM_DEVICE_IGNORE}="1", \
    SYMLINK+="stlinkv2-1_%n"

SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3752", \
    MODE="660", GROUP="plugdev", TAG+="uaccess", ENV{ID_MM_DEVICE_IGNORE}="1", \
    SYMLINK+="stlinkv2-1_%n"

```
49-stlinkv2.rules
```
# stm32 discovery boards, with onboard st/linkv2
# ie, STM32L, STM32F4.

SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3748", \
    MODE="660", GROUP="plugdev", TAG+="uaccess", ENV{ID_MM_DEVICE_IGNORE}="1", \
    SYMLINK+="stlinkv2_%n"
```
49-stlinkv3.rules
```
# stlink-v3 boards (standalone and embedded) in usbloader mode and standard (debug) mode

SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374d", \
    MODE="660", GROUP="plugdev", TAG+="uaccess", ENV{ID_MM_DEVICE_IGNORE}="1", \
    SYMLINK+="stlinkv3loader_%n"

SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374e", \
    MODE="660", GROUP="plugdev", TAG+="uaccess", ENV{ID_MM_DEVICE_IGNORE}="1", \
    SYMLINK+="stlinkv3_%n"

SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374f", \
    MODE="660", GROUP="plugdev", TAG+="uaccess", ENV{ID_MM_DEVICE_IGNORE}="1", \
    SYMLINK+="stlinkv3_%n"

SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3753", \
    MODE="660", GROUP="plugdev", TAG+="uaccess", ENV{ID_MM_DEVICE_IGNORE}="1", \
    SYMLINK+="stlinkv3_%n"

SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3754", \
    MODE="660", GROUP="plugdev", TAG+="uaccess", ENV{ID_MM_DEVICE_IGNORE}="1", \
    SYMLINK+="stlinkv3_%n"

SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3755", \
    MODE="660", GROUP="plugdev", TAG+="uaccess", ENV{ID_MM_DEVICE_IGNORE}="1", \
    SYMLINK+="stlinkv3loader_%n"

SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3757", \
    MODE="660", GROUP="plugdev", TAG+="uaccess", ENV{ID_MM_DEVICE_IGNORE}="1", \
    SYMLINK+="stlinkv3_%n"
```
51-altera-usb-blaster.rules
```
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6002", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6003", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6010", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6810", MODE="0666"
```
52-xilinx-digilent-usb.rules
```
###########################################################################
#                                                                         #
#  52-digilent-usb.rules -- UDEV rules for Digilent USB Devices           #
#                                                                         #
###########################################################################
#  Author: MTA                                                            #
#  Copyright 2010 Digilent Inc.                                           #
###########################################################################
#  File Description:                                                      #
#                                                                         #
#  This file contains the rules used by UDEV when creating entries for    #
#  Digilent USB devices. In order for Digilent's shared libraries and     #
#  applications to access these devices without root privalages it is     #
#  necessary for UDEV to create entries for which all users have read     #
#  and write permission.                                                  #
#                                                                         #
#  Usage:                                                                 #
#                                                                         #
#  Copy this file to "/etc/udev/rules.d/" and execute                     #
#  "/sbin/udevcontrol reload_rules" as root. This only needs to be done   #
#  immediately after installation. Each time you reboot your system the   #
#  rules are automatically loaded by UDEV.                                #
#                                                                         #
###########################################################################
#  Revision History:                                                      #
#                                                                         #
#  04/15/2010(MTA): created                                               #
#  02/28/2011(MTA): modified to support FTDI based devices                #
#  07/10/2012(MTA): modified to work with UDEV versions 098 or newer      #
#  04/19/2013(MTA): modified mode assignment to use ":=" insetead of "="  #
#       so that our permission settings can't be overwritten by other     #
#       rules files                                                       #
#  07/28/2014(MTA): changed default application path                      #
#                                                                         #
###########################################################################

# Create "/dev" entries for Digilent device's with read and write
# permission granted to all users.
ATTR{idVendor}=="1443", MODE:="666"
ACTION=="add", ATTR{idVendor}=="0403", ATTR{manufacturer}=="Digilent", MODE:="666"

# The following rules (if present) cause UDEV to ignore all UEVENTS for
# which the subsystem is "usb_endpoint" and the action is "add" or
# "remove". These rules are necessary to work around what appears to be a
# bug in the Kernel used by Red Hat Enterprise Linux 5/CentOS 5. The Kernel
# sends UEVENTS to remove and then add entries for the endpoints of a USB
# device in "/dev" each time a process releases an interface. This occurs
# each time a data transaction occurs. When an FPGA is configured or flash
# device is written a large number of transactions take place. If the
# following lines are commented out then UDEV will be overloaded for a long
# period of time while it tries to process the massive number of UEVENTS it
# receives from the kernel. Please note that this work around only applies
# to systems running RHEL5 or CentOS 5 and as a result the rules will only
# be present on those systems.
```
52-xilinx-ftdi-usb.rules
```
###########################################################################
#                                                                         #
#  52-xilinx-ftdi-usb.rules -- UDEV rules for Xilinx USB Devices          #
#                                                                         #
###########################################################################
#  Author: EST                                                            #
#  Copyright 2016 Xilinx Inc.                                             #
###########################################################################
#  File Description:                                                      #
#                                                                         #
#  This file contains the rules used by UDEV when creating entries for    #
#  Xilinx USB devices. In order for Xilinx's shared libraries and         #
#  applications to access these devices without root privalages it is     #
#  necessary for UDEV to create entries for which all users have read     #
#  and write permission.                                                  #
#                                                                         #
#  Usage:                                                                 #
#                                                                         #
#  Copy this file to "/etc/udev/rules.d/" and execute                     #
#  "/sbin/udevcontrol reload_rules" as root. This only needs to be done   #
#  immediately after installation. Each time you reboot your system the   #
#  rules are automatically loaded by UDEV.                                #
#                                                                         #
###########################################################################
#  Revision History:                                                      #
#                                                                         #
#  10/18/2016(EST): created                                               #
#                                                                         #
###########################################################################
# version 0001
# Create "/dev" entries for Xilinx device's with read and write
# permission granted to all users.
ACTION=="add", ATTR{idVendor}=="0403", ATTR{manufacturer}=="Xilinx", MODE:="666"

# The following rules (if present) cause UDEV to ignore all UEVENTS for
# which the subsystem is "usb_endpoint" and the action is "add" or
# "remove". These rules are necessary to work around what appears to be a
# bug in the Kernel used by Red Hat Enterprise Linux 6/CentOS 5. The Kernel
# sends UEVENTS to remove and then add entries for the endpoints of a USB
# device in "/dev" each time a process releases an interface. This occurs
# each time a data transaction occurs. When an FPGA is configured or flash
# device is written a large number of transactions take place. If the
# following lines are commented out then UDEV will be overloaded for a long
# period of time while it tries to process the massive number of UEVENTS it
# receives from the kernel. Please note that this work around only applies
# to systems running RHEL6 or CentOS 5 and as a result the rules will only
# be present on those systems.
```
52-xilinx-pcusb.rules
```
# version 0002
ATTR{idVendor}=="03fd", ATTR{idProduct}=="0008", MODE="666"
ATTR{idVendor}=="03fd", ATTR{idProduct}=="0007", MODE="666"
ATTR{idVendor}=="03fd", ATTR{idProduct}=="0009", MODE="666"
ATTR{idVendor}=="03fd", ATTR{idProduct}=="000d", MODE="666"
ATTR{idVendor}=="03fd", ATTR{idProduct}=="000f", MODE="666"
ATTR{idVendor}=="03fd", ATTR{idProduct}=="0013", MODE="666"
ATTR{idVendor}=="03fd", ATTR{idProduct}=="0015", MODE="666"
```
60-dreamsourcelab.rules
```
SUBSYSTEM=="usb", ATTRS{idVendor}=="2a0e", MODE="0666"
```
60-vboxdrv.rules
```
KERNEL=="vboxdrv", NAME="vboxdrv", OWNER="root", GROUP="vboxusers", MODE="0660"
KERNEL=="vboxdrvu", NAME="vboxdrvu", OWNER="root", GROUP="root", MODE="0666"
KERNEL=="vboxnetctl", NAME="vboxnetctl", OWNER="root", GROUP="vboxusers", MODE="0660"
SUBSYSTEM=="usb_device", ACTION=="add", RUN+="/usr/lib/virtualbox/VBoxCreateUSBNode.sh $major $minor $attr{bDeviceClass}"
SUBSYSTEM=="usb", ACTION=="add", ENV{DEVTYPE}=="usb_device", RUN+="/usr/lib/virtualbox/VBoxCreateUSBNode.sh $major $minor $attr{bDeviceClass}"
SUBSYSTEM=="usb_device", ACTION=="remove", RUN+="/usr/lib/virtualbox/VBoxCreateUSBNode.sh --remove $major $minor"
SUBSYSTEM=="usb", ACTION=="remove", ENV{DEVTYPE}=="usb_device", RUN+="/usr/lib/virtualbox/VBoxCreateUSBNode.sh --remove $major $minor"
```
61-msp430uif.rules
```
ATTRS{idVendor}=="2047",ATTRS{idProduct}=="0010",MODE="0666"
ATTRS{idVendor}=="2047",ATTRS{idProduct}=="0013",MODE="0666"
ATTRS{idVendor}=="2047",ATTRS{idProduct}=="0014",MODE="0666"
ATTRS{idVendor}=="2047",ATTRS{idProduct}=="0203",MODE="0666"
ATTRS{idVendor}=="2047",ATTRS{idProduct}=="0204",MODE="0666"
ATTRS{idVendor}=="0451",ATTRS{idProduct}=="f432",MODE="0666"
```
70-mm-no-ti-emulators.rules
```
ACTION!="add|change", GOTO="mm_usb_device_blacklist_end"
SUBSYSTEM!="usb", GOTO="mm_usb_device_blacklist_end"
ENV{DEVTYPE}!="usb_device",  GOTO="mm_usb_device_blacklist_end"

# TI USB Emulators
ATTRS{idVendor}=="2047", ATTRS{idProduct}=="0010", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTRS{idVendor}=="2047", ATTRS{idProduct}=="0013", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTRS{idVendor}=="2047", ATTRS{idProduct}=="0014", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTRS{idVendor}=="2047", ATTRS{idProduct}=="0203", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTRS{idVendor}=="2047", ATTRS{idProduct}=="0204", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTRS{idVendor}=="0451", ATTRS{idProduct}=="F432", ENV{ID_MM_DEVICE_IGNORE}="1"

LABEL="mm_usb_device_blacklist_end"
```
70-ttyusb.rules
```
KERNEL=="ttyUSB[0-9]*",MODE="0666"
```
71-ti-permissions.rules
```
SUBSYSTEM=="usb",ENV{DEVTYPE}=="usb_device",ATTRS{idVendor}=="0403",ATTRS{idProduct}=="a6d0",MODE:="0666"
SUBSYSTEM=="usb",ENV{DEVTYPE}=="usb_device",ATTRS{idVendor}=="0403",ATTRS{idProduct}=="a6d1",MODE:="0666"
SUBSYSTEM=="usb",ENV{DEVTYPE}=="usb_device",ATTRS{idVendor}=="0403",ATTRS{idProduct}=="6010",MODE:="0666"
SUBSYSTEM=="usb",ENV{DEVTYPE}=="usb_device",ATTRS{idVendor}=="0403",ATTRS{idProduct}=="bcd9",MODE:="0666"
SUBSYSTEM=="usb",ENV{DEVTYPE}=="usb_device",ATTRS{idVendor}=="0403",ATTRS{idProduct}=="bcda",MODE:="0666"
SUBSYSTEM=="usb",ENV{DEVTYPE}=="usb_device",ATTRS{idVendor}=="1cbe",ATTRS{idProduct}=="00fd",MODE:="0666"
SUBSYSTEM=="usb",ENV{DEVTYPE}=="usb_device",ATTRS{idVendor}=="1cbe",ATTRS{idProduct}=="00ff",MODE:="0666"
SUBSYSTEM=="usb",ENV{DEVTYPE}=="usb_device",ATTRS{idVendor}=="0451",ATTRS{idProduct}=="bef1",MODE:="0666"
SUBSYSTEM=="usb",ENV{DEVTYPE}=="usb_device",ATTRS{idVendor}=="0451",ATTRS{idProduct}=="bef2",MODE:="0666"
SUBSYSTEM=="usb",ENV{DEVTYPE}=="usb_device",ATTRS{idVendor}=="0451",ATTRS{idProduct}=="bef3",MODE:="0666"
SUBSYSTEM=="usb",ENV{DEVTYPE}=="usb_device",ATTRS{idVendor}=="0451",ATTRS{idProduct}=="bef4",MODE:="0666"
SUBSYSTEM=="usb",ENV{DEVTYPE}=="usb_device",ATTRS{idVendor}=="0451",ATTRS{idProduct}=="c32a",MODE:="0666"
ATTRS{idVendor}=="0451",ATTRS{idProduct}=="bef0",ENV{ID_MM_DEVICE_IGNORE}="1"
ATTRS{idVendor}=="0c55",ATTRS{idProduct}=="0220",ENV{ID_MM_DEVICE_IGNORE}="1"
KERNEL=="ttyACM[0-9]*",MODE:="0666"

```
cat 95-tty0tty.rules
```
KERNEL=="tnt[0-7]", SUBSYSTEM=="tty", GROUP="uucp", MODE="0660"
```
99-jlink.rules
```
#
# This file is going to be stored at /etc/udev/rules.d on installation of the J-Link package
# It makes sure that non-superuser have access to the connected J-Links, so JLinkExe etc. can be executed as non-superuser and can work with J-Link
#
#
# Matches are AND combined, meaning: a==b,c==d,do stuff
# results in:                        if (a == b) && (c == d) -> do stuff
#
ACTION!="add", SUBSYSTEM!="usb_device", GOTO="jlink_rules_end"
#
# Give all users read and write access.
# Note: NOT all combinations are supported by J-Link right now. Some are reserved for future use, but already added here
#
# ATTR{filename}
#                  Match sysfs attribute values of the event device. Trailing
#                  whitespace in the attribute values is ignored unless the specified
#                  match value itself contains trailing whitespace.
#
# ATTRS{filename}
#                  Search the devpath upwards for a device with matching sysfs
#                  attribute values. If multiple ATTRS matches are specified, all of
#                  them must match on the same device. Trailing whitespace in the
#                  attribute values is ignored unless the specified match value itself
#                  contains trailing whitespace.
#
# How to find out about udev attributes of device:
# Connect J-Link to PC
# Terminal: cat /var/log/syslog
# Find path to where J-Link device has been "mounted"
# sudo udevadm info --query=all --attribute-walk --path=<PathExtractedFromSyslog>
# sudo udevadm info --attribute-walk /dev/bus/usb/<Bus>/<Device> (extract <Bus> and <Device> from "lsusb")
# Reload udev rules after rules file change:
#   sudo udevadm control --reload-rules
#   sudo udevadm trigger
#
# [old format]
# 0x0101 - J-Link (default)                 | Flasher STM8 | Flasher ARM | Flasher 5 PRO
# 0x0102 - J-Link USBAddr = 1 (obsolete)
# 0x0103 - J-Link USBAddr = 2 (obsolete)
# 0x0104 - J-Link USBAddr = 3 (obsolete)
# 0x0105 - CDC + J-Link
# 0x0106 - CDC
# 0x0107 - RNDIS  + J-Link
# 0x0108 - J-Link + MSD
#
ATTR{idProduct}=="0101", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="0102", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="0103", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="0104", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="0105", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="0107", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="0108", ATTR{idVendor}=="1366", MODE="666"
#
# Make sure that J-Links are not captured by modem manager service
# as this service would try detect J-Link as a modem and send AT commands via the VCOM component which might not be liked by the target...
#
ATTR{idProduct}=="0101", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="0102", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="0103", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="0104", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="0105", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="0107", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="0108", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
#
# J-Link Product-Id assignment:
# 0x1000 +
# Bit 0: MSD
# Bit 1: RNDIS
# Bit 2: CDC
# Bit 3: HID
# Bit 4: J-Link (BULK via SEGGER host driver)
# Bit 5: J-Link (BULK via WinUSB driver. Needs to be enabled in J-Link config area)
#
# [new format]
# 0x1001: MSD
# 0x1002: RNDIS
# 0x1003: RNDIS  + MSD
# 0x1004: CDC
# 0x1005: CDC    + MSD
# 0x1006: RNDIS  + CDC
# 0x1007: RNDIS  + CDC    + MSD
# 0x1008: HID
# 0x1009: MSD    + HID
# 0x100a: RNDIS  + HID
# 0x100b: RNDIS  + MSD    + HID
# 0x100c: CDC    + HID
# 0x100d: CDC    + MSD    + HID
# 0x100e: RNDIS  + CDC    + HID
# 0x100f: RNDIS  + CDC    + MSD + HID
# 0x1010: J_LINK_SEGGER_DRV
# 0x1011: J_LINK_SEGGER_DRV                             + MSD
# 0x1012: J_LINK_SEGGER_DRV                  + RNDIS
# 0x1013: J_LINK_SEGGER_DRV                  + RNDIS    + MSD
# 0x1014: J_LINK_SEGGER_DRV          + CDC              
# 0x1015: J_LINK_SEGGER_DRV          + CDC              + MSD
# 0x1016: J_LINK_SEGGER_DRV          + CDC   + RNDIS
# 0x1017: J_LINK_SEGGER_DRV          + CDC   + RNDIS    + MSD
# 0x1018: J_LINK_SEGGER_DRV + HID
# 0x1019: J_LINK_SEGGER_DRV + HID                       + MSD
# 0x101a: J_LINK_SEGGER_DRV + HID            + RNDIS
# 0x101b: J_LINK_SEGGER_DRV + HID            + RNDIS    + MSD
# 0x101c: J_LINK_SEGGER_DRV + HID    + CDC
# 0x101d: J_LINK_SEGGER_DRV + HID    + CDC              + MSD
# 0x101e: J_LINK_SEGGER_DRV + HID    + CDC   + RNDIS
# 0x101f: J_LINK_SEGGER_DRV + HID    + CDC   + RNDIS    + MSD
# 0x1020: J_LINK_WINUSB_DRV 
# 0x1021: J_LINK_WINUSB_DRV                             + MSD
# 0x1022: J_LINK_WINUSB_DRV                  + RNDIS
# 0x1023: J_LINK_WINUSB_DRV                  + RNDIS    + MSD
# 0x1024: J_LINK_WINUSB_DRV          + CDC              
# 0x1025: J_LINK_WINUSB_DRV          + CDC              + MSD
# 0x1026: J_LINK_WINUSB_DRV          + CDC   + RNDIS
# 0x1027: J_LINK_WINUSB_DRV          + CDC   + RNDIS    + MSD
# 0x1028: J_LINK_WINUSB_DRV + HID
# 0x1029: J_LINK_WINUSB_DRV + HID                       + MSD
# 0x102a: J_LINK_WINUSB_DRV + HID            + RNDIS
# 0x102b: J_LINK_WINUSB_DRV + HID            + RNDIS    + MSD
# 0x102c: J_LINK_WINUSB_DRV + HID    + CDC
# 0x102d: J_LINK_WINUSB_DRV + HID    + CDC              + MSD
# 0x102e: J_LINK_WINUSB_DRV + HID    + CDC   + RNDIS
# 0x102f: J_LINK_WINUSB_DRV + HID    + CDC   + RNDIS    + MSD
# 0x103x: J_LINK_SEGGER_DRV + J_LINK_WINUSB_DRV does not make any sense, therefore skipped
# 0x1050: J_LINK_SEGGER_DRV          + 2x CDC
# 0x1051: J_LINK_SEGGER_DRV          + 2x CDC              + MSD
# 0x1052: J_LINK_SEGGER_DRV          + 2x CDC   + RNDIS
# 0x1053: J_LINK_SEGGER_DRV          + 2x CDC   + RNDIS    + MSD
# 0x1054: J_LINK_SEGGER_DRV          + 3x CDC
# 0x1055: J_LINK_SEGGER_DRV          + 3x CDC              + MSD
# 0x1056: J_LINK_SEGGER_DRV          + 3x CDC   + RNDIS
# 0x1057: J_LINK_SEGGER_DRV          + 3x CDC   + RNDIS    + MSD
# 0x1058: J_LINK_SEGGER_DRV + HID    + 2x CDC
# 0x1059: J_LINK_SEGGER_DRV + HID    + 2x CDC              + MSD
# 0x105a: J_LINK_SEGGER_DRV + HID    + 2x CDC   + RNDIS
# 0x105b: J_LINK_SEGGER_DRV + HID    + 2x CDC   + RNDIS    + MSD
# 0x105c: J_LINK_SEGGER_DRV + HID    + 3x CDC
# 0x105d: J_LINK_SEGGER_DRV + HID    + 3x CDC              + MSD
# 0x105e: J_LINK_SEGGER_DRV + HID    + 3x CDC   + RNDIS
# 0x105f: J_LINK_SEGGER_DRV + HID    + 3x CDC   + RNDIS    + MSD
# 0x1060: J_LINK_WINUSB_DRV          + 2x CDC
# 0x1061: J_LINK_WINUSB_DRV          + 2x CDC              + MSD
# 0x1062: J_LINK_WINUSB_DRV          + 2x CDC   + RNDIS
# 0x1063: J_LINK_WINUSB_DRV          + 2x CDC   + RNDIS    + MSD
# 0x1064: J_LINK_WINUSB_DRV          + 3x CDC
# 0x1065: J_LINK_WINUSB_DRV          + 3x CDC              + MSD
# 0x1066: J_LINK_WINUSB_DRV          + 3x CDC   + RNDIS
# 0x1067: J_LINK_WINUSB_DRV          + 3x CDC   + RNDIS    + MSD
# 0x1068: J_LINK_WINUSB_DRV + HID    + 2x CDC
# 0x1069: J_LINK_WINUSB_DRV + HID    + 2x CDC              + MSD
# 0x106a: J_LINK_WINUSB_DRV + HID    + 2x CDC   + RNDIS
# 0x106b: J_LINK_WINUSB_DRV + HID    + 2x CDC   + RNDIS    + MSD
# 0x106c: J_LINK_WINUSB_DRV + HID    + 3x CDC
# 0x106d: J_LINK_WINUSB_DRV + HID    + 3x CDC              + MSD
# 0x106e: J_LINK_WINUSB_DRV + HID    + 3x CDC   + RNDIS
# 0x106f: J_LINK_WINUSB_DRV + HID    + 3x CDC   + RNDIS    + MSD
#
ATTR{idProduct}=="1001", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1002", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1003", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1004", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1005", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1006", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1007", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1008", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1009", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="100a", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="100b", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="100c", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="100d", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="100e", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="100f", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1010", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1011", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1012", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1013", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1014", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1015", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1016", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1017", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1018", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1019", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="101a", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="101b", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="101c", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="101d", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="101e", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="101f", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1020", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1021", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1022", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1023", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1024", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1025", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1026", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1027", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1028", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1029", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="102a", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="102b", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="102c", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="102d", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="102e", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="102f", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1050", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1051", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1052", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1053", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1054", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1055", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1056", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1057", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1058", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1059", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="105a", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="105b", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="105c", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="105d", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="105e", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="105f", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1060", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1061", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1062", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1063", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1064", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1065", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1066", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1067", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1068", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="1069", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="106a", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="106b", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="106c", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="106d", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="106e", ATTR{idVendor}=="1366", MODE="666"
ATTR{idProduct}=="106f", ATTR{idVendor}=="1366", MODE="666"
#
# Handle known CMSIS-DAP probes (taken from mbed website and OpenOCD):
#   VID 0x1366 (SEGGER)
#     PID 0x1008-100f, 0x1018-101f, 0x1028-102f, 0x1058-105f, 0x1068-106f (SEGGER J-Link)
#     We cover all of them via idProduct=10* and idVendor=1366
#
#   VID 0xC251 (Keil)
#     PID 0xF001: (LPC-Link-II CMSIS_DAP)
#     PID 0xF002: (OpenSDA CMSIS_DAP Freedom Board)
#     PID 0x2722: (Keil ULINK2 CMSIS-DAP)
#   VID 0x0D28 (mbed)
#     PID 0x0204: MBED CMSIS-DAP
#
KERNEL=="hidraw*", ATTRS{idProduct}=="10*",  ATTRS{idVendor}=="1366", MODE="666"
KERNEL=="hidraw*", ATTRS{idProduct}=="f001", ATTRS{idVendor}=="c251", MODE="666"
KERNEL=="hidraw*", ATTRS{idProduct}=="f002", ATTRS{idVendor}=="c251", MODE="666"
KERNEL=="hidraw*", ATTRS{idProduct}=="2722", ATTRS{idVendor}=="c251", MODE="666"
KERNEL=="hidraw*", ATTRS{idProduct}=="0204", ATTRS{idVendor}=="c251", MODE="666"
KERNEL=="hidraw*", ATTRS{idProduct}=="f001", ATTRS{idVendor}=="0d28", MODE="666"
KERNEL=="hidraw*", ATTRS{idProduct}=="f002", ATTRS{idVendor}=="0d28", MODE="666"
KERNEL=="hidraw*", ATTRS{idProduct}=="2722", ATTRS{idVendor}=="0d28", MODE="666"
KERNEL=="hidraw*", ATTRS{idProduct}=="0204", ATTRS{idVendor}=="0d28", MODE="666"
#
# Make sure that J-Links are not captured by modem manager service
# as this service would try detect J-Link as a modem and send AT commands via the VCOM component which might not be liked by the target...
#
ATTR{idProduct}=="1001", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1002", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1003", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1004", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1005", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1006", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1007", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1008", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1009", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="100a", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="100b", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="100c", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="100d", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="100e", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="100f", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1010", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1011", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1012", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1013", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1014", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1015", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1016", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1017", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1018", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1019", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="101a", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="101b", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="101c", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="101d", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="101e", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="101f", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1020", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1021", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1022", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1023", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1024", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1025", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1026", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1027", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1028", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1029", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="102a", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="102b", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="102c", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="102d", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="102e", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="102f", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1050", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1051", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1052", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1053", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1054", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1055", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1056", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1057", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1058", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1059", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="105a", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="105b", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="105c", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="105d", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="105e", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="105f", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1060", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1061", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1062", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1063", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1064", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1065", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1066", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1067", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1068", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="1069", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="106a", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="106b", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="106c", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="106d", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="106e", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="106f", ATTR{idVendor}=="1366", ENV{ID_MM_DEVICE_IGNORE}="1"
#
# Handle known CMSIS-DAP probes (taken from mbed website and OpenOCD):
#   VID 0xC251 (Keil)
#     PID 0xF001: (LPC-Link-II CMSIS_DAP)
#     PID 0xF002: (OpenSDA CMSIS_DAP Freedom Board)
#     PID 0x2722: (Keil ULINK2 CMSIS-DAP)
#   VID 0x0D28 (mbed)
#     PID 0x0204: MBED CMSIS-DAP
#
ATTR{idProduct}=="f001", ATTR{idVendor}=="c251", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="f002", ATTR{idVendor}=="c251", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="2722", ATTR{idVendor}=="c251", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="0204", ATTR{idVendor}=="c251", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="f001", ATTR{idVendor}=="0d28", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="f002", ATTR{idVendor}=="0d28", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="2722", ATTR{idVendor}=="0d28", ENV{ID_MM_DEVICE_IGNORE}="1"
ATTR{idProduct}=="0204", ATTR{idVendor}=="0d28", ENV{ID_MM_DEVICE_IGNORE}="1"
#
# Make sure that VCOM ports of J-Links can be opened with user rights
# We simply say that all devices from SEGGER which are in the "tty" domain are enumerated with normal user == R/W
#
SUBSYSTEM=="tty", ATTRS{idVendor}=="1366", MODE="0666", GROUP="dialout"
SUBSYSTEM=="tty", ATTRS{idVendor}=="c251", MODE="0666", GROUP="dialout"
SUBSYSTEM=="tty", ATTRS{idVendor}=="0d28", MODE="0666", GROUP="dialout"
#
# End of list
#
LABEL="jlink_rules_end"
```
99-Kingst.rules
```
# Kingst Virtual Instruments
# This file should be installed to /etc/udev/rules.d so that you can access the hardware without being root
#
# type this at the command prompt: sudo cp 99-Kingst.rules /etc/udev/rules.d

SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="77a1", ATTR{idProduct}=="01a1", MODE="0666"
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="77a1", ATTR{idProduct}=="01a2", MODE="0666"
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="77a1", ATTR{idProduct}=="01a3", MODE="0666"
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="77a1", ATTR{idProduct}=="01a4", MODE="0666"
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="77a1", ATTR{idProduct}=="02a1", MODE="0666"
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="77a1", ATTR{idProduct}=="02a2", MODE="0666"
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="77a1", ATTR{idProduct}=="02a3", MODE="0666"
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="77a1", ATTR{idProduct}=="03a1", MODE="0666"
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="77a1", ATTR{idProduct}=="03a2", MODE="0666"
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="77a1", ATTR{idProduct}=="03a3", MODE="0666"
```
99-SaleaeLogic.rules
```
# Saleae Logic Analyzer
# This file should be installed to /etc/udev/rules.d so that you can access the Logic hardware without being root
#
# type this at the command prompt: sudo cp 99-SaleaeLogic.rules /etc/udev/rules.d

SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="0925", ATTR{idProduct}=="3881", MODE="0666"
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="21a9", ATTR{idProduct}=="1001", MODE="0666"
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="21a9", ATTR{idProduct}=="1003", MODE="0666"
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="21a9", ATTR{idProduct}=="1004", MODE="0666"
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="21a9", ATTR{idProduct}=="1005", MODE="0666"
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="21a9", ATTR{idProduct}=="1006", MODE="0666"

```
reload rules
```
sudo udevadm control --reload-rules
```

---
***
# something
```
sudo apt-get install libftdi-dev fxload libc6-dev libusb-dev build-essential
```

---
***
# su权限文件怎么 通过管道修改
```
cat xxx | sudo tee xxxx
echo xxx | sudo tee xxxx
echo xxx | sudo tee -a xxxx
```


***
# FT2232C
```
$ ls -l /dev/bus/usb/001/008
crw-rw-rw-+ 1 root plugdev 189, 7 Jul 10 13:28 /dev/bus/usb/001/008
```
```
$ getfacl /dev/bus/usb/001/008
getfacl: Removing leading '/' from absolute path names
# file: dev/bus/usb/001/008
# owner: root
# group: plugdev
user::rw-
user:andreas:rw-
group::rw-
mask::rw-
other::rw-

```
```
$ ls -l /dev/bus/usb/*/*
crw-rw-r--  1 root root    189,   0 Jul 10 09:19 /dev/bus/usb/001/001
crw-rw-r--  1 root root    189,   1 Jul 10 09:19 /dev/bus/usb/001/002
crw-rw----+ 1 root plugdev 189,   2 Jul 10 09:19 /dev/bus/usb/001/003
crw-rw-r--  1 root root    189,   3 Jul 10 09:19 /dev/bus/usb/001/004
crw-rw-r--  1 root root    189,   4 Jul 10 09:19 /dev/bus/usb/001/005
crw-rw-r--  1 root root    189,   6 Jul 10 09:19 /dev/bus/usb/001/007
crw-rw-rw-+ 1 root plugdev 189,   7 Jul 10 13:28 /dev/bus/usb/001/008
crw-rw-r--  1 root root    189,  10 Jul 10 13:04 /dev/bus/usb/001/011
crw-rw-r--  1 root root    189,  12 Jul 10 13:09 /dev/bus/usb/001/013
crw-rw-r--  1 root root    189, 128 Jul 10 09:19 /dev/bus/usb/002/001
crw-rw-r--  1 root root    189, 129 Jul 10 09:19 /dev/bus/usb/002/002
crw-rw-r--  1 root root    189, 130 Jul 10 09:19 /dev/bus/usb/002/003
crw-rw-r--  1 root root    189, 131 Jul 10 09:19 /dev/bus/usb/002/004
crw-rw-r--  1 root root    189, 132 Jul 10 09:23 /dev/bus/usb/002/005
```

***
#
```
$ sudo apt install lightdm lightdm-gtk-greeter
/var/log/apt/*.log

实际上安装了lightdm-gtk-greeter会导致显示很不爽，丢失默认配置
$ sudo apt remove gnome-themes-standard lightdm-gtk-greeter

```



***
# anydesk
安装deb文件
附加安装 libgtkglext1
添加服务
/etc/systemd/system/multi-user.target.wants/anydesk.service → /etc/systemd/system/anydesk.service.
usbstick地址码:
`711 296 904`

```
sudo systemctl enable anydesk.service
sudo systemctl start anydesk.service
```
设置 anydesk 无人值守
```
echo "password" | sudo anydesk --set-password
sudo systemctl restart anydesk.service 
```

***
#
```
sudo apt-get update
sudo apt autoremove
sudo apt-get install software-properties-common
sudo apt-get install uuid uuid-dev zlib1g-dev liblz-dev liblzo2-2 lzop git curl u-boot-tools mtd-utils android-sdk-libsparse-utils openjdk-8-jdk device-tree-compiler gdisk m4 make bc fakeroot unzip zip gawk busybox libstdc++6 lib32stdc++6 bison flex python libssl-dev cpio rsync


sudo aptitude install liblzo2-dev
     Downgrade the following packages:                         
1)     liblzo2-2 [2.10-2~18.04.sav0 (now) -> 2.08-1.2 (bionic)]
The following packages will be DOWNGRADED:
  liblzo2-2 
The following NEW packages will be installed:
  liblzo2-dev 

sudo apt-get install lz4
Package 'lz4' has no installation candidate

but liblz4-1 installed
i A liblz4-1                                                                                          - Fast LZ compression algorithm library - runtime                                                            
i A liblz4-1:i386                                                                                     - Fast LZ compression algorithm library - runtime   


sudo aptitude install liblz4-tool
      Remove the following packages:                                                          
1)      libwireshark15 [3.6.2-2~18.04.sav0 (now)]                                             
2)      libwiretap12 [3.6.2-2~18.04.sav0 (now)]                                               

      Install the following packages:                                                         
3)      libwireshark11 [2.6.10-1~ubuntu18.04.0 (bionic-updates)]                              
4)      libwiretap8 [2.6.10-1~ubuntu18.04.0 (bionic-updates)]                                 
5)      libwscodecs2 [2.6.10-1~ubuntu18.04.0 (bionic-updates)]                                
6)      libwsutil9 [2.6.10-1~ubuntu18.04.0 (bionic-updates)]                                  

      Downgrade the following packages:                                                       
7)      liblz4-1 [1.9.3-2~18.04.sav0 (now) -> 0.0~r131-2ubuntu3.1 (bionic-updates)]           
8)      liblz4-1:i386 [1.9.3-2~18.04.sav0 (now) -> 0.0~r131-2ubuntu3.1 (bionic-updates)]      
9)      wireshark [3.6.2-2~18.04.sav0 (now) -> 2.6.10-1~ubuntu18.04.0 (bionic-updates)]       
10)     wireshark-common [3.6.2-2~18.04.sav0 (now) -> 2.6.10-1~ubuntu18.04.0 (bionic-updates)]
11)     wireshark-qt [3.6.2-2~18.04.sav0 (now) -> 2.6.10-1~ubuntu18.04.0 (bionic-updates)] 

The following packages will be DOWNGRADED:
  liblz4-1 liblz4-1:i386 wireshark wireshark-common wireshark-qt 
The following NEW packages will be installed:
  liblz4-tool libwireshark11{a} libwiretap8{a} libwscodecs2{a} libwsutil9{a} 
The following packages will be REMOVED:
  libbcg729-0{u} libwireshark15{a} libwiretap12{a} libwsutil13{u} 
0 packages upgraded, 5 newly installed, 5 downgraded, 4 to remove and 35 not upgraded.



sudo apt-get install openssh-server vim git fakeroot
sudo apt-get install repo git ssh make gcc libssl-dev liblz4-tool expect g++ patchelf chrpath gawk texinfo chrpath diffstat binfmt-support qemu-user-static live-build bison flex fakeroot cmake gcc-multilib g++-multilib unzip device-tree-compiler python-pip libncurses5-dev

The following additional packages will be installed:
  g++-7-multilib lib32stdc++-7-dev libx32stdc++-7-dev python-kerberos tcl-expect
Suggested packages:
  lib32stdc++6-7-dbg libx32stdc++6-7-dbg win32-loader gnu-fdisk
The following NEW packages will be installed:
  expect g++-7-multilib g++-multilib lib32stdc++-7-dev libx32stdc++-7-dev live-build patchelf python-kerberos repo tcl-expect


sudo apt-get install expect time build-essential kmod
// sudo apt-get install python3.9
sudo apt-get install net-tools


sudo apt-get install libncurses*

The following additional packages will be installed:
  gnu-smalltalk gnu-smalltalk-common libtinfo5-dbg
Suggested packages:
  gnu-smalltalk-doc
The following NEW packages will be installed:
  gnu-smalltalk gnu-smalltalk-common libncurses-gst libncurses5-dbg libncursesada-doc libncursesada5 libncursesada5-dev libncursesw5-dbg libtinfo5-dbg


sudo apt-get install repo git ssh make gcc libssl-dev liblz4-tool expect g++ patchelf chrpath gawk texinfo chrpath diffstat binfmt-support qemu-user-static live-build bison flex fakeroot cmake gcc-multilib g++-multilib unzip device-tree-compiler ncurses-dev


sudo apt install gcc-aarch64-linux-gnu
```

***
# mp4v2
```
$ sudo apt-get build-dep mp4v2
$ sudo apt-get install build-essential fakeroot subversion cvs dpkg-dev devscripts
...
Suggested packages:
  mksh rcs
The following NEW packages will be installed:
  cvs
...
$ mkdir src; cd src
$ apt-get source mp4v2
$ cd mp4v2-2.0.0~dfsg0
//patch -p1 < SomePackagePatch.patch
//debchange -i
//dpkg-source --commit
// $ debuild -us -uc -i -I
// $ dpkg-buildpackage -us -uc
// $ sudo dpkg-buildpackage -b -uc -us
$ dpkg-buildpackage -rfakeroot -b -uc -us


解包
$ dpkg-source -x mp4v2_2.0.0~dfsg0-6.dsc 
$ cd mp4v2-2.0.0~dfsg0
$ dpkg-buildpackage -rfakeroot -b -uc -us
```

***
# 远程桌面
```
sudo apt-get install rdesktop grdesktop

Suggested packages:
  pcscd
The following NEW packages will be installed:
  grdesktop libgssglue1 rdesktop


rdesktop -a 16 -r sound:local -r clipboard:PRIMARYCLIPBOARD -r disk:sunray=/home/andreas -f 192.168.0.93 &


realvnc:
sudo apt install xserver-xorg-video-dummy
sudo vncinitconfig -enable-system-xorg
```

***
# 腾讯会议
```
sudo dpkg -i TencentMeeting_0300000000_3.15.1.403_x86_64_default.publish.deb

/opt/wemeet/wemeetapp.sh %u
```

***
# heif-convert
```
sudo apt-get install libheif1 libheif-examples libheif-dev
heif-info
heif-enc
heif-convert
```
```
heif-enc -q 50 example.png
for file in *.heic; do heif-convert $file ${file/%.heic/.jpg}; done
```

尝试 eog 直接浏览，还不行

<https://launchpad.net/~strukturag/+archive/ubuntu/libheif>
<https://launchpad.net/~savoury1/+archive/ubuntu/graphics>
<https://launchpad.net/ubuntu/+source/libheif>
```
sudo add-apt-repository ppa:savoury1/graphics
sudo add-apt-repository ppa:strukturag/libheif

# sudo apt-get install libheif1 libheif-examples libheif-dev heif-gdk-pixbuf heif-thumbnailer libheif-plugin-aomdec libheif-plugin-aomenc libheif-plugin-dav1d libheif-plugin-libde265 libheif-plugin-rav1e libheif-plugin-svtenc libheif-plugin-x265

sudo apt-get install libheif1 libheif-examples libheif-dev heif-gdk-pixbuf heif-thumbnailer libheif-plugin-aomdec libheif-plugin-aomenc libheif-plugin-dav1d libheif-plugin-libde265 libheif-plugin-x265

The following additional packages will be installed:
  libaom-dev libaom3 libdav1d-dev libdav1d7 libde265-0 libde265-dev libsharpyuv-dev libsharpyuv0 libwebp-dev libwebp7 libwebpdecoder3 libwebpdemux2 libwebpmux3 libx265-199
Suggested packages:
  libheif-plugin-ffmpegdec libheif-plugin-jpegdec libheif-plugin-jpegenc libheif-plugin-j2kdec libheif-plugin-j2kenc
The following NEW packages will be installed:
  heif-gdk-pixbuf heif-thumbnailer libaom-dev libaom3 libdav1d-dev libdav1d7 libde265-dev libheif-plugin-aomdec libheif-plugin-aomenc libheif-plugin-dav1d libheif-plugin-libde265 libheif-plugin-x265
  libsharpyuv-dev libsharpyuv0 libwebp7 libwebpdecoder3 libx265-199
The following packages will be upgraded:
  libde265-0 libheif-dev libheif-examples libheif1 libwebp-dev libwebpdemux2 libwebpmux3


# sudo apt-get install libheif-plugin-ffmpegdec libheif-plugin-jpegdec libheif-plugin-jpegenc libheif-plugin-j2kdec libheif-plugin-j2kenc

sudo apt-get install libheif-plugin-jpegdec libheif-plugin-jpegenc libheif-plugin-j2kdec libheif-plugin-j2kenc

sudo apt-get install libavif-gdk-pixbuf

The following NEW packages will be installed:
  libabsl2206 libavif-gdk-pixbuf libavif16 libgav1-1 libyuv0

$ sudo apt-get install eog-plugins
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  eog-plugin-disable-dark-theme eog-plugin-exif-display eog-plugin-export-to-folder eog-plugin-fit-to-width eog-plugin-fullscreen-background eog-plugin-hide-titlebar eog-plugin-map eog-plugin-maximize-windows
  eog-plugin-picasa eog-plugin-python-console eog-plugin-send-by-mail eog-plugin-slideshow-shuffle eog-plugins-common libchamplain-0.12-0 libchamplain-gtk-0.12-0
The following NEW packages will be installed:
  eog-plugin-disable-dark-theme eog-plugin-exif-display eog-plugin-export-to-folder eog-plugin-fit-to-width eog-plugin-fullscreen-background eog-plugin-hide-titlebar eog-plugin-map eog-plugin-maximize-windows
  eog-plugin-picasa eog-plugin-python-console eog-plugin-send-by-mail eog-plugin-slideshow-shuffle eog-plugins eog-plugins-common libchamplain-0.12-0 libchamplain-gtk-0.12-0
0 upgraded, 16 newly installed, 0 to remove and 282 not upgraded.


sudo apt install heif-gdk-pixbuf heif-thumbnailer gimagereader gpicview


```
反正直接看不了。ffmepg也不支持，转换之后再用其他图片压缩



***
# flatpak + handbrake
```
sudo apt install flatpak gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub fr.handbrake.ghb        or              flatpak --user install fr.handbrake.ghb         or      sudo flatpak install fr.handbrake.ghb
flatpak run fr.handbrake.ghb

sudo apt install nasm
```
or
```
flatpak --user install HandBrake-1.4.2-x86_64.flatpak
flatpak --user install HandBrakeCLI-1.4.2-x86_64.flatpak
Download the latest snapshot from the [development snapshot builds](https://github.com/HandBrake/HandBrake-snapshots)[^nightly-builds]
flatpak --user install fr.handbrake.ghb-20210720182537-a01549c9c-master-x86_64.flatpak
```

***
# native handbrake
```
sudo apt install handbrake handbrake-cli
```


***
# ffmpeg
```
检查 intel 显卡加速
ffmpeg -encoders -hide_banner | grep -i qsv
ffmpeg -decoders -hide_banner | grep -i qsv

ffmpeg -hide_banner -h encoder=h264_nvenc
```
***
#
```
sudo apt-get update

sudo apt-get install repo git-core gitk git-gui gcc-arm-linux-gnueabihf u-boot-tools device-tree-compiler \
gcc-aarch64-linux-gnu mtools parted libudev-dev libusb-1.0-0-dev python-linaro-image-tools \
linaro-image-tools gcc-arm-linux-gnueabihf libssl-dev liblz4-tool genext2fs lib32stdc++6 \
gcc-aarch64-linux-gnu g+conf autotools-dev libsigsegv2 m4 intltool libdrm-dev curl sed make \
binutils build-essential gcc g++ bash patch gzip bzip2 perl tar cpio python unzip rsync file bc wget \
libncurses5 libqt4-dev libglib2.0-dev libgtk2.0-dev libglade2-dev cvs git mercurial rsync openssh-client \
subversion asciidoc w3m dblatex graphviz python-matplotlib libssl-dev texinfo fakeroot \
libparse-yapp-perl default-jre patchutils swig chrpath diffstat gawk time expect-dev

sudo apt-get install repo git ssh make gcc libssl-dev liblz4-tool \
expect g++ patchelf chrpath gawk texinfo chrpath diffstat binfmt-support \
qemu-user-static live-build bison flex fakeroot cmake gcc-multilib g++-multilib \
unzip \
device-tree-compiler ncurses-dev



初始化sdk

mkdir rk3588_sdk
cd rk3588_sdk
repo init --no-clone-bundle --repo-url https://gitlab.com/firefly-linux/git-repo.git -u https://gitlab.com/firefly-linux/manifests.git -b master -m rk3588_linux_release.xml
.repo/repo/repo sync -c --no-tags
cd .repo/repo
git pull
.repo sync
cd -
.repo/repo/repo start firefly --all

mkdir rk3399_sdk
cd rk3399_sdk
repo init --no-clone-bundle --repo-url https://gitlab.com/firefly-linux/git-repo.git -u https://gitlab.com/firefly-linux/manifests.git -b master -m rk3399_linux_release.xml
.repo/repo/repo sync -c --no-tags
cd .repo/repo
git pull
.repo sync
cd -
.repo/repo/repo start firefly --all


同步sdk
.repo/repo/repo sync -c --no-tags
```


***
# 电驴 BT种子 磁力链接 下载
bt magnet 用 qbittorrent / Transmission/ deluge 还是挺好的
```
sudo apt-get install deluge deluge-common deluge-gtk deluge-torrent deluged deluge-console deluge-web deluge-webui
sudo apt-get install mldonkey-gui
sudo apt-get install amule amule-common amule-utils amule-utils-gui 
sudo apt-get install bittorrent bittorrent-gui
sudo apt-get install rtorrent qbittorrent
```
trackerslist
```
proxychains git clone git@github.com:ngosang/trackerslist.git
```
trackers_all.txt内容贴到种子的trackerslist

实在不行才用utorrent的web版本
```
sudo apt install libssl-dev
wget http://download.ap.bittorrent.com/track/beta/endpoint/utserver/os/linux-x64-ubuntu-13-04 -O utserver.tar.gz
```

测试链接
```
ed2k://|file|HAVD-707.avi|1016554984|E43EB71D6B47008C4B8CE50B7684A5A7|/
magnet:?xt=urn:btih:C70298676C4A0D3E1ACDDAB4F15B6F7CB312E77D
```
amule 段错误无法运行，mlgui服务器都没连上（不知道添加啥服务器好了）。 电驴看来彻底废了。


***
# Device /dev/ttyUSB1 is locked
```
ls /run/lock/
```

***
# xfreerdp 远程 （没有成功）
```
sudo apt install freerdp2-x11
```
参数说明
```
/u: 登陆用户名
/p: 登陆密码
/sec:nla 验证
/cert-ignore 不回首次连接时会提示用户 Do you trust the above certificate?
/drive: 映射网络硬盘
/v 远程目标ip地址和端口

```

```
xfreerdp /u:administrator /p:**** /sec:nla /drive:x,/media /drive:y,/root /v:192.168.0.93
xfreerdp /u:user_name /d:domain_name /a:32 /g:1920x1080 /x:0 /fonts /sec:nla /v:192.168.0.93
xfreerdp /sec:nla /v:192.168.0.93:3389
```

***
# 清理 cuda 
```
sudo apt purge cuda-tools-10-2 cuda-command-line-tools-10-2 cuda-compiler-10-2 cuda-cudart-11-2 cuda-cudart-dev-10-2 cuda-cufft-10-2 cuda-cufft-dev-10-2 cuda-cuobjdump-10-2 cuda-cupti-10-2 cuda-cupti-dev-10-2 cuda-curand-10-2 cuda-curand-dev-10-2 cuda-cusolver-10-2 cuda-cusolver-dev-10-2 cuda-cusparse-10-2 cuda-cusparse-dev-10-2 cuda-documentation-10-2 cuda-driver-dev-10-2 cuda-gdb-10-2 cuda-libraries-10-2 cuda-libraries-dev-10-2 cuda-license-10-2 cuda-memcheck-10-2 cuda-misc-headers-10-2  cuda-npp-10-2 cuda-npp-dev-10-2 cuda-nsight-10-2 cuda-nsight-compute-10-2 cuda-nsight-systems-10-2 cuda-nvcc-10-2 cuda-nvdisasm-10-2 cuda-nvgraph-10-2 cuda-nvgraph-dev-10-2 cuda-nvjpeg-10-2 cuda-nvjpeg-dev-10-2 cuda-nvml-dev-10-2 cuda-nvprof-10-2 cuda-nvprune-10-2 cuda-nvrtc-10-2 cuda-nvrtc-dev-10-2 cuda-nvtx-10-2 cuda-nvvp-10-2 cuda-samples-10-2 cuda-sanitizer-api-10-2 cuda-toolkit-10-2 cuda-tools-10-2 cuda-visual-tools-10-2 libvisionworks libvisionworks-sfm cuda-cudart-10-2

sudo apt purge cuda-cudart-cross-aarch64-10-2
```
实际上nvidia驱动版本可以高, cuda和cudnn要选合适的, 选保留10.2比较好
```
sudo aptitude install cuda-tools-10-2 cuda-command-line-tools-10-2 cuda-compiler-10-2 cuda-cudart-10-2 cuda-cudart-dev-10-2 cuda-cufft-10-2 cuda-cufft-dev-10-2 cuda-cuobjdump-10-2 cuda-cupti-10-2 cuda-cupti-dev-10-2 cuda-curand-10-2 cuda-curand-dev-10-2 cuda-cusolver-10-2 cuda-cusolver-dev-10-2 cuda-cusparse-10-2 cuda-cusparse-dev-10-2 cuda-documentation-10-2 cuda-driver-dev-10-2 cuda-gdb-10-2 cuda-libraries-10-2 cuda-libraries-dev-10-2 cuda-license-10-2 cuda-memcheck-10-2 cuda-misc-headers-10-2  cuda-npp-10-2 cuda-npp-dev-10-2 cuda-nsight-10-2 cuda-nsight-compute-10-2 cuda-nsight-systems-10-2 cuda-nvcc-10-2 cuda-nvdisasm-10-2 cuda-nvgraph-10-2 cuda-nvgraph-dev-10-2 cuda-nvjpeg-10-2 cuda-nvjpeg-dev-10-2 cuda-nvml-dev-10-2 cuda-nvprof-10-2 cuda-nvprune-10-2 cuda-nvrtc-10-2 cuda-nvrtc-dev-10-2 cuda-nvtx-10-2 cuda-nvvp-10-2 cuda-samples-10-2 cuda-sanitizer-api-10-2 cuda-toolkit-10-2 cuda-tools-10-2 cuda-visual-tools-10-2 libvisionworks libvisionworks-sfm cuda-cudart-10-2 cuda-cudart-cross-aarch64-10-2

sudo aptitude install libcudnn8=8.6.0.163-1+cuda10.2 libcudnn8-dev=8.6.0.163-1+cuda10.2 libcudnn8-samples=8.6.0.163-1+cuda10.2
```
列出一个软件的所有仓库版本
```
sudo apt-cache madison libcudnn8
```


```
sudo aptitude purge cuda cuda-11-4 cuda-runtime-11-4 cuda-cccl-11-4 cuda-command-line-tools-11-4 cuda-compat-11-4 cuda-compiler-11-4 cuda-cub-11-4 cuda-cudart-dev-11-4 cuda-documentation-11-4 cuda-libraries-dev-11-4 cuda-nvcc-11-4 cuda-samples-11-4 cuda-toolkit-11-4 cuda-tools-11-4 cuda-nsight-compute-11-4 nsight-compute-2021.2.2 
     Remove the following packages:                      
1)     cuda-nsight-compute-10-2 [10.2.89-1 (<NULL>, now)]
2)     cuda-toolkit-10-2 [10.2.89-1 (<NULL>, now)]       
3)     cuda-tools-10-2 [10.2.89-1 (<NULL>, now)]         
4)     cuda-visual-tools-10-2 [10.2.89-1 (<NULL>, now)]  
```
先删了再安装就是,实际上也安装了一个nsight-compute-2023.1.1,之前的是nsight-compute-2021.2.2
```
sudo aptitude install nsight-compute-2021.2.2
sudo aptitude remove nsight-compute-2023.1.1


cuda-toolkit-11-config-common
sudo aptitude remove cuda-cudart-11-2
sudo aptitude remove libcufft-11-2
sudo aptitude install cuda-cudart-11-4 libcublas-11-4 libcublas-dev-11-4 libcufft-11-4 libcusolver-11-4 libcusparse-11-4
ls -l /usr/local | grep cuda
sudo update-alternatives --config cuda
sudo aptitude install cuda=10.2.89-1 cuda-10-2 cuda-demo-suite-10-2 cuda-runtime-10-2
ll /etc/alternatives/cuda*
update-alternatives --list cuda
update-alternatives --display cuda
sudo update-alternatives --install "/usr/local/cuda" "cuda" "/usr/local/cuda-10.2" 100
sudo update-alternatives --set cuda /usr/local/cuda-10.2
sudo update-alternatives --config cuda
ll /etc/alternatives/cuda*
ll /usr/local | grep cuda
```
如果用tenserflow 2.5.0~2.8.0~? 
Could not load dynamic library 'libcublas.so.11'
Could not load dynamic library 'libcublasLt.so.11'
Could not load dynamic library 'libcusolver.so.11'
Could not load dynamic library 'libcusparse.so.11'
```
sudo update-alternatives --set cuda /usr/local/cuda-11.4
```
alternatives指向11.4版本其实也不影响mx等

如果需要nvcc(10.2)
```
sudo update-alternatives --set cuda /usr/local/cuda-10.2
```



***
#gcc-aarch64-linux-gnu
```
sudo apt install gcc-aarch64-linux-gnu

The following additional packages will be installed:
  gcc-7-aarch64-linux-gnu
Suggested packages:
  gcc-7-doc gcc-7-locales libgcc1-dbg-arm64-cross libgomp1-dbg-arm64-cross
  libitm1-dbg-arm64-cross libatomic1-dbg-arm64-cross libasan4-dbg-arm64-cross
  liblsan0-dbg-arm64-cross libtsan0-dbg-arm64-cross libubsan0-dbg-arm64-cross
  libcilkrts5-dbg-arm64-cross libmpx2-dbg-arm64-cross
  libquadmath0-dbg-arm64-cross gdb-aarch64-linux-gnu gcc-doc
The following packages will be REMOVED:
  g++-multilib gcc-multilib
The following NEW packages will be installed:
  gcc-7-aarch64-linux-gnu gcc-aarch64-linux-gnu

```

***
#
```
## 展示静态库的文件组成列表
ar -t *.a
## 展示静态库的符号列表,会将静态库的函数, 以文件为单位列出函数和结构体列表;
nm *.a
$nm libhello.so |grep printf U

## ldd命令查看依赖于哪些库
$ldd hello libc.so.6=>/lib/libc.so.6(0x400la000) /lib/ld-linux.so.2=>
/lib/ld-linux.so.2 (0x40000000)

## 查看静态库或动态库定义了哪些函数
nm -g --defined-only xxxx.a
nm -g --defined-only xxxx.so
nm -n --defined-only xxxx.a
nm -g -C --defined-only xxxx.so
nm -D xxxx.so

## 显示xxx.a 中的未定义符号，需要和其他对象文件进行链接.
nm -u xxx.o

## 在 ./ 目录下找出哪个库文件定义了close_socket函数. 
nm -A ./* 2>/dev/null | grep "T close_socket"

## 查看动态库有哪些符号，包括数据段、导出的函数和引用其他库的函数
objdump -tT xxx.so
objdump -x xxx.a

## 查看动态库依赖项
objdump -x xxx.so | grep "NEEDED" 

## 查看动态符号表
objdump -T xxx.so
## 假如想知道 xxx.so 中是否导出了符号 yyy ，那么命令为 objdump -T xxx.so | grep "yyy" 。

## 查看动态符号表
objdump -t xxx.so
## -T 和 -t 选项在于 -T 只能查看动态符号，如库导出的函数和引用其他库的函数，而 -t 可以查看所有的符号，包括数据段的符号。

## 查看静态库定义的函数
readelf -c xxx.a

## 查看静态库定义的函数
readelf -A xxx.so 

## 由.o文件创建静态库
gcc -c hello.c
ar cr libmyhello.a hello.o

gcc -c hello.c -o hello.o
ar cqs libhello.a hello.o

## 在程序中使用静态库
gcc -o hello main.c -L. -lmyhello

./hello

Hello everyone!

## 由.o文件创建动态库文件
gcc -shared -fPCI -o libmyhello.so hello.o
gcc -shared -Wl,-soname,libhello.so.1 -o libhello.so.1.0 hello.o

## 在程序中使用动态库
gcc -o hello main.c -L. -lmyhello

./hello

## 顺利找到动态库，有三种方法
### 把库拷贝到缺省的库搜索路径/usr/lib和/lib目录下，如果在其它位置要加上-L参数
### 在LD_LIBRARY_PATH环境变量中加上库所在路径
$export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/ting/lib
### 修改/etc/ld.so.conf文件，把库所在的路径加到文件末尾，并执行ldconfig刷新。这样，加入的目录下的所有库文件都可见

## 当静态库和动态库同名时， gcc命令将优先使用动态库

## 指示与静态库连接(如果系统中只有静态库当然就不需要"-WI，-Bstatic"这个参数了)
$gcc testlib.o -o testlib -WI,-Bstatic -lhello
## 指示与多个静态库连接
$gcc testlib.o -o testlib -WI,-Bstatic -lhello -WI,-Bdynamic -lbye

## 可以在库文件名后加上版本号为后缀
libxxxx.so.major.minor 其中，xxxx是库的名字，major是主版本号，minor 是次版本号

ln -s libhello.so.1.0 libhello.so.1
ln -s libhello.so.1 libhello.so


```
***
# trtexec tensorrt
trtexec在libnvinfer-bin里面
```
$ aptitude search tensorrt
p   tensorrt                                                                                          - Meta package for TensorRT                                                                                  
p   tensorrt-dev                                                                                      - Meta package for TensorRT development libraries                                                            
p   tensorrt-libs                                                                                     - Meta package for TensorRT runtime libraries                                                                
(lane-det) andreas@Vostro-5880:~/Downloads/TODO/TensorRT/samples/trtexec/build
$ apt-cache madison tensorrt
  tensorrt | 8.6.1.6-1+cuda12.0 | https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages
  tensorrt | 8.6.1.6-1+cuda11.8 | https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages
  tensorrt | 8.6.0.12-1+cuda12.0 | https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages
  tensorrt | 8.6.0.12-1+cuda11.8 | https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages
  tensorrt | 8.5.3.1-1+cuda11.8 | https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages
  tensorrt | 8.5.3.1-1+cuda10.2 | https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages
  tensorrt | 8.5.2.2-1+cuda11.8 | https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages
  tensorrt | 8.5.2.2-1+cuda10.2 | https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages
  tensorrt | 8.5.1.7-1+cuda11.8 | https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages
  tensorrt | 8.5.1.7-1+cuda10.2 | https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages
  tensorrt | 8.4.3.1-1+cuda11.6 | https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages
  tensorrt | 8.4.3.1-1+cuda10.2 | https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages
  tensorrt | 8.4.2.4-1+cuda11.6 | https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages
  tensorrt | 8.4.2.4-1+cuda10.2 | https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages
  tensorrt | 8.4.1.5-1+cuda11.6 | https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages
  tensorrt | 8.4.1.5-1+cuda10.2 | https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Packages
(lane-det) andreas@Vostro-5880:~/Downloads/TODO/TensorRT/samples/trtexec/build
$ sudo aptitude install tensorrt=8.5.3.1-1+cuda10.2 tensorrt-dev=8.5.3.1-1+cuda10.2 tensorrt-libs=8.5.3.1-1+cuda10.2
The following NEW packages will be installed:
  tensorrt{b} tensorrt-dev{b} tensorrt-libs{b} 
0 packages upgraded, 3 newly installed, 0 to remove and 41 not upgraded.
Need to get 10.9 kB of archives. After unpacking 33.8 kB will be used.
The following packages have unmet dependencies:
 tensorrt-libs : Depends: libnvinfer8 (= 8.5.3-1+cuda10.2) but it is not going to be installed
                 Depends: libnvinfer-plugin8 (= 8.5.3-1+cuda10.2) but it is not going to be installed
                 Depends: libnvparsers8 (= 8.5.3-1+cuda10.2) but it is not going to be installed
                 Depends: libnvonnxparsers8 (= 8.5.3-1+cuda10.2) but it is not going to be installed
 tensorrt-dev : Depends: libnvinfer-dev (= 8.5.3-1+cuda10.2) but it is not going to be installed
                Depends: libnvinfer-plugin-dev (= 8.5.3-1+cuda10.2) but it is not going to be installed
                Depends: libnvparsers-dev (= 8.5.3-1+cuda10.2) but it is not going to be installed
                Depends: libnvonnxparsers-dev (= 8.5.3-1+cuda10.2) but it is not going to be installed
 tensorrt : Depends: libnvinfer8 (= 8.5.3-1+cuda10.2) but it is not going to be installed
            Depends: libnvinfer-plugin8 (= 8.5.3-1+cuda10.2) but it is not going to be installed
            Depends: libnvparsers8 (= 8.5.3-1+cuda10.2) but it is not going to be installed
            Depends: libnvonnxparsers8 (= 8.5.3-1+cuda10.2) but it is not going to be installed
            Depends: libnvinfer-bin (= 8.5.3-1+cuda10.2) but it is not going to be installed
            Depends: libnvinfer-dev (= 8.5.3-1+cuda10.2) but it is not going to be installed
            Depends: libnvinfer-plugin-dev (= 8.5.3-1+cuda10.2) but it is not going to be installed
            Depends: libnvparsers-dev (= 8.5.3-1+cuda10.2) but it is not going to be installed
            Depends: libnvonnxparsers-dev (= 8.5.3-1+cuda10.2) but it is not going to be installed
            Depends: libnvinfer-samples (= 8.5.3-1+cuda10.2) but it is not going to be installed
The following actions will resolve these dependencies:

     Keep the following packages at their current version:
1)     tensorrt [Not Installed]                           
2)     tensorrt-dev [Not Installed]                       
3)     tensorrt-libs [Not Installed]                      



Accept this solution? [Y/n/q/?] n
The following actions will resolve these dependencies:

      Install the following packages:                    
1)      libnvinfer-bin [8.5.3-1+cuda10.2 (<NULL>)]       
2)      libnvinfer-dev [8.5.3-1+cuda10.2 (<NULL>)]       
3)      libnvinfer-plugin-dev [8.5.3-1+cuda10.2 (<NULL>)]
4)      libnvinfer-plugin8 [8.5.3-1+cuda10.2 (<NULL>)]   
5)      libnvinfer-samples [8.5.3-1+cuda10.2 (<NULL>)]   
6)      libnvinfer8 [8.5.3-1+cuda10.2 (<NULL>)]          
7)      libnvonnxparsers-dev [8.5.3-1+cuda10.2 (<NULL>)] 
8)      libnvonnxparsers8 [8.5.3-1+cuda10.2 (<NULL>)]    
9)      libnvparsers-dev [8.5.3-1+cuda10.2 (<NULL>)]     
10)     libnvparsers8 [8.5.3-1+cuda10.2 (<NULL>)]        



Accept this solution? [Y/n/q/?] y
The following NEW packages will be installed:
  libnvinfer-bin{a} libnvinfer-dev{a} libnvinfer-plugin-dev{a} libnvinfer-plugin8{a} libnvinfer-samples{a} libnvinfer8{a} libnvonnxparsers-dev{a} libnvonnxparsers8{a} libnvparsers-dev{a} libnvparsers8{a} 
  tensorrt tensorrt-dev tensorrt-libs 
0 packages upgraded, 13 newly installed, 0 to remove and 41 not upgraded.


(lane-det) andreas@Vostro-5880:~/Downloads/TODO/TensorRT/samples/trtexec/build
$ export PATH=$PATH:/usr/src/tensorrt/bin/
(lane-det) andreas@Vostro-5880:~/Downloads/TODO/TensorRT/samples/trtexec/build
$ trtexec --help

```
***
# 查看已经安装的deb包版本
比如 tensorrt 的版本是啥, 有这些办法可以查找
```
dpkg -s tensorrt | grep Version
apt-show-versions -a tensorrt
aptitude versions tensorrt
apt list tensorrt
apt list tensorrt -a
```


***
# 更新 ffmpeg4
实际上是希望能把 hevc_qsv 编码器用起来，但是目前环境看起来不行。更新到更高版本的系统apt仓库才有预编译好的deb包
```
sudo add-apt-repository ppa:morphis/intel-media
sudo apt-get install libva-dev intel-media-va-driver-non-free vainfo
for i in buildconf hwaccels decoders filters encoders; do echo $i:; ffmpeg -hide_banner -${i} | egrep -i "qsv|vaapi|libmfx"; done
sudo vainfo
ffmpeg -hwaccel qsv -c:v hevc_qsv -i example.mp4 -b:v 2000k output.mp4
```
记录一下更改，免得黑屏啥的
```
$ sudo apt-get install libva-dev intel-media-va-driver-non-free vainfo ffmpeg
Reading package lists... Done
Building dependency tree       
Reading state information... Done
vainfo is already the newest version (2.1.0+ds1-1).
The following additional packages will be installed:
  libavcodec58 libavdevice58 libavfilter7 libavformat58 libavresample4 libavutil56 libcodec2-0.7 libigdgmm9 libpostproc55 libswresample3 libswscale5 libva-drm2 libva-drm2:i386 libva-glx2 libva-wayland2
  libva-x11-2 libva-x11-2:i386 libva2 libva2:i386
The following NEW packages will be installed:
  intel-media-va-driver-non-free libavcodec58 libavdevice58 libavfilter7 libavformat58 libavresample4 libavutil56 libcodec2-0.7 libigdgmm9 libpostproc55 libswresample3 libswscale5
The following packages will be upgraded:
  ffmpeg libva-dev libva-drm2 libva-drm2:i386 libva-glx2 libva-wayland2 libva-x11-2 libva-x11-2:i386 libva2 libva2:i386

```
编译的方式咱就不试验了

## 其实是能用起来的

ffmpeg版本信息如下
```
$ ffmpeg -version
ffmpeg version 4.1.4-1build2~bionic1 Copyright (c) 2000-2019 the FFmpeg developers
built with gcc 7 (Ubuntu 7.4.0-1ubuntu1~18.04.1)
configuration: --prefix=/usr --extra-version='1build2~bionic1' --toolchain=hardened --libdir=/usr/lib/x86_64-linux-gnu --incdir=/usr/include/x86_64-linux-gnu --arch=amd64 --enable-gpl --disable-stripping --enable-avresample --disable-filter=resample --enable-avisynth --enable-gnutls --enable-ladspa --disable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libcodec2 --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus --enable-libpulse --enable-librsvg --enable-librubberband --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --disable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzmq --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opengl --enable-sdl2 --enable-libdc1394 --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 --enable-shared
libavutil      56. 22.100 / 56. 22.100
libavcodec     58. 35.100 / 58. 35.100
libavformat    58. 20.100 / 58. 20.100
libavdevice    58.  5.100 / 58.  5.100
libavfilter     7. 40.101 /  7. 40.101
libavresample   4.  0.  0 /  4.  0.  0
libswscale      5.  3.100 /  5.  3.100
libswresample   3.  3.100 /  3.  3.100
libpostproc    55.  3.100 / 55.  3.100

```

按前面的安装了intel-media-va-driver-non-free，一定要设置LIBVA_DRIVER_NAME， 还可以加strace查看
```
$ cat /proc/cpuinfo 
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 165
model name	: Intel(R) Core(TM) i7-10700 CPU @ 2.90GHz
...

$ ls /dev/dri -l
total 0
drwxr-xr-x  2 root root       120 Apr  1 10:56 by-path
crw-rw----+ 1 root video 226,   0 Apr  1 10:56 card0
crw-rw----+ 1 root video 226,   1 Apr  1 10:56 card1
crw-rw----+ 1 root video 226, 128 Apr  1 10:56 renderD128           # 这个就是intel核显
crw-rw----+ 1 root video 226, 129 Apr  1 10:56 renderD129

如果这里 当前用户不在 renderD128 用户组 `sudo usermod -a -G render $USER` 可以把用户添加到 render 组。这里是 video 组，其实不设置也可以用了。



$ ls /usr/lib/x86_64-linux-gnu/dri | grep drv_video.so
i965_drv_video.so
iHD_drv_video.so                    # i7 10代 应该用这个
nouveau_drv_video.so
r600_drv_video.so
radeonsi_drv_video.so

$ vainfo
libva info: VA-API version 1.5.0
libva info: va_getDriverName() returns 0
libva info: Trying to open /usr/lib/x86_64-linux-gnu/dri/nvidia_drv_video.so
libva info: va_openDriver() returns -1
vaInitialize failed with error code -1 (unknown libva error),exit


$ export LIBVA_DRIVER_NAME=iHD LIBVA_TRACE=1

$ vainfo        # 和 `vainfo --display x11` 输出一样
libva info: Open new log file 1.102708.thd-0x0000669e for the thread 0x0000669e
libva info: LIBVA_TRACE is on, save log into 1.102708.thd-0x0000669e
libva info: VA-API version 1.5.0
libva info: va_getDriverName() returns 0
libva info: User requested driver 'iHD'
libva info: Trying to open /usr/lib/x86_64-linux-gnu/dri/iHD_drv_video.so
libva info: Found init function __vaDriverInit_1_5
libva info: va_openDriver() returns 0
vainfo: VA-API version: 1.5 (libva 2.1.0)
vainfo: Driver version: Intel iHD driver - 1.0.0
vainfo: Supported profile and entrypoints
      VAProfileNone                   :	VAEntrypointVideoProc
      VAProfileNone                   :	VAEntrypointStats
      VAProfileMPEG2Simple            :	VAEntrypointVLD
      VAProfileMPEG2Simple            :	VAEntrypointEncSlice
      VAProfileMPEG2Main              :	VAEntrypointVLD
      VAProfileMPEG2Main              :	VAEntrypointEncSlice
      VAProfileH264Main               :	VAEntrypointVLD
      VAProfileH264Main               :	VAEntrypointEncSlice
      VAProfileH264Main               :	VAEntrypointFEI
      VAProfileH264Main               :	VAEntrypointEncSliceLP
      VAProfileH264High               :	VAEntrypointVLD
      VAProfileH264High               :	VAEntrypointEncSlice
      VAProfileH264High               :	VAEntrypointFEI
      VAProfileH264High               :	VAEntrypointEncSliceLP
      VAProfileVC1Simple              :	VAEntrypointVLD
      VAProfileVC1Main                :	VAEntrypointVLD
      VAProfileVC1Advanced            :	VAEntrypointVLD
      VAProfileJPEGBaseline           :	VAEntrypointVLD
      VAProfileJPEGBaseline           :	VAEntrypointEncPicture
      VAProfileH264ConstrainedBaseline:	VAEntrypointVLD
      VAProfileH264ConstrainedBaseline:	VAEntrypointEncSlice
      VAProfileH264ConstrainedBaseline:	VAEntrypointFEI
      VAProfileH264ConstrainedBaseline:	VAEntrypointEncSliceLP
      VAProfileVP8Version0_3          :	VAEntrypointVLD
      VAProfileVP8Version0_3          :	VAEntrypointEncSlice
      VAProfileHEVCMain               :	VAEntrypointVLD
      VAProfileHEVCMain               :	VAEntrypointEncSlice
      VAProfileHEVCMain               :	VAEntrypointFEI
      VAProfileHEVCMain10             :	VAEntrypointVLD
      VAProfileHEVCMain10             :	VAEntrypointEncSlice
      VAProfileVP9Profile0            :	VAEntrypointVLD
      VAProfileVP9Profile2            :	VAEntrypointVLD

$ sudo vainfo           # 环境变量没有作用到 root
error: XDG_RUNTIME_DIR not set in the environment.
libva info: VA-API version 1.5.0
libva info: va_getDriverName() returns 0
libva info: Trying to open /usr/lib/x86_64-linux-gnu/dri/nvidia_drv_video.so
libva info: va_openDriver() returns -1
vaInitialize failed with error code -1 (unknown libva error),exit

<https://ffmpeg-user.ffmpeg.narkive.com/XZk7pyBx/vaapi-impossible-to-convert-between-the-formats>

ffmpeg -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -i example.mp4 -c:v h264_vaapi output.mp4
会报错 Impossible to convert between the formats supported by the filter 'Parsed_null_0' and the filter 'auto_scaler_0'

设置 `-hwaccel_output_format` 下面这些都可以用, 
ffmpeg -hide_banner -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -hwaccel_output_format vaapi -i example.mp4 -c:v hevc_vaapi output.mp4
ffmpeg -hide_banner -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -hwaccel_output_format vaapi -i example.mp4 -c:v h264_vaapi output.mp4
ffmpeg -hide_banner -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -i example.mp4 -c:v libx264 output.mp4

ffmpeg -vaapi_device /dev/dri/renderD128 -i example.mp4 -vf 'format=nv12,hwupload' -c:v hevc_vaapi out1.mp4                 # try -vf 'format=nv12|vaapi,hwupload'

增加 log 
ffmpeg -hide_banner -loglevel trace -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -hwaccel_output_format vaapi -i test.avi -c:v h264_vaapi out.mp4


不加设备名也是可以的

ffmpeg -hide_banner -hwaccel vaapi -hwaccel_output_format vaapi -i example.mp4 -c:v hevc_vaapi output1.mp4


export LIBVA_DRIVER_NAME=iHD  # 去掉 strace 了
ffmpeg -hide_banner -threads 0 -hwaccel vaapi -hwaccel_output_format vaapi -i example.mp4 -c:v hevc_vaapi -profile:v main -b:v 1000k -g 250 -keyint_min 25 -sws_flags bicubic -ar 44100 -b:a 128k -c:a aac -ac 2 -map_metadata -1 -map_chapters -1 -strict -2 -rtbufsize 120m -max_muxing_queue_size 1024 -n output1.mp4
```


```
$ ffmpeg -hide_banner -hwaccels shows
Hardware acceleration methods:
vdpau
vaapi
drm

$ ffmpeg -hide_banner -init_hw_device list
Supported hardware device types:
vdpau
vaapi
drm

```
<https://trac.ffmpeg.org/wiki/Hardware/VAAPI>
<https://trac.ffmpeg.org/wiki/HWAccelIntro>

***
# wine64 简单使用和 desktop文件 例子
```
env LC_ALL="zh_CN.UTF-8" LANG="zh_CN.UTF-8" WINEARCH=win64 WINEPREFIX="/home/andreas/.wine-x64" wine Caesium\ Image\ Compressor.exe
```
MAXSerDesEV-GMSL.desktop
```
[Desktop Entry]
Name=MAXSerDesEV-GMSL
Exec=env LC_ALL="zh_CN.UTF-8" LANG="zh_CN.UTF-8" WINEARCH=win64 WINEPREFIX="/home/andreas/.wine-x64" wine C:\\\\users\\\\Public\\\\Desktop\\\\MAXSerDesEV-GMSL.lnk
Type=Application
StartupNotify=true
Path=/home/andreas/.wine-x64/dosdevices/c:/Maxim Integrated/MAXSerDesEV-GMSL
Icon=F365_GMSL.0
StartupWMClass=gmsl.exe
```

***
# cargo
```
$ sudo apt install cargo
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libstd-rust-1.65 libstd-rust-dev rustc
Suggested packages:
  cargo-doc llvm-14 lld-14 clang-14
The following NEW packages will be installed:
  cargo libstd-rust-1.65 libstd-rust-dev rustc

```

***
# gifski
```
sudo dpkg -i gifski_1.32.0-1_amd64.deb
$ gifski --help
https://gif.ski by Kornel Lesiński

Usage: gifski [OPTIONS] --output <a.gif> <FILES>...

Arguments:
  <FILES>...
          one video file supported by FFmpeg, or multiple PNG image files

Options:
  -o, --output <a.gif>
          Destination file to write to; "-" means stdout

  -r, --fps <num>
          Frame rate of animation. If using PNG files as input, this means the speed, as all frames are kept. If video is used, it will be resampled to this constant rate by dropping and/or duplicating frames
          
          [default: 20]

      --fast-forward <x>
          Multiply speed of video by a factor
          
          [default: 1]

      --fast
          50% faster encoding, but 10% worse quality and larger file size

      --extra
          50% slower encoding, but 1% better quality

  -Q, --quality <1-100>
          Lower quality may give smaller file
          
          [default: 90]

      --motion-quality <1-100>
          Lower values reduce motion

      --lossy-quality <1-100>
          Lower values introduce noise and streaks

  -W, --width <px>
          Maximum width.
          By default anims are limited to about 800x600

  -H, --height <px>
          Maximum height (stretches if the width is also set)

      --no-sort
          Use files exactly in the order given, rather than sorted

  -q, --quiet
          Do not display anything on standard output/console

      --repeat <num>
          Number of times the animation is repeated (-1 none, 0 forever or <value> repetitions

      --fixed-color <RGBHEX>
          Always include this color in the palette

      --matte <RGBHEX>
          Background color for semitransparent pixels

  -h, --help
          Print help (see a summary with '-h')

  -V, --version
          Print version

```
***
# gifsicle
```
sudo apt install gifsicle

$ gifsicle --help
'Gifsicle' manipulates GIF images. Its most common uses include combining
single images into animations, adding transparency, optimizing animations for
space, and printing information about GIFs.

Usage: gifsicle [OPTION | FILE | FRAME]...

Mode options: at most one, before any filenames.
  -m, --merge                   Merge mode: combine inputs, write stdout.
  -b, --batch                   Batch mode: modify inputs, write back to
                                same filenames.
  -e, --explode                 Explode mode: write N files for each input,
                                one per frame, to 'input.frame-number'.
  -E, --explode-by-name         Explode mode, but write 'input.name'.

General options: Also --no-OPTION for info and verbose.
  -I, --info                    Print info about input GIFs. Two -I's means
                                normal output is not suppressed.
      --color-info, --cinfo     --info plus colormap details.
      --extension-info, --xinfo --info plus extension details.
      --size-info, --sinfo      --info plus compression information.
  -V, --verbose                 Prints progress information.
  -h, --help                    Print this message and exit.
      --version                 Print version number and exit.
  -o, --output FILE             Write output to FILE.
  -w, --no-warnings             Don't report warnings.
      --no-ignore-errors        Quit on very erroneous input GIFs.
      --conserve-memory         Conserve memory at the expense of speed.
      --multifile               Support concatenated GIF files.

Frame selections:               #num, #num1-num2, #num1-, #name

Frame change options:
  --delete FRAMES               Delete FRAMES from input.
  --insert-before FRAME GIFS    Insert GIFS before FRAMES in input.
  --append GIFS                 Append GIFS to input.
  --replace FRAMES GIFS         Replace FRAMES with GIFS in input.
  --done                        Done with frame changes.

Image options: Also --no-OPTION and --same-OPTION.
  -B, --background COL          Make COL the background color.
      --crop X,Y+WxH, --crop X,Y-X2,Y2
                                Crop the image.
      --crop-transparency       Crop transparent borders off the image.
      --flip-horizontal, --flip-vertical
                                Flip the image.
  -i, --interlace               Turn on interlacing.
  -S, --logical-screen WxH      Set logical screen to WxH.
  -p, --position X,Y            Set frame position to (X,Y).
      --rotate-90, --rotate-180, --rotate-270, --no-rotate
                                Rotate the image.
  -t, --transparent COL         Make COL transparent.

Extension options:
      --app-extension N D       Add an app extension named N with data D.
  -c, --comment TEXT            Add a comment before the next frame.
      --extension N D           Add an extension number N with data D.
  -n, --name TEXT               Set next frame's name.
      --no-comments, --no-names, --no-extensions
                                Remove comments (names, extensions) from input.
Animation options: Also --no-OPTION and --same-OPTION.
  -d, --delay TIME              Set frame delay to TIME (in 1/100sec).
  -D, --disposal METHOD         Set frame disposal to METHOD.
  -l, --loopcount[=N]           Set loop extension to N (default forever).
  -O, --optimize[=LEVEL]        Optimize output GIFs.
  -U, --unoptimize              Unoptimize input GIFs.
  -j, --threads[=THREADS]       Use multiple threads to improve speed.

Whole-GIF options: Also --no-OPTION.
      --careful                 Write larger GIFs that avoid bugs in other
                                programs.
      --change-color COL1 COL2  Change COL1 to COL2 throughout.
  -k, --colors N                Reduce the number of colors to N.
      --color-method METHOD     Set method for choosing reduced colors.
  -f, --dither                  Dither image after changing colormap.
      --gamma G                 Set gamma for color reduction [2.2].
      --resize WxH              Resize the output GIF to WxH.
      --resize-width W          Resize to width W and proportional height.
      --resize-height H         Resize to height H and proportional width.
      --resize-fit WxH          Resize if necessary to fit within WxH.
      --scale XFACTOR[xYFACTOR] Scale the output GIF by XFACTORxYFACTOR.
      --resize-method METHOD    Set resizing method.
      --resize-colors N         Resize can add new colors up to N.
      --transform-colormap CMD  Transform each output colormap by shell CMD.
      --use-colormap CMAP       Set output GIF's colormap to CMAP, which can
                                be 'web', 'gray', 'bw', or a GIF file.

```

***
# 安装 rustup, 更新 rustup
先做个准备, 如果报 `~/.config/fish/conf.d/rustup.fish': No such file or directory` 可以这样处理
```
$ mkdir -p ~/.config/fish/conf.d/
$ touch ~/.config/fish/conf.d/rustup.fish
```
运行安装脚本
```
curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh

其实可以下载 rustup-init.sh 自己运行


$ proxychains sh rustup-init.sh 
ProxyChains-3.1 (http://proxychains.sf.net)
info: downloading installer
|DNS-request| static.rust-lang.org 
|S-chain|-<>-127.0.0.1:10808-<><>-4.2.2.2:53-<><>-OK
|DNS-response| static.rust-lang.org is 151.101.110.137
|S-chain|-<>-127.0.0.1:10808-<><>-151.101.110.137:443-<><>-OK
warning: it looks like you have an existing installation of Rust at:
warning: /usr/bin
warning: It is recommended that rustup be the primary Rust installation.
warning: Otherwise you may have confusion unless you are careful with your PATH
warning: If you are sure that you want both rustup and your already installed Rust
warning: then please reply `y' or `yes' or set RUSTUP_INIT_SKIP_PATH_CHECK to yes
warning: or pass `-y' to ignore all ignorable checks.
error: cannot install while Rust is installed

Continue? (y/N) y


Welcome to Rust!

This will download and install the official compiler for the Rust
programming language, and its package manager, Cargo.

Rustup metadata and toolchains will be installed into the Rustup
home directory, located at:

  /home/andreas/.rustup

This can be modified with the RUSTUP_HOME environment variable.

The Cargo home directory is located at:

  /home/andreas/.cargo

This can be modified with the CARGO_HOME environment variable.

The cargo, rustc, rustup and other commands will be added to
Cargo's bin directory, located at:

  /home/andreas/.cargo/bin

This path will then be added to your PATH environment variable by
modifying the profile files located at:

  /home/andreas/.profile
  /home/andreas/.bashrc
  /home/andreas/.zshenv
  /home/andreas/.config/fish/conf.d/rustup.fish

You can uninstall at any time with rustup self uninstall and
these changes will be reverted.

Current installation options:


   default host triple: x86_64-unknown-linux-gnu
     default toolchain: stable (default)
               profile: default
  modify PATH variable: yes

1) Proceed with standard installation (default - just press enter)
2) Customize installation
3) Cancel installation
>1

info: profile set to 'default'
info: default host triple is x86_64-unknown-linux-gnu
info: syncing channel updates for 'stable-x86_64-unknown-linux-gnu'
|DNS-request| static.rust-lang.org 
|S-chain|-<>-127.0.0.1:10808-<><>-4.2.2.2:53-<><>-OK
|DNS-response| static.rust-lang.org is 151.101.110.137
|S-chain|-<>-127.0.0.1:10808-<><>-151.101.110.137:443-<><>-OK
info: latest update on 2024-04-09, rust version 1.77.2 (25ef9e3d8 2024-04-09)
info: downloading component 'cargo'
info: downloading component 'clippy'
info: downloading component 'rust-docs'
info: downloading component 'rust-std'
info: downloading component 'rustc'
 60.3 MiB /  60.3 MiB (100 %)  37.1 MiB/s in  2s ETA:  0s
info: downloading component 'rustfmt'
info: installing component 'cargo'
info: installing component 'clippy'
info: installing component 'rust-docs'
 14.9 MiB /  14.9 MiB (100 %)  13.5 MiB/s in  1s ETA:  0s
info: installing component 'rust-std'
 24.3 MiB /  24.3 MiB (100 %)  17.2 MiB/s in  1s ETA:  0s
info: installing component 'rustc'
 60.3 MiB /  60.3 MiB (100 %)  18.7 MiB/s in  3s ETA:  0s
info: installing component 'rustfmt'
info: default toolchain set to 'stable-x86_64-unknown-linux-gnu'

  stable-x86_64-unknown-linux-gnu installed - rustc 1.77.2 (25ef9e3d8 2024-04-09)


Rust is installed now. Great!

To get started you may need to restart your current shell.
This would reload your PATH environment variable to include
Cargo's bin directory ($HOME/.cargo/bin).

To configure your current shell, you need to source
the corresponding env file under $HOME/.cargo.

This is usually done by running one of the following (note the leading DOT):
. "$HOME/.cargo/env"            # For sh/bash/zsh/ash/dash/pdksh
source "$HOME/.cargo/env.fish"  # For fish

```
重新打开 bash
```
$ rustc -V
rustc 1.77.2 (25ef9e3d8 2024-04-09)
$ rustup -V
rustup 1.27.0 (bbb9276d2 2024-03-08)
info: This is the version for the rustup toolchain manager, not the rustc compiler.
info: The currently active `rustc` version is `rustc 1.77.2 (25ef9e3d8 2024-04-09)`
```


***
# qt-6-2 失败
<https://launchpad.net/~savoury1/+archive/ubuntu/qt-6-2>
```
sudo add-apt-repository ppa:savoury1/qt-6-2
sudo apt update

sudo aptitude install qt6-base-dev
sudo aptitude install qt6ct
不行

sudo add-apt-repository --remove pa:savoury1/qt-6-2
sudo apt update
```

***
# ffmpeg4.4
```
sudo add-apt-repository ppa:savoury1/ffmpeg4
sudo apt-get update

$ sudo apt-get -c ~/apt_proxy_conf install ffmpeg
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libcodec2-0.7 libegl-mesa0:i386 libegl1:i386 libibus-1.0-dev libsndio-dev libwayland-egl1-mesa:i386
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  libavcodec58 libavdevice58 libavfilter7 libavformat58 libavutil56 libcdio-cdda2 libcdio-paranoia2 libcdio19 libcodec2-1.2 libgsm1 libgsm1:i386 libmysofa1 libpocketsphinx3 libpostproc55 librabbitmq4
  libsdl2-2.0-0 libsdl2-2.0-0:i386 libsndio7 libsphinxbase3 libsrt1.5-gnutls libswresample3 libswscale5 libvidstab1.1 libvpx8 libx264-164 libzimg2
Suggested packages:
  libnvcuvid1 libnvidia-encode1 sndiod
Recommended packages:
  pocketsphinx-hmm-en-hub4wsj | pocketsphinx-hmm-zh-tdt | pocketsphinx-hmm-en-tidigits pocketsphinx-lm-en-hub4 | pocketsphinx-lm-zh-hans-gigatdt | pocketsphinx-lm-zh-hant-gigatdt
The following packages will be REMOVED:
  libavresample4 libsdl2-dev
The following NEW packages will be installed:
  libcdio19 libcodec2-1.2 libmysofa1 libpocketsphinx3 librabbitmq4 libsndio7 libsphinxbase3 libsrt1.5-gnutls libvidstab1.1 libvpx8 libx264-164 libzimg2
The following packages will be upgraded:
  ffmpeg libavcodec58 libavdevice58 libavfilter7 libavformat58 libavutil56 libcdio-cdda2 libcdio-paranoia2 libgsm1 libgsm1:i386 libpostproc55 libsdl2-2.0-0 libsdl2-2.0-0:i386 libswresample3 libswscale5
15 upgraded, 12 newly installed, 2 to remove and 1182 not upgraded.


sudo add-apt-repository --remove ppa:savoury1/ffmpeg4
sudo apt-get update


$ sudo apt-get remove ffmpeg
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libavcodec58 libavdevice58 libavfilter7 libavformat58 libavutil56 libcodec2-0.7 libcodec2-1.2 libegl-mesa0:i386 libegl1:i386 libibus-1.0-dev libmysofa1 libpocketsphinx3 libpostproc55 librabbitmq4
  libsndio-dev libsndio7 libsphinxbase3 libsrt1.5-gnutls libswresample3 libswscale5 libvidstab1.1 libvpx8 libwayland-egl1-mesa:i386 libx264-164 libzimg2
Use 'sudo apt autoremove' to remove them.
The following packages will be REMOVED:
  ffmpeg
0 upgraded, 0 newly installed, 1 to remove and 1046 not upgraded.


$ sudo apt autoremove
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be REMOVED:
  libavcodec58 libavdevice58 libavfilter7 libavformat58 libavutil56 libcodec2-0.7 libcodec2-1.2 libegl-mesa0:i386 libegl1:i386 libibus-1.0-dev libmysofa1 libpocketsphinx3 libpostproc55 librabbitmq4
  libsndio-dev libsndio7 libsphinxbase3 libsrt1.5-gnutls libswresample3 libswscale5 libvidstab1.1 libvpx8 libwayland-egl1-mesa:i386 libx264-164 libzimg2
0 upgraded, 0 newly installed, 25 to remove and 1045 not upgraded.




$ sudo aptitude install ffmpeg=7:4.1.4-1build2~bionic1
The following NEW packages will be installed:
  ffmpeg{b} 
0 packages upgraded, 1 newly installed, 0 to remove and 1045 not upgraded.
Need to get 0 B/1,409 kB of archives. After unpacking 1,963 kB will be used.
The following packages have unmet dependencies:
 ffmpeg : Depends: libavcodec58 (= 7:4.1.4-1build2~bionic1) but it is not going to be installed
          Depends: libavdevice58 (= 7:4.1.4-1build2~bionic1) but it is not going to be installed
          Depends: libavfilter7 (= 7:4.1.4-1build2~bionic1) but it is not going to be installed
          Depends: libavformat58 (= 7:4.1.4-1build2~bionic1) but it is not going to be installed
          Depends: libavresample4 (= 7:4.1.4-1build2~bionic1) but it is not going to be installed
          Depends: libavutil56 (= 7:4.1.4-1build2~bionic1) but it is not going to be installed
          Depends: libpostproc55 (= 7:4.1.4-1build2~bionic1) but it is not going to be installed
          Depends: libswresample3 (= 7:4.1.4-1build2~bionic1) but it is not going to be installed
          Depends: libswscale5 (= 7:4.1.4-1build2~bionic1) but it is not going to be installed
The following actions will resolve these dependencies:

     Keep the following packages at their current version:
1)     ffmpeg [Not Installed]                             



Accept this solution? [Y/n/q/?] n
The following actions will resolve these dependencies:

      Install the following packages:                    
1)      libavcodec58 [7:4.1.4-1build2~bionic1 (bionic)]  
2)      libavdevice58 [7:4.1.4-1build2~bionic1 (bionic)] 
3)      libavfilter7 [7:4.1.4-1build2~bionic1 (bionic)]  
4)      libavformat58 [7:4.1.4-1build2~bionic1 (bionic)] 
5)      libavresample4 [7:4.1.4-1build2~bionic1 (bionic)]
6)      libavutil56 [7:4.1.4-1build2~bionic1 (bionic)]   
7)      libcodec2-0.7 [0.7-1 (bionic)]                   
8)      libpostproc55 [7:4.1.4-1build2~bionic1 (bionic)] 
9)      libswresample3 [7:4.1.4-1build2~bionic1 (bionic)]
10)     libswscale5 [7:4.1.4-1build2~bionic1 (bionic)]   



Accept this solution? [Y/n/q/?] y
The following NEW packages will be installed:
  ffmpeg libavcodec58{a} libavdevice58{a} libavfilter7{a} libavformat58{a} libavresample4{a} libavutil56{a} libcodec2-0.7{a} libpostproc55{a} libswresample3{a} libswscale5{a} 
0 packages upgraded, 11 newly installed, 0 to remove and 1045 not upgraded.



libavresample4=7:4.1.4-1build2~bionic1

libsdl2-dev=2.0.8+dfsg1-1ubuntu1.18.04.4

The following actions will resolve these dependencies:

     Install the following packages:                                                                       
1)     libibus-1.0-dev [1.5.17-3ubuntu5.3 (bionic-updates)]                                                

     Keep the following packages at their current version:                                                 
2)     gir1.2-ibus-1.0 [1.5.17-3ubuntu5.3 (bionic-updates, now)]                                           
3)     libibus-1.0-5 [1.5.17-3ubuntu5.3 (bionic-updates, now)]                                             

     Downgrade the following packages:                                                                     
4)     libsdl2-2.0-0 [2.30.2+dfsg-1~18.04.sav0 (now) -> 2.0.8+dfsg1-1ubuntu1.18.04.4 (bionic-updates)]     
5)     libsdl2-2.0-0:i386 [2.30.2+dfsg-1~18.04.sav0 (now) -> 2.0.8+dfsg1-1ubuntu1.18.04.4 (bionic-updates)]


记得关掉 security.debian.org 源

sudo apt-get install libavcodec58 libavdevice58 libavfilter7 libavformat58 libavutil56 libcodec2-0.7 libegl-mesa0:i386 libegl1:i386 libibus-1.0-dev libpocketsphinx3 libpostproc55 librabbitmq4 libsndio-dev libsphinxbase3 libswresample3 libswscale5 libwayland-egl1-mesa:i386


sudo apt-get install ffmpeg libavcodec58 libavdevice58 libavfilter7 libavformat58 libavutil56 libcdio-cdda2 libcdio-paranoia2 libgsm1 libgsm1:i386 libpostproc55 libsdl2-2.0-0 libsdl2-2.0-0:i386 libswresample3 libswscale5


libegl1 libegl1:i386 libegl-mesa0 libegl-mesa0:i386 libgbm1 libgbm1:i386 libwayland-egl1-mesa libwayland-egl1-mesa:i386 这几个玩意有兼容性问题

$ sudo aptitude install libegl-mesa0=20.0.8-0ubuntu1~18.04.1
      Install the following packages:                                                                       
1)      libsensors4:i386 [1:3.4.0-4ubuntu0.1 (bionic-updates)]                                              

      Downgrade the following packages:                                                                     
2)      libgbm1 [20.0.8-0ubuntu1~18.04.1sav1 (now) -> 20.0.8-0ubuntu1~18.04.1 (bionic-updates)]             
3)      libgl1-mesa-dri [20.0.8-0ubuntu1~18.04.1sav1 (now) -> 20.0.8-0ubuntu1~18.04.1 (bionic-updates)]     
4)      libgl1-mesa-dri:i386 [20.0.8-0ubuntu1~18.04.1sav1 (now) -> 20.0.8-0ubuntu1~18.04.1 (bionic-updates)]
5)      libglapi-mesa [20.0.8-0ubuntu1~18.04.1sav1 (now) -> 20.0.8-0ubuntu1~18.04.1 (bionic-updates)]       
6)      libglapi-mesa:i386 [20.0.8-0ubuntu1~18.04.1sav1 (now) -> 20.0.8-0ubuntu1~18.04.1 (bionic-updates)]  
7)      libglx-mesa0 [20.0.8-0ubuntu1~18.04.1sav1 (now) -> 20.0.8-0ubuntu1~18.04.1 (bionic-updates)]        
8)      libglx-mesa0:i386 [20.0.8-0ubuntu1~18.04.1sav1 (now) -> 20.0.8-0ubuntu1~18.04.1 (bionic-updates)]   
9)      libosmesa6 [20.0.8-0ubuntu1~18.04.1sav1 (now) -> 20.0.8-0ubuntu1~18.04.1 (bionic-updates)]          
10)     libosmesa6:i386 [20.0.8-0ubuntu1~18.04.1sav1 (now) -> 20.0.8-0ubuntu1~18.04.1 (bionic-updates)]     
11)     libsensors4 [1:3.6.0-7~18.04.sav0 (now) -> 1:3.4.0-4ubuntu0.1 (bionic-updates)]          

$ sudo aptitude install libegl-mesa0:i386=20.0.8-0ubuntu1~18.04.1
The following NEW packages will be installed:
  libegl-mesa0:i386 libgbm1:i386{a} libwayland-server0:i386{a} 

$ sudo aptitude install libegl1=1.0.0-2ubuntu2.3
      Remove the following packages:                                                                     
1)      libegl-dev [1.3.4-1~18.04.sav0 (now)]                                                            
2)      libgl-dev [1.3.4-1~18.04.sav0 (now)]                                                             
3)      libgles-dev [1.3.4-1~18.04.sav0 (now)]                                                           
4)      libglx-dev [1.3.4-1~18.04.sav0 (now)]                                                            
5)      libopengl-dev [1.3.4-1~18.04.sav0 (now)]                                                         

      Downgrade the following packages:                                                                  
6)      libegl1-mesa-dev [20.0.8-0ubuntu1~18.04.1sav1 (now) -> 20.0.8-0ubuntu1~18.04.1 (bionic-updates)] 
7)      libgl1 [1.3.4-1~18.04.sav0 (now) -> 1.0.0-2ubuntu2.3 (bionic-updates)]                           
8)      libgl1:i386 [1.3.4-1~18.04.sav0 (now) -> 1.0.0-2ubuntu2.3 (bionic-updates)]                      
9)      libgl1-mesa-dev [20.0.8-0ubuntu1~18.04.1sav1 (now) -> 20.0.8-0ubuntu1~18.04.1 (bionic-updates)]  
10)     libgles1 [1.3.4-1~18.04.sav0 (now) -> 1.0.0-2ubuntu2.3 (bionic-updates)]                         
11)     libgles2 [1.3.4-1~18.04.sav0 (now) -> 1.0.0-2ubuntu2.3 (bionic-updates)]                         
12)     libgles2-mesa-dev [20.0.8-0ubuntu1~18.04.1sav1 (now) -> 20.0.8-0ubuntu1~18.04.1 (bionic-updates)]
13)     libglvnd-core-dev [1.3.4-1~18.04.sav0 (now) -> 1.0.0-2ubuntu2.3 (bionic-updates)]                
14)     libglvnd-dev [1.3.4-1~18.04.sav0 (now) -> 1.0.0-2ubuntu2.3 (bionic-updates)]                     
15)     libglvnd0 [1.3.4-1~18.04.sav0 (now) -> 1.0.0-2ubuntu2.3 (bionic-updates)]                        
16)     libglvnd0:i386 [1.3.4-1~18.04.sav0 (now) -> 1.0.0-2ubuntu2.3 (bionic-updates)]                   
17)     libglx0 [1.3.4-1~18.04.sav0 (now) -> 1.0.0-2ubuntu2.3 (bionic-updates)]                          
18)     libglx0:i386 [1.3.4-1~18.04.sav0 (now) -> 1.0.0-2ubuntu2.3 (bionic-updates)]                     
19)     libopengl0 [1.3.4-1~18.04.sav0 (now) -> 1.0.0-2ubuntu2.3 (bionic-updates)]                       
20)     mesa-common-dev [20.0.8-0ubuntu1~18.04.1sav1 (now) -> 20.0.8-0ubuntu1~18.04.1 (bionic-updates)] 

$ sudo aptitude install libegl1:i386=1.0.0-2ubuntu2.3
$ sudo aptitude install libgbm1=20.0.8-0ubuntu1~18.04.1 libgbm1:i386=20.0.8-0ubuntu1~18.04.1
$ sudo aptitude install libwayland-egl1-mesa=20.0.8-0ubuntu1~18.04.1 libwayland-egl1-mesa:i386=20.0.8-0ubuntu1~18.04.1




```

***
# GLIBC 2.28
```
ldd --version

ldd (Debian GLIBC 2.28-10+deb10u2) 2.28
...

# or
strings /lib/x86_64-linux-gnu/libc.so.6 | grep GLIBC_

sudo su -c 'echo "deb http://security.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list' root

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 112695A0E562B32A 54404762BBB6E853

sudo apt update

//sudo apt install libc6 libc6-dev -y

sudo apt-get -c ~/apt_proxy_conf install libc6 libc6-dev



ldd --version

# or
strings /lib/x86_64-linux-gnu/libc.so.6 | grep GLIBC_2.28

```

***
#
```
$ sudo apt install qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager
Reading package lists... Done
Building dependency tree       
Reading state information... Done
bridge-utils is already the newest version (1.5-15ubuntu1).
libvirt-clients is already the newest version (4.0.0-1ubuntu8.21).
libvirt-clients set to manually installed.
libvirt-daemon is already the newest version (4.0.0-1ubuntu8.21).
libvirt-daemon set to manually installed.
qemu-kvm is already the newest version (1:2.11+dfsg-1ubuntu7.42).
The following additional packages will be installed:
  gir1.2-gtk-vnc-2.0 gir1.2-libosinfo-1.0 gir1.2-libvirt-glib-1.0 gir1.2-spiceclientglib-2.0 gir1.2-spiceclientgtk-3.0 libgovirt-common libgovirt2 libgtk-vnc-2.0-0 libgvnc-1.0-0 libosinfo-1.0-0 libphodav-2.0-0
  libphodav-2.0-common libspice-client-glib-2.0-8 libspice-client-gtk-3.0-5 libusbredirhost1 libvirt-glib-1.0-0 osinfo-db python-gi-cairo python-ipaddr qemu-slof qemu-system qemu-system-arm qemu-system-mips
  qemu-system-misc qemu-system-ppc qemu-system-s390x qemu-system-sparc qemu-user spice-client-glib-usb-acl-helper virt-viewer virtinst
Suggested packages:
  libosinfo-l10n vde2 qemu-efi openbios-ppc openhackware openbios-sparc ssh-askpass python-guestfs
The following NEW packages will be installed:
  gir1.2-gtk-vnc-2.0 gir1.2-libosinfo-1.0 gir1.2-libvirt-glib-1.0 gir1.2-spiceclientglib-2.0 gir1.2-spiceclientgtk-3.0 libgovirt-common libgovirt2 libgtk-vnc-2.0-0 libgvnc-1.0-0 libosinfo-1.0-0 libphodav-2.0-0
  libphodav-2.0-common libspice-client-glib-2.0-8 libspice-client-gtk-3.0-5 libusbredirhost1 libvirt-glib-1.0-0 osinfo-db python-gi-cairo python-ipaddr qemu qemu-slof qemu-system qemu-system-arm
  qemu-system-mips qemu-system-misc qemu-system-ppc qemu-system-s390x qemu-system-sparc qemu-user spice-client-glib-usb-acl-helper virt-manager virt-viewer virtinst
0 upgraded, 33 newly installed, 0 to remove and 68 not upgraded.


sudo apt-get install qemu qemu-system qemu-system-arm
sudo apt-get install qemu-kvm qemu virt-manager virt-viewer libvirt-daemon-system libvirt-clients bridge-utils

qemu-img -V
qemu-system-arm --version
qemu-system-aarch64 --version
qemu-system-x86_64 -version

andreas@Vostro-5880:~
$ qemu-img -V
qemu-img version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.42)
Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers
andreas@Vostro-5880:~
$ qemu-system-arm --version
QEMU emulator version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.42)
Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers
andreas@Vostro-5880:~
$ qemu-system-aarch64 --version
QEMU emulator version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.42)
Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers
andreas@Vostro-5880:~
$ qemu-system-x86_64 -version
QEMU emulator version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.42)
Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

```

***
# matlab2017
运行 simulink 报错
Can't reload '/opt/MATLAB/R2017b/bin/glnxa64/libmwdastudio.so'
```
andreas@Vostro-5880:~/bin
$ ls -l
total 4
lrwxrwxrwx  1 andreas andreas   33 Mar 31  2021 deploytool2017 -> /opt/MATLAB/R2017b/bin/deploytool
lrwxrwxrwx  1 andreas andreas   45 Mar 31  2021 FoxitReader -> /opt/foxitsoftware/foxitreader/FoxitReader.sh
lrwxrwxrwx  1 andreas andreas   29 Mar 31  2021 matlab2017 -> /opt/MATLAB/R2017b/bin/matlab
lrwxrwxrwx  1 andreas andreas   29 Mar 31  2021 mbuild2017 -> /opt/MATLAB/R2017b/bin/mbuild
lrwxrwxrwx  1 andreas andreas   26 Mar 31  2021 mcc2017 -> /opt/MATLAB/R2017b/bin/mcc
lrwxrwxrwx  1 andreas andreas   26 Mar 31  2021 mex2017 -> /opt/MATLAB/R2017b/bin/mex

```
据说是 libfreetype.so.6，移除试验可以运行 simulink
```
cd /opt/MATLAB/R2017b/bin/glnxa64
mkdir -p /opt/MATLAB/R2017b/exclude
mv libfreetype.* /opt/MATLAB/R2017b/exclude
```
然后重新打开 mablab2017，就好了

ref
<https://ww2.mathworks.cn/matlabcentral/answers/506092-can-t-reload-usr-local-matlab-r2018a-bin-glnxa64-libmwdastudio-so>


实际上 socbuilder 在 2019 之后的版本才有。升级版本吧

***
# try to run openpilot on PC
```

sudo apt install autoconf \
    build-essential \
    ca-certificates \
    casync \
    clang \
    cmake \
    make \
    cppcheck \
    libtool \
    gcc-arm-none-eabi \
    bzip2 \
    liblzma-dev \
    libarchive-dev \
    libbz2-dev \
    capnproto \
    libcapnp-dev \
    curl \
    libcurl4-openssl-dev \
    git \
    git-lfs \
    ffmpeg \
    libavformat-dev \
    libavcodec-dev \
    libavdevice-dev \
    libavutil-dev \
    libavfilter-dev \
    libeigen3-dev \
    libffi-dev \
    libglew-dev \
    libgles2-mesa-dev \
    libglfw3-dev \
    libglib2.0-0 \
    libncurses5-dev \
    libncursesw5-dev \
    libomp-dev \
    libopencv-dev \
    libpng16-16 \
    libportaudio2 \
    libssl-dev \
    libsqlite3-dev \
    libusb-1.0-0-dev \
    libzmq3-dev \
    libsystemd-dev \
    locales \
    opencl-headers \
    ocl-icd-libopencl1 \
    ocl-icd-opencl-dev \
    clinfo \
    portaudio19-dev \
    qml-module-qtquick2 \
    qtmultimedia5-dev \
    qtlocation5-dev \
    qtpositioning5-dev \
    qttools5-dev-tools \
    libqt5sql5-sqlite \
    libqt5svg5-dev \
    libqt5charts5-dev \
    libqt5x11extras5-dev \
    libreadline-dev \
    libdw1 \
    valgrind


sudo apt install 
binutils-arm-none-eabi
gcc-arm-none-eabi libnewlib-arm-none-eabi libnewlib-dev libstdc++-arm-none-eabi-newlib
libavcodec-dev libavdevice-dev libavfilter-dev libavformat-dev libavresample-dev libavutil-dev libpostproc-dev libswresample-dev libswscale-dev
libglfw3
libportaudiocpp0 libqt5charts5 libqt5location5 libqt5location5-plugins libvulkan-dev opencl-c-headers opencl-clhpp-headers
capnproto casync clinfo cppcheck cppcheck-gui libcapnp-dev libeigen3-dev libglew-dev libglfw3-dev libqt5charts5-dev libsystemd-dev libzmq3-dev opencl-headers
ocl-icd-opencl-dev qtlocation5-dev
scons


[ portaudio19-dev libjack-dev libjack0 ]



cd openpilot
proxychains ./update_requirements.sh
configure: error: You must get working getaddrinfo() function or pass the "--disable-ipv6" option to configure.

./update_requirements.sh






POETRY_INSTALL_ARGS="--no-cache --no-root"

if [ -n "$XX" ]; then
  echo "WARNING: using xx dependency group, installing globally"
  proxychains poetry config virtualenvs.create false --local
  POETRY_INSTALL_ARGS="$POETRY_INSTALL_ARGS --with xx --sync"
else
  echo "PYTHONPATH=${PWD}" > .env
  proxychains poetry self add poetry-dotenv-plugin@^0.1.0
fi

echo "pip packages install..."
proxychains poetry install $POETRY_INSTALL_ARGS
pyenv rehash

[ -n "$XX" ] || [ -n "$POETRY_VIRTUALENVS_CREATE" ] && RUN="" || RUN="poetry run"

if [ "$(uname)" != "Darwin" ]; then
  echo "pre-commit hooks install..."
  shopt -s nullglob
  for f in .pre-commit-config.yaml */.pre-commit-config.yaml; do
    if [ -e "$DIR/$(dirname $f)/.git" ]; then
      $RUN pre-commit install -c "$f"
    fi
  done
fi





没有安装portaudio19-dev导致，但是wine这些都不能删啊

  - Installing pyaudio (0.2.13): Failed

  ChefBuildError

  Backend subprocess exited when trying to invoke build_wheel
  
  running bdist_wheel
  running build
  running build_py
  creating build
  creating build/lib.linux-x86_64-cpython-311
  creating build/lib.linux-x86_64-cpython-311/pyaudio
  copying src/pyaudio/__init__.py -> build/lib.linux-x86_64-cpython-311/pyaudio
  running build_ext
  building 'pyaudio._portaudio' extension
  creating build/temp.linux-x86_64-cpython-311
  creating build/temp.linux-x86_64-cpython-311/src
  creating build/temp.linux-x86_64-cpython-311/src/pyaudio
  gcc -pthread -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -fPIC -I/usr/local/include -I/usr/include -I/tmp/tmplh9ybnwp/.venv/include -I/home/andreas/.pyenv/versions/3.11.4/include/python3.11 -c src/pyaudio/device_api.c -o build/temp.linux-x86_64-cpython-311/src/pyaudio/device_api.o
  src/pyaudio/device_api.c:9:10: fatal error: portaudio.h: No such file or directory
   #include "portaudio.h"
            ^~~~~~~~~~~~~
  compilation terminated.
  error: command '/usr/bin/gcc' failed with exit code 1
  

  at ~/.pyenv/versions/3.11.4/lib/python3.11/site-packages/poetry/installation/chef.py:164 in _prepare
      160│ 
      161│                 error = ChefBuildError("\n\n".join(message_parts))
      162│ 
      163│             if error is not None:
    → 164│                 raise error from None
      165│ 
      166│             return path
      167│ 
      168│     def _prepare_sdist(self, archive: Path, destination: Path | None = None) -> Path:


```

```
删除
rm -rf ~/.pyenv
rm -rf ~/.cache/pypoetry
rm ~/.pyenvrc
修改 ~/.bashrc
```

***
# 在 Docker 中安装 RKNN-Toolkit2 环境
```
cd Projects/rknn-toolkit2/rknn-toolkit2/docker/docker_file/ubuntu_xx_xx_cpxx
docker build -f Dockerfile_ubuntu_xx_xx_for_cpxx -t rknn-toolkit2:x.x.x-cpxx .
```

***
# Xray and v2rayA
vless协议的代理应该使用支持xtls/vless协议的客户端服务，v2ray-core在某些版本后已经不支持vless

<https://xtls.github.io>

<https://github.com/xtls/Xray-core/releases>

<https://github.com/XTLS/Xray-install>

PKGBUILD
```
# Maintainer: m8D2 <omui (at) proton mail (dot) com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Dct Mei <dctxmei@gmail.com>
# Contributor: denglitsch <denglitsch@gmail.com>

pkgname=xray
pkgver=1.8.23
pkgrel=1
pkgdesc="A set of network tools that helps you to build your own computer network (git version)."
arch=(x86_64)
url="https://github.com/xtls/Xray-core"
license=(MIT)
makedepends=()
source=(Xray-linux-64.zip
        xray.service
        xray@.service
        config.json)
sha512sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

package() {
  cd $srcdir/
  install -Dm644 xray.service "$pkgdir"/etc/systemd/system/xray.service
  install -Dm644 xray@.service "$pkgdir"/etc/systemd/system/xray@.service
  install -Dm644 *.dat -t "$pkgdir"/usr/share/xray/
  install -Dm644 *.json -t "$pkgdir"/etc/xray/
  install -Dm755 xray -t "$pkgdir"/usr/bin/xray/
}

```

xray.service
```
[Unit]
Description=XRay Service
Documentation=https://xtls.github.io
After=network.target nss-lookup.target

[Service]
User=nobody
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/xray/xray run -config /etc/xray/config.json
Restart=on-failure
RestartPreventExitStatus=23

[Install]
WantedBy=multi-user.target
```

xray@.service
```
[Unit]
Description=XRay Client
Documentation=https://xtls.github.io
After=network.target nss-lookup.target

[Service]
User=nobody
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/xray/xray run -config /etc/xray/%i.json
Restart=on-failure
RestartPreventExitStatus=23

[Install]
WantedBy=multi-user.target
```
config.json
```
{
  "inbounds": [
    {
      "port": 1080, // SOCKS 代理端口，在浏览器中需配置代理并指向这个端口
      "listen": "127.0.0.1",
      "protocol": "socks",
      "settings": {
        "udp": true
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "vmess",
      "settings": {
        "vnext": [
          {
            "address": "server", // 服务器地址，请修改为你自己的服务器 ip 或域名
            "port": 10086, // 服务器端口
            "users": [
              {
                "id": "b831381d-6324-4d53-ad4f-8cda48b30811"  // 记得替换这个字段，使用 `xray uuid` 或 `uuidgen` 生成
              }
            ]
          }
        ]
      }
    },
    {
      "protocol": "freedom",
      "tag": "direct"
    }
  ],
  "routing": {
    "domainStrategy": "IPOnDemand",
    "rules": [
      {
        "type": "field",
        "ip": ["geoip:private","geoip:cn"], // 绕过局域网和国内IP段
        "outboundTag": "direct"
      }
    ]
  }
}
```

`makedeb`生成`xray_1.8.23-1_amd64.deb`安装
```
sudo systemctl enable xray.service
sudo systemctl restart xray.service
```
配置文件具体修改config.json。我这里本地端口定义为10809，浏览器socket5端口也跟着改。



v2rayA其实就是给xray或者v2ray再套一个web前端。

<https://v2raya.org>

<https://github.com/v2rayA/v2rayA/releases>

```
sudo systemctl enable v2raya.service
sudo systemctl restart v2raya.service
```

如果有必要可以关闭v2ray或xray服务
```
sudo systemctl disable v2ray --now ### Xray 需要替换服务为 xray
```

修改一下官方提供的deb并安装

web前端是

<http://localhost:2017>


sudo gedit /etc/v2raya/v2raya
修改
```
V2RAYA_V2RAY_BIN=/usr/bin/xray/xray

V2RAYA_V2RAY_ASSETSDIR=/usr/share/xray/
```

查看log
```
sudo cat /var/log/v2raya/v2raya.log
```

要有
```
... V2Ray binary is /usr/bin/xray/xray
... V2Ray asset directory is /usr/share/xray/
```

然后在<http://localhost:2017>填入订阅和启动服务

[andreas .]

浏览器socket5端口是20170




***
# apt-offline
```
sudo apt-get update
sudo apt-get install apt-offline
```

***
# pip加速

## 临时使用方法
```
pip install selenium -i https://mirrors.163.com/pypi/simple
pip install selenium -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
```

## 永久设置 pip 源
```
mkdir ~/.pip
tee ~/.pip/pip.conf <<-'EOF'
[global]
timeout=600
index-url=https://mirrors.aliyun.com/pypi/simple/
trusted-host=mirrors.aliyun.com
EOF
```
如果使用的是 windows 系统，同样在用户的家目录下创建 .pip 文件夹，并写入 pip.conf 配置文件。具体路径为 C:\Users\{你的系统⽤户名}\.pip\pip.conf

## 通过命令行配置 pip 源
如果你不想编写配置文件，可以使用一条命令配置 pip 源，会自动生成以上目录及文件 升级 pip 到最新的版本后进行配置
```
# 升级 pip
pip install -i https://mirrors.aliyun.com/pypi/simple/ pip -U
# ⽣成 pip 配置⽂件
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
```


***
# autocad有关 2d cad
```
除了wine一个autocad-2004，还可以使用ARES(graebert-gmbh)/DraftSight(dassault-systemes)等

librecad太不好使

顺便提 freecad 是挺好的一个 3d cad 工具
```

***
# generate a barcode
```
sudo apt install barcode
echo "Your Data" | barcode -E png > barcode.png
```
or
```
pip install python-barcode
```
Here is a sample Python code to generate a barcode
```
import barcode
from barcode.writer import ImageWriter
 
code = barcode.get('ean13', '123456789102', writer=ImageWriter())
code.save('my_barcode')
```
zint在22.04版本起才官方带zint和zint-qt，更早版本可以自己编译出deb包
```
sudo apt-get install zint
zint -o barcode13.png -b 13 -d "123456789012"
zint -o barcode8.png -b 8 -d "12345678"
```
## 编译zint出deb

### 处理 gl.h 缺失的问题

```
/usr/include/x86_64-linux-gnu/qt5/QtGui/qopengl.h:139:13: fatal error: GL/gl.h: No such file or directory
```
```
$ locate GL/gl.h

/opt/Xilinx/Vivado/2017.4/msys/include/GL/gl.h
/opt/Xilinx/Vivado/2017.4/msys32/mingw32/i686-w64-mingw32/include/GL/gl.h
/opt/Xilinx/Vivado/2018.3/msys64/mingw64/x86_64-w64-mingw32/include/GL/gl.h
/opt/nvidia/nvidia_sdk/JetPack_4.5.1_Linux_JETSON_AGX_XAVIER/Linux_for_Tegra/rootfs/usr/include/GL/gl.h
/opt/nvidia/nvidia_sdk/JetPack_4.5.1_Linux_JETSON_AGX_XAVIER/Linux_for_Tegra/rootfs/usr/src/nvidia/graphics_demos/include/GL/gl.h
/usr/i686-w64-mingw32/include/GL/gl.h
/usr/share/mingw-w64/include/GL/gl.h
/usr/x86_64-w64-mingw32/include/GL/gl.h

$ ls /usr/include/GL/gl.h
ls: cannot access '/usr/include/GL/gl.h': No such file or directory

$ qmake -query
QT_SYSROOT:
QT_INSTALL_PREFIX:/usr
QT_INSTALL_ARCHDATA:/usr/lib/x86_64-linux-gnu/qt5
QT_INSTALL_DATA:/usr/share/qt5
QT_INSTALL_DOCS:/usr/share/qt5/doc
QT_INSTALL_HEADERS:/usr/include/x86_64-linux-gnu/qt5
QT_INSTALL_LIBS:/usr/lib/x86_64-linux-gnu
QT_INSTALL_LIBEXECS:/usr/lib/x86_64-linux-gnu/qt5/libexec
QT_INSTALL_BINS:/usr/lib/qt5/bin
QT_INSTALL_TESTS:/usr/tests
QT_INSTALL_PLUGINS:/usr/lib/x86_64-linux-gnu/qt5/plugins
QT_INSTALL_IMPORTS:/usr/lib/x86_64-linux-gnu/qt5/imports
QT_INSTALL_QML:/usr/lib/x86_64-linux-gnu/qt5/qml
QT_INSTALL_TRANSLATIONS:/usr/share/qt5/translations
QT_INSTALL_CONFIGURATION:/etc/xdg
QT_INSTALL_EXAMPLES:/usr/lib/x86_64-linux-gnu/qt5/examples
QT_INSTALL_DEMOS:/usr/lib/x86_64-linux-gnu/qt5/examples
QT_HOST_PREFIX:/usr
QT_HOST_DATA:/usr/lib/x86_64-linux-gnu/qt5
QT_HOST_BINS:/usr/lib/qt5/bin
QT_HOST_LIBS:/usr/lib/x86_64-linux-gnu
QMAKE_SPEC:linux-g++
QMAKE_XSPEC:linux-g++
QMAKE_VERSION:3.1
QT_VERSION:5.9.5

```


how to solve this errr. I already have libgl1-mesa-dev and libglu1-mesa-dev installed

```
dpkg -L libgl1-mesa-dev | grep gl.h
sudo apt remove --purge qt5-default qtcreator
sudo apt install qt5-default qtcreator libgl1-mesa-dev libglu1-mesa-dev mesa-common-dev
sudo apt-get install --reinstall libgl1-mesa-dev libglu1-mesa-dev mesa-common-dev freeglut3-dev
```
到这里就ok了
```
dpkg -S /usr/include/GL/gl.h 
mesa-common-dev:amd64: /usr/include/GL/gl.h
```


### 获取 debian 修改版本的 zint 源码

ppa 里<https://launchpad.net/ubuntu/+source/zint>查找选取比较早的版本为 2.10.0

从<https://launchpad.net/ubuntu/+source/zint/2.10.0-1>下载
```
zint_2.10.0-1.dsc
zint_2.10.0.orig.tar.xz
zint_2.10.0-1.debian.tar.xz
```

修改zint_2.10.0-1.dsc
```
Format: 3.0 (quilt)
Source: zint
Binary: zint, zint-qt, libzint2.10, libzint-dev
Architecture: any
Version: 2.10.0-1
Maintainer: Dmitry Smirnov <onlyjob@debian.org>
Uploaders: Jakob Haufe <sur5r@debian.org>
Homepage: https://sourceforge.net/projects/zint/
Standards-Version: 4.6.0
Vcs-Browser: https://salsa.debian.org/debian/zint
Vcs-Git: https://salsa.debian.org/debian/zint.git
Build-Depends: debhelper-compat (= 12), cmake, libpng-dev, qtbase5-dev, qttools5-dev
Package-List:
 libzint-dev deb libdevel optional arch=any
 libzint2.10 deb libs optional arch=any
 zint deb graphics optional arch=any
 zint-qt deb graphics optional arch=any
Files:
 e14cff4416bc445b06ea2de2c340f8bd 1685384 zint_2.10.0.orig.tar.xz
 422c3d8ab5e1bb6170b95fdfa2af2aea 8656 zint_2.10.0-1.debian.tar.xz
```
后面的 Files 里面数据来源为

`md5sum zint_2.10.0-1.debian.tar.xz` and `du -sb zint_2.10.0-1.debian.tar.xz`


解包
```
$ dpkg-source -x zint_2.10.0-1.dsc
```
碰到libpng12.so.0库依赖问题，这里不应该安装`libpng12-0_1.2.54-1ubuntu1_amd64.deb`和`libpng12-dev_1.2.54-1ubuntu1_amd64.deb`
```
dpkg-shlibdeps: error: cannot find library libpng12.so.0 needed by debian/libzint2.10/usr/lib/libzint.so.2.10.0.0 (ELF format: 'elf64-x86-64' abi: '0201003e00000000'; RPATH: '')
dpkg-shlibdeps: error: cannot continue due to the error above
Note: libraries are not searched in other binary packages that do not have any shlibs or symbols file.
To help dpkg-shlibdeps find private libraries, you might need to use -l.
dh_shlibdeps: error: dpkg-shlibdeps -Tdebian/libzint2.10.substvars debian/libzint2.10/usr/lib/libzint.so.2.10.0.0 returned exit code 2
dh_shlibdeps: error: Aborting due to earlier error
```

how to change lib depend on libpng.so instead of libpng12.so.0
```
andreas@Vostro-5880:~/Downloads/build_zint/test
$ echo $LD_LIBRARY_PATH

andreas@Vostro-5880:~/Downloads/build_zint/test
$ cmake .
-- The C compiler identification is GNU 7.5.0
-- The CXX compiler identification is GNU 7.5.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Found libpng: /opt/modelsim/modeltech/linux_x86_64/libpng.so
-- Configuring done
-- Generating done
-- Build files have been written to: /home/andreas/Downloads/build_zint/test
andreas@Vostro-5880:~/Downloads/build_zint/test

libpng.so路径还不是我希望的


unset LD_LIBRARY_PATH

ldconfig -p | grep libpng

export LIBPNG_LIBRARY=/usr/lib/x86_64-linux-gnu/libpng.so
export LIBPNG_INCLUDE_DIR=/usr/include/
cmake ..
```

都不行，但是root登录是对的。那么PATH也应最小化
```
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

这样libpng路径就对了，指向`/usr/lib/x86_64-linux-gnu/libpng.so`


```
dpkg-source -x zint_2.10.0-1.dsc
cd zint-2.10.0/
dpkg-buildpackage -rfakeroot -uc -us -b | tee ../log.txt

sudo dpkg -i libzint2.10_2.10.0-1_amd64.deb
sudo dpkg -i libzint-dev_2.10.0-1_amd64.deb
sudo dpkg -i zint_2.10.0-1_amd64.deb
sudo dpkg -i zint-qt_2.10.0-1_amd64.deb
```
就可以了





## Scanning Barcodes
```
sudo apt-get install zbar-tools
zbarimg barcode_image.png


zint -o barcode8.png -b 8 -d "12345678" --scale=2           # The --scale option increases the barcode's size.
$ zbarimg  barcode8.png 
CODE-39:12345678
scanned 1 barcode symbols from 1 images in 0.12 seconds

zint -o barcode8.png -b 8 -d "12345678" --fg=000000 --bg=FFFFFF
zbarimg --verbose barcode8.png

zint -o barcode8.png -b 8 -d "12345678" --scale=2 --fg=000000 --bg=FFFFFF


```


***
# alist更新
只想要下载pikpak的存储内容，替换即可，但是数据库格式不兼容了。一定要在目录里样运行才能修改了密码

## 先停止服务
```
# systemctl stop alist.service 
andreas@Vostro-5880:/opt/alist
# systemctl start alist.service 
```

## Randomly generate a password
```
# ./alist admin random
```

## Manually set a password, `NEW_PASSWORD` refers to the password you need to set
```
# ./alist admin set NEW_PASSWORD
```

<https://alist.nn.ci/guide/install/manual.html#how-to-update>

<https://github.com/AlistGo/alist/releases>

***
#
```
```


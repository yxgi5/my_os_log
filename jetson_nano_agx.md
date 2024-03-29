* * *
# 0. 首先安装亚克力支架等。


# 1. 下载SD卡镜像
<https://developer.nvidia.com/embedded/downloads>
迅雷下载看运气吧


下面这个办法其实也可以，但是非常慢。
`wget https://developer.download.nvidia.com/embedded/L4T/r32_Release_v5.1/r32_Release_v5.1/Jeston_Nano/jetson-nano-jp451-sd-card-image.zip`
可能加cookie才能保证连接

# 2. SD卡刷系统
用etcher把解压后的镜像刷进SD卡，这里是64G的SD卡。

然后把J48挑帽接上，接上USB键盘和USB鼠标，5VDV供电。根据提示释放系统到SD卡。

其中选择自动登录桌面


## tips:`/etc/apt/sources.list`更换成国内源
<http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/>
<https://mirrors.aliyun.com/ubuntu-ports/>
别忘了
```
sudo apt update
sudo apt upgrade
```

# 3. Jetson Nano 摄像头测试

## 方法1
目标板桌面terminal或者ssh输入指令：
`$  nvgstcapture`

## 方法2
目标板桌面terminal输入指令：
`$ gst-launch-1.0 nvarguscamerasrc ! 'video/x-raw(memory:NVMM),width=3820, height=2464, framerate=21/1, format=NV12' ! nvvidconv flip-method=0 ! 'video/x-raw,width=960, height=616' ! nvvidconv ! nvegltransform ! nveglglessink -e`

单独测摄像头0或1,修改sensor_id=0或sensor_id=1
`gst-launch-1.0 nvarguscamerasrc sensor_id=0 ! \
   'video/x-raw(memory:NVMM),width=3280, height=2464, framerate=21/1, format=NV12' ! \
   nvvidconv flip-method=0 ! 'video/x-raw,width=960, height=720' ! \
   nvvidconv ! nvegltransform ! nveglglessink -e`

## 方法3
<https://github.com/JetsonHacksNano/CSI-Camera>
把~/.ssh打包通过scp推到目标板，这样可以使用加密git://
`git clone git@github.com:JetsonHacksNano/CSI-Camera.git`

`cd CSI-Camera`
`g++ -std=c++11 -Wall -I/usr/include/opencv4 simple_camera.cpp -L/usr/lib -lopencv_core -lopencv_highgui -lopencv_videoio -o simple_camera`

报错
```
Failed to load module "canberra-gtk-module"
```
`sudo apt install libcanberra-gtk-module`

用这个测双目摄像头硬件很方便啊

# 4. 远程控制(串口/SSH/VNC)
官网start文档有USB线直接在主机引入一个com口的

主机连接板子的USB串口(并不好用)
`sudo screen /dev/ttyACM0 115200`

我这可以接屏幕，就在目标板桌面连接wifi好了
`sudo apt update`


## tips：如果
```
Could not get lock /var/lib/apt/lists/lock - open (11: Resource temporarily unavailable)
```
解决办法
`sudo rm /var/lib/apt/lists/lock`

目标板桌面通过wifi连接到内网后
`ifconfig -a`找到wifi的ip
主机通过SSH登录目标板


## VNC配置
```
sudo apt update
sudo apt install vino       （现在不叫vino-server了）
sudo apt install dconf-editor
mkdir -p ~/.config/autostart
cp /usr/share/applications/vino-server.desktop ~/.config/autostart
gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino require-encryption false
gsettings set org.gnome.Vino authentication-methods "['vnc']"
gsettings set org.gnome.Vino vnc-password $(echo -n '123456'|base64)
```
dconf-editor也可以修改

`sudo vim /usr/share/glib-2.0/schemas/org.gnome.Vino.gschema.xml`

在`</schema>`之前插入
```
<key name='enabled' type='b'>
      <summary>Enable remote access to the desktop</summary>
      <description>
        If true, allows remote access to the desktop via the RFB
        protocol. Users on remote machines may then connect to the
        desktop using a VNC viewer.
      </description>
      <default>false</default>
    </key>
```
如果前面释放SD卡系统的时候选了密码登录而不是自动登录，现在要改成自动登录
System Settings的账户设置成自动login（右上的unlock先）

`sudo reboot`

VNC分辨率如果有问题，就修改。

To use a different resolution, edit /etc/X11/xorg.conf and append the following lines:
```
Section "Screen"
   Identifier    "Default Screen"
   Monitor       "Configured Monitor"
   Device        "Tegra0"
   SubSection "Display"
       Depth    24
       Virtual 1280 800 # Modify the resolution by editing these values
   EndSubSection
EndSection
```
或者在运行vino之前，`xrandr --fb 1280x1024`


也可以自己设置 启动应用程序
名称 `vino-server`
命令 `/home/xxx/openvino`
注释 `vino-server`

先删`~/.config/autostart/vino-server.desktop`
`gedit ~/openvino`
```
#!/bin/bash
export DISPLAY=:0
gsettings set org.gnome.Vino enabled true
gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino require-encryption false
xrandr --fb 1280x1024
/usr/lib/vino/vino-server --sm-disable &
```

`chmod +x ~/openvino`

参考网址：
<https://wiki.archlinux.org/index.php/Vino#Alternative_Desktop_Environments>
<https://help.ubuntu.com/community/VNC/Servers>


# 5. 安装其他一些工具
```
sudo apt install iptux dconf-editor
sudo apt install aptitude apt-file apt-utils
sudo apt-file update
sudo apt install cmake-gui libopencv-dev
sudo apt install python3-pip python-pip
```
```
pip3 list
DEPRECATION: The default format will switch to columns in the future. You can use --format=(legacy|columns) (or define a format=(legacy|columns) in your pip.conf under the [list] section) to disable this warning.
apt-clone (0.2.1)
apturl (0.5.2)
asn1crypto (0.24.0)
beautifulsoup4 (4.6.0)
blinker (1.4)
Brlapi (0.6.6)
certifi (2018.1.18)
chardet (3.0.4)
cryptography (2.1.4)
cupshelpers (1.0)
decorator (4.1.2)
defer (1.0.6)
distro-info (0.18ubuntu0.18.04.1)
feedparser (5.2.1)
graphsurgeon (0.4.5)
html5lib (0.999999999)
httplib2 (0.9.2)
idna (2.6)
Jetson.GPIO (2.0.16)
keyring (10.6.0)
keyrings.alt (3.0)
language-selector (0.1)
launchpadlib (1.10.6)
lazr.restfulclient (0.13.5)
lazr.uri (1.0.3)
louis (3.5.0)
lxml (4.2.1)
macaroonbakery (1.1.3)
Mako (1.0.7)
MarkupSafe (1.0)
numpy (1.13.3)
oauth (1.0.1)
oauthlib (2.0.6)
onboard (1.4.1)
PAM (0.4.2)
pandas (0.22.0)
pip (9.0.1)
protobuf (3.0.0)
pycairo (1.16.2)
pycrypto (2.6.1)
pycups (1.9.73)
pygobject (3.26.1)
PyICU (1.9.8)
PyJWT (1.5.3)
pymacaroons (0.13.0)
PyNaCl (1.1.2)
pyRFC3339 (1.0)
python-apt (1.6.5+ubuntu0.5)
python-dateutil (2.6.1)
python-debian (0.1.32)
pytz (2018.3)
pyxattr (0.6.0)
pyxdg (0.25)
PyYAML (3.12)
requests (2.18.4)
requests-unixsocket (0.1.5)
scipy (0.19.1)
SecretStorage (2.3.1)
setuptools (39.0.1)
simplejson (3.13.2)
six (1.11.0)
ssh-import-id (5.7)
system-service (0.3)
systemd-python (234)
tensorrt (7.1.3.0)
ubuntu-drivers-common (0.0.0)
uff (0.6.9)
unity-scope-calculator (0.1)
unity-scope-chromiumbookmarks (0.1)
unity-scope-colourlovers (0.1)
unity-scope-devhelp (0.1)
unity-scope-firefoxbookmarks (0.1)
unity-scope-manpages (0.1)
unity-scope-openclipart (0.1)
unity-scope-texdoc (0.1)
unity-scope-tomboy (0.1)
unity-scope-virtualbox (0.1)
unity-scope-yelp (0.1)
unity-scope-zotero (0.1)
urllib3 (1.22)
urwid (2.0.1)
wadllib (1.3.2)
webencodings (0.5)
wheel (0.30.0)
xkit (0.0.0)
youtube-dl (2018.3.14)
zope.interface (4.3.2)
```
pip3升级到21.0.1
```
sudo -H pip3 install --upgrade pip -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install launchpadlib -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install testresources -i https://mirrors.163.com/pypi/simple
sudo python3 -m pip install --upgrade setuptools -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install numpy==1.19.5 -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install protobuf==3.3.0 -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install opencv-python==4.5.1.48 -i https://mirrors.163.com/pypi/simple
ModuleNotFoundError: No module named ‘skbuild’
sudo -H pip3 install scikit-build -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install cmake -i https://mirrors.163.com/pypi/simple
//sudo -H pip3 install scipy -i https://mirrors.163.com/pypi/simple
##sudo -H pip3 install matplotlib -i https://mirrors.163.com/pypi/simple
##sudo -H pip3 install scikit-learn -i https://mirrors.163.com/pypi/simple
//pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple cmake

sudo -H pip3 install numpy==1.19.5 grpcio absl-py py-cpuinfo psutil portpicker six==1.11.0 mock requests gast h5py astor termcolor protobuf  -i https://mirrors.163.com/pypi/simple
sudo -H /usr/bin/python3 -m pip install --upgrade pip
sudo -H /usr/bin/python3 -m pip install --upgrade setuptools
sudo -H pip3 install testresources  -i https://mirrors.163.com/pypi/simple
//pip install --upgrade pip -vvv
```
```
sudo apt install mlocate
sudo updatedb
```
```
sudo apt-get install libcanberra-gtk-module
```

```
sudo apt install fcitx-googlepinyin fcitx fcitx-bin fcitx-data fcitx-modules fcitx-googlepinyin fcitx-config-gtk fcitx-frontend-gtk2 fcitx-ui-classic fcitx-module-dbus
sudo im-config
```
需要重启板子在tray里面设置添加googlepinyin
```
sudo cp /usr/share/fcitx/xdg/autostart/fcitx-autostart.desktop /etc/xdg/autostart/
```
~/.xprofile中加入：(不要在/etc/environment)
```
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export QT4_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```

~/.bashrc
```
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
修改为
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
```
```
sudo apt install parcellite
mkdir -p /home/andy/.config/autostart/
cp /usr/share/applications/parcellite.desktop /home/andy/.config/autostart/
```


设置PC的pycharm远程连接目标板

需要安装professional版本，试用就好

新建project时候

设置解释器为目标板的解释器

然后在settings-->Project...-->Python Interpreter下拉选show all编辑框设置sudo


```
sudo apt install p7zip p7zip-full p7zip-rar unace unrar zip unzip p7zip-full p7zip-rar sharutils uudeview mpack jlha-utils arj cabextract file-roller xz-utils
```


目标板上也可以安装pycharm
<https://www.jetbrains.com/pycharm/download/>


`sudo apt install i2c-tools libi2c-dev `
查看有几组i2c adapter
```
andy@andy-desktop:~/Downloads$ i2cdetect -l
i2c-3	i2c       	7000c700.i2c                    	I2C adapter
i2c-1	i2c       	7000c400.i2c                    	I2C adapter
i2c-8	i2c       	i2c-6-mux (chan_id 1)           	I2C adapter
i2c-6	i2c       	Tegra I2C adapter               	I2C adapter
i2c-4	i2c       	7000d000.i2c                    	I2C adapter
i2c-2	i2c       	7000c500.i2c                    	I2C adapter
i2c-0	i2c       	7000c000.i2c                    	I2C adapter
i2c-7	i2c       	i2c-6-mux (chan_id 0)           	I2C adapter
i2c-5	i2c       	7000d100.i2c                    	I2C adapter
```
查看总线上器件
```
andy@andy-desktop:~/Downloads$ i2cdetect -r -y 2
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: 50 -- -- -- -- -- -- 57 -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --  
```
查看某设备所有寄存器的值
```
andy@andy-desktop:~/Downloads$ i2cdump -f -y 2 0x50
No size specified (using byte-data access)
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 01 00 fc 00 78 0d 00 00 04 46 00 00 00 00 00 00    ?.?.x?..?F......
10: 00 00 00 00 36 39 39 2d 31 33 34 34 38 2d 30 30    ....699-13448-00
20: 30 30 2d 34 30 30 20 46 2e 30 00 00 00 00 00 00    00-400 F.0......
30: 00 00 ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
40: ff ff ff ff 84 40 ec 4b 04 00 31 34 32 34 37 32    ....?@?K?.142472
50: 30 30 36 38 32 35 30 00 00 00 00 00 00 00 00 00    0068250.........
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
90: 00 00 00 00 00 00 4e 56 43 42 1c 00 4d 31 00 00    ......NVCB?.M1..
a0: ff ff ff ff ff ff ff ff ff ff ff ff 84 40 ec 4b    ............?@?K
b0: 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ?...............
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 33    ...............3
```

查看主板上的PCI插槽
`sudo apt install dmidecode`
```
andy@andy-desktop:~$ sudo dmidecode | grep --color "PCI"
andy@andy-desktop:~$ lspci
00:01.0 PCI bridge: NVIDIA Corporation Device 0fae (rev a1)
00:02.0 PCI bridge: NVIDIA Corporation Device 0faf (rev a1)
01:00.0 Network controller: Intel Corporation Wireless 8265 / 8275 (rev 78)
02:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 15)
andy@andy-desktop:~$ lspci -tv
-[0000:00]-+-01.0-[01]----00.0  Intel Corporation Wireless 8265 / 8275
           \-02.0-[02]----00.0  Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller
```


<https://docs.nvidia.com/deeplearning/frameworks/install-tf-jetson-platform/index.html>
`sudo apt-get install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran`
`sudo apt-get install virtualenv`
`$ python3 -m virtualenv -p python3 <chosen_venv_name>`
`$ source <chosen_venv_name>/bin/activate`
`pip3 install numpy==1.19.5 grpcio absl-py py-cpuinfo psutil portpicker six==1.11.0 mock requests gast h5py astor termcolor protobuf  -i https://mirrors.163.com/pypi/simple`

keras-pr keras-applications
```
sudo apt install python3.8 python3.8-dev python3.8-distutils python3.8-examples python3.8-gdbm  python3.8-lib2to3 python3.8-minimal python3.8-venv python3:any
sudo python3.8 -m pip install --upgrade pip -i https://mirrors.163.com/pypi/simple
sudo python3.8 -m pip install --upgrade setuptools -i https://mirrors.163.com/pypi/simple
sudo pip3.8 install -U numpy grpcio absl-py py-cpuinfo psutil portpicker six mock requests gast h5py astor termcolor protobuf keras-applications -i https://mirrors.163.com/pypi/simple
```


```
dpkg-reconfigure tzdata
```

声音输出到HDMI

select sound setting -> output source to HDMI

```sudo apt install alsamixergui volumeicon-alsa alsa-oss alsa-tools-gui
sudo apt install mkchromecast-pulseaudio pulseaudio-equalizer pulseaudio-esound-compat pulseaudio-module-gconf xfce4-pulseaudio-plugin
sudo apt purge gnome-alsamixer
```

设置调用从
`xterm -e 'alsamixer'`
改成
`alsamixergui`

`aplay -l`
```
**** List of PLAYBACK Hardware Devices ****
card 0: tegrahda [tegra-hda], device 3: HDMI 0 [HDMI 0]
  Subdevices: 0/1
  Subdevice #0: subdevice #0
card 1: tegrasndt210ref [tegra-snd-t210ref-mobile-rt565x], device 0: ADMAIF1 CIF ADMAIF1-0 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: tegrasndt210ref [tegra-snd-t210ref-mobile-rt565x], device 1: ADMAIF2 CIF ADMAIF2-1 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: tegrasndt210ref [tegra-snd-t210ref-mobile-rt565x], device 2: ADMAIF3 CIF ADMAIF3-2 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: tegrasndt210ref [tegra-snd-t210ref-mobile-rt565x], device 3: ADMAIF4 CIF ADMAIF4-3 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: tegrasndt210ref [tegra-snd-t210ref-mobile-rt565x], device 4: ADMAIF5 CIF ADMAIF5-4 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: tegrasndt210ref [tegra-snd-t210ref-mobile-rt565x], device 5: ADMAIF6 CIF ADMAIF6-5 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: tegrasndt210ref [tegra-snd-t210ref-mobile-rt565x], device 6: ADMAIF7 CIF ADMAIF7-6 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: tegrasndt210ref [tegra-snd-t210ref-mobile-rt565x], device 7: ADMAIF8 CIF ADMAIF8-7 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: tegrasndt210ref [tegra-snd-t210ref-mobile-rt565x], device 8: ADMAIF9 CIF ADMAIF9-8 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: tegrasndt210ref [tegra-snd-t210ref-mobile-rt565x], device 9: ADMAIF10 CIF ADMAIF10-9 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```
结果显示，0号卡上的设备3是NVIDIA的HDMI声卡
`sudo alsamixer -c 0`
```
aplay -D plughw:0,3 /usr/share/sounds/alsa/Front_Center.wav
```
plughw:0,3的含义很明确了，就是刚才列出的card 0、device 3，后面这个wav文件可以是任意的wav格式的音频文件。

编辑`/etc/asound.conf`文件，这个文件本来不存在的，没关系，新建一个就好。然后输入下面的内容保存：
```
pcm.!default {
type hw
card 0
device 3
}
```


# 安装vncserver
ref:   
<http://wiki.friendlyarm.com/wiki/index.php/How_to_setup_VNC_server_on_NanoPC-T4/zh>  

## 安装VNC Server
```
sudo apt-get install tightvncserver //或者 vnc4server
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
这里冒号前有空格


## 配置VNC server
编辑`~/.vnc/xstartup`文件，在尾部添加:  
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
#/usr/bin/lxsession -s LXDE &
#ibus-daemon -drx --panel /usr/lib/ibus/ibus-ui-gtk3 &
openbox-session &
```  
`chmod +x ~/.vnc/xstartup`

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
User=andy
#PAMName=andy  #有这句服务启动失败
PIDFile=/home/andy/.vnc/%H:%i.pid
#ExecStart=/sbin/runuser -l root -c "/usr/bin/vncserver -depth 24 -geometry 1600x900 :%i" 
ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1
ExecStart=/usr/bin/vncserver -depth 24 -geometry 1600x900 :%i
ExecStop=/usr/bin/vncserver -kill :%i
 
[Install]
WantedBy=multi-user.target
```

普通用户的ExecStart不同于root，加/sbin/runuser则会在启动服务时报以下错误
Job for vncserver@:2.service failed because the control process exited with error code. See "systemctl status vncserver@:2.service" and "journalctl -xe" for details.

创建符号链接以实现开机自启动：  
```
sudo ln -s /etc/systemd/system/vncserver@.service /etc/systemd/system/multi-user.target.wants/vncserver@1.service
```

修改了服务配置文件需要
```
sudo systemctl daemon-reload
sudo systemctl start vncserver@1.service
systemctl status vncserver@1.service
```
  

查看VNC端口占用
```
sudo netstat -tlup | grep vnc
```


重启开发板：  
```
sudo reboot
```

vncviewer这样访问
`192.168.1.30:1`
这里冒号前没有空格


# firefox
`sudo apt install firefox `
<https://addons.mozilla.org/firefox/downloads/file/1056777/proxy_switchyomega-2.5.20-an+fx.xpi>
<https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt>


# 其他一些杂七杂八的玩意儿
```
sudo apt install stress stress-ng sysstat netstress
sudo apt install lm-sensors
```
`sensors`
```
sudo -H pip3 install jetson-stats -i https://mirrors.163.com/pypi/simple
sudo jtop
```
```
sudo nvpmodel --query
sudo nvpmodel -m 0
sudo nvpmodel -m 3
```
```
sudo jetson_clocks
```
for agx fan
```
sudo jetson_clocks --fan
cat /sys/devices/pwm-fan/target-pwm
sudo sh -c "echo 100 > /sys/devices/pwm-fan/target_pwm"
echo 255 | sudo tee /sys/devices/pwm-fan/target_pwm
```

```
sudo apt install libgtk2.0-dev libpango-perl libpango1.0-dev build-essential cpanminus git conky conky-all tk-dev volumeicon-alsa gnome-icon-theme parcellite shutter net-tools p7zip p7zip-full p7zip-rar unace unrar zip unzip p7zip-full p7zip-rar sharutils uudeview mpack jlha-utils arj cabextract file-roller xz-utils fonts-ipafont-gothic fonts-ipafont-mincho fonts-wqy-microhei fonts-wqy-zenhei fonts-indic git libgtk2.0-dev libglib2.0-dev libgconf2-dev libgstreamer1.0-dev g++ make cmake libgst-dev autoconf libtool automake cmake cmake-gui python-pip gtk-theme-switch gtk2-engines openbox-dev lxappearance-obconf adwaita-icon-theme-full chromium-browser  chromium-browser-l10n firefox network-manager-dev network-manager-openvpn network-manager-pptp network-manager-vpnc network-manager-openconnect network-manager-iodine pppoe ppp pppoeconf pppconfig fcitx-table-wubi libreoffice-l10n-en-za hyphen-en-gb hunspell-en-ca libreoffice-l10n-en-gb thunderbird-locale-en-gb mythes-en-au libreoffice-help-en-gb fcitx-sunpinyin hunspell-en-za gimp-help-en kde-l10n-engb hunspell-en-au hunspell-en-gb kde-l10n-zhcn fcitx-googlepinyin fcitx fcitx-bin fcitx-data fcitx-modules fcitx-googlepinyin fcitx-config-gtk fcitx-frontend-gtk2 fcitx-ui-classic fcitx-module-dbus xscreensaver libopengl-xscreensaver-perl xscreensaver-data xscreensaver-data-extra xscreensaver-gl xscreensaver-gl-extra xscreensaver-screensaver-bsod xscreensaver-screensaver-dizzy xscreensaver-screensaver-webcollage fonts-freefont-ttf ubuntu-desktop ubuntu-restricted-extras ubuntu-unity-desktop unity-tweak-tool screenfetch gitk

```


unity-control-center和gnome-control-center都空白的处理

`env XDG_CURRENT_DESKTOP=GNOME gnome-control-center`
这样就可以显示了

可以修改`/usr/share/applications/gnome-control-center.desktop`

unity-control-center应该也类似，`XDG_CURRENT_DESKTOP=Unity`
```
sudo apt install busybox pciutils

sudo apt install strace

git clone git@github.com:NVIDIA/jetson-gpio.git
sudo -H pip3 install Jetson.GPIO -i https://mirrors.163.com/pypi/simple
sudo /opt/nvidia/jetson-io/jetson-io.py
```

`sudo gedit /etc/init.d/fan`
```
#!/bin/bash 
 
### BEGIN INIT INFO
# Provides: fan
# Required-Start: $remote_fs $syslog
# Required-Stop: $remote_fs $syslog
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: start fan
# Description: start fan
### END INIT INFO

echo '用户密码' | sudo -S su
sleep 2
echo 150 > /sys/devices/pwm-fan/target_pwm
exit 0
```
```
sudo chmod 777 /etc/init.d/fan
sudo update-rc.d fan defaults 90
sudo reboot #开机查看
```
也可以用这里面的fan.sh根据温度自动改转速
```
git clone git@github.com:yqlbu/fan-control/
```


* * *
# visionworks sample 1.6

<https://github.com/shahin198/Build-VisionWorks--Library-And-Run-Sample>

<https://developer.nvidia.com/embedded/downloads#?search=JetPack>

<https://docs.nvidia.com/jetson/index.html>

<https://docs.nvidia.com/jetson/archives/r35.1/DeveloperGuide/text/SD/GraphicsProgramming/SampleApplications.html>

```
$ /usr/share/visionworks/sources/install-samples.sh ~/
$ cd ~/VisionWorks-1.6-Samples/
$ make -j4 # add dbg=1 to make debug build
$ cd ~/VisionWorks-Tracking-<ver>-Samples/bin/<arch>/linux/release
$ ./nvx_sample_object_tracker
...
$ /usr/share/visionworks-sfm/sources/install-samples.sh ~/
$ cd ~/VisionWorks-Sfm-1.6-Samples/
$ make -j4 # add dbg=1 to make debug build
$ cd ~/VisionWorks-Sfm-<ver>-Samples/bin/<arch>/linux/release
$ ./nvx_sample_sfm
...

$ cd/usr/src/nvidia/graphics_demos/bin
```



Jetson Setup | Apache MXNet.html
<https://mxnet.apache.org/versions/1.8.0/get_started/jetson_setup>
docker-compose
```
git clone --recursive https://github.com/apache/incubator-mxnet.git mxnet
or
bash git clone --recursive -b v1.6.x https://github.com/apache/incubator-mxnet.git mxnet
git submodule update --init --recursive
```
添加当前用户到docker组
```
$ sudo usermod -aG docker $USER
$ newgrp docker
$ groups
```
`gedit ~/.profile`(其实不要修改)
```
export PATH=/usr/local/cuda/bin:$PATH
export MXNET_HOME=$HOME/mxnet/
export PYTHONPATH=$MXNET_HOME/python:$PYTHONPATH
```

`nvcc --version`
```
10.2
```
```
//sudo rm /usr/local/cuda
//sudo ln -s /usr/local/cuda-10.2 /usr/local/cuda
```
上面的编译应该在pc上进行，取消对.profile的修改，免得对后面安装的mxnet有影响。


升级之后docker.io的server不能启动
```
$ sudo apt-get remove docker docker-engine docker.io containerd runc
The following packages will be REMOVED:
  containerd docker docker.io nvidia-docker2 runc
$ sudo apt-get update
$ sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
Add Docker’s official GPG key:
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io nvidia-docker2
$ sudo groupadd docker
$ docker version
$ sudo docker run hello-world
$ sudo usermod -aG docker $USER
$ newgrp docker
$ docker run hello-world
$ docker version
```

解决:Jetson系列python3 import 报错 "Illegal instruction[cpre dumped]"

`gedit ~/.bashrc`
```
export OPENBLAS_CORETYPE=ARMV8
```
`source ~/.bashrc`


```
sudo apt-get update
sudo apt-get install -y git build-essential libopenblas-dev python3-pip
sudo pip3 install -U pip
wget https://mxnet-public.s3.us-east-2.amazonaws.com/install/jetson/1.6.0/mxnet_cu102-1.6.0-py2.py3-none-linux_aarch64.whl
sudo pip3 install mxnet_cu102-1.6.0-py2.py3-none-linux_aarch64.whl
python3 -c 'import mxnet'
sudo apt-get update
sudo apt-get install -y python3-scipy python3-pil python3-matplotlib
sudo apt autoremove -y
sudo pip3 install gluoncv
export MXNET_CUDNN_AUTOTUNE_DEFAULT=0
```
test.py:
```
from gluoncv import model_zoo, data, utils
from matplotlib import pyplot as plt
import mxnet as mx

# set context
# ctx = mx.cpu()
ctx = mx.gpu()

# load model
net = model_zoo.get_model('yolo3_darknet53_voc', pretrained=True, ctx=ctx)

# load input image
# im_fname = utils.download('https://raw.githubusercontent.com/zhreshold/' +
                        'mxnet-ssd/master/data/demo/dog.jpg',
                        path='dog.jpg')
im_fname = '[path/]dog.jpg'
x, img = data.transforms.presets.yolo.load_test(im_fname, short=512)
x = x.as_in_context(ctx)

# call forward and show plot
class_IDs, scores, bounding_boxs = net(x)
ax = utils.viz.plot_bbox(img, bounding_boxs[0], scores[0],
                        class_IDs[0], class_names=net.classes)
plt.show()
```


```
sudo -H pip3 install parsel -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install pillow -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install pyecharts -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install jupyter -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install ipykernel -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install notedown -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install d2l==1.0.0a1.post0
mkdir d2l-en && cd d2l-en
curl https://d2l.ai/d2l-en.zip -o d2l-en.zip
unzip d2l-en.zip && rm d2l-en.zip
cd pytorch
$ jupyter notebook
```




```
sudo dmidecode -t 2
nvidia-smi
```


```
$ pip3 list
Package                       Version
----------------------------- -------------------
absl-py                       1.3.0
apturl                        0.5.2
argon2-cffi                   20.1.0
asn1crypto                    0.24.0
async-generator               1.10
attrs                         21.4.0
autocfg                       0.0.8
awscli                        1.18.69
backcall                      0.2.0
beautifulsoup4                4.6.0
bleach                        3.3.1
blinker                       1.4
botocore                      1.16.19
Brlapi                        0.6.6
certifi                       2018.1.18
cffi                          1.14.6
chardet                       3.0.4
charset-normalizer            2.0.12
click                         6.7
cloudpickle                   2.2.0
cmake                         3.18.4.post1
colorama                      0.3.7
contextvars                   2.4
cryptography                  2.1.4
cssselect                     1.1.0
cupshelpers                   1.0
cycler                        0.10.0
d2l                           1.0.0a1.post0
dataclasses                   0.8
decorator                     4.1.2
defer                         1.0.6
defusedxml                    0.7.1
distro                        1.5.0
distro-info                   0.18ubuntu0.18.04.1
dm-tree                       0.1.7
docutils                      0.14
entrypoints                   0.3
feedparser                    5.2.1
Flask                         0.12.2
gast                          0.5.3
gluoncv                       0.10.4.post4
graphsurgeon                  0.4.5
graphviz                      0.8.4
gym                           0.26.2
gym-notices                   0.0.8
html5lib                      0.999999999
httplib2                      0.9.2
idna                          2.6
immutables                    0.15
importlib-metadata            4.8.1
ipykernel                     5.5.6
ipython                       7.16.2
ipython-genutils              0.2.0
ipywidgets                    7.6.3
itsdangerous                  0.24
jedi                          0.17.2
Jetson.GPIO                   2.0.16
jetson-stats                  3.0.3
Jinja2                        2.10
jmespath                      0.9.3
jsonschema                    3.2.0
jupyter                       1.0.0
jupyter-client                7.0.6
jupyter-console               6.4.0
jupyter-core                  4.7.1
jupyterlab-pygments           0.1.2
jupyterlab-widgets            1.0.0
keyring                       10.6.0
keyrings.alt                  3.0
language-selector             0.1
launchpadlib                  1.10.6
lazr.restfulclient            0.13.5
lazr.uri                      1.0.3
louis                         3.5.0
lxml                          4.2.1
macaroonbakery                1.1.3
Mako                          1.0.7
MarkupSafe                    1.0
matplotlib                    2.1.1
matplotlib-inline             0.1.6
mistune                       0.8.4
mxnet-cu102                   1.6.0
nbclient                      0.5.3
nbconvert                     6.0.7
nbformat                      5.1.3
nest-asyncio                  1.5.1
netifaces                     0.10.4
notebook                      6.4.6
notedown                      1.5.1
numpy                         1.19.5
oauth                         1.0.1
oauthlib                      2.0.6
olefile                       0.45.1
onboard                       1.4.1
opencv-python                 4.5.1.48
packaging                     20.4
pandas                        0.22.0
pandoc-attributes             0.1.7
pandocfilters                 1.4.3
parsel                        1.6.0
parso                         0.7.1
pbr                           5.4.5
pexpect                       4.2.1
pickleshare                   0.7.5
Pillow                        5.1.0
pip                           21.3.1
portalocker                   2.3.2
prettytable                   2.1.0
prometheus-client             0.11.0
prompt-toolkit                3.0.20
protobuf                      3.3.0
psutil                        5.4.2
ptyprocess                    0.7.0
pyasn1                        0.4.2
pycairo                       1.16.2
PyChromecast                  0.8.1
pycparser                     2.20
pycrypto                      2.6.1
pycups                        1.9.73
pyecharts                     1.9.0
Pygments                      2.11.1
PyGObject                     3.26.1
pyinotify                     0.9.6
PyJWT                         1.5.3
pymacaroons                   0.13.0
PyNaCl                        1.1.2
pyOpenSSL                     17.5.0
pyparsing                     2.4.7
pyRFC3339                     1.0
pyrsistent                    0.17.3
python-apt                    1.6.5+ubuntu0.7
python-dateutil               2.6.1
python-debian                 0.1.32
pytz                          2018.3
pyxattr                       0.6.0
pyxdg                         0.25
PyYAML                        3.12
pyzmq                         22.1.0
qtconsole                     5.2.2
QtPy                          1.11.2
reportlab                     3.4.0
requests                      2.27.1
requests-unixsocket           0.1.5
roman                         2.0.0
rsa                           3.4.2
s3transfer                    0.3.3
scikit-build                  0.11.1
scipy                         0.19.1
SecretStorage                 2.3.1
Send2Trash                    1.8.0
setuptools                    54.2.0
simplejson                    3.13.2
six                           1.11.0
ssh-import-id                 5.7
system-service                0.3
systemd-python                234
tensorflow-probability        0.18.0
tensorrt                      7.1.3.0
terminado                     0.12.1
testpath                      0.4.4
testresources                 2.0.1
tornado                       6.1
tqdm                          4.62.3
traitlets                     4.3.3
typing_extensions             4.0.1
ubuntu-drivers-common         0.0.0
uff                           0.6.9
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
urllib3                       1.22
urwid                         2.0.1
virtualenv                    15.1.0
w3lib                         1.22.0
wadllib                       1.3.2
wcwidth                       0.2.5
webencodings                  0.5
Werkzeug                      0.14.1
wheel                         0.30.0
widgetsnbextension            3.5.1
xkit                          0.0.0
yacs                          0.1.8
youtube_dl                    2018.3.14
zeroconf                      0.19.1
zipp                          3.5.0
zope.interface                4.3.2
andy@andy-agx:~
$ pip3 -V
pip 21.3.1 from /usr/local/lib/python3.6/dist-packages/pip (python 3.6)
andy@andy-agx:~
$ python3 -V
Python 3.6.9
```

* * *
# qt5
```
sudo apt install qt5-default qmake qtcreator
sudo apt install qtbase5-dev qtbase5-dev-tools qtbase5-doc qtbase5-doc-html qtbase5-examples qtbase5-private-dev qt5-qmake qt5-default qt5-doc qt5-doc-html qt5-assistant qt5ct qtcreator-data qtcreator-doc qtchooser libevdev-doc qt5-style-plugins default-libmysqlclient-dev firebird-dev libpq-dev libsqlite3-dev unixodbc-dev
```

* * *
# geany


* * *
# Next Topic




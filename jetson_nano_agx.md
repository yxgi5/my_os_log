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

* * *
# 2+. nvidia sdk for jetsonX

可以在主机通过sdkmanager给板子刷机

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


## VNC配置(Vino 是 GNOME 官方 VNC 服务, 在 KDE、XFCE、LXDE、MATE 等环境不合适用)
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

更新的
```
$ cat /sys/devices/platform/pwm-fan/hwmon/hwmon4/power/control                                                                           
auto   
// Switch to manual fan control.
$ sudo bash -c 'echo on >/sys/devices/platform/pwm-fan/hwmon/hwmon4/power/control'
// Set fan speed to max (pwm).
$ sudo bash -c 'echo 255 >/sys/devices/platform/pwm-fan/hwmon/hwmon4/pwm1'
// Verify fan speed (pwm).
$ cat /sys/devices/platform/pwm-fan/hwmon/hwmon4/pwm1 
255
// Verify rpm.
$ cat /sys/devices/platform/39c0000.tachometer/hwmon/hwmon2/rpm   
6214

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

---
* * *
# pulseaudio 

这样 openbox 环境也可输出声音到 hdmi 显示器
```
sudo apt install xfce4-pulseaudio-plugin pulseaudio-utils pulseaudio-module-zeroconf pulseaudio-module-raop pulseaudio-module-lirc pulseaudio-module-jack pulseaudio-module-bluetooth pulseaudio-equalizer pulseaudio-dlna gstreamer1.0-pulseaudio mkchromecast-pulseaudio osspd-pulseaudio pulsemixer

The following packages were automatically installed and are no longer required:
  apt-clone archdetect-deb bogl-bterm cryptsetup-bin dpkg-repack
  gir1.2-timezonemap-1.0 gir1.2-xkl-1.0 grub-common kde-window-manager kinit
  kio kpackagetool5 kwayland-data kwin-common kwin-data kwin-x11
  libdebian-installer4 libkdecorations2-5v5 libkdecorations2private5v5
  libkf5activities5 libkf5attica5 libkf5completion-data libkf5completion5
  libkf5declarative-data libkf5declarative5 libkf5doctools5
  libkf5globalaccel-data libkf5globalaccel5 libkf5globalaccelprivate5
  libkf5idletime5 libkf5jobwidgets-data libkf5jobwidgets5 libkf5kcmutils-data
  libkf5kcmutils5 libkf5kiocore5 libkf5kiontlm5 libkf5kiowidgets5
  libkf5newstuff-data libkf5newstuff5 libkf5newstuffcore5 libkf5package-data
  libkf5package5 libkf5plasma5 libkf5quickaddons5 libkf5solid5
  libkf5solid5-data libkf5sonnet5-data libkf5sonnetcore5 libkf5sonnetui5
  libkf5textwidgets-data libkf5textwidgets5 libkf5waylandclient5
  libkf5waylandserver5 libkf5xmlgui-bin libkf5xmlgui-data libkf5xmlgui5
  libkscreenlocker5 libkwin4-effect-builtins1 libkwineffects11
  libkwinglutils11 libkwinxrenderutils11 libqgsttools-p1 libqt5multimedia5
  libqt5multimedia5-plugins libqt5multimediaquick-p5 libqt5multimediawidgets5
  libqt5opengl5 libqt5quickwidgets5 libxcb-composite0 libxcb-cursor0
  libxcb-damage0 os-prober python3-dbus.mainloop.pyqt5 python3-icu python3-pam
  python3-pyqt5.qtsvg python3-pyqt5.qtwebkit
  qml-module-org-kde-kquickcontrolsaddons qml-module-qtmultimedia
  qml-module-qtquick2 rdate
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  osspd python-bs4 python-certifi python-chardet python-concurrent.futures
  python-docopt python-html5lib python-lxml python-netifaces python-notify2
  python-openssl python-protobuf python-psutil python-pyroute2 python-requests
  python-setproctitle python-urllib3 python-webencodings python-zeroconf
Suggested packages:
  libav-tools python-netaddr gir1.2-rsvg-3.0 python-genshi python-lxml-dbg
  python-lxml-doc python-openssl-doc python-openssl-dbg python-psutil-doc
  python-pyroute2-doc python-socks python-ntlm
The following NEW packages will be installed:
  osspd osspd-pulseaudio pulseaudio-dlna pulseaudio-module-jack
  pulseaudio-module-lirc pulseaudio-module-raop pulseaudio-module-zeroconf
  pulsemixer python-bs4 python-certifi python-chardet
  python-concurrent.futures python-docopt python-html5lib python-lxml
  python-netifaces python-notify2 python-openssl python-protobuf python-psutil
  python-pyroute2 python-requests python-setproctitle python-urllib3
  python-webencodings python-zeroconf
The following packages will be upgraded:
  gstreamer1.0-pulseaudio
1 upgraded, 26 newly installed, 0 to remove and 516 not upgraded.
Need to get 2,651 kB of archives.

```

```
sudo apt install pasystray paprefs pavumeter pulseaudio-module-zeroconf

The following additional packages will be installed:
  libgconfmm-2.6-1v5 libglademm-2.4-1v5 libgtkmm-2.4-1v5
Suggested packages:
  paman
The following NEW packages will be installed:
  libgconfmm-2.6-1v5 libglademm-2.4-1v5 libgtkmm-2.4-1v5 paprefs pasystray pavumeter

```

```
sudo apt install bluetooth bluez bluez-cups bluez-tools btscanner gnome-bluetooth python-bluez pulseaudio-module-bluetooth blueman rfkill

The following additional packages will be installed:
  ieee-data
The following NEW packages will be installed:
  bluetooth bluez-tools btscanner ieee-data python-bluez
The following packages will be upgraded:
  bluez bluez-cups

```

没有安装包的
```
E: Unable to locate package python3-bluez
E: Unable to locate package bluez-meshd
```


---
* * *
# vlc

```
sudo apt install vlc vlc-plugin-notify vlc-plugin-qt vlc-plugin-samba vlc-plugin-skins2 vlc-plugin-video-splitter vlc-plugin-visualization qt5ct

qt5ct
```
vlc xxx.mp4 看起来会崩溃，不能用

<https://forums.developer.nvidia.com/t/vlc-player-crashes-in-jetson-nano-segmentation-fault-core-dumped/176534>

<https://forums.developer.nvidia.com/t/vlc-not-working-on-l4t-r27-0-1/49423/16>

You may try to disable OMXIL plugin

```
sudo mv /usr/lib/aarch64-linux-gnu/vlc/plugins/codec/libomxil_plugin.so /usr/lib/aarch64-linux-gnu/vlc/plugins/codec/libomxil_plugin.so.bk
```
就好用了。


记录
```
VLC media player 3.0.8 Vetinari (revision 3.0.8-0-gf350b6b5a7)
[000000559a7ca650] main libvlc: Running vlc with the default interface. Use 'cvlc' to use vlc without interface.
qt5ct: using qt5ct plugin
qt5ct: D-Bus global menu: no
qt5ct: D-Bus system tray: no
inotify_add_watch("/home/andy/.config/qt5ct") failed: "No such file or directory"
Bus error (core dumped)


qt5ct

sudo apt install vainfo vdpau-va-driver qt5ct

killall -9 vlc
vlc --reset-config vlc://quit

vlc -vvv xxx.mp4

rm -rf  ~/.config/vlc ~/.local/share/vlc

strace vlc &> vlc.log

dpkg -l | grep vlc

egrep " (install|remove|upgrade) " /var/log/dpkg.log

sudo mv /usr/lib/aarch64-linux-gnu/vlc/plugins/codec/libomxil_plugin.so /usr/lib/aarch64-linux-gnu/vlc/plugins/codec/libomxil_plugin.so.old

```

---
* * *
# mplayer
其实最好使还是这个

```
sudo apt install mplayer

The following additional packages will be installed:
  libavcodec-extra57 libavformat57 libavutil55 libdirectfb-1.7-7 libenca0 libpostproc54 libswresample2 libswscale4 libvorbisidec1 libxvmc1
Suggested packages:
  libdirectfb-extra mplayer-doc netselect | fping
The following NEW packages will be installed:
  libdirectfb-1.7-7 libenca0 libvorbisidec1 libxvmc1 mplayer
The following packages will be upgraded:
  libavcodec-extra57 libavformat57 libavutil55 libpostproc54 libswresample2 libswscale4


sudo apt install mplayer mplayer-fonts mplayer-gui mplayer-skins
```

---
* * *
# 测试 jetson 的 GPU、ENCODER 什么的

## 安装 nvidia-jetpack
```
sudo apt install nvidia-jetpack
```

sudo dpkg --get-selections | grep nvidia
```
andy@andy-nano:~/Downloads/nvidia$ sudo dpkg --get-selections | grep nvidia
[sudo] password for andy:
libnvidia-container-tools                       install
libnvidia-container0:arm64                      install
nvidia-container                                install
nvidia-container-csv-cuda                       install
nvidia-container-csv-cudnn                      install
nvidia-container-csv-tensorrt                   install
nvidia-container-csv-visionworks                install
nvidia-container-runtime                        install
nvidia-container-toolkit                        install
nvidia-cuda                                     install
nvidia-cudnn8                                   install
nvidia-docker2                                  install
nvidia-jetpack                                  install
nvidia-l4t-3d-core                              install
nvidia-l4t-apt-source                           install
nvidia-l4t-bootloader                           install
nvidia-l4t-camera                               install
nvidia-l4t-configs                              install
nvidia-l4t-core                                 install
nvidia-l4t-cuda                                 install
nvidia-l4t-firmware                             install
nvidia-l4t-graphics-demos                       install
nvidia-l4t-gstreamer                            install
nvidia-l4t-init                                 install
nvidia-l4t-initrd                               install
nvidia-l4t-jetson-io                            install
nvidia-l4t-jetson-multimedia-api                install
nvidia-l4t-kernel                               install
nvidia-l4t-kernel-dtbs                          install
nvidia-l4t-kernel-headers                       install
nvidia-l4t-multimedia                           install
nvidia-l4t-multimedia-utils                     install
nvidia-l4t-oem-config                           install
nvidia-l4t-tools                                install
nvidia-l4t-wayland                              install
nvidia-l4t-weston                               install
nvidia-l4t-x11                                  install
nvidia-l4t-xusb-firmware                        install
nvidia-opencv                                   install
nvidia-tensorrt                                 install
nvidia-visionworks                              install
nvidia-vpi                                      install

```
```
andy@andy-agx:~/Downloads/nvidia/nano_build_opencv$ sudo dpkg --get-selections | grep nvidia
libnvidia-container-tools                       install
libnvidia-container0:arm64                      install
nvidia-container                                install
nvidia-container-csv-cuda                       install
nvidia-container-csv-cudnn                      install
nvidia-container-csv-tensorrt                   install
nvidia-container-csv-visionworks                install
nvidia-container-runtime                        install
nvidia-container-toolkit                        install
nvidia-cuda                                     install
nvidia-cudnn8                                   install
nvidia-docker2                                  install
nvidia-jetpack                                  install
nvidia-l4t-3d-core                              install
nvidia-l4t-apt-source                           install
nvidia-l4t-bootloader                           install
nvidia-l4t-camera                               install
nvidia-l4t-configs                              install
nvidia-l4t-core                                 install
nvidia-l4t-cuda                                 install
nvidia-l4t-firmware                             install
nvidia-l4t-graphics-demos                       install
nvidia-l4t-gstreamer                            install
nvidia-l4t-init                                 install
nvidia-l4t-initrd                               install
nvidia-l4t-jetson-io                            install
nvidia-l4t-jetson-multimedia-api                install
nvidia-l4t-kernel                               install
nvidia-l4t-kernel-dtbs                          install
nvidia-l4t-kernel-headers                       install
nvidia-l4t-libvulkan                            install
nvidia-l4t-multimedia                           install
nvidia-l4t-multimedia-utils                     install
nvidia-l4t-oem-config                           install
nvidia-l4t-tools                                install
nvidia-l4t-wayland                              install
nvidia-l4t-weston                               install
nvidia-l4t-x11                                  install
nvidia-l4t-xusb-firmware                        install
nvidia-opencv                                   install
nvidia-tensorrt                                 install
nvidia-visionworks                              install
nvidia-vpi                                      install
```

## 查看L4T版本
```
head -n 1 /etc/nv_tegra_release
```

## 查看JetPack版本
```
dpkg -l | grep nvidia-jetpack
```

## 查看cuda 版本
```
nvcc -V
```

## 查看cudnn版本
```
cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
```

tips：
```
nvidia-smi 不适用于 jetson 系列板卡哦
类似 watch -n 1 nvidia-smi 都并不能用
nvtop也不能用
```




## 安装 jetson-stats 可以使用 jtop
```
sudo apt-get install python3-pip

sudo -H pip3 install jetson-stats


sudo -H pip3 install -U jetson-stats
sudo systemctl restart jtop.service


jtop
sudo jtop
```

## tegrastats
```
tegrastats | grep -E 'GR3D|NVD|NVE'
tegrastats --interval 500 | grep -E 'GR3D|NVENC|NVDEC'
```
GR3D就是GPU




---
* * *
# v4l-utils
```
sudo apt install v4l-utils
v4l2-ctl --list-devices         # 列出所有视频设备
v4l2-ctl --device=/dev/video0 --all  # 查看详细参数
```

---
* * *
# nload
```
sudo apt install nload
```

---
* * *
# gstreamer 可以测试硬件加速编解码

<https://docs.nvidia.com/jetson/archives/r36.4/DeveloperGuide/SD/Multimedia.html>

```
sudo apt install \
gstreamer1.0-tools \
gstreamer1.0-plugins-good \
gstreamer1.0-plugins-bad \
gstreamer1.0-plugins-ugly \
gstreamer1.0-libav \
libgstreamer1.0-dev \
libgstrtspserver-1.0-dev
```

```
gst-inspect-1.0 --plugin
gst-inspect-1.0 | grep nv      # 查看所有NVIDIA专用插件
gst-inspect-1.0 nvv4l2decoder  # 检查解码器
```

例子
```
gst-launch-1.0 filesrc location="(18禁アニメ) 義母散華 後編 (DVD 1280x720 x264 AAC).mp4" ! qtdemux ! queue ! h264parse ! nvv4l2decoder ! nvvidconv ! video/x-raw,format=I420 ! autovideosink
gst-launch-1.0 filesrc location="(18禁アニメ) 義母散華 後編 (DVD 1280x720 x264 AAC).mp4" ! qtdemux ! queue ! h264parse ! nvv4l2decoder ! nvvidconv ! queue ! autovideosink
gst-launch-1.0 filesrc location="(18禁アニメ) 義母散華 後編 (DVD 1280x720 x264 AAC).mp4" ! qtdemux ! queue ! h264parse ! nvv4l2decoder ! nvvidconv ! queue ! v4l2sink device=/dev/video1
gst-launch-1.0 filesrc location="(18禁アニメ) 義母散華 後編 (DVD 1280x720 x264 AAC).mp4" ! decodebin ! videoconvert ! autovideosink
gst-launch-1.0 filesrc location="(18禁アニメ) 義母散華 後編 (DVD 1280x720 x264 AAC).mp4" ! qtdemux ! queue ! h264parse ! nvv4l2decoder ! nvvidconv ! queue ! autovideosink
gst-launch-1.0 filesrc location=(18禁アニメ) 義母散華 後編 (DVD 1280x720 x264 AAC).mp4 ! qtdemux ! queue ! h264parse ! nvv4l2decoder ! nvvidconv ! queue ! videoscale method=0 ! video/x-raw,width=320,height=240,format=I420 ! nvvidconv ! queue ! autovideosink
gst-launch-1.0 filesrc location=(18禁アニメ) 義母散華 後編 (DVD 1280x720 x264 AAC).mp4 ! qtdemux ! queue ! h264parse ! nvv4l2decoder ! nvvidconv ! queue ! xvimagesink
gst-launch-1.0 ximagesrc startx=1920 starty=0 endx=2943 endy=768 ! video/x-raw,framerate=15/1 ! videoscale method=0 add-borders=false ! video/x-raw,width=640,height=360 ! videoflip method=horizontal-flip ! ximagesink
gst-launch-1.0 filesrc location=(18禁アニメ) 義母散華 後編 (DVD 1280x720 x264 AAC).mp4 ! qtdemux ! queue ! h264parse ! nvv4l2decoder ! nvvidconv ! queue ! videoscale method=0 add-borders=false ! video/x-raw,width=640,height=360 ! videoflip method=horizontal-flip ! ximagesink
gst-launch-1.0 filesrc location=(18禁アニメ) 義母散華 後編 (DVD 1280x720 x264 AAC).mp4 ! qtdemux ! queue ! h264parse ! nvv4l2decoder ! nvvidconv ! queue ! videoscale method=0 add-borders=false ! video/x-raw,width=640,height=360 ! xvimagesink

//gst-launch-1.0 videotestsrc ! nvvidconv ! 'video/x-raw(memory:NVMM)' ! nvv4l2h264enc insert-sps-pps=1 bitrate=4000000 ! h264parse ! qtmux ! filesink location=output.mp4  失败了
//gst-launch-1.0 videotestsrc ! nvvidconv ! 'video/x-raw(memory:NVMM)' ! nvv4l2h264enc bitrate=4000000 ! h264parse ! qtmux ! filesink location=output.mp4   失败了



gst-launch-1.0 videotestsrc ! nvvidconv ! 'video/x-raw(memory:NVMM)' ! nvv4l2h264enc bitrate=4000000 ! h264parse ! filesink location=output.mp4
gst-launch-1.0 videotestsrc ! nvvidconv ! 'video/x-raw(memory:NVMM)' ! nvv4l2h264enc bitrate=4000000 ! h264parse ! matroskamux  ! filesink location=output.mkv
```
autovideosink 会占用显示(我这里是HDMI显示器)，其他操作不能(ssh访问是可以的，可以kill掉gst)，播放 H-carton 会一直播 很尴尬

最好用ximagesink、xvimagesink进行窗口显示

---
* * *
# ffmpeg

这里特指编译带硬件加速编解码的ffmpeg版本

参考

<https://www.cyberciti.biz/faq/how-to-install-ffmpeg-with-nvidia-gpu-acceleration-on-linux>

<https://github.com/LinusCDE/mad-jetson-ffmpeg>

<https://github.com/Keylost/jetson-ffmpeg>

<https://johnvansickle.com/ffmpeg>

准备
```
sudo apt install build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev pkg-config
sudo apt install bzip2 fontconfig libfribidi{0,-dev} gmpc{,-dev} gnutls-bin lame libass{9,-dev} libavc1394-{0,dev} libbluray{2,-dev} libdrm{2,-dev} libfreetype6{,-dev} libmodplug{1,-dev} libraw1394-{11,dev} librsvg2{-2,-dev} libsoxr{0,-dev} libtheora{0,-dev} libva{2,-dev} libva-drm2 libva-x11-2 libvdpau{1,-dev} libvorbisenc2 libvorbis{0a,-dev} libvpx{5,-dev} libwebp{6,-dev} libx11{-6,-dev} libx264-{152,dev} libx265-{146,dev} libxcb1{,-dev} libxext{6,-dev} libxml2{,-dev} libxv{1,-dev} libxvidcore{4,-dev} libopencore-amr{nb0,nb-dev,wb0,wb-dev} opus-tools libsdl2-dev speex v4l-utils zlib1g{,-dev} libopenjp2-7{,-dev} libssh-{4,dev} libspeex{1,-dev}
```

## 尝试最通用的编译

```
git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
cd nv-codec-headers && sudo make install


sed 's#@@PREFIX@@#/usr/local#' ffnvcodec.pc.in > ffnvcodec.pc
install -m 0755 -d '/usr/local/include/ffnvcodec'
install -m 0644 include/ffnvcodec/*.h '/usr/local/include/ffnvcodec'
install -m 0755 -d '/usr/local/lib/pkgconfig'
install -m 0644 ffnvcodec.pc '/usr/local/lib/pkgconfig'
```

git加速，我这里用的v2rayN appimage
```
git config --global http.proxy 'socks5://127.0.0.1:10808'
git config --global https.proxy 'socks5://127.0.0.1:10808'
```

clone 主仓库
```
git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg/
```



```
./configure \
  --prefix=/usr/local \
  --extra-cflags="-I/usr/local/include" \
  --extra-ldflags="-L/usr/local/lib" \
  --disable-debug \
  --disable-stripping \
  --enable-lto \
  --enable-fontconfig \
  --enable-gmp \
  --enable-gnutls \
  --enable-gpl \
  --enable-ladspa \
  --enable-libass \
  --enable-libbluray \
  --enable-libdrm \
  --enable-libfreetype \
  --enable-libfribidi \
  --enable-libmodplug \
  --enable-libmp3lame \
  --enable-libopencore_amrnb \
  --enable-libopencore_amrwb \
  --enable-libopenjpeg \
  --enable-libopus \
  --enable-libpulse \
  --enable-librsvg \
  --enable-libsoxr \
  --enable-libspeex \
  --enable-libssh \
  --enable-libtheora \
  --enable-libv4l2 \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libwebp \
  --enable-libx264 \
  --enable-libx265 \
  --enable-libxcb \
  --enable-libxml2 \
  --enable-libxvid \
  --enable-version3 \
  --enable-nvmpi \
  --enable-nvv4l2dec --enable-libv4l2 --enable-shared --extra-libs="-L/usr/lib/aarch64-linux-gnu/tegra -lnvbuf_utils" --extra-cflags="-I /usr/src/jetson_multimedia_api/include/"
  
  
  
  
  ./configure --enable-nonfree --enable-cuda-nvcc --enable-libnpp --extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64 --enable-gpl \
--enable-gnutls \
--enable-libaom \
--enable-libass \
--enable-libfdk-aac \
--enable-libfreetype \
--enable-libmp3lame \
--enable-libopus \
--enable-libvorbis \
--enable-libvpx \
--enable-libx264 \
--enable-libx265 \
--enable-nonfree


./configure \
--enable-nonfree \
--enable-gpl \
--enable-shared \
--enable-ffmpeg \
--enable-ffplay \
--enable-ffprobe \
--enable-libx264 \
--enable-libx265 \
--enable-cuda-nvcc \
--enable-nvenc \
--enable-nvdec \
--enable-cuda \
--enable-cuvid \
--enable-libnpp \
--extra-libs="-lpthread -lm" \
--extra-cflags=-I/usr/local/cuda/include \
--extra-ldflags=-L/usr/local/cuda/lib64 

pkg-config --modversion x264
pkg-config --variable=pc_path pkg-config
```



ERROR: x264 not found using pkg-config
```
sudo apt install libx264-dev
sudo apt install libx265-dev
```

ERROR: X264_BUILD >= 155 not satisfied

看起来要求较高的X264版本，放弃



不整其他选项整了

```
./configure --enable-nonfree --enable-cuda-nvcc --enable-libnpp --extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64
make -j $(nproc)
//sudo make install


./ffmpeg -hide_banner -threads 0 -v verbose -hwaccel auto -i ~/Downloads/output.mp4 -c:v hevc_nvenc -profile:v main -b:v 2548951  "out.mp4"
```
编译成功，运行失败，hevc_nvenc看起来不能用

## jetson-ffmpeg 版本

```
cd ~/Downloads/nvidia
git clone https://github.com/Keylost/jetson-ffmpeg.git
cd jetson-ffmpeg
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig

cd ~/Downloads/nvidia
clone one of supported ffmpeg versions (for example ffmpeg 7.1)
git clone git://source.ffmpeg.org/ffmpeg.git -b release/7.1 --depth=1
Go to the directory with the jetson-ffmpeg sources and patch the ffmpeg using the ffpatch.sh script.
cd jetson-ffmpeg
./ffpatch.sh ../ffmpeg
Go to ffmpeg sources directory configure and build ffmpeg with nvmpi enabled and your custom options 
cd ../ffmpeg
./configure --enable-nvmpi
make
//sudo make install
```


Decode h264 video example，其实 gst、vlc、mplayer 等播放视频都观察到解码器被使用
```
ffmpeg -c:v h264_nvmpi -i <input.mp4> -f null -
```
Decode h264 video with fast scaling during decoding example
```
ffmpeg -c:v h264_nvmpi -resize:v 1920x1080 -i <input.mp4> -f null -
```
Encode h264 video example
```
ffmpeg -i <input.mp4> -c:v h264_nvmpi <output.mp4>
```
Transcode h264 to h265 video example
```
ffmpeg -c:v h264_nvmpi -i <input.mp4> -c:v hevc_nvmpi <output.mp4>
```

尝试如下，hevc_nvmpi 是好使的, jtop 内看到硬件编码加速用起来了。
```
./ffmpeg -hide_banner -threads 0 -v verbose -hwaccel auto -hwaccel_device 0 -extra_hw_frames 3 -i ~/Downloads/output.mp4 -c:v hevc_nvmpi -profile:v main -b:v 2548951  "out.mp4"
./ffmpeg -hide_banner -threads 0 -v verbose -hwaccel auto -i ~/Downloads/output.mp4 -c:v hevc_nvenc -profile:v main -b:v 2548951 -fps_mode cfr -pix_fmt yuv420p -color_range tv -colorspace bt709 -color_primaries bt709 -color_trc bt709 -g 250 -keyint_min 25 -sws_flags bicubic -ar 44100 -b:a 128k -c:a aac -ac 2 -map_metadata -1 -map_chapters -1 -strict -2 -rtbufsize 120m -max_muxing_queue_size 1024 "out.mp4"
./ffmpeg -hide_banner -threads 0 -v verbose -hwaccel auto -i ~/Downloads/output.mp4 -c:v hevc_nvenc -profile:v main -b:v 2548951  "out.mp4"
./ffmpeg -hide_banner -threads 0 -v verbose -hwaccel auto -i ~/Downloads/output.mp4 -c:v hevc_nvmpi -profile:v main  -preset fast -b:v 2548951 -fps_mode cfr -pix_fmt yuv420p -color_range tv -colorspace bt709 -color_primaries bt709 -color_trc bt709 -g 250 -keyint_min 25 -sws_flags bicubic -ar 44100 -b:a 128k -c:a aac -ac 2 -map_metadata -1 -map_chapters -1 -strict -2 -rtbufsize 120m -max_muxing_queue_size 1024 "out.mp4"
./ffmpeg -hide_banner -threads 0 -v verbose -hwaccel auto -i ~/Downloads/output.mp4 -c:v hevc_nvmpi -profile:v main -b:v 2548951  "out.mp4"
./ffmpeg -hide_banner -threads 0 -v verbose -hwaccel auto -hwaccel_device 0 -extra_hw_frames 3 -i ~/Downloads/output.mp4 -c:v hevc_nvmpi -profile:v main -b:v 2548951  "out.mp4"
./ffmpeg -hide_banner -threads 0 -v verbose -hwaccel auto -extra_hw_frames 3 -i ~/Downloads/output.mp4 -c:v hevc_nvmpi -profile:v main -b:v 2548951  "out.mp4"
## ./ffmpeg -hide_banner -threads 0 -v verbose -hwaccel cuda -hwaccel_device 0 -hwaccel_output_format cuda -i ~/Downloads/output.mp4 -c:v hevc_nvmpi -profile:v main -b:v 2548951  "out.mp4"
./ffmpeg -hide_banner -threads 0 -v verbose -hwaccel auto -hwaccel_output_format cuda -i ~/Downloads/output.mp4 -c:v hevc_nvmpi -profile:v main -b:v 2548951  "out.mp4"
./ffmpeg -hide_banner -threads 0 -v verbose -hwaccel auto -extra_hw_frames 3 -hwaccel_output_format cuda -i ~/Downloads/output.mp4 -c:v hevc_nvmpi -profile:v main -b:v 2548951  "out.mp4"
./ffmpeg -hide_banner -threads 0 -v verbose -hwaccel auto -extra_hw_frames 3 -hwaccel_output_format cuda -i ~/Downloads/output.mp4 -c:v hevc_nvmpi -profile:v main -preset fast -b:v 2548951 -fps_mode cfr -pix_fmt yuv420p -color_range tv -colorspace bt709 -color_primaries bt709 -color_trc bt709 -g 250 -keyint_min 25 -sws_flags bicubic -ar 44100 -b:a 128k -c:a aac -ac 2 -map_metadata -1 -map_chapters -1 -strict -2 -rtbufsize 120m -max_muxing_queue_size 1024 "out.mp4"
##./ffmpeg -hide_banner -threads 0 -v verbose -hwaccel auto -i ~/Downloads/output.mp4 -c:v hevc_nvenc -profile:v main -b:v 2548951 -fps_mode cfr -pix_fmt yuv420p -color_range tv -colorspace bt709 -color_primaries bt709 -color_trc bt709 -g 250 -keyint_min 25 -sws_flags bicubic -ar 44100 -b:a 128k -c:a aac -ac 2 -map_metadata -1 -map_chapters -1 -strict -2 -rtbufsize 120m -max_muxing_queue_size 1024 "out.mp4"
./ffmpeg -hide_banner -threads 0 -v verbose -hwaccel auto -i ~/Downloads/output.mp4 -c:v hevc_nvmpi -profile:v main -preset fast -b:v 2548951 -fps_mode cfr -pix_fmt yuv420p -color_range tv -colorspace bt709 -color_primaries bt709 -color_trc bt709 -g 250 -keyint_min 25 -sws_flags bicubic -ar 44100 -b:a 128k -c:a aac -ac 2 -map_metadata -1 -map_chapters -1 -strict -2 -rtbufsize 120m -max_muxing_queue_size 1024 "out.mp4"

```

## tips
```
如果安装编译的版本，库文件可能找不到
vim /etc/ld.so.conf.d/ffmpeg.conf
内容为
/usr/local/ffmpeg/lib
在终端中输入
ldconfig
```


---
* * *
# opencv

这里特指编译带硬件加速编解码的opencv版本

<https://developer.nvidia.com/embedded/community/jetson-projects/opencv>

<https://github.com/mdegans/nano_build_opencv>
```
./build_opencv.sh           # 报错
./build_opencv.sh 4.4.0     # 报错
./build_opencv.sh 4.1.1     # 报错
```
all fail。以后再说

<https://github.com/mdegans/nano_build_opencv/issues/77>

<https://forums.developer.nvidia.com/t/jetson-nano-opencv-installation-nvcc-does-not-support-gpu-architecture/266847>

<https://github.com/AastaNV/JEP/tree/master/script>

<https://my.cytron.io/tutorial/build-opencv-with-cuda-support-for-jetson>

<https://forums.developer.nvidia.com/t/opencv-3-2-with-cuda-compilation/48938>

```
#!/bin/bash
#

version="4.10.0"
folder="workspace"

set -e

for (( ; ; ))
do
    echo "Do you want to remove the default OpenCV (yes/no)?"
    read rm_old

    if [ "$rm_old" = "yes" ]; then
        echo "** Remove other OpenCV first"
        sudo apt -y purge *libopencv*
	break
    elif [ "$rm_old" = "no" ]; then
	break
    fi
done


echo "------------------------------------"
echo "** Install requirement"
echo "------------------------------------"
sudo apt-get update
sudo apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev python3.10-dev python3-numpy
sudo apt-get install -y libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libv4l-dev v4l-utils qv4l2
sudo apt-get install -y curl


echo "------------------------------------"
echo "** Download opencv "${version}""
echo "------------------------------------"
mkdir $folder
cd ${folder}
curl -L https://github.com/opencv/opencv/archive/${version}.zip -o opencv-${version}.zip
curl -L https://github.com/opencv/opencv_contrib/archive/${version}.zip -o opencv_contrib-${version}.zip
unzip opencv-${version}.zip
unzip opencv_contrib-${version}.zip
rm opencv-${version}.zip opencv_contrib-${version}.zip
cd opencv-${version}/


echo "------------------------------------"
echo "** Build opencv "${version}""
echo "------------------------------------"
mkdir release
cd release/
cmake -D WITH_CUDA=ON -D WITH_CUDNN=ON -D CUDA_ARCH_BIN="8.7" -D CUDA_ARCH_PTX="" -D OPENCV_GENERATE_PKGCONFIG=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-${version}/modules -D WITH_GSTREAMER=ON -D WITH_LIBV4L=ON -D BUILD_opencv_python3=ON -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j$(nproc)


echo "------------------------------------"
echo "** Install opencv "${version}""
echo "------------------------------------"
sudo make install
echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export PYTHONPATH=/usr/local/lib/python3.10/site-packages/:$PYTHONPATH' >> ~/.bashrc
source ~/.bashrc


echo "** Install opencv "${version}" successfully"
```

## nvcc fatal : Unsupported gpu architecture 'compute_87'
脚本里，或者cmake传环境变量时候
```
-D CUDA_ARCH_BIN=5.3,6.2,7.2  # 去掉 8.7
```
For Nano, CUDA arch is 5.3

For TX2, CUDA arch is 6.2

For Xavier, CUDA arch is 7.2

For Orin, CUDA arch is 8.7

```
Jetson AGX Orin, Jetson Orin NX, Jetson Orin Nano	8.7
Jetson AGX Xavier, Jetson Xavier NX	                7.2
Jetson TX2	                                        6.2
Jetson Nano, Jetson TX1                             5.3

```

具体可在这里找到

<https://developer.nvidia.com/cuda-legacy-gpus>

<https://developer.nvidia.com/cuda-gpus>

GPU Architecture and Major Revision Numbers

|   Major Revision Number   |  NVIDIA GPU Architecture |
|   ----                    |  ----                    |
|   9                       |  NVIDIA Hopper GPU Architecture |
|   8                       |  NVIDIA Ampere GPU Architecture |
|   7                       |  NVIDIA Volta GPU Architecture |
|   6                       |  NVIDIA Pascal GPU Architecture |
|   5                       |  NVIDIA Maxwell GPU Architecture |
|   3                       |  NVIDIA Kepler GPU Architecture |


Jetson CUDA GPU Compute Capability

|   Compute Capability      |   Jetson  |
|   ----                    |  ----     |
|   3.2                     |   Tegra K1, Jetson TK1    |
|   5.3                     |   Jetson Nano             |
|   6.2                     |   Jetson TX2              |
|   7.2                     |   Jetson AGX Xavier, Jetson Xavier NX |
|   8.7                     |   Jetson AGX Orin, Jetson Orin NX, Jetson Orin Nano   |
|   11.0                    |   Jetson T5000, Jetson T4000  |


## boostdesc_bgm.i: No such file or directory
```
sudo apt install libboost-all-dev

Suggested packages:
  libboost-doc graphviz libboost1.65-doc gccxml libmpfrc++-dev libntl-dev xsltproc doxygen docbook-xml docbook-xsl default-jdk fop
The following NEW packages will be installed:
  libboost-all-dev libboost-atomic-dev libboost-atomic1.65-dev libboost-atomic1.65.1 libboost-chrono-dev libboost-chrono1.65-dev libboost-chrono1.65.1 libboost-container-dev
  libboost-container1.65-dev libboost-container1.65.1 libboost-context-dev libboost-context1.65-dev libboost-context1.65.1 libboost-coroutine-dev libboost-coroutine1.65-dev
  libboost-coroutine1.65.1 libboost-date-time-dev libboost-date-time1.65-dev libboost-dev libboost-exception-dev libboost-exception1.65-dev libboost-fiber-dev libboost-fiber1.65-dev
  libboost-fiber1.65.1 libboost-filesystem-dev libboost-filesystem1.65-dev libboost-graph-dev libboost-graph-parallel-dev libboost-graph-parallel1.65-dev libboost-graph-parallel1.65.1
  libboost-graph1.65-dev libboost-graph1.65.1 libboost-iostreams-dev libboost-iostreams1.65-dev libboost-locale-dev libboost-locale1.65-dev libboost-log-dev libboost-log1.65-dev
  libboost-log1.65.1 libboost-math-dev libboost-math1.65-dev libboost-math1.65.1 libboost-mpi-dev libboost-mpi-python-dev libboost-mpi-python1.65-dev libboost-mpi-python1.65.1
  libboost-mpi1.65-dev libboost-mpi1.65.1 libboost-numpy-dev libboost-numpy1.65-dev libboost-numpy1.65.1 libboost-program-options-dev libboost-program-options1.65-dev
  libboost-program-options1.65.1 libboost-python-dev libboost-python1.65-dev libboost-python1.65.1 libboost-random-dev libboost-random1.65-dev libboost-random1.65.1 libboost-regex-dev
  libboost-regex1.65-dev libboost-regex1.65.1 libboost-serialization-dev libboost-serialization1.65-dev libboost-serialization1.65.1 libboost-signals-dev libboost-signals1.65-dev
  libboost-signals1.65.1 libboost-stacktrace-dev libboost-stacktrace1.65-dev libboost-stacktrace1.65.1 libboost-system-dev libboost-system1.65-dev libboost-test-dev libboost-test1.65-dev
  libboost-test1.65.1 libboost-thread-dev libboost-thread1.65-dev libboost-timer-dev libboost-timer1.65-dev libboost-timer1.65.1 libboost-tools-dev libboost-type-erasure-dev
  libboost-type-erasure1.65-dev libboost-type-erasure1.65.1 libboost-wave-dev libboost-wave1.65-dev libboost-wave1.65.1 libboost1.65-dev libboost1.65-tools-dev mpi-default-bin

```

cat /tmp/build_opencv/opencv/build/CMakeDownloadLog.txt

下载文件没有成功，多试几次自动下载或手动下载`boostdesc_bgm.i,vgg_generated_48.i等.rar`

或者，之前存档的文件有`build_opencv\opencv\.cache\xfeatures2d\boostdesc` 里面的复制进 `/tmp/build_opencv\opencv\.cache\xfeatures2d\boostdesc`

发现了 失败情况有的文件大小为0， 直接替换。这里报错一般可以继续编译，也就是输入 sudo 密码，就继续编译了

<https://github.com/opencv/opencv_3rdparty/tree/contrib_xfeatures2d_boostdesc_20161012>

或者在脚本中添加cmake选项
```
-DBUILD_opencv_xfeatures2d=OFF
```


目前排除这两个坑，就编译成功了！


jtop看到opencv启用了gpu



## tips

其实，一般情况应该先删除 apt 安装的 opencv库
```
pkg-config --libs opencv
pkg-config --modversion opencv
pkg-config --cflags opencv
sudo pkg-config --libs --cflags opencv
sudo apt purge libopencv*
sudo apt autoremove
```

但是这里 依赖关系不能轻易删除 libopencv*
```
The following packages will be REMOVED:
  libopencv* libopencv-dev* libopencv-python* libopencv-samples* nvidia-jetpack* nvidia-opencv* nvidia-vpi* opencv-licenses* vpi1-samples*
```

## pkg-config --libs opencv
```
Package opencv was not found in the pkg-config search path.
Perhaps you should add the directory containing `opencv.pc'
to the PKG_CONFIG_PATH environment variable
No package 'opencv' found
```

`echo $PKG_CONFIG_PATH`

`find / -name pkgconfig`

`find / -name opencv.pc`

`apt-file search opencv.pc`

比如可能找到如下路径，
```
/usr/share/pkgconfig
/usr/lib/pkgconfig
/usr/lib/x86_64-linux-gnu/pkgconfig
/usr/local/lib/pkgconfig
```
选择一个即可

然后把.pc文件复制到选择的文件夹中
```
例如选择/usr/lib/pkgconfig
sudo cp /opt/opencv4.5.5/lib/pkgconfig/opencv4.pc /usr/lib/pkgconfig
```

## 测试命令
```
python -c "import cv2; print(f'OpenCV: {cv2.__version__} for python installed and working'); print(f'CUDA-enabled GPU count {cv2.cuda.getCudaEnabledDeviceCount()}')"

python -c "import cv2; print(cv2.__version__); print(cv2.cuda.getCudaEnabledDeviceCount())"
```


```
import cv2
import numpy as np

# Check if CUDA is available
if not cv2.cuda.getCudaEnabledDeviceCount():
    print("CUDA-enabled GPU not found. Exiting...")
    exit()
    
# Load an image
image = cv2.imread('image.jpg', cv2.IMREAD_COLOR)
if image is None:
    print("Error loading image. Exiting...")
    exit()
    
# Upload image to GPU
gpu_image = cv2.cuda_GpuMat()
gpu_image.upload(image)

# Apply Gaussian blur on GPU
gpu_blurred_image = cv2.cuda_GaussianBlur(gpu_image, (15, 15), 0)

# Download the result back to CPU
blurred_image = gpu_blurred_image.download()

# Display the results
cv2.imshow('Original Image', image)
cv2.imshow('Blurred Image', blurred_image)
cv2.waitKey(0)
cv2.destroyAllWindows()
```


---
* * *
# cuda 10.2 samples


如果需要
```
sudo apt update
sudo apt install -y --no-install-recommends make g++
```

复制副本并编译
```
cp -r /usr/local/cuda/samples tmp
cd tmp/samples/5_Simulations/nbody
make
./nbody
```


compute_53 is Nano GPU architecture

compute_62 is TX2 GPU architecture

compute_72 is Xavier GPU architecture

compute_87 is Orin GPU architecture
```
$ ./nbody 
Run "nbody -benchmark [-numbodies=<numBodies>]" to measure performance.
	-fullscreen       (run n-body simulation in fullscreen mode)
	-fp64             (use double precision floating point values for simulation)
	-hostmem          (stores simulation data in host memory)
	-benchmark        (run benchmark to measure performance) 
	-numbodies=<N>    (number of bodies (>= 1) to run in simulation) 
	-device=<d>       (where d=0,1,2.... for the CUDA device to use)
	-numdevices=<i>   (where i=(number of CUDA devices > 0) to use for simulation)
	-compare          (compares simulation results running once on the default GPU and once on the CPU)
	-cpu              (run n-body simulation on the CPU)
	-tipsy=<file.bin> (load a tipsy model file for simulation)

NOTE: The CUDA Samples are not meant for performance measurements. Results may vary when GPU Boost is enabled.

> Windowed mode
> Simulation data stored in video memory
> Single precision floating point simulation
> 1 Devices used for simulation
GPU Device 0: "Maxwell" with compute capability 5.3

> Compute 5.3 CUDA device: [NVIDIA Tegra X1]
```
```
$ ./nbody
Run "nbody -benchmark [-numbodies=<numBodies>]" to measure performance.
	-fullscreen       (run n-body simulation in fullscreen mode)
	-fp64             (use double precision floating point values for simulation)
	-hostmem          (stores simulation data in host memory)
	-benchmark        (run benchmark to measure performance) 
	-numbodies=<N>    (number of bodies (>= 1) to run in simulation) 
	-device=<d>       (where d=0,1,2.... for the CUDA device to use)
	-numdevices=<i>   (where i=(number of CUDA devices > 0) to use for simulation)
	-compare          (compares simulation results running once on the default GPU and once on the CPU)
	-cpu              (run n-body simulation on the CPU)
	-tipsy=<file.bin> (load a tipsy model file for simulation)

NOTE: The CUDA Samples are not meant for performance measurements. Results may vary when GPU Boost is enabled.

> Windowed mode
> Simulation data stored in video memory
> Single precision floating point simulation
> 1 Devices used for simulation
GPU Device 0: "Xavier" with compute capability 7.2

> Compute 7.2 CUDA device: [Xavier]
```



---
* * *
# docker 

## 查看启动命令
```
resize -s 40 120
docker ps --no-trunc
docker ps -a --no-trunc > docker_output.txt

docker inspect --format='{{.Config.Cmd}}' <container_id>
```

## 查看docker服务日志
```
sudo journalctl -u docker.service
```

## 关于镜像和代理

像下面这样

$ cat /etc/docker/daemon.json 
```
{
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    },
    "registry-mirrors":  [
	"https://docker.1panel.live",
	"https://docker.1ms.run",
	"https://docker.xuanyuan.me",
	"https://docker.registry.cyou",
	"https://docker-cf.registry.cyou",
	"https://dockercf.jsdelivr.fyi",
	"https://docker.jsdelivr.fyi",
	"https://dockertest.jsdelivr.fyi",
	"https://mirror.aliyuncs.com",
	"https://dockerproxy.com",
	"https://mirror.baidubce.com",
	"https://docker.m.daocloud.io",
	"https://docker.nju.edu.cn",
	"https://docker.mirrors.sjtug.sjtu.edu.cn",
	"https://docker.mirrors.ustc.edu.cn",
	"https://mirror.iscas.ac.cn",
	"https://docker.rainbond.cc",
	"https://do.nark.eu.org",
	"https://dc.j8.work",
	"https://dockerproxy.com",
	"https://gst6rzl9.mirror.aliyuncs.com",
	"https://registry.docker-cn.com",
	"http://hub-mirror.c.163.com",
	"http://mirrors.ustc.edu.cn/",
	"https://mirrors.tuna.tsinghua.edu.cn/",
	"http://mirrors.sohu.com/"
    ],
    "data-root": "/media/andy/462c143b-0c11-4aca-bf8d-20b839017693/docker",
    "insecure-registries" : [
	"https://docker.1panel.live",
	"https://docker.1ms.run",
	"https://docker.xuanyuan.me",
    	"registry.docker-cn.com",
    	"docker.mirrors.ustc.edu.cn"
    ],
    "debug": true,
    "experimental": false,
    "proxies": {
        "http-proxy": "127.0.0.1:10808",
        "https-proxy": "127.0.0.1:10808"
    }
}
```




有些Docker daemon 的 daemon.json 文件中 不支持 proxies 这个配置项

创建或编辑 /etc/systemd/system/docker.service.d/http-proxy.conf 文件， 类似
```
[Service]
Environment="HTTP_PROXY=http://192.168.3.16:7890"
Environment="HTTPS_PROXY=http://192.168.3.16:7890"
Environment="NO_PROXY=localhost,127.0.0.1,::1"
```

```
[Service]
Environment="HTTP_PROXY=127.0.0.1:10808"
Environment="HTTPS_PROXY=127.0.0.1:10808"
Environment="NO_PROXY=localhost,127.0.0.1,::1"
```
然后执行
```
sudo systemctl daemon-reload
sudo systemctl restart docker
```
测试
```
docker run hello-world
docker run -it --rm [imamge:tag] sh
docker run -it --rm [imamge:tag] /bin/bash

docker run -it --rm nvidia/cuda-arm64:11.1.1-cudnn8-devel-ubuntu18.04 bash
sudo docker run --runtime=nvidia -it --name test -v /path:/path nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04 /bin/bash
```

---
* * *
# tree
```
sudo apt install tree
```

---
* * *
# Next Topic

---
* * *
# Next Topic

---
* * *
# Next Topic

---
* * *
# Next Topic

---
* * *
# Next Topic

---
* * *
# Next Topic



***
# install and config sudo
```
$ su
# apt-get install sudo
# chmod +w /etc/sudoers
# gedit /etc/sudoers
（等效于visudo命令）
// add this line
andy	ALL=(ALL:ALL) ALL
```

***
# sources.list
比如163,aliyun都要用https,更稳定连接

tip: 查发行版本名称`lsb_release -cs`，会获得比如jessie等名称

***
# install openbox
```
$ sudo apt-get install openbox menu libxml2-dev tint2 openbox-menu openbox-gnome-session pkg-config menu-l10n gksu lxdm
//Suggested packages:
//  openbox-kde-session
//The following NEW packages will be installed:
//  giblib1 gksu libfm-extra4 libgksu2-0 libid3tag0 libimlib2 libmenu-cache-bin
//  libmenu-cache3 libobrender29 libobt2 libxml2-dev menu menu-l10n obconf
//  openbox openbox-gnome-session openbox-menu pkg-config scrot tint2


$ tint2conf

$ sudo apt-get install feh
$ sudo apt-get install obmenu
// The following NEW packages will be installed:
//  obmenu python-glade2


$ sudo apt-get install lxappearance
$ sudo apt-get install pcmanfm libfm-tools nautilus-actions
$ sudo apt-get install lxterminal
$ sudo apt-get install leafpad
```

***
# install firefox and flash-plugin
```
// default browser is iceweasel, also based on firefox
$ sudo apt-get install flashplugin-nonfree ttf-mscorefonts-installer ttf-xfree86-nonfree
$ sudo gedit /etc/apt/sources.list

// add
## deb http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt all main

// add key for 
// $ sudo apt-key adv --recv-keys --keyserver kerserver.ubuntu.com C1289A29
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 C1289A29

$ sudo apt-get update
$ sudo apt-get install thunderbird-mozilla-build 

// don't wanna remove iceweasel, so can not install firefox
// $ sudo apt-get install firefox-mozilla-build

// install firefox-mozilla-build could cause error
 (current status `half-installed')
Sub-process /usr/bin/dpkg returned an error code (1)

$ sudo leafpad /var/lib/dpkg/status
要把firefox-mozilla-build状态改成install ok installed就可以删除了

$ sudo dpkg -P firefox-mozilla-build
$ sudo apt-get --purge autoremove firefox-mozilla-build
$ sudo apt-get autoclean
```
```
sudo leafpad /etc/profile
```
```
if [ "`id -u`" -eq 0 ]; then
  PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
else
  PATH="/usr/local/bin:/usr/bin:/bin:/sbin:/usr/local/games:/usr/games:/usr/sbin:/usr/local/sbin"
fi
export PATH
```

firefox可以通过alt键调出menu bar，所以隐藏掉好了，隐藏digo signin bar

***
#切换中文目录为英文目录 使用命令来转换中文目录为英文目录。

即/home中的“桌面”、“下载”等等转换成“Desktop”、“Downloads”等等。
```
export LANG=en_US
xdg-user-dirs-update
```
选 update
```
export LANG=zh_CN.UTF-8
xdg-user-dirs-update
```
或`xdg-user-dirs-gtk-update`
选“不要再提醒”和“保持原来的名称”

arch无效


```
echo en_US > ~/.config/user-dirs.locale
修改~/.config/user-dirs.dirs
XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_TEMPLATES_DIR="$HOME/Templates"
XDG_PUBLICSHARE_DIR="$HOME/Public"
XDG_DOCUMENTS_DIR="$HOME/Documents"
XDG_MUSIC_DIR="$HOME/Music"
XDG_PICTURES_DIR="$HOME/Pictures"
XDG_VIDEOS_DIR="$HOME/Videos"
```
```
mkdir Desktop Downloads Templates Public Documents Music Pictures Videos
rm -rf 公共  视频  文档  音乐 模板  图片  下载  桌面
```

***
# essential tools
```
$ sudo apt-get install aptitude
$ sudo apt-get install apt-file
$ sudo apt-file update

$ sudo apt-get install vim ctags vim-doc vim-scripts exuberant-ctags libtemplate-perl ispell vim-addon-manager cscope
$ sudo update-alternatives --config editor
select 3, vim.basic

$ sudo apt-get install git git-gui git-svn git-doc
$ sudo apt-get autoremove
$ git config --global user.name "Andreas Zhang"
$ git config --global user.email denglitsch@gmail.com
$ git config --global user.name
Andreas Zhang
$ git config --global user.email
denglitsch@gmail.com
$ vim ~/.gitconfig
$ sudo apt-get install subversion subversion-tools rapidsvn

$ sudo apt-get install rdesktop grdesktop 
$ rdesktop -a 16 -r sound:local -r clipboard:PRIMARYCLIPBOARD -r disk:sunray=/home/andy -f 192.168.1.99 &
$ rdesktop -a 16 -r sound:local -r clipboard:PRIMARYCLIPBOARD -r disk:share=/home/andy -f 192.168.1.99 &
退出全屏模式 :使用组合键ctrl+alt+enter

$ sudo apt-get install xrdp vnc4server tightvncserver ssh
$ sudo apt-get install remmina libfreerdp-plugins-standard libxcomp3 nxproxy remmina-plugin-gnome remmina-plugin-nx remmina-plugin-rdp remmina-plugin-telepathy remmina-plugin-vnc remmina-plugin-xdmcp
Ubuntu之间远程登录用remmina，协议选VNC-虚拟网络


$ sudo apt-get install dpkg-dev build-essential
$ sudo apt-get install debian-keyring debian-keyring g++-multilib g++-4.9-multilib gcc-4.9-doc libstdc++6-4.9-dbg gcc-multilib autoconf automake libtool flex bison
$ sudo apt-get install gcc-doc gcc-4.9-multilib gcc-4.9-locales libgcc1-dbg libgomp1-dbg libitm1-dbg libatomic1-dbg libasan1-dbg liblsan0-dbg libtsan0-dbg autoconf-doc apt-mirror
$ sudo apt-get install libubsan0-dbg libcilkrts5-dbg libquadmath0-dbg glibc-doc libstdc++-4.9-doc make-doc gdb libc-dbg gdb-doc doc-base bison-doc autoconf-doc libtool-doc automake



$ sudo apt-get install rar p7zip p7zip-full p7zip-rar unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack jlha-utils arj cabextract file-roller xz-utils
file-roller就是archive manager
把 rarreg.key 复制到你的 home 目录，或：/etc， /usr/lib， /usr/local/lib， /usr/local/etc
## sudo chattr +i rarreg.key


// $ apt-get install java-package
// $ sudo apt-get install fakeroot doxygen doxygen-doc doxygen-latex doxygen-gui
$ sudo apt-get install fakeroot doxygen doxygen-doc doxygen-gui
```
```
$ sudo apt-get install virtualbox virtualbox-guest-additions-iso virtualbox-qt virtualbox-dkms linux-headers-amd64 linux-headers-3.16.0-4-all linux-headers-3.16.0-4-common
$ sudo apt-get install gcc-4.8-multilib gcc-4.8-doc 
$ systemctl status virtualbox.service
```
```
$ sudo sh -c 'echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list
$ sudo sh -c 'echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list
$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
$ sudo apt-get update
$ sudo apt-get install oracle-java8-installer
```
```
$ sudo leafpaf /etc/apt/sources.list
deb http://archive.ubuntukylin.com:10006/ubuntukylin trusty main
$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D259B7555E1D3C58
$ sudo apt-get update

$ sudo leafpaf /etc/apt/sources.list
deb http://ppa.launchpad.net/fcitx-team/nightly/ubuntu trusty main 
deb-src http://ppa.launchpad.net/fcitx-team/nightly/ubuntu trusty main 
$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7E5FA1EE
$ sudo apt-get update

$ sudo apt-get install fcitx-googlepinyin
//$ sudo apt-get install fcitx fcitx fcitx-bin fcitx-config-common fcitx-config-gtk fcitx-data fcitx-frontend-all fcitx-frontend-gtk3:amd64 fcitx-libs:amd64 fcitx-libs-gclient:amd64 fcitx-libs-qt:amd64 fcitx-module-cloudpinyin fcitx-module-dbus fcitx-module-kimpanel fcitx-module-x11 fcitx-modules fcitx-qimpanel-configtool fcitx-ui-classic fcitx-sogoupinyin sogoupinyin

$ sudo apt-get install fcitx fcitx-bin fcitx-config-common fcitx-config-gtk fcitx-data fcitx-frontend-all fcitx-frontend-gtk3:amd64 fcitx-libs:amd64 fcitx-libs-gclient:amd64 fcitx-libs-qt:amd64 fcitx-module-cloudpinyin fcitx-module-dbus fcitx-module-kimpanel fcitx-module-x11 fcitx-modules fcitx-ui-classic sogoupinyin
$ sudo apt-get install fcitx fcitx-bin fcitx-config-common fcitx-config-gtk fcitx-data fcitx-frontend-all fcitx-frontend-gtk3:amd64 fcitx-libs:amd64 fcitx-libs-gclient:amd64 fcitx-libs-qt:amd64 fcitx-module-cloudpinyin fcitx-module-dbus fcitx-module-kimpanel fcitx-module-x11 fcitx-modules fcitx-pinyin fcitx-ui-classic fcitx-sunpinyin fcitx-googlepinyin fcitx-module-cloudpinyin fcitx-table-all sogoupinyin fcitx-ui-classic fcitx-ui-light
$ sudo apt-get install libopencc1

$ sudo im-config
```
出现窗口点击确定>确定
这里选择fcitx即可，然后确定
接下来注销系统重新登录，此时输入法应该就可以用了，如果依旧不行，请打开fcitx配置，将输入法顺序排列即可
如果依旧不行的话，请运行如下命令检查输入法依赖是否安装齐全，这里给出我的依赖列表
```
dpkg --get-selections | grep fcitx
fcitx -r --enable sogou-qimpanel
fcitx -r --enable fcitx-qimpanel&&fcitx-qimpanel
```
重置托盘就行。。。汗
```
// sudo apt-get remove fcitx fcitx-bin fcitx-config-common fcitx-config-gtk fcitx-data fcitx-frontend-all fcitx-frontend-gtk3:amd64 fcitx-libs:amd64 fcitx-libs-gclient:amd64 fcitx-libs-qt:amd64 fcitx-module-cloudpinyin fcitx-module-dbus fcitx-module-kimpanel fcitx-module-x11 fcitx-modules fcitx-qimpanel-configtool fcitx-ui-classic fcitx-sunpinyin fcitx-googlepinyin fcitx-module-cloudpinyin fcitx-table-all sogoupinyin fcitx-ui-qimpanel --purge

// sudo apt-get remove --purge fcitx-mozc fcitx fcitx-table-wubi-large fcitx-frontend-all fcitx-frontend-gtk2 fcitx-frontend-gtk3 fcitx-frontend-qt4 fcitx-config-gtk fcitx-ui-classic fcitx-module-kimpanel fcitx-module-dbus libopencc1 fcitx-libs-qt fcitx-m17n fcitx-tools m17n-docs

// sudo apt-get autoremove

//# sudo apt-get install im-switch # either im-config
//# im-switch -s fcitx -z default # never needed

//apt-cache search fcitx
//aptitude search fcitx
//dpkg --get-selections | grep fcitx

//sudo gnome-session-properties
//sogou-qimpanel 设置成6s

//!!!最重要的，在启动器里调整sogou-qimpanel的启动延迟，就可以了，不要启动fcitx-qimpanel, 但是如果不安装fcitx-ui-qimpanel,搜狗面板又不能切出,看着很蛋疼
```

搞一些ubuntu kylin的工具过来使使
```
//andy@andy-dell ~ $ sudo apt-get install ubuntu-kylin-software-center indicator-china-weather youker-assistant chinese-calendar fcitx-ui-qimpanel libcurl3 libcurl3:i386 libqxt-core0 libqxt-gui0
$ sudo apt-get install libqxt-core0 libqxt-gui0
$ sudo apt-get install libboost-iostreams1.55.0 kuaipan4uk
$ sudo apt-get -f install
```

搞一些deepinlinux的东东过来
```
# sudo gedit /etc/apt/sources.list &
# add this line temperary
# deb http://packages.linuxdeepin.com/deepin trusty main non-free universe
# # deb-src http://packages.linuxdeepin.com/deepin trusty main non-free universe
# andy@andy-dell ~ $ sudo apt-get update
# andy@andy-dell ~ $ wget http://packages.linuxdeepin.com/deepin/project/deepin-keyring.gpg
# andy@andy-dell ~ $ gpg --import /home/andy/deepin-keyring.gpg
# andy@andy-dell ~ $ sudo gpg --export --armor 209088E7 | sudo apt-key add -
# andy@andy-dell ~ $ rm deepin-keyring.gpg
# 等效于
# andy@andy-dell ~ $ $ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0A40427E209088E7
# 然后
# andy@andy-dell ~ $ sudo apt-get update
# andy@andy-dell ~ $ sudo rm /var/lib/dpkg/updates/*
# andy@andy-dell ~ $ sudo apt-get update
# andy@andy-dell ~ $ sudo rm /var/cache/apt/archives/lock
# andy@andy-dell ~ $ sudo rm /var/lib/dpkg/lock
# andy@andy-dell ~ $ sudo apt-get update
# andy@andy-dell ~ $ sudo apt-get install python-deepin-gsettings deepin-music-player wps-office opera

apt-cache search libmng
aptitude search libmng
$ sudo apt-get install libmng1 libmng-dev 
//$ sudo apt-get install deepin-music-player deepin-media-player deepin-terminal
```
会自动安装mplayer

`sudo apt-get -f install` 不久得了，自动解决依赖问题。。。库依赖还是不太能解决，如果库里面都删除以前版本的话
```
#编译缺失的查找，没用过
#apt-get install apt-file
#apt-file update

//gpg --keyserver wwwkeys.pgp.net --recv-keys 07DC563D1F41B907
//gpg --export --armor 1F41B907 | sudo apt-key add -
//等同于
//sudo apt-key adv --recv-keys --keyserver wwwkeys.pgp.net 07DC563D1F41B907
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 07DC563D1F41B907

sudo apt-get install python-javascriptcore git
git clone https://github.com/sumary/dmusic-plugin-baidumusic.git
cd dmusic-plugin-baidumusic
cp -r baidumusic ~/.local/share/deepin-music-player/plugins/
```
再添加一些音频视频播放器
```
//$ sudo apt-get install ffmpeg smplayer smplayer-themes smplayer-translations
$ sudo apt-get install smplayer smplayer-themes
//$ sudo apt-get install rhythmbox rhythmbox-plugins rhythmbox-mozilla rhythmbox-plugin-cdrecorder rhythmbox-plugin-zeitgeist
$ sudo apt-get install rhythmbox rhythmbox-plugins rhythmbox rhythmbox-plugin-cdrecorder

//#sudo apt-get install vlc
//#sudo aptitude install mplayer2 -f
//sudo aptitude -f install deadbeef audacious xmms2 audacious-plugins
//#sudo apt-get install libaudiofile1 libesd0 libsvga1 mplayer-gui mplayer-nogui mplayer-skins
//#sudo apt-get install mplayer-gui mplayer-nogui mplayer-skin-blue mplayer-fonts 
//sudo apt-get install gecko-mediaplayer vdr-plugin-mplayers
sudo apt-get install gecko-mediaplayer
//sudo aptitude install smplayer2 smplayer2-common		
//sudo apt-get remove mplayer-gui mplayer-nogui mplayer-skin-blue mplayer-fonts 
sudo apt-get autoremove
```

设置远程登录
```
andy@andy-dell:~$ sudo apt-get install rdesktop grdesktop 
andy@andy-hp:~/kylinlog$ rdesktop -a 16 -r sound:local -r clipboard:PRIMARYCLIPBOARD -r disk:sunray=/home/andy -f 192.168.1.99 &
目标机器要打开桌面共享，取消每次都要确认
sudo apt-get install xrdp
sudo apt-get install vnc4server tightvncserver vnc4server
sudo apt-get install remmina libfreerdp-plugins-standard libxcomp3 nxproxy remmina-plugin-gnome remmina-plugin-nx remmina-plugin-rdp remmina-plugin-telepathy remmina-plugin-vnc remmina-plugin-xdmcp
sudo aptitude install ssh -f

$ vncpasswd
123456

$ leafpad .vnc/xstartup  
export XKL_XMODMAP_DISABLE=1
#/etc/X11/Xsession
exec startxfce4

$ vncserver -kill :1
$ sudo /etc/init.d/xrdp restart
$ x0vncserver -display :0 -passwordfile ~/.vnc/passwd 
$ sudo /etc/init.d/xrdp status
$ sudo systemctl start xrdp
```

```
$ sudo apt-get install qemu skyeye

//$ sudo apt-get install spacefm udevil

//$ spacefm --find-files

$ sudo apt-get install xarchiver fluid idesk

$ sudo apt-get install qt-sdk qv4l2
$ sudo apt-get install alsa-tools alsa-tools-gui alsamixergui 
```
Carbon  
Openbox Theme
http://openbox.org/wiki/Openbox:Themes
http://box-look.org/content/show.php/Carbon?content=59418

~/.themes/ 
```
$ sudo aptitude install gtk-theme-switch gtk2-engines
$ sudo aptitude install lxrandr
$ sudo apt-get install volumeicon-alsa
```

在 ~/.config/openbox/autostart 下加入

(The autostart script is located at ~/.config/openbox/autostart.sh. If that file does not exist, then the system-wide default script, located at /etc/xdg/openbox/autostart.sh, is run instead)

背景图片
```
feh --bg-scale /path/to/your/background/image.jpg
```
桌面图标使用的是 idesk，感觉比较复杂，没办法，除了 rox，没什么比较好的选择。
idesk 的相关配置文件可以参考 /usr/share/idesk/
引用：

The main configuration file is called .ideskrc and must reside in the users home-directory (~/.ideskrc). The icons are loaded from lnk-files, which must placed in ~/.idesktop/*.lnk.

Sample configuration files can be found in /usr/share/idesk/. These files contains all available options. Please you must read them. 

自启动还可以在
随桌面启动的autostart
```
/etc/xdg/autostart
/usr/share/autostart
/usr/share/gdm/autostart
/usr/share/gnome/autostart
~/.config/autostart
~/.kde/share/autostart
~/.local/share/autostart
```

```
$ sudo apt-get install apt-show-versions
// apt-show-versions fcitx-ui-qimpanel
安装dpkg-scanpackages
$ sudo apt-get install dpkg-dev
$ sudo apt-get install wps-office ttf-mscorefonts-installer
$ sudo apt-get install aria2 axel curl
//$ aptitude search proz
```

```
$ sudo apt-get install vim ctags vim-doc vim-scripts exuberant-ctags libtemplate-perl ispell vim-addon-manager
复制配置文件过来
$ sudo apt-get install vim-gtk
```
```
$ sudo apt-get install synaptic
$ sudo apt-get install okular
$ sudo apt-get install usbview iptux
$ sudo aptitude install nautilus-share samba smbclient smbfs system-config-samba winbind
sudo apt-get install libreoffice
//sudo apt-get install xchm chmsee
$ sudo apt-get install chm2pdf xchm
//#sudo apt-get install ffmpeg smplayer smplayer-themes smplayer-translations
//sudo apt-get install smplayer smplayer-l10n
//sudo apt-get install rhythmbox rhythmbox-plugins rhythmbox-mozilla rhythmbox-plugin-cdrecorder rhythmbox-plugin-zeitgeist
```
audacious等，ref to https://pkgs.org/download/audacious

For jessie (stable) amd64, armel, armhf, i386, kfreebsd-amd64, kfreebsd-i386, mips, mipsel and powerpc packages

add in your /etc/apt/sources.list

non-free is for i386 and amd64 arches only.
```
deb http://www.deb-multimedia.org jessie main non-free
```
要安装libaudcore3 audacious audacious-plugins
```
sudo aptitude -f install audacious xmms2 audacious-plugins
$ sudo apt-get install gecko-mediaplayer audacious xmms2 audacious-plugins
$ sudo apt-get install gnome-mplayer gecko-mediaplayer libgda-5.0-bin libgda-5.0-mysql libgda-5.0-postgres libgmlib1-dbg libgmtk1-dbg
sudo apt-get autoremove
$ sudo apt-get install goldendict
```
```
//# sudo add-apt-repository ppa:matthaeus123/mrw-gimp-svn
//# sudo apt-get update
$ sudo apt-get install gimp gimp-data gimp-plugin-registry gimp-data-extras
```
```
$ sudo apt-get install htop w3m tmux awesome suckless-tools
$ sudo apt-get install fbgrab netpbm dstat
//$ sudo apt-get install openjdk-7-jdk
// sudo apt-get install gcj-jdk
// sudo apt-get install eclipse eclipse-cdt eclipse-jdt codeblocks
$ sudo apt-get install eclipse eclipse-cdt eclipse-jdt
$ sudo apt-get install xscreensaver libopengl-xscreensaver-perl xscreensaver-data xscreensaver-data-extra xscreensaver-gl xscreensaver-gl-extra xscreensaver-screensaver-bsod xscreensaver-screensaver-dizzy xscreensaver-screensaver-webcollage fonts-freefont-ttf
$ sudo apt-get install wps-office ttf-mscorefonts-installer wps2odt wps2epub
$ sudo apt-get install aria2 axel
$ sudo apt-get install filezilla
//#sudo add-apt-repository ppa:deluge-team/ppa
//#sudo apt-get update
$ sudo apt-get install deluge
```
```
$ sudo aptitude install xfce4 xfce4-goodies slim
```
不要用slim，用lxdm

```
$ sudo apt-get install libappindicator1
$ sudo apt-get install pepperflashplugin-nonfree
$ sudo update-pepperflashplugin-nonfree --install
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb


//$ sudo apt-get install conky conky-std conky-manager tk-dev 
$ sudo apt-get install conky conky-all tk-dev
Suggested packages:
  apcupsd moc mpd
The following packages will be REMOVED:
  conky-std
The following NEW packages will be installed:
  conky-all libaudclient2 libxnvctrl0

// sudo apt-get install chromium-browser chromium-codecs-ffmpeg-extra chromium-browser-l10n
$ sudo apt-get install chromium-l10n chromium-inspector chromium opera-stable
```

```
deb http://ppa.launchpad.net/ubuntu-wine/ppa/ubuntu trusty main 
#deb-src http://ppa.launchpad.net/ubuntu-wine/ppa/ubuntu trusty main

$ sudo sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 F9CB8DB0

#deb http://ppa.launchpad.net/wine-cn/ppa/ubuntu YOUR_UBUNTU_VERSION_HERE main 
#deb-src http://ppa.launchpad.net/wine-cn/ppa/ubuntu YOUR_UBUNTU_VERSION_HERE main 

$ sudo sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 94625C2F

//$ sudo apt-get install winetricks wine-mono4.5.6 wine-gecko2.40 

$ sudo apt-get install qemu qemu-user-static vde2 sgabios ovmf debootstrap

$ sudo dpkg --add-architecture i386
$ sudo apt-get update
$ sudo apt-get install wine-development

安装wine
$ sudo apt-get install wine winetricks pulseaudio-esound-compat oss-compat liblcms2-utils libgnutls26 libjpeg8
$ sudo aptitude install wine winetricks pulseaudio-esound-compat oss-compat liblcms2-utils libgnutls26 libjpeg8


env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winecfg
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks --gui
//默认配置
//andy@andy-hp:~$ winecfg 
//添加一些font和runtime library
//andy@andy-hp:~$ winetricks

// sudo apt-get install wine winetricks wine-mono0.0.8 wine-mono0.0.8:i386 wine-gecko2.21 wine-gecko2.21:i386 liblcms2-utils:i386 dosbox:any pulseaudio-esound-compat oss-compat
```


pulseaudio会导致alsamixer的speaker开机静音 声音 音量

修改
```
/usr/share/pulseaudio/alsa-mixer/paths/analog-output.conf
```
and change this:
```
[Element Speaker]
switch = mute
volume = off
to this:
[Element Speaker]
switch = mute
volume = merge
```
类似这样的修改，重启之后就有声音了

git log 显示一例
```
andy@andy-hp:~/kylinlog$ git commit -a -m "远程登陆,安装配置wine"
andy@andy-hp:~/kylinlog$ git log --pretty=format:"%h %s" --graph
```

wine 纸黄金交易通
```
andy@andy-hp:~/.wine/drive_c/Program Files (x86)/纸黄金交易通$ export LANG=zh_CN.UTF-8
andy@andy-hp:~/.wine/drive_c/Program Files (x86)/纸黄金交易通$ wine mygold.exe

需要DLL、字体，
winetricks，在/home/andy/.cache/winetricks
（可以全自动、半自动安装）
补上重要的DDL
vb6run,vcrun6,vcrun6sp6,secur32,msvcirt,mfc42,richedit

http://downloads.sourceforge.net/wqy/wqy-microhei-0.2.0-beta.tar.gz
下载到/home/andy/.cache/winetricks/wenquanyi
Executing w_do_call wenquanyi
Executing load_wenquanyi
Executing mv wqy-microhei/wqy-microhei.ttc /home/andy/.wine/dosdevices/c:/windows/Fonts
Executing winetricks_early_wine regedit C:\windows\Temp\_wenquanyi\_register-font.reg
Executing winetricks_early_wine regedit C:\windows\Temp\_wenquanyi\_register-font.reg

sudo add-apt-repository ppa:ubuntu-wine/ppa
sudo apt-get update
sudo apt-get install wine1.7 winetricks wine-mono4.5.2 libwine-gecko-2.21 wine-gecko2.34 winbind
$ winetricks riched20 riched30 ie8 vcrun6 vcrun2005sp1 gdiplus cjkfonts corefonts wenquanyi
```
这里字体可能影响了gnome的

```
sudo add-apt-repository ppa:ubuntu-wine/ppa
sudo apt-get update

sudo apt-get install wine1.7 winetricks wine-mono4.5.2 wine-mono4.5.2:i386 wine-gecko2.34 wine-gecko2.34:i386 winbind p11-kit:i386
sudo apt-get install p11-kit:i386

安装winetricks组件

mkdir /home/andy/.cache/winetricks
复制已经下载的winetricks部件到这里
#winetricks vb6run vcrun6 vcrun6sp6 secur32 msvcirt mfc42 riched20 riched30 ie6 gdiplus
#winetricks cmd comctl32 gdiplus mfc42 vcrun2003 vcrun2005 vcrun2008 vcrun2010 riched20 riched30 
#winetricks msxml3 gdiplus riched20 riched30 vcrun6 vcrun2005 ie6 flash
在64位系统下安装，如果安装某些库或者程序（例如安装ie6）出现无法安装的情况，提示：You're using a 64-bit WINEPREFIX, most of winetricks hasn't been fixed for win64 yet. 这时，你需要删除~/.wine，强制使用32位的，命令如下：
env WINEARCH=win32 WINEPREFIX=/path/to/wineprefix winetricks
例如：env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks

到这里下载ie6
http://www.westernpacificresearch.com/downloads/

env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks vb6run vcrun6 vcrun6sp6 secur32 msvcirt mfc42 riched20 riched30 ie6 gdiplus
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks cmd comctl32 gdiplus mfc42 vcrun2003 vcrun2005 vcrun2008 vcrun2010 riched20 riched30
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks msxml3 gdiplus riched20 riched30 vcrun6 vcrun2005 ie6 flash
```
安装wine的程序
```
beyond compare, source insight, winrar, thunder5, foxit reader 3.0, minithunder
```
快捷方式在
```
/home/andy/.local/share/applications
```
桌面整合在
```
/home/andy/.config/menus/applications-merged
```

不少是可以跑到windows分区去绿色执行的

UltraEdit，汇金，迅雷5


ia32-libs
```
sudo apt-get install libgtk2.0-0:i386
而不是sudo apt-get install ia32-libs ia32-libs-gtk
sudo apt-get install libp11-kit-gnome-keyring:i386
wget https://raw.github.com/spaetzlecode/getlibs/master/getlibs
sudo chown root:root getlibs
sudo chmod +x getlibs
sudo mv -n getlibs /usr/bin
sudo ln -s /usr/lib32/i386-linux-gnu/pkcs11/gnome-keyring-pkcs11.so /usr/lib/i386-linux-gnu/pkcs11/gnome-keyring-pkcs11.so
```
<http://askubuntu.com/questions/127848/wine-cant-find-gnome-keyring-pkcs11-so>
```
sudo cp qq2013.tar.gz /opt/longene/qq/
```
用自己重新做的qq2013.tar.gz替换/opt/longene/qq/qq2013.tar.gz

可以用了

要安装其他软件到longene的wine
```
export 
LANG=zh_CN.utf8
LONGENE_DIR=/opt/longene
WINE_DIR=$LONGENE_DIR/qq/wine-lib
WINEPREFIX_DIR=$HOME/.longene/qq

env WINEPREFIX=$WINEPREFIX_DIR $WINE_DIR/bin/winecfg
```


***
# source.list
```
deb http://mirrors.163.com/ubuntu/ trusty main universe restricted multiverse
deb http://mirrors.163.com/ubuntu/ trusty-updates universe main multiverse restricted
deb http://mirrors.163.com/ubuntu/ trusty-proposed universe main multiverse restricted
deb http://mirrors.163.com/ubuntu/ trusty-security universe main multiverse restricted
deb http://mirrors.163.com/ubuntu/ trusty-backports main multiverse restricted universe
# deb-src http://mirrors.163.com/ubuntu/ trusty main universe restricted multiverse
# deb-src http://mirrors.163.com/ubuntu/ trusty-security universe main multiverse restricted
# deb-src http://mirrors.163.com/ubuntu/ trusty-updates universe main multiverse restricted
# deb-src http://mirrors.163.com/ubuntu/ trusty-proposed universe main multiverse restricted
# deb-src http://mirrors.163.com/ubuntu/ trusty-backports universe main multiverse restricted
```
```
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 C0B21F32
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 437D05B5
```

***
# gcc
```
$ sudo apt-get install gcc-arm-none-eabi gcc-avr avr-libc libnewlib-doc avrdude avrdude-doc avr-libc libnewlib-dev binutils-avr avrprog openocd skyeye
$ sudo apt-get install gdb-arm-none-eabi gdb-avr gdb gdb-mingw-w64 gdbserver gdb-doc gcc-mingw-w64 gcc-msp430 gcc-multilib gdb-msp430 msp430-libc msp430mcu 

//$ sudo apt-get install gcc-arm-linux-gnueabi lib32bz2-1.0 
$ sudo apt-get install  mspdebug binutils-msp430 sdcc
$ sudo apt-get install lib32z1 lib32ncurses5 g++-multilib gcc-multilib
$ sudo apt-get install emacs vim-gtk cscope exuberant-ctags
```
```
http://ftp.yzu.edu.tw/eclipse/tools/cdt/releases/8.7/cdt-8.7.0.zip
http://avr-eclipse.sourceforge.net/wiki/index.php/The_AVR_Eclipse_Plugin
http://sourceforge.net/projects/gnuarmeclipse
http://opensource.zylin.com/embeddedcdt.html
http://opensource.zylin.com/zylincdt
http://sourceforge.net/projects/eclipse-sdcc/?source=dlp
```


```
$ leafpad ~/.bashrc
export WINEPREFIX=$HOME/.wine/
export WINEARCH=win32

$ sudo apt-get install mono-tools-devel mono-tools-gui ncurses-bin ncurses-base
$ sudo apt-get install wine-gecko2.40 wine-mono4.5.6
$ sudo dpkg --add-architecture i386
$ sudo apt-get install wine-gecko2.40:i386 wine-mono4.5.6:i386 wine-mono0.0.8 wine-mono0.0.8:i386
$ winetricks --gui

foxit用绿色版本
可以export LANG=zh_CN.GKB
找到卸载的 .exe  然后输入命令  wine ****.exe    如卸载福昕阅读器命令 为   
[cpp] 
wine unins000.exe  
 即可。
方法二：终端执行：wine uninstaller   注意使用这个命令，是将所有.exe 软件全部卸载了。小心使用哦

//not good ////
http://packages.linuxdeepin.com/deepin/pool/main/d/deepinwine-foxitreader4/deepinwine-foxitreader4_0.0.2_all.deb
http://packages.linuxdeepin.com/deepin/pool/main/d/deepinwine-foxitreader5/deepinwine-foxitreader5_0.0.1_all.deb

```


***
# 硬盘分区挂载出现“Not authorized to perform operation“的问题 
```
$ sudo mkdir /mnt/c_win /mnt/d_win /mnt/e_win
```
fstab
```
/dev/sda2	/               ext4    errors=remount-ro 0       1
/dev/sda1	/mnt/c_win	ntfs-3g	users,auto,rw,dev,exec,locale=zh_CN.UTF-8      0      0
/dev/sdb1	/mnt/d_win	ntfs-3g	users,auto,rw,dev,exec,locale=zh_CN.UTF-8      0      0
/dev/sdb2	/mnt/e_win	ntfs-3g	users,auto,rw,dev,exec,locale=zh_CN.UTF-8      0      0
```
```
su 
cd /etc/polkit-1/localauthority/50-local.d/
leafpad 50-filesystem-mount-system-internal.pkla
```
文件内
```
[Mount a system-internal device]
Identity=*
Action=org.freedesktop.udisks2.filesystem-mount-system
ResultActive=yes
```
立即生效。真有效

```
leafpad /usr/share/polkit-1/actions/org.freedesktop.udisks2.policy 
```
```
Mount a device
Mount a filesystem
Mount a filesystem on a system device
三段最后的都改成
      <allow_any>yes</allow_any>
      <allow_inactive>yes</allow_inactive>
      <allow_active>yes</allow_active>
```

***
# pdf
```
$ sudo apt-get install pdftk
$ sudo apt-get install gdebi
ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb
// 最好不要安装 
$ sudo dpkg -i AdbeRdr9.5.5-1_i386linux_enu.deb
The following NEW packages will be installed:
  libatk1.0-0:i386 libcairo2:i386 libdatrie1:i386 libgdk-pixbuf2.0-0:i386
  libgraphite2-3:i386 libgtk2.0-0:i386 libharfbuzz0b:i386 libjasper1:i386
  libpango-1.0-0:i386 libpangocairo-1.0-0:i386 libpangoft2-1.0-0:i386
  libpixman-1-0:i386 libthai0:i386 libxcb-render0:i386 libxcb-shm0:i386
The following packages will be upgraded:
  libharfbuzz0b
$ sudo apt-get install libatk1.0-0:i386 libcairo2:i386 libdatrie1:i386 libgdk-pixbuf2.0-0:i386 libgraphite2-3:i386 libgtk2.0-0:i386 libharfbuzz0b:i386 libjasper1:i386 libpango-1.0-0:i386 libpangocairo-1.0-0:i386 libpangoft2-1.0-0:i386 libpixman-1-0:i386 libthai0:i386 libxcb-render0:i386 libxcb-shm0:i386
```

***
# wine-gecho
```
$ sudo apt-get install wine-gecko2.40:i386 wine-gecko2.36:i386 wine-gecko2.34:i386 wine-gecko2.24:i386 wine-gecko2.21:i386 wine-gecko2.40 wine-gecko2.36 wine-gecko2.34 wine-gecko2.24 wine-gecko2.21
$ sudo apt-get install libwine-gecko-2.21
```

***
# xournal
```
// careful
//$ sudo apt-get install xournal
//可以加画线，但是删除了下面的包

The following extra packages will be installed:
  foomatic-filters ghostscript ghostscript-x libgs9 libgs9-common
  libjpeg-turbo8 libjpeg8
Suggested packages:
  hpijs
The following packages will be REMOVED:
  cups cups-filters evince gimp gimp-gmic gimp-plugin-registry
  gir1.2-evince-3.0 gnome gnome-core gnome-documents gnome-sushi hplip
  libevdocument3-4 libevview3-3 libjpeg-turbo-progs libspectre1 libturbojpeg1
  okular printer-driver-c2050 printer-driver-gutenprint printer-driver-hpcups
  printer-driver-pnm2ppa printer-driver-postscript-hp printer-driver-pxljr
  printer-driver-splix task-gnome-desktop task-print-server
  xscreensaver-data-extra xscreensaver-screensaver-bsod
  xscreensaver-screensaver-webcollage
The following NEW packages will be installed:
  foomatic-filters ghostscript-x libjpeg-turbo8 libjpeg8 xournal
The following packages will be upgraded:
  ghostscript libgs9 libgs9-common
3 upgraded, 5 newly installed, 30 to remove and 195 not upgraded.
```


***
# 降级ghostscript libgs9 libgs9-common
```
$ sudo apt-get remove libjpeg-turbo8 libjpeg8 xournal libgs9
$ sudo apt-get install cups cups-filters evince gimp gimp-gmic gimp-plugin-registry gir1.2-evince-3.0 gnome gnome-core gnome-documents gnome-sushi hplip libevdocument3-4 libevview3-3 libspectre1 okular printer-driver-c2050 printer-driver-gutenprint printer-driver-hpcups printer-driver-pnm2ppa printer-driver-postscript-hp printer-driver-pxljr printer-driver-splix task-gnome-desktop task-print-server ghostscript 

//$ sudo apt-get install p11-kit:i386
冲突恢复
$ sudo apt-get install evolution evolution-data-server evolution-plugins gdm3 gnome gnome-contacts gnome-core gnome-keyring gnome-session gnome-shell gnome-shell-extension-weather gnome-shell-extensions libfolks-eds25 p11-kit seahorse task-gnome-desktop



$ sudo apt-get install libjpeg-turbo-progs libturbojpeg1 xscreensaver-data-extra xscreensaver-screensaver-bsod xscreensaver-screensaver-webcollage


$ sudo apt-get install cups cups-filters evince gimp gimp-gmic gimp-plugin-registry gir1.2-evince-3.0 gnome gnome-core gnome-documents gnome-sushi hplip libevdocument3-4 libevview3-3 libjpeg-turbo-progs libspectre1 libturbojpeg1 okular printer-driver-c2050 printer-driver-gutenprint printer-driver-hpcups printer-driver-pnm2ppa printer-driver-postscript-hp printer-driver-pxljr printer-driver-splix task-gnome-desktop task-print-server xscreensaver-data-extra xscreensaver-screensaver-bsod xscreensaver-screensaver-webcollage

$ sudo apt-get install thunderbird-mozilla-build
$ sudo apt-get install libgnutls28
```

***
# 清理源去掉ubuntu的源, 升级gnome
```
$ sudo aptitude install gnome-panel
$ sudo apt-get install gnome-session*
$ sudo apt-get install gnome-shell*
$ sudo aptitude install gnome-a* libgtk-3-dev libgtk2.0-dev libpango1.0-dev libharfbuzz-dev libharfbuzz0b libharfbuzz0b gnome-themes gnome-games gnome-clocks gnome-ppp gnome-rdp gnome-audio gnome-boxes gnome-bluetooth gnome-tweak-tool gnome-user-guide gnome-user-share gnome-nettool gnome-mines gnome-icon-theme gnome-chess gnome-breakout gnome-calculator gnome-terminal gnome-system-tools gnome-genius gnome-hearts gnome-font-viewer gnome-extra-icons gnome-flashback gnome-nibbles gnome-mplayer gnome-schedule gnome-screensaver gnome-search-tool gnome-sound-recorder gnome-menus gnome-accessibility-themes gnome-keyring gnome-maps  
```

```
$ sudo apt-get install pdfcube
$ sudo apt-get install mupdf* pdfsam
```
直接用pdf studio好了。


***
# obmenu-generator
```
$ sudo cpan
$ sudo cpan install Linux::DesktopFiles Data::Dump
$ obmenu-generator
```

```
$ sudo mv /etc/xdg/autostar/fcitx-ui-sogou-qimpanel.desktop ~/Desktop/
```

***
# u盘挂载了但不能访问，检查一下挂载点的权限，要给r+x


***
# 还原备份后处理
```
sudo leafpad /etc/apt/sources.list
sudo apt-get update && sudo apt-get upgrade
sudo apt-key add all_keys
echo "alias cd..='cd ..'" >> ~/.bashrc
```
updata-doc放到/usr/bin

***
# winavr

https://sourceforge.net/p/winavr/code/HEAD/tree/

https://github.com/embecosm/winavr.git

winavr-code放到～

目录名修改为winavr @@ 20180412

***
# gedit
```
$ sudo apt-get install dconf-tools
$ dconf-editor
依次点开->org->gnome->gedit->preferences->encodings
改成
['UTF-8', 'GB18030', 'GB2312', 'GBK', 'BIG5', 'CURRENT', 'ISO-8859-15', 'UTF-16']
```

***
#让Leafpad不再乱码  
```
    系统自带的记事本-leafpad 默认是UTF8编码的，打开GBK的文本自然会乱码，但是leafpad其实也是支持GBK的  
      
    root打开 /usr/share/applications/leafpad.desktop 文件  
      
    找到 exec=leafpad %f 这一行  
    改为 exec=leafpad --codeset=gbk %f  
    再将 name[zh_CN]=记事本  
    改为 name[zh_CN]=记事本[GBK]  
      
    或在Leafpad菜单命令中改也是一样  leafpad --codeset=gbk %f  
```
上面的办法不好，开uft的文件就会乱码


***
# samba share
```
mkdir -p ~/share
```
```
[global]
workgroup = WORKGROUP
security = user

[Movies]
path = /home/transmission/Downloads
valid users = samba
public = no
writable = yes
printable = no
create mask = 0644
```

建立samba用户密码
```
$ sudo pdbedit -a -u andy
== $ smbpasswd -a andy
$ smbclient -L 192.168.1.106 -U%
$ testparm -s
//$ sudo /etc/init.d/samba restart
```

***
# rarreg.key
```
//$ sudo chattr +a *
//$ sudo chattr +a .*
$ sudo chattr +i rarreg.key
$ sudo chattr -i rarreg.key
$ lsattr -a
```

***
# apt-key
```
$ apt-key exportall > all_keys
$ sudo apt-key add all_keys
```

***
# flashplugin
```
$ sudo apt-get install flashplugin-nonfree-extrasound 
$ sudo update-flashplugin-nonfree --install
```

***
# getskype
//$ wget http://www.skype.com/go/getskype-linux-deb-32
//$ sudo dpkg -i getskype-linux-deb-32

***
# minicom等
```
$ sudo apt-get install pidgin-otr 
$ sudo apt-get install minicom lrzsz
$ dconf write /org/gnome/shell/overrides/button-layout '":minimize,maximize,close"'
$ sudo apt-get install k3b
$ sudo apt-get install ffmpegthumbs
$ sudo apt-get install amarok
$ sudo apt-get install k3b lame
$ sudo apt-get install libncursesw5-dev
```

***
# chrome
```
//Download and install Google Public key
//$ wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub
//$ sudo apt-key add linux_signing_key.pub
//$ sudo su
//# echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list
//# exit
//$ sudo apt-get update
//$ sudo apt-get install google-chrome-stable
```


***
# 生成grub的配置文件
```
// Debian or Ubuntu
// 一定加sudo，普通用户不要直接用sbin下的
//generate new grub.cfg
//$ sudo grub2-mkconfig -o /boot/grub2/grub.cfg
//or
//$ grub-mkconfig -o /boot/grub/grub.cfg

//$ sudo update-grub  //生成grub的配置文件
//or
//$ sudo update-grub2  //生成grub的配置文件
//$ sudo apt-get install grub2-common  //没有 update-grub命令时,先运行这个安装命令 
//or
//$ sudo apt-get install grub-common  //没有 update-grub命令时,先运行这个安装命令 
```

***
# 剪贴板
Gpaste 这个 Shell Extension
```
//$ sudo apt-get install gpaste-applet glippy
//$ sudo apt-get install parcellite 
//$ sudo apt-get install xmonad awesome
```

***
# dock 工具
```
//$ sudo apt-get install plank
```

***
# btsync
```
// btsync 太难搞了，老子不高兴弄了
$ sudo gedit /etc/apt/sources.list

deb http://debian.yeasoft.net/btsync/ jessie main non-free contrib
#deb-src http://debian.yeasoft.net/btsync jessie main non-free contrib
$ sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 6BF18B15
//$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 6BF18B15
$ sudo apt-get update
$ sudo apt-get install btsync btsync-gui
```

***
#  用iptux
```
// $ export LANG=zh_CN.UTF-8
// wine ipmsg
```
//iptux无法传文件, 但是可以传输文件夹
```
netstat -tanp
killall pname
ulimit -a  
```

***
# ti dvsdk && ridgerun evsdk
```
$ sudo apt-get install u-boot-tools lrzsz minicom nfs-kernel-server tftpd xinetd libncurses5-dev
$ sudo apt-get install slang-xfig
$ sudo apt-get install quilt
$ sudo apt-get install e2fsck-static


$ ls /bin/sh -l
/bin/sh -> dash

$ sudo rm /bin/sh
$ sudo ln -s /bin/bash /bin/sh

sudo apt-get install git-core libcrypt-ssleay-perl ccache libusb-dev libexpect-perl mono-devel
cd RidgeRun-SDK-DM36x-Turrialba-Eval/bsp/oscheck
cp ubuntu.common debian.common
cp ubuntu.tools debian.tools
cp ubuntu-14.04_64.sh debian-8.2_64
```
安装之后立即把downloads包扔进安装目录
且把 README.md 文件删除
```
make config
make VERBOSE=1
make clean -i
make install
```

***
# winrar
wine winrar


***
#  安装百度云
```
sudo apt-get install python3-dev python3-setuptools python3-crypto python3-keyring python3-lxml python3-pyinotify python3-secretstorage
sudo apt-get install python-pip
$ sudo apt-get install libssl-dev libssl1.0.0
sudo easy_install3 pip

$ sudo easy_install3 pip
Searching for pip
Reading https://pypi.python.org/simple/pip/
Download error on https://pypi.python.org/simple/pip/: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:600) -- Some packages may not be found!
Couldn't find index page for 'pip' (maybe misspelled?)
Scanning index of all packages (this may take a while)
Reading https://pypi.python.org/simple/
Download error on https://pypi.python.org/simple/: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:600) -- Some packages may not be found!
No local packages or download links found for pip
error: Could not find suitable distribution for Requirement.parse('pip')


$ wget http://curl.haxx.se/ca/cacert.pem
$ mv cacert.pem ca-bundle.crt
$ sudo cp ca-bundle.crt /etc/pki/tls/certs/

$ sudo easy_install3 pip
Searching for pip
Reading https://pypi.python.org/simple/pip/
Best match: pip 9.0.1
Downloading https://pypi.python.org/packages/11/b6/abcb525026a4be042b486df43905d6893fb04f05aac21c32c638e939e447/pip-9.0.1.tar.gz#md5=35f01da33009719497f01a4ba69d63c9
Processing pip-9.0.1.tar.gz
Writing /tmp/easy_install-ksi97d1h/pip-9.0.1/setup.cfg
Running pip-9.0.1/setup.py -q bdist_egg --dist-dir /tmp/easy_install-ksi97d1h/pip-9.0.1/egg-dist-tmp-ipyv89t6
/usr/lib/python3.4/distutils/dist.py:260: UserWarning: Unknown distribution option: 'python_requires'
  warnings.warn(msg)
warning: no previously-included files found matching '.coveragerc'
warning: no previously-included files found matching '.mailmap'
warning: no previously-included files found matching '.travis.yml'
warning: no previously-included files found matching '.landscape.yml'
warning: no previously-included files found matching 'pip/_vendor/Makefile'
warning: no previously-included files found matching 'tox.ini'
warning: no previously-included files found matching 'dev-requirements.txt'
warning: no previously-included files found matching 'appveyor.yml'
no previously-included directories found matching '.github'
no previously-included directories found matching '.travis'
no previously-included directories found matching 'docs/_build'
no previously-included directories found matching 'contrib'
no previously-included directories found matching 'tasks'
no previously-included directories found matching 'tests'
Adding pip 9.0.1 to easy-install.pth file
Installing pip3.4 script to /usr/local/bin
Installing pip3 script to /usr/local/bin
Installing pip script to /usr/local/bin

Installed /usr/local/lib/python3.4/dist-packages/pip-9.0.1-py3.4.egg
Processing dependencies for pip
Finished processing dependencies for pip


sudo pip3 install --upgrade pycrypto
sudo pip3 install --upgrade keyring
sudo dpkg -i bcloud_3.8.1-1_all.deb

// bypy 好垃圾啊啊
sudo pip install requests
sudo apt-get install python-tk

https://openapi.baidu.com/oauth/2.0/authorize?scope=basic+netdisk&redirect_uri=oob&response_type=code&client_id=q8WE4EpCsau1oS0MplgMKNBn
yxgi7@aliyun.com的授权码
51f55a0346b6f13b21b84f509757f6b1
```

***
# locales
```
sudo aptitude install locales
//sudo apt-get install dpkg-awk
sudo dpkg-reconfigure locales
```

***
# 默认浏览器
```
$ sudo update-alternatives --config x-www-browser
```
```
There are 4 choices for the alternative x-www-browser (providing /usr/bin/x-www-browser).

  Selection    Path                           Priority   Status
------------------------------------------------------------
* 0            /usr/bin/opera                  200       auto mode
  1            /usr/bin/chromium               40        manual mode
  2            /usr/bin/google-chrome-stable   200       manual mode
  3            /usr/bin/iceweasel              70        manual mode
  4            /usr/bin/opera                  200       manual mode

Press enter to keep the current choice[*], or type selection number: 3
```

***
# default app 相关内容
https://wiki.archlinux.org/index.php/Default_applications#MIME_types_and_desktop_entries

https://wiki.archlinux.org/index.php/Xdg-open#Set_the_default_browser
```
$ xdg-mime default browser.desktop x-scheme-handler/http
$ xdg-mime default browser.desktop x-scheme-handler/https
$ xdg-mime default browser.desktop text/html
```
上面三句有效

其他
```
Processing triggers for shared-mime-info (1.3-1) ...
Unknown media type in type 'all/all'
Unknown media type in type 'all/allfiles'
Unknown media type in type 'uri/mms'
Unknown media type in type 'uri/mmst'
Unknown media type in type 'uri/mmsu'
Unknown media type in type 'uri/pnm'
Unknown media type in type 'uri/rtspt'
Unknown media type in type 'uri/rtspu'
```
```
$ sudo gedit /usr/share/mime/packages/kde.xml
```
删除上面有关的部分内容

类似的
```
Unknown media type in type 'chemical
```
```
sudo rm /usr/share/mime/packages/chemical-mime-data.xml
```


该错误源于KDE，自2008年以来一直没有修复：

https://bugs.kde.org/show_bug.cgi?id=303627

https://bugs.kde.org/show_bug.cgi?id=250924

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=469833

https://bugs.launchpad.net/ubuntu/+source/shared-mime-info/+bug/289592

https://askubuntu.com/questions/39852/how-to-remove-warnings-like-unknown-media-type


***
# mathomatic+gnuplot+gtkwave+qucs
```
//$ sudo apt-get install mathomatic gnuplot rlwrap filelight baobab colordiff hardinfo i-nex gnome-calendar calcurse when qucs geda-gaf units freehdl
$ sudo apt-get install mathomatic gnuplot rlwrap filelight baobab colordiff hardinfo calcurse when units freehdl
```
```
gnuplot> plot [-3.14:3.14] sin(x)
```
http://www.gnuplot.info/demo/

//add source
```
$ sudo leafpad /etc/apt/sources.list
deb http://ppa.launchpad.net/qucs/qucs/ubuntu trusty main 
#deb-src http://ppa.launchpad.net/qucs/qucs/ubuntu trusty main
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 2C2B9116
$ sudo apt-get update
```
//这个是pcb和HDL仿真软件
```
$ sudo apt-get install qucs gtkwave
```

***
# stellarium星空图
```
$ sudo apt-get install stellarium
qtquick1-qml-plugins stellarium stellarium-data
```


***
# cpu-g
```
$ sudo leafpad /etc/apt/sources.list
deb http://ppa.launchpad.net/cpug-devs/ppa/ubuntu trusty main 
#deb-src http://ppa.launchpad.net/cpug-devs/ppa/ubuntu trusty main 
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 4B894331
$ sudo apt-get update
$ sudo apt-get install cpu-g
$ cpu-g.py
```

***
# i-nex 坑跌了安装不了
```
$ sudo leafpad /etc/apt/sources.list
deb http://ppa.launchpad.net/i-nex-development-team/stable/ubuntu trusty main 
deb-src http://ppa.launchpad.net/i-nex-development-team/stable/ubuntu trusty main 
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 F34CDDAD
$ sudo apt-get update
```

***
# iverilog+geda
<http://www.geda-project.org/>
<https://launchpad.net/~mehanik/+archive/ubuntu/geda-unstable>
```
//$ sudo leafpad /etc/apt/sources.list
//deb http://ppa.launchpad.net/mehanik/geda-unstable/ubuntu trusty main 
//#deb-src http://ppa.launchpad.net/mehanik/geda-unstable/ubuntu trusty main 
//$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 BDEB2384
//$ sudo apt-get update
//$ sudo apt-get install geda-gaf iverilog 
```

debian的stable库是有geda-gaf的， 安装了上面的用aptitude降级

<http://wiki.geda-project.org/geda:download>
```
deb http://mirrors.163.com/debian/ stable main non-free contrib
deb-src http://mirrors.163.com/debian/ stable main non-free contrib
```
```
$ sudo apt-get install geda pcb gerbv geda-utils geda-examples geda-gschem geda-xgsch2pcb
sudo apt-get remove geda-utils geda-xgsch2pcb pcb geda-gschem gerbv geda geda-examples geda-gattrib geda-gnetlist geda-gsymcheck pcb-common pcb-gtk geda-doc geda-symbols geda-gaf geda-xorn libgeda43 libgeda-common
sudo apt-get install geda-utils geda-xgsch2pcb pcb geda-gschem gerbv geda geda-examples geda-gattrib geda-gnetlist geda-gsymcheck pcb-common pcb-gtk geda-doc geda-symbols libgeda42 libgeda-common
$ gschem
$ pcb
$ gsymcheck
$ gerbv
$ iverilog
$ gtkwave
// geda不如qucs新
```

好多资源都没有加入默认仓库，但都在一个源里都有。。。。



***
#回收站位置
`~/.local/share/Trash/files/`


***
# conky
```
$ git clone https://github.com/brndnmtthws/conky.git
$ sudo apt-get install liblua5.1-0-dev liblua5.2-dev
```
按照cmake的说法安装一遍，看起来效果不怎么样
```
// 打开ubuntu的源安装conky-manager，记得立即关闭ubuntu的源

// 不要安装这个玩意
// $ sudo apt-get install gnome-do

$ sudo apt-get install lua5.2
$ sudo apt-get install lua50 lua5.1
$ sudo apt-get install cairo-clock
$ sudo apt-get install lua-rings
$ sudo apt-get install lua-rings-dev
$ sudo apt-get install lm-sensors hddtemp
$ sudo hddtemp
或者干脆
//$ sudo cp /usr/sbin/hddtemp /usr/bin/
//$ sudo cp /sbin/ifconfig /bin/
上面的不是个好办法，修改/etc/profile才是好办法


$ sudo apt-get install scons
$ sudo apt-get install lua-iconv lua-iconv-dev
$ sudo apt-get install lua-curses lua-curses-dev
$ sudo apt-get install libluabind-doc libluabind-dev liblua5.2-dev libluabind0.9.1 liblua50-dev liblualib50-dev libluabind-examples liblua5.2-dev liblua5.1-0-dev  liblua50-dev

$ killall conky

// 主要是这几个-dev和编译有关
$ sudo apt-get install libtolua-dev libtolua++5.1-dev libimlib2 libimlib2-dev libiml0 libiml-dev

$ locate lua5.1

$ cd conky-1.9.0
$ ./configure --enable-lua-cairo --enable-lua-imlib2 --enable-imlib2
$ make && sudo make install

conky -v

// test
copy files
- conkyrc_grey
- conky_grey.lua
in ~/.conky/
$ conky -c ~/.conky/conkyrc_grey
$ killall conky
```

***
# games
```
$ aptitude search mines
$ sudo apt-get install games-minesweeper
```


***
# 安装modelsim
```
$ sudo apt-get install libxp-dev libxp6 libxpa-dev libxpa1 libxplc0.3.13-dev libxplc0.3.13 xorg-dev xserver-xorg-dev primus-libs-ia32

// 这样才能运行modelsim的安装程序，一般的unix兼容层而且是32位元
$ sudo apt-get install libxtst6:i386 libxt6:i386 libxp6:i386 libxpa1:i386


$ sudo apt-get install libstdc++5 libstdc++5:i386
cd /opt/modelsim/modeltech
记得先chmod 777 -R
sudo ./sfk6 rep -yes -pat -bin /5589E557565381ECD00000008B5508/31C0C357565381ECD00000008B5508/ -dir .

$ leafpaf ~/.bashrc

添加
export LM_LICENSE_FILE=/opt/modelsim/license.dat
export PATH=$PATH:/opt/modelsim/modeltech/linux_x86_64

// 查看license
$ lmutil lmdiag

// 运行
$ vsim
```

***
# matlab
```
$ sudo apt-get install libc-dev libc6-amd64:i386
```


***
#  操作mdb文件
```
$ sudo apt-get install mdbtools mdbtools-gmdb mdbtools-dev
$ sudo apt-get install unixodbc mdbtools
$ gmdb2
```

***
# firmware
$ sudo apt-get install firmware-linux-nonfree


***
# 安装有道词典
// 要临时开trusty的源，python3-xlib在Debian中没有
```
$ sudo gdebi youdao-dict_1.0.2~deepin_amd64.deb
$ sudo apt-get -f install
```

***
# 安装altera quartus
https://wiki.archlinux.org/index.php/Altera_Design_Software_%28%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87%29
```
$ sudo apt-get install tcsh
$ sudo dpkg-reconfigure dash
```
http://www.linuxidc.com/Linux/2011-10/46280.htm

安装文件所在目录的名称不能有空格
```
$ sh 11.0_quartus_linux.sh  --noexec
$ sh 11.0_dsp_builder_linux.sh  --noexec
$ sh 11.0_devices_linux.sh  --noexec
$ sh 11.0_modelsim_ae_linux.sh  --noexec
$ sh 11.0_legacy_nios2_linux.sh  --noexec
$ sh 11.0_programmer_linux.sh --noexec
```
然后把每个解压的文件夹里的libpng12.so.0都mv出来，就能正常安装了

```
/etc/udev/rules.d/51-altera-usb-blaster.rules
```
```
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6002", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6003", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6010", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6810", MODE="0666"
```

设置环境变量
```
export WINEPREFIX=$HOME/.wine/
export WINEARCH=win32

PATH="/home/andy/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/andy/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/andy/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/andy/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/andy/perl5"; export PERL_MM_OPT;
alias cd..='cd ..'


export LM_LICENSE_FILE=/opt/modelsim/license.dat:/opt/altera/license.dat
export PATH=$PATH:/opt/MATLAB/R2010b/bin:/opt/modelsim/modeltech/bin:/opt/altera/11.0/quartus/bin:/opt/altera/11.0/nios2eds/bin
		
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/altera/11.0/quartus/dsp_builder/bin64:/opt/altera/11.0/quartus/dspba/Blocksets/BaseBlocks/linux64
```

添加快捷bin
```
cd /usr/local/bin
sudo gedit quartus
```
```
#!/bin/bash
cd /opt/altera/11.0/quartus/bin/
./quartus
```
```
sudo chmod +x quartus
```

解压配置好的部分alter器件的modelsim仿真库

这样基本上就配置完毕

在tech_log/fpga/给modelsim_SE创建Altera库/modeltech64_10.1c_q110_linux.tar.xz


***
# 找出大文件
http://www.gosoa.com.cn/category/linux%E5%BC%80%E5%8F%91

http://www.gosoa.com.cn/linux-%E6%89%BE%E5%87%BA%E5%A4%A7%E6%96%87%E4%BB%B6%E6%B1%87%E6%80%BB

/home/user/.cache/tracker目录，找到meta.db（多媒体文件索引数据），删除这个文件（可以放心删除，手机重启后会自动生成），然后重启

`$ find . -type f -size +10000k -exec ls -lh {} \; | awk ‘{ print $8 “: ” $5 }’
`

***
# cadence(abort)
```
$ sudo apt-get install devscripts
$ sudo apt-get install libxmu-dev:i386 libxmu-headers:i386
```
```
export CDS_INST_DIR=/opt/spb
export CDS_ROOT=/opt/IC5141
export CDS_INSTALL_DIR=$CDS_INST_DIR/tools/dfII:$CDS_ROOT/tools/dfII
export CDS_LIC_FILE=$CDS_INST_DIR/share/cadence.license:$CDS_ROOT/share/license/license.dat
export CDS_DIR=$CDS_INST_DIR:$CDS_ROOT
export CONCEPT_INST_DIR=$CDS_INST_DIR
export CDS_SITE=$CDS_INST_DIR/share/local/
export LD_LIBRARY_PATH=$CDS_INST_DIR/tools/lib:$CDS_ROOT/tools/lib
export CDSDOC_PROJECT=$CDS_INST_DIR/doc:$CDS_ROOT/doc
export PATH=$CDS_INST_DIR/tools/bin:$CDS_INST_DIR/tools/pcb/bin:$CDS_INST_DIR/tools/fet/bin:$CDS_INST_DIR/tools/dfII/bin:$CDS_ROOT/tools/bin:$CDS_ROOT/tools/dfII/bin:$CDS_ROOT/tools/spectre/bin:$PATH
export CDS_Netlisting_Node Analog
export LD_ASSUME_KERNEL=2.4.19
#allegro &allegro_design_entry_HDL &projmgr &
```
```
cd /home/您的主目录/您的SPB166工作路径/
source spb166
allegro或者concepthdl或者projmgr
```
例子：
```
#!/bin/bash
cd /home/love/Documents/cadence/SPB166/
source spb166
allegro
```

```
alias lmgrd='/opt/cadence/SPB166/tools/bin/lmgrd -c /opt/cadence/SPB166/share/license/license.dat'   
alias lmdown='/opt/cadence/SPB166/tools/bin/lmdown -c /opt/cadence/SPB166/share/license/license.dat'            
export CDS_LIC_FILE=27000@localhost.localdomain     
export SPB166=/opt/cadence/SPB166                  
export OA_HOME=/opt/cadence/SPB166/oa_v22.43.006   
export CDS_Netlisting_Mode=Analog                  
export
PATH=$SPB166/tools/bin:$SPB166/tools/pcb/bin:$SPB166/tools/fet/bin:$SPB166/tools/specctra/bin:$PATH
```

破解用的
```
eetop.cn_license.dat.tar.gz
eetop.cn_pubkey_verify_1.10.rar
```

确实有allegro.exe在/opt/cadence/SPB166/tools.lnx86/pcb/bin


***
# 关于FT232RL USB转RS232线
```
$ lsusb
$ dmesg|tail
$ ls /dev/ttyUSB*
$ sudo apt-get install putty
```

***
# 安装unetbootin

ppa:n-muench/programs-ppa

<https://launchpad.net/~n-muench/+archive/ubuntu/programs-ppa2>
```
deb http://ppa.launchpad.net/n-muench/programs-ppa2/ubuntu trusty main 
deb-src http://ppa.launchpad.net/n-muench/programs-ppa2/ubuntu trusty main 
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 EAE0D85C
$ sudo apt-get update
$ sudo apt-get install unetbootin
```


***
# 安装veracrypt
ppa:unit193/encryption
<https://launchpad.net/~unit193/+archive/ubuntu/encryption>
```
deb http://ppa.launchpad.net/unit193/encryption/ubuntu trusty main 
deb-src http://ppa.launchpad.net/unit193/encryption/ubuntu trusty main 
```
```
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 B58A653A
$ sudo apt-get update
$ sudo apt-get install veracrypt
```


***
# dropbox
自动更新
```
$ sudo apt-get install nautilus-dropbox
dropbox start -i
```

这种方式比较旧
```
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd
```


***
# something
```
$ sudo apt-get install x11-apps
$ sudo apt-get install hexedit dhex dmg2img
```


***
# 安装115yun


***
# 安装uex


***
# 安装bcompare
32位的包在64位环境可以用的，但是要安装libxft2:i386等

先dpkg，报错，然后完成依赖关系安装,就可以运行了
```
$ sudo apt-get -f install
```

key
```
HmB5oANygQOhaStTHNa+zOKgOeWHOkeAp6d1+QwIebz6z9kwYCm9-O0jF9F79zvzed9v5UVC4VrDkDMmTM8nB+
```

***
# 安装acetoneiso

https://launchpad.net/ubuntu/trusty/+package/acetoneiso

https://launchpad.net/ubuntu/trusty/+package/fuseiso

```
fuseiso_20070708-3ubuntu1_amd64.deb
$ sudo apt-get install isomaster
$ sudo apt-get install okteta
```
打开ubuntu的源后
<https://launchpad.net/onboard>
```
$ sudo apt-get install onboard
```

***
# tesseract-ocr
```
$ sudo apt-get install gimagereader
```

***
# 网页编辑
```
$ sudo apt-get install bluefish
```
其实还是kompozer好

***
# 电驴
```
$ sudo apt-get install mldonkey-gui
// = deluge
$ sudo apt-get install bittorrent-gui rtorrent
```


***
# 以太网接口的逻辑名字（eth0 , eth1 , eth2 ……）
该名称保存在
```
/etc/udev/rules.d/70-persistent-net.rules
```
查看默认路由配置：
```
route -n
```
清空一个网卡接口的所有IP配置
```
ip addr flush eth0
```
DNS配置,即时生效的
```
cat /etc/resolv.conf
nameserver 202.xx.xx.xx
nameserver 192.168.1.1
```
DNS服务器查询
```
$ nslookup
```
动态IP地址分配(DHCP Client)
修改`/etc/network/interfaces`文件如下
```
auto eth0
iface eth0 inet dhcp
```
静态主机名
修改`/etc/hosts`
查看主机名
```
$ hosts
```
临时修改主机名
```
$ sudo hostname testserver
```
永久修改主机名
```
$ sudo vi /etc/hostname
```
删除当前缺省网关
```
$ sudo route del default gw
```
手工配置缺省网关
```
$ sudo route add default gw 192.168.1.1
```
重启networking命令让新配置生效：
```
$ sudo /etc/init.d/networking restart
```
也可以重启网卡让新配置生效，优点是不影响其他网络接口：
```
$ sudo ifdown eth0
$ sudo ifup eth0
```

***
# 设置双网卡
`$ sudo vim /etc/network/interfaces`
```
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
address 192.167.1.100
netmask 255.255.255.0

# iface wlan0 inet static
# address 192.168.1.110
# netmask 255.255.255.224
# gateway 192.168.1.1

auto wlan0
```
```
$ sudo /etc/init.d/networking restart
```
这样就可以通过有线路由连接开发板了，而且通过无线网卡可以上网


同网段的，

有线网卡192.168.2.222（静态)

无线网卡192.168.2.x（dhcp）

在上述双网卡配置条件下

先`$ sudo ifconfig eth0 192.168.2.222`

再重连接无线路由就可以用了


***
# 修改pcmanfm的默认shell
`x-terminal-emulator %s` 修改为 `lxterminal`

原来是
```
In pcmanfm preferences, under the advanced tab, change the terminal to "x-terminal-emulator -e %s". You can also change the "terminal" value in ~/.config/libfm/libfm.conf
```
最好的办法
```
$ sudo update-alternatives --config  x-terminal-emulator
```
``` 
There are 8 choices for the alternative x-terminal-emulator (providing /usr/bin/x-terminal-emulator).

  Selection    Path                             Priority   Status
------------------------------------------------------------
* 0            /usr/bin/gnome-terminal.wrapper   40        auto mode
  1            /usr/bin/deepin-terminal          30        manual mode
  2            /usr/bin/gnome-terminal.wrapper   40        manual mode
  3            /usr/bin/koi8rxterm               20        manual mode
  4            /usr/bin/lxterm                   30        manual mode
  5            /usr/bin/lxterminal               40        manual mode
  6            /usr/bin/uxterm                   20        manual mode
  7            /usr/bin/xfce4-terminal.wrapper   40        manual mode
  8            /usr/bin/xterm                    20        manual mode

Press enter to keep the current choice[*], or type selection number: 5
```

pcmanfm的bookmark文件在
```
/home/andy/.config/gtk-3.0/bookmarks
```

***
# 安装lantern
设置一下浏览器代理 `127.0.0.1：8787`


***
# 安装kmplayer
```
$ sudo apt-get install kmplayer
```

***
# 安装ffmpeg
<http://www.deb-multimedia.org/>
```
deb http://www.deb-multimedia.org stable main non-free
```
```
sudo apt-get install deb-multimedia-keyring
sudo apt-get update
sudo apt-get install ffmpeg
```

***
# 安装mpv


***
# 截图工具shutter


***
# 再搭配gimp


***
# 安装calibre


***
# 安装lucidor
EPUB阅读软件ppub没有deb包


***
# 安装eaglemode
<http://eaglemode.sourceforge.net/download.html>
需要-f添加一些依赖包


***
# 安装golang


***
# peco+catfish+locator

## peco
<http://peco.github.io/>
下载后放到bin里面就行

## 安装agrep

## 安装catfish

## 安装Lazarus(abort)

## 安装locator
<https://github.com/AlexTuduran/Locator>
直接安装编译好的就可以了

在peco/locator
```
sudo /opt/locator/locator
$ sudo updatedb
$ locate XXX | peco
$ locate XXX | pick
$ locate XXX | peco | xargs less
$ locate XXX | less
sudo catfish
```
用catfish和locator等查找外部存储器的内容

最好先备份默认缓存文件
```
$ sudo cp /var/lib/mlocate/mlocate.db /path_to/mlocate.db.bk
```
需要生产默认文件名的缓存文件
```
sudo updatedb -U /media/sdd1/
```
再使用catfish和locator等locate前端

## 查找文件的终极方法

可以本地查找用catfish/locator，外部存储器用命令行
另外生成外部存储器的缓存文件
```
sudo updatedb -U /media/sdd1/ -o /var/lib/mlocate/mlocate_sdd.db
sudo updatedb -U /media/andy/BC482DD5482D8EE8 -o /var/lib/mlocate/mlocate_sdd.db
```
用locate查找就行了
```
sudo locate -d /var/lib/mlocate/mlocate_sdd.db  XXX
sudo locate -d /var/lib/mlocate/mlocate_sdd.db  XXX | peco
sudo locate -d /var/lib/mlocate/mlocate_sdd.db VPFE | grep pdf | peco
sudo locate -d /var/lib/mlocate/mlocate_sdd.db VPFE | grep pdf
```
最纯粹的方法是用find
```
find /media/sdd1/ -name "*VPBE*"
```


***
# 安装xdm
```
$ sudo leafpad /etc/xrdp/startwm.sh 
```
```
#!/bin/sh

if [ -r /etc/default/locale ]; then
  . /etc/default/locale
  export LANG LANGUAGE
fi

#exec startxfce4
exec /usr/bin/openbox-session

. /etc/X11/Xsession
```
```
$ sudo /etc/init.d/xrdp restart
```
```
$ rdesktop -a 16 -r sound:local -r clipboard:PRIMARYCLIPBOARD -r disk:sunray=/home/andy -f 192.168.1.110
```
也可以访问了

startxfce4替换成，？
```
/usr/bin/openbox --startup /usr/lib/x86_64-linux-gnu/openbox-autostart OPENBOX
/usr/bin/ssh-agent /usr/bin/dbus-launch --exit-with-session /usr/bin/sogou-session /usr/bin/im-launch /usr
/usr/bin/dbus-launch --exit-with-session /usr/bin/sogou-session /usr/bin/im-launch /usr/bin/openbox-sessio
/home/andy/.config/openbox/autostart
```


***
# SDL
```
$ sudo aptitude install libsdl-image1.2-dev libsdl1.2-dev libpulse-dev libv4l-dev v4l-utils v4l-utils v4l-utils v4l-utils dov4l dv4l
```


***
# avcodec
```
$ sudo aptitude install libavcodec-dev libswscale-dev
```

***
# i2c-tools
```
sudo apt-get install i2c-tools
```

***
# lxterminal
shell的scrollback设置成5000


***
# qt
```
$ sudo aptitude install qt5-default
$ sudo apt-get install libqwt5-qt4 libqwt5-qt4-dev
$ sudo apt-get install qt4-dev-tools qt4-doc qt4-qtconfig qt4-demos qt4-designer qt4-qmlviewer
$ sudo apt-get install libqt4-sql-mysql 
$ sudo apt-get install libxcb1 libxcb1-dev libx11-xcb1 libx11-xcb-dev libxcb-keysyms1 libxcb-keysyms1-dev libxcb-image0 libxcb-image0-dev libxcb-shm0 libxcb-shm0-dev libxcb-sync-dev libxcb-render-util0 libxcb-render-util0-dev libxcb-xfixes0-dev
$ sudo apt-get install libxcb-keysyms1-dev libxcb-image0-dev libxcb-shm0-dev libxcb-icccm4-dev libxcb-sync0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-randr0-dev libxcb-render-util0-dev
```

add source
```
deb http://mirrors.163.com/debian experimental main contrib non-free
deb-src http://mirrors.163.com/debian experimental main contrib non-free
```
```
$ sudo apt-get install libicu-dev qmlscene oxideqmlscene
$ sudo apt-get install libx11-xcb1
```
经验证,添加下面环境变量能够解决xcb插件不能找到的问题
```
$ export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/x86_64-linux-gnu/qt5/plugins/platforms
```
<http://stackoverflow.com/questions/17106315/failed-to-load-platform-plugin-xcb-while-launching-qt5-app-on-linux-without>

添加到profile
```
$ gedit ~/.profile
```


***
# gstreamer
$ sudo apt-get install gstreamer1.0-tools gstreamer1.0-doc gstreamer0.10-plugins-ugly gstreamer0.10-doc gstreamer-tools gstreamer-sdk-dev gstreamer-sdk gstreamer0.10-plugins-good gstreamer0.10-plugins-good


***
# gcalctool
```
$ sudo apt-get install gcalctool
```
这个牛逼的玩意已经被改名了用gnome-calculator



***
# ATI 驱动
<http://support.amd.com/zh-cn/download>
```
amd-catalyst-15.9-linux-installer-15.201.1151-x86.x86_64.zip
```
准备工作
```
sudo apt-get install module-assistant build-essential
sudo apt-get install fakeroot dh-make debconf libstdc++5 linux-headers-$(uname -r)
```
```
xserver-xorg-video-radeon
radeontool
radeontop
libdrm-radeon1
libgl1-fglrx-glx
xserver-xorg-video-fglrx
glx-alternative-fglrx
libfglrx
fglrx-control
fglrx-driver
radeontool
radeontop
fglrx-atieventsd
fglrx-modules-dkms
```
```
$ sudo apt-get install xserver-xorg-video-fglrx fglrx-driver fglrx-control
```
```
The following extra packages will be installed:
  fglrx-atieventsd fglrx-modules-dkms glx-alternative-fglrx glx-alternative-mesa glx-diversions libfglrx libfglrx:i386
  libfglrx-amdxvba1 libfglrx-amdxvba1:i386 libgl1-fglrx-glx libgl1-fglrx-glx:i386 libgl1-fglrx-glx-i386:i386
  nvidia-installer-cleanup

The following NEW packages will be installed:
  fglrx-atieventsd fglrx-control fglrx-driver fglrx-modules-dkms glx-alternative-fglrx glx-alternative-mesa glx-diversions libfglrx
  libfglrx:i386 libfglrx-amdxvba1 libfglrx-amdxvba1:i386 libgl1-fglrx-glx libgl1-fglrx-glx:i386 libgl1-fglrx-glx-i386:i386
  nvidia-installer-cleanup
```
```
lsb_release -a
Codename:   jessie
```
```
sudo sh AMD-Catalyst-15.9-Linux-installer-15.201.1151-x86.x86_64.run --buildpkg Debian/jessie
```
无效, Debian/ustable都不行
```
$ sudo aticonfig --initial

sudo aticonfig --initial -f
sudo aticonfig --input=/etc/X11/xorg.conf --tls=1

glxinfo | grep -i opengl 
OpenGL renderer string后面是你的显卡型号
fglrxinfo
fgl_glxgears
```
```
$ sudo apt-get install fp-utils lksctp-tools dropbear

$ sudo apt-get install lazarus-ide mldonkey-server xcb lazarus

lazarus-ide
lazarus-ide-1.2.4
lazbuild
lazbuild-1.2.4
lazres
lazres-1.2.4

$ sudo apt-get install bzr
$ bzr branch lp:onboard

$ sudo apt-get -u dist-upgrade
```
```
sudo update-alternatives --config glx?fb?
```


***
# smb目录的shell访问
```
andy@debian-dell:/run/user/1000/gvfs/smb-share:server=192.168.1.111,share=ridgerun-sdk/kernel/linux-2.6.32.17-psp03.01.01.39$ 
```

***
# tor
```
$ sudo apt-get install tor vidalia 
```

***
# privoxy
```
$ sudo apt-get install privoxy 
```


***
# 摄像头 camera
```
cheese
```


***
# apache
```
$ sudo apt-get install apache2 apache2-utils apache2-doc 
sudo /etc/init.d/apache2 restart
sudo /etc/init.d/apache2 stop
sudo killall apache2
sudo a2enmod rewrite
sudo service apache2 reload
sudo gedit /etc/apache2/sites-available/zhang.conf
```
设置网络分享目录，但是搭建apt源别有中文，会出问题的
```
<VirtualHost *:80>
	ServerAdmin yxgi5@163.com
	ServerName andreas.com
	ServerAlias www.andreas.com
	DocumentRoot /media/sdd1/software
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
或者内容如下
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
```
sudo gedit /etc/apache2/apache2.conf
```
添加
```
<Directory /media/sdd1/software>
	Options Indexes FollowSymLinks
	AllowOverride None
	Order allow,deny
	Allow from all
	Require all granted
</Directory>
<Directory /media/andy/>
	Options Indexes FollowSymLinks
	AllowOverride None
	Order allow,deny
	Allow from all
	Require all granted
</Directory>

...[末尾]
IndexOptions Charset=UTF-8
```
如果原来乱码ff看是unicode，这样简易的文件服务器乱码就好了
```
$ cd /etc/apache2
$ sudo a2dissite 000-default.conf
$ sudo a2ensite zhang.conf
$ sudo /etc/init.d/apache2 restart
```
不要用lantern等代理，或者暂时关闭，就能访问这个局域网的web服务器


***
# ntfs文件系统的权限问题
```
sudo apt-get install ntfs-config
sudo ntfs-config
```
点击ok，勾选`Enable write support for external device`
```
$ sudo apt-get install fuse
$ id
```
就手动mount好了
```
$ sudo mount -t ntfs-3g -o users,auto,rw,dev,exec,locale=zh_CN.UTF-8 /dev/sdd1 /media/sdd1/
```

## 自动挂载的ntfs移动磁盘不能访问

查看硬盘信息
```
$ udevadm info /dev/sdd | grep ID_SERIAL
$ udevadm info /dev/sdc1
$ blkid /dev/sdd1 | grep UUID
$ ls -l /dev/disk/by-uuid/
$ cat /sys/block/sdd
$ mount | grep /dev/sdc1
$ udevadm monitor
$ lsblk

$ sudo udevadm control -l debug
```
```
sudo udevadm control --reload-rules
sudo udevadm trigger
sudo /etc/init.d/udev restart
sudo systemctl daemon-reload

systemctl --type=service
sudo strace -f /lib/systemd/systemd-udevd --daemon
$ sudo partprobe /dev/sdc1
$ udevadm test -a -p  $(udevadm info -q path -n /dev/sdc1)

/lib/udev/rules.d/60-persistent-storage.rules
$ /lib/udev/scsi_id --help
```
目前看来很像这样调用的
```
$ udisksctl mount -o rw,exec,locale=zh_CN.UTF-8 -b /dev/sdc1
$ udisksctl mount -o rw,exec,locale=zh_CN.UTF-8 -b /dev/sdc1 --no-user-interaction
```
systemd里面是用udisks2之类管理挂载的吧,给定一下权限,ok了,自动挂载mount出来的目录有权限了
```
$ udisksctl mount -o uid=1000,gid=1000,umask=0000,rw,exec,locale=zh_CN.UTF-8 -b /dev/sdc1
$ udisksctl unmount -b /dev/sdc1
```
据说udisks的命令类似于
```
udisks --mount-options uid=1000,gid=100,umask=0000 --mount /dev/sda6
```
<https://serverfault.com/questions/766506/automount-usb-drives-with-systemd>

命名搞不定,那么就解决一下权限吧
```
$ sudo journalctl -f
```
可看出dmask,umask都不是我要的
```
10月 18 14:46:35 debian-dell systemd-udevd[20990]: validate module index
10月 18 14:46:35 debian-dell systemd-udevd[20990]: Check if link configuration needs reloading.
10月 18 14:46:35 debian-dell systemd-udevd[20990]: seq 22731 queued, 'add' 'bdi'
10月 18 14:46:35 debian-dell systemd-udevd[20990]: seq 22731 forked new worker [23092]
10月 18 14:46:35 debian-dell systemd-udevd[23092]: seq 22731 running
10月 18 14:46:35 debian-dell systemd-udevd[23092]: no db file to read /run/udev/data/+bdi:8:33-fuseblk: No such file or directory
10月 18 14:46:35 debian-dell systemd-udevd[23092]: passed -1 bytes to netlink monitor 0x563db2405440
10月 18 14:46:35 debian-dell systemd-udevd[23092]: seq 22731 processed with 0
10月 18 14:46:35 debian-dell ntfs-3g[23093]: Version 2014.2.15AR.2 integrated FUSE 28
10月 18 14:46:35 debian-dell ntfs-3g[23093]: Mounted /dev/sdc1 (Read-Write, label "本地磁盘", NTFS 3.1)
10月 18 14:46:35 debian-dell ntfs-3g[23093]: Cmdline options: rw,nodev,nosuid,uid=1000,gid=1000,dmask=0077,fmask=0177,uhelper=udisks2
10月 18 14:46:35 debian-dell ntfs-3g[23093]: Mount options: rw,nodev,nosuid,uhelper=udisks2,allow_other,nonempty,relatime,default_permissions,fsname=/dev/sdc1,blkdev,blksize=4096
10月 18 14:46:35 debian-dell ntfs-3g[23093]: Global ownership and permissions enforced, configuration type 7
10月 18 14:46:35 debian-dell /etc/gdm3/Xsession[2447]: 10月 18 14:46:35.3 - [DEBUG] ip:80.253.30.204 real fail
10月 18 14:46:35 debian-dell org.gtk.Private.UDisks2VolumeMonitor[2522]: index_parse.c:191: indx_parse(): error opening /media/andy/本地磁盘/BDMV/index.bdmv
10月 18 14:46:35 debian-dell org.gtk.Private.UDisks2VolumeMonitor[2522]: index_parse.c:191: indx_parse(): error opening /media/andy/本地磁盘/BDMV/BACKUP/index.bdmv
10月 18 14:46:35 debian-dell org.gtk.Private.UDisks2VolumeMonitor[2522]: libudev: udev_device_new_from_syspath: device 0x743200 has devpath '/devices/pci0000:00/0000:00:1c.2/0000:03:00.0/usb3/3-1/3-1:1.0/host6/target6:0:0/6:0:0:0/block/sdc/sdc1'
10月 18 14:46:35 debian-dell org.gtk.Private.UDisks2VolumeMonitor[2522]: libudev: udev_device_read_db: device 0x743200 filled with db file data
10月 18 14:46:35 debian-dell udisksd[2719]: Mounted /dev/sdc1 at /media/andy/本地磁盘 on behalf of uid 1000
```

查看到底用的哪个service
```
sudo systemctl status systemd-udevd
```

ntfsfix is a program to perform limited NTFS checking. While it won't fix all NTFS troubles, it will fix some problems. 


***
# qt
```
$ tar zxvf qt-everywhere-opensource-src-4.7.0.tar.gz
$ tar zxvf tslib-1.4.tar.gz
$ mv qt-everywhere-opensource-src-4.7.0 qt-everywhere-opensource-src-4.7.0-pc
$ cp qt-everywhere-opensource-src-4.7.0-pc/ qt-everywhere-opensource-src-4.7.0-x86 -r
$ cp qt-everywhere-opensource-src-4.7.0-pc/ qt-everywhere-opensource-src-4.7.0-arm -r
$ source set_env.sh
$ ./configure --prefix=/usr/local/tslib/ --host=arm-none-linux-gnueabi ac_cv_func_malloc_0_nonnull=yes
$ make
$ sudo make install
```
```
cd qt-everywhere-opensource-src-4.7.0-pc64
echo yes | ./configure -opensource  -prefix /usr/local/Trolltech/Qt-4.7.0  -prefix-install -qt-freetype -depths all -qt-kbd-linuxinput -qt-libtiff -qt-libmng -qt-libjpeg -qt-libpng -qt-gfx-linuxfb -qvfb -make tools -make libs -make examples -make demos

cd qt-everywhere-opensource-src-4.7.0-x64
echo yes | ./configure -opensource -prefix /usr/local/Trolltech/QtEmbedded-4.7.0-x64 -prefix-install -embedded x64 -xplatform qws/linux-generic-g++ -qt-gfx-qvfb -qt-kbd-qvfb -qt-mouse-qvfb -qt-libtiff -qt-libmng -qt-libjpeg -qt-libpng -qvfb -make tools -make libs -make examples -make demos
```
```
cp /usr/local/Trolltech/Qt-4.7.0/bin/qvfb* /usr/local/Trolltech/QtEmbedded-4.7.0-x64/bin
```


***
# 内核 kernel
```
$ sudo dpkg -l | grep linux-headers
```
暂时不要升级内核到4.4
```
$ sudo apt-get install linux-image-4.4.0-trunk-amd64
The following extra packages will be installed:
  firmware-linux-free irqbalance
Suggested packages:
  linux-doc-4.4 debian-kernel-handbook
The following packages will be REMOVED:
  task-desktop task-gnome-desktop xserver-xorg-input-all xserver-xorg-input-vmmouse
The following NEW packages will be installed:
  firmware-linux-free irqbalance linux-image-4.4.0-trunk-amd64
```


***
# ubuntu14虚拟机重新编译附加驱动组件
```
sudo /etc/init.d/vboxadd setup 
```


***
# 字符界面启动

查看运行级别
```
runlevel
sudo runlevel
```

指定登录管理器
```
/etc/X11/default-display-manager

/etc/init/rc-sysinit.conf
/etc/init/lightdm.conf
...#没有必要
```

编辑/etc/default/grub #不建议

把
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
```
改成
```
GRUB_CMDLINE_LINUX_DEFAULT="text"或“quiet splash text”
```
其实只要把"quiet splash"修改为其它字符就可以了，这是系统启动是ubuntu那个logo和下面那个闪动的小亮点。
```
sudo update-grub
sudo update-grub2
```

## 直接修改/boot/grub/grub.cfg
```
linux	/boot/vmlinuz-2.6.32-22-generic root=UUID=035c6a4f-6382-445d-9c5b-f8739d15caea ro   quiet splash
```
成
```
linux	/boot/vmlinuz-2.6.32-22-generic root=UUID=035c6a4f-6382-445d-9c5b-f8739d15caea ro   quiet splash text
```
上述方法在u10.04测试通过

Ubuntu的默认开机的runlevel是2,可以用`runlevel`来查看当前的默认运行级别。

debian系(ubuntu是基于debian)的Linux一直是用runlevel 2来默认启动，并且runlevel定义也与redhat有区别

debian的runlevel级别定义如下
```
0 – Halt，关机模式
1 – Single，单用户模式
2 - Full multi-user with display manager (GUI)
3 - Full multi-user with display manager (GUI)
4 - Full multi-user with display manager (GUI)
5 - Full multi-user with display manager (GUI)
6 – Reboot，重启
```
可以发现2~5级是没有任何区别的。他们为多用户模式，这和一般的linux不一样。而redhat的runlevel级别定义如下：
```
0：关机。不能将系统缺省运行级别设置为0，否则无法启动。
1：单用户模式，只允许root用户对系统进行维护。
2：多用户模式，但不能使用NFS（相当于Windows下的网上邻居）
3：字符界面的多用户模式。
4：未定义。
5：图形界面的多用户模式。
6：重启。不能将系统缺省运行级别设置为0，否则会一直重启。
```
这里补充一下，多数的linux都是用一种叫System V的机制来启动运行级别，而ubuntu使用upstart代替init启动系统进程。所以没有那个inittab文件来改默认运行级别。ubuntu 的默认运行级别文件是`/etc/init/rc-sysinit.conf`

而init启动系统进程的默认运行级别文件是`/etc/inittab`
```
id:3:initdefault:
```

/etc目录下的 `rc0.d  rc1.d  rc2.d  rc3.d  rc4.d  rc5.d  rc6.d`

如果rc-sysinit.conf或inittab中指定的默认级别是2，那么init将执行/etc/rc2.d目录下的脚本启动或关闭相应服务

把对应级别下的登录管理器备份，参考
```
cd /etc/rc2.d
sudo mv S30gdm /home/my-ubuntu/s30gdm
```
也可以，用工具配置（等于redhat系列的chkconfig工具）

<https://www.debian.org/doc/manuals/debian-reference/ch03.en.html>
```
$ sudo apt-get install sysv-rc-conf
$ sudo apt-get rcconf(在redhat的ntsysv）
$ sudo update-rc.d -f gdm3 remove
$ sudo sysv-rc-conf
$ pstree
```

## 对于debian8和ubuntu16有效 修改runlevel
<http://unix.stackexchange.com/questions/210117/how-to-set-up-a-runlevel-3-in-debian-8>

Debian 8 that you speak of don't use upstart. ubuntu1404还是用的upstart
```
Two things you need to know:
1) Systemd boots towards the target given by "default.target". This is typically a symbolic link to the actual target file.
2) Systemd keeps it's targets in /lib/systemd/system and /etc/systemd/system. A file in /etc/systemd/system takes precedence over those shipped with the OS in /lib/systemd/system -- the intent is that /etc/systemd is used by systems administrators and /lib/systemd is used by distributions.
Debian as-shipped boots towards the graphical target. You can see this yourself:
$ ls -l /etc/systemd/system/default.target
... No such file or directory
$ ls -l /lib/systemd/system/default.target
... /lib/systemd/system/default.target -> graphical.target
So to boot towards the multiuser target all you need do is to put in own target:
$ cd /etc/systemd/system/
$ sudo ln -s /lib/systemd/system/multi-user.target default.target
```


## 如果用的是kdm
systemctl disable kdm.service #似乎是arch的服务管理方式<http://bbs.archbang.org/viewtopic.php?id=5301>

如果临时想用图形界面，那直接systemctl start kdm.service不就行了么？干嘛还要改配置重启啊？

另外直接startx应该也可以，当然得设置好~/.xinitrc 
其他一些dm也类似


***
# 内核 kernel
安装stable unstable test版本的源
```
$ sudo apt-get install linux-image-4.3.0-1-amd64
```


***
# nvidia-driver
```
$ sudo apt-get install nvidia-driver

The following NEW packages will be installed:
  glx-alternative-mesa glx-alternative-nvidia glx-diversions libegl1-nvidia
  libgl1-nvidia-glx libgl1-nvidia-glx:i386 libgl1-nvidia-glx-i386:i386
  libgles1-nvidia libgles2-nvidia libnvidia-eglcore libnvidia-ml1
  nvidia-alternative nvidia-driver nvidia-driver-bin nvidia-installer-cleanup
  nvidia-kernel-common nvidia-kernel-dkms nvidia-modprobe nvidia-settings
  nvidia-support nvidia-vdpau-driver xserver-xorg-video-nvidia
0 upgraded, 22 newly installed, 0 to remove and 1 not upgraded.

$ sudo apt-get remove glx-alternative-mesa glx-alternative-nvidia glx-diversions libegl1-nvidia libgl1-nvidia-glx libgl1-nvidia-glx:i386 libgl1-nvidia-glx-i386:i386 libgles1-nvidia libgles2-nvidia libnvidia-ml1 nvidia-alternative nvidia-driver nvidia-driver-bin nvidia-installer-cleanup nvidia-kernel-common nvidia-kernel-dkms nvidia-modprobe nvidia-settings nvidia-support nvidia-vdpau-driver xserver-xorg-video-nvidia
```


***
# masterpdfeditor3破解版本
```
Code.Industry.Master.PDF.Editor.v3.3.20.for.Linux.x64-BEAN.tar.gz
/opt/master-pdf-editor-3
```

***
# fbset
```
$ sudo apt-get install fbset
```


***
# ftp client
such as gftp, filezilla
```
$ sudo apt-get install gftp
```
gftp need use unstable source


***
# 转换rpm包到deb
```
$ sudo apt-get install alien
```


***
# pcmamfm
pcmamfm在edit>preferences里面,修改default view为detailed list view



***
# samba
```
'net usershare' returned error 255: net usershare add: cannot share path /media/sdd1 as we are restricted to only sharing directories we own.
	Ask the administrator to add the line "usershare owner only = false" 
	to the [global] section of the smb.conf to allow this.
```
```
sudo gedit /etc/samba/smb.conf
```


***
# something 
```
sudo apt-get install dumpet
sudo apt-get install xorriso
```


***
# 百度文库
idocdown_v29用于下载百度文库


***
# squashfs
```
sudo apt-get install squashfs-tools
```


***
# 安装 openproj
```
Download openproj from http://sourceforge.net/projects/openproj/ Yes, you can only download the rpm file. But you can also install it in Ubuntu via alien. sudo apt-get install alien sudo alien -i openproj.rpm
```
错误
```
Your Java vendor is "Oracle Corporation". To run OpenProj, you need the Sun Java implementation. The auto-detected Java Runtime used is..
```
解决办法
修改`$HOME/.openproj/run.conf`，将
```
JAVA_OPTS="-Xms128m -Xmx768m"
```
改为
```
JAVA_OPTS="-Djava.vendor=Sun -Xms128m -Xmx768m"
```
最后重启openproj



***
# 安装jwm
```
sudo apt-get install jwm
```


***
# 安装目录树工具
```
$ sudo apt-get install tree
```


***
# chrome设置代理
```
--proxy-server=127.0.0.1:8787
```


***
# 恢复intel驱动
```
sudo apt-get install libgl1-fglrx-glx-i386:i386
sudo apt-get install libgl1-fglrx-glx libgl1-fglrx-glx-i386
sudo apt-get install libfglrx libfglrx:i386 fglrx-atieventsd fglrx-modules-dkms glx-alternative-fglrx glx-alternative-mesa glx-diversions libfglrx libfglrx:i386 fglrx-control amd-opencl-icd fglrx-driver
sudo apt-get install xlibmesa-dri xlibmesa-gl xlibmesa-glu mesa-utils libgl1-mesa-dri libgl1-mesa-glx

glxinfo
lspci | grep VGA
glxgears
```


***
# allegro相关

从rpm包提取 `.drirc` to ~


allegro环境变量设置要点
```
Unable to resolve function glXQueryExtension
```
这类问题，要制定对的库;debian和arch位置有区别的
```
export LD_LIBRARY_PATH=/usr/lib/i386-linux-gnu/:/usr/lib/:/usr/lib64:/usr/lib32/:$CDS_ROOT/tools/lib64:$CDS_ROOT/tools.lnx86/mainwin540_64/mw/lib-amd64_linux_optimized:$CDS_ROOT/tools.lnx86/lib:$CDS_ROOT/tools.lnx86/mainwin540/mw/lib-linux_optimized:$LD_LIBRARY_PATH
```
lmgrd出现no such file and directory问题解决
```
sudo apt-get install lsb-core
```


***
# autoCAD的替代品
```
$ sudo apt-get install librecad
```
当然autocad2004用wine运行也是可以的
也可以用draftsight
```
/opt/dassault-systemes/DraftSight/Linux$ ./DraftSight
```


***
# visio替代pin
```
$ sudo apt-get install dia
```


***
# 安装CCS
<http://processors.wiki.ti.com/index.php/Linux_Host_Support_CCSv6>
```
dpkg --add-architecture i386
sudo aptitude install libgtk2.0-0:i386 libcanberra-gtk0:i386 libdbus-glib-1-2:i386 libgconf-2-4:i386 liborbit-2-0:i386 libusb-0.1-4:i386 libgnomevfs2-0:i386 libice6:i386 libncurses5:i386 libsm6:i386 libxtst6:i386 libxt6:i386 libasound2:i386 libgcrypt11:i386 libudev1:i386
```
Note：
```
libudev0 has been obsoleted and removed. You can install libudev1:i386 instead and
sudo ln -siT /lib/i386-linux-gnu/libudev.so.1 /lib/i386-linux-gnu/libudev.so.0
If you cannot install libgcrypt11:i386 then add
deb http://security.debian.org/debian-security wheezy/updates main to your /etc/apt/sources.list
```
后来libgcrypt11更新到libgcrypt20，而ccs还是要用libgcrypt11

简单暴力的方法，解压libgcrypt11_1.5.0-5+deb7u6_i386.deb提取libgcrypt.so.11.7.0，复制到/lib/i386-linux-gnu，然后建立一个软链接libgcrypt.so.11

一个个安装处理包兼容性

主要问题
```
The following packages have unmet dependencies:
 libdbus-glib-1-2 : Breaks: libdbus-glib-1-2:i386 (!= 0.106-1) but 0.102-1 is to be installed.
 libdbus-glib-1-2:i386 : Breaks: libdbus-glib-1-2 (!= 0.102-1) but 0.106-1 is installed.
open: 137; closed: 997; defer: 105; conflict: 151                                           
```

手动下载
```
libdbus-glib-1-dev_0.102-1_amd64.deb
libdbus-glib-1-2_0.102-1_amd64.deb
```
用dpkg安装降级

其他都可以用aptitude降级

这下可以安装ccs了

## ccs6的空白
<https://e2e.ti.com/support/development_tools/code_composer_studio/f/81/t/349185>
```
ldd -v -r /opt/ti/ccsv6/eclipse/plugins/com.ti.chromium.browser.gtk.linux.x86_1.0.0.201604131600/libs/*.so|grep "not"
sudo apt-get install libnss3:i386
```
libgcrypt11升级问题也会导致空白，前面有解决方法:
```
后来libgcrypt11更新到libgcrypt20，而ccs还是要用libgcrypt11
简单暴力的方法，解压libgcrypt11_1.5.0-5+deb7u6_i386.deb提取libgcrypt.so.11.7.0，复制到/lib/i386-linux-gnu，然后建立一个软链接libgcrypt.so.11
```
## CCS的附加库选择
比如xdc的最新版本安装在/opt/ti2/,而且其调用64位jre（eclipese目录下jre目录）

在用ccs6.1.3时候就要说XDC_CG_ROOT路径有问题，

只能通过product选择来更新路径。这样的情况是不应该让ccs去发现高版本的xdc库的

有关设置位置
```
window->reference-> code composer studio -> RTSC -> product
```
两种设置，一个是路径，一个是库，都可以进行选择，

影响的path有
```
project -> property -> resource -> linked resources
```
还有一个办法是
```
project -> property -> CCS General -> RTSC
```
这里可以选XDC版本
```
the environment variable 'XDCTOOLS_JAVA_HOME' is set, but does not appear to be a directory containing a 64-bit Java Runtime Environment (1.7 or greater); e.g., '/usr/lib/jvm/java-7-openjdk-amd64'.
```

## ccs6的升级plugin报错
<https://e2e.ti.com/support/development_tools/code_composer_studio/f/81/t/411178>
```
Cd to <installdir>\ccsv6\eclipse\p2\org.eclipse.equinox.p2.core and <installdir>\ccsv6\eclipse\p2\org.eclipse.equinox.p2.repository and delete the cache folders there.
Try the update again.
```
还有proxy设置的开启和关闭，都试试


***
# eclipse svn插件 git插件
3.8.1的eclipse
http://download.eclipse.org/egit/updates-2.1

http://subclipse.tigris.org/update_1.10.x

http://subclipse.tigris.org/servlets/ProjectDocumentList?folderID=2240

## eclipse jdt插件 
4.5.0的eclipse
http://archive.eclipse.org/eclipse/downloads/

http://archive.eclipse.org/eclipse/downloads/drops4/R-4.5-201506032000/

http://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/R-4.5-201506032000/org.eclipse.jdt-4.5.zip

## eclipse ADT插件
Android Developer Tools Update Site

<https://dl.google.com/android/eclipse/>

Eclipse Color Theme（从插件市场安装）

<http://marketplace.eclipse.org/content/eclipse-color-theme>

## eclipse一般出问题
可以试图关闭项目，删除整个工作目录（包括隐藏项目）


## logcat不显示问题
```
    exit eclipse

    open up the file

        ~/workspace/.metadata/.plugins/org.eclipse.core.runtime/.settings/com.Android.ide.eclipse.ddms.prefs

    Then cut and paste this in over the existing

    ddms.logcat.auotmonitor.level=error  
    ddms.logcat.automonitor=false  
    ddms.logcat.automonitor.userprompt=true  
    eclipse.preferences.version=1
    logcat.view.colsize.Application=169
    logcat.view.colsize.Level=54
    logcat.view.colsize.PID=54
    logcat.view.colsize.Tag=198
    logcat.view.colsize.Text=619
    logcat.view.colsize.Time=182

```
```
sudo apt-get install setserial
```


***
# ti cc2650
```
sunmaysky.blogspot.com/2016_01_01_archive.html
https://apkpure.com/search?q=BLE+Scanner
http://www.eeworld.com.cn/huodong/201310_TI_SensorTag/zhuanti/
https://github.com/geobio/sensortag
https://git.ti.com/sensortag-20-android
http://www.ti.com/ww/en/wireless_connectivity/sensortag2015/tearDown.html

dmesg | grep tty
lsusb
sudo setserial -g /dev/ttyS*
sudo setserial -g /dev/ttyA*

http://dev.ti.com/tirex/content/cc26xx_bluetooth_smart/cc26xx_bluetooth_smart__2.01.00.44423/Projects/ble/ProjectZero/project0_resources/prz/index.html#/?collapsetree=
```
云下载按提示安装firefox插件，然后安装
ticloudagent.run
可能需要建立软链接
```
sudo ln -s /lib/i386-linux-gnu/libusb-1.0.so.0.1.0  /lib/i386-linux-gnu/libusb-1.0.so
```


***
# 显示进度的复制
```
$ sudo apt-get install gcp
```


***
# playonlinux
```
sudo apt-get install playonlinux
```


***
# 命令行浏览器
w3m、lynx等
```
sudo apt-get install lynx elinks
```


***
# 更新opera
```
$ sudo apt-get install apt-transport-https
$ sudo dpkg -i opera_stable-40.0.2308.74-linux-release-x64.deb 
```


***
# 命令行邮件工具，采用exim4程序
```
sudo dpkg-reconfigure exim4-config
#sudo apt-get install mailutils
update-alternatives: using /usr/bin/frm.mailutils to provide /usr/bin/frm (frm) in auto mode
update-alternatives: using /usr/bin/from.mailutils to provide /usr/bin/from (from) in auto mode
update-alternatives: using /usr/bin/messages.mailutils to provide /usr/bin/messages (messages) in auto mode
update-alternatives: using /usr/bin/movemail.mailutils to provide /usr/bin/movemail (movemail) in auto mode
update-alternatives: using /usr/bin/readmsg.mailutils to provide /usr/bin/readmsg (readmsg) in auto mode
update-alternatives: using /usr/bin/dotlock.mailutils to provide /usr/bin/dotlock (dotlock) in auto mode

http://blog.csdn.net/ablo_zhou/article/details/5032362
http://teamcoding.com/blog/2010/02/24/sendmail-slash-exim-error-mailing-to-remote-domains-not-supported/

gedit /etc/exim4/update-exim4.conf.conf

sudo /etc/init.d/exim4 restart
```
mail命令

按q出来会存放在~/mbox

按EOF出来会保持，再按q出来也是保持，奇怪啊，就这样

按x出来也会保持
```
sudo mailq -v
sudo /usr/lib/sendmail -bp
```
没有发送成功的在
```
/var/spool/exim4/input
```
如果要重装，exim4-config和exim4都删除重装，mailutils没有必要，purge掉并autoremove

```
mail -s test yxgi5@163.com
aa  #这里是邮件内容
ss
s #正文以ctrl+d结束并下一步; 两次Ctrl+C键则中断工作，不送此信件
Cc:  #以enter结束并发送
```
```
sudo /usr/lib/sendmail -bp
```
将文件当做电子邮件的内容送出
```
mail -s 邮件主题 -a 附件 用户名@地址 < 正文内容文件
echo “邮件正文” | mail -s 邮件主题 -a 附件 用户名@地址
uuencode <in_file> <remote_file> | mail -s "title" mail@address
```

在linux中输入`mail` ，就进行了收件箱，并显示二十封邮件列表。
```
    此时命令提示符为”&”：（可以输入以下命令对邮件进行相关操作）
    unread 标记为未读邮件
    h|headers 显示当前的邮件列表
    l|list 显示当前支持的命令列表
    ?|help 显示多个查看邮件列表的命令参数用法
    d 删除当前邮件，指针并下移。 d 1-100 删除第1到100封邮件
    f|from 只显示当前邮件的简易信息。 f num 显示某一个邮件的简易信息
    f|from num 指针移动到某一封邮件
    z 显示刚进行收件箱时的后面二十封邮件列表
    more|p|page 阅读当前指针所在的邮件内容 阅读时，按空格键就是翻页，按回车键就是下移一行
    t|type|more|p|page num 阅读某一封邮件
    n|next|{什么都不填} 阅读当前指针所在的下一封邮件内容阅读时，按空格键就是翻页，按回车键就是下移一行
    v|visual 当前邮件进入纯文本编辑模式
    n|next|{什么都不填} num 阅读某一封邮件
    top 显示当前指针所在的邮件的邮件头
    file|folder 显示系统邮件所在的文件，以及邮件总数等信息
    x 退出mail命令平台，并不保存之前的操作，比如删除邮件
    q 退出mail命令平台，保存之前的操作，比如删除已用d删除的邮件，已阅读邮件会转存到当前用户家目录下的mbox文件中。如果在mbox中删除文件才会 彻底删除。在linux文本命令平台输入 mail -f mbox，就可以看到当前目录下的mbox中的邮件了。
    cd 改变当前所在文件夹的位置
```


***
# iceweasel被firefox替换
```
sudo apt-get install firefox-esr icedove 
```
thunderbird-mozilla-build还没有完成替换



***
# qrcode zbar 等
```
sudo apt-get install qtqr python-qrtools python-zbar
```


***
# 登录管理器还是gdm3比较好看
```
sudo dpkg-reconfigure gdm3
```


***
# sqlitebrowser sqlite3
```
sudo apt-get install sqlitebrowser
```
```
$ sudo aptitude install sqlite3
sqlite3 -version
```
可选
```
sudo apt-get install libsqlite3-dev
```
```
sqlite3 test.db
```
查看数据库
```
sqlite> .database
```
查看数据表

查看数据库有那写数据表 可以用.table或者.tables
```
sqlite> .table
student  teacher
sqlite> .tables
student  teacher
sqlite> 
```
插入数据
```
sqlite> insert into student values('fck', 21);
sqlite> insert into student values("shit",20);
```
查询数据
```
sqlite> select * from student;
fck|21
shit|20
```

退出数据库
```
sqlite> .exit;
```


***
# gdebi

install via .deb and resolve dependence

1. using gdebi
```
sudo gdebi  nautilus_nutstore_amd64.deb
```
2. double click the .deb, install via ubuntu software center

3. install via dpkg
```
sudo dpkg -i nautilus_nutstore_amd64.deb

sudo apt-get install -f
```


***
# nutstore
增加一个启动器
```
sudo gedit /usr/bin/nutstore
sh -c "nohup ~/.nutstore/dist/bin/nutstore-pydaemon.py >/dev/null 2>&1 &"
sudo chmod +x /usr/bin/nutstore
```


***
# something
```
sudo apt-get install libftdi-dev fxload libc6-dev libusb-dev build-essential
```

***
# 回收站位置
```
~/.local/share/Trash/files
```


***
# codeblocks
<http://www.codeblocks.org/>
<https://apt.jenslody.de/>
http://http.debian.net/debian源也有
```
sudo apt-get install codeblocks
```


***
# rar文件关联
```
perl-file-mimeinfo 调用 mimeopen 类似这样:
mimeopen -d /path/to/file
会提示用哪个程序来打开 /path/to/file:
Please choose a default application for files of type text/plain
       1) notepad  (wine-extension-txt)
       2) Leafpad  (leafpad)
       3) OpenOffice.org Writer  (writer)
       4) gVim  (gvim)
       5) Other...
```

pcmanfm open with是空的
<https://wiki.archlinux.org/index.php/PCManFM>
```
Open With dialog window empty
If you do not see any applications to choose from in the open with dialog, then you can try removing gnome-menus and instead install lxmenu-data. Furthermore, export the following variables:
export XDG_MENU_PREFIX=lxde-
export XDG_CURRENT_DESKTOP=LXDE
No "Applications"
You can try this method: Delete all files in the $HOME/.cache/menus directory, and run PCManFM again.
PCManFM requires the environment variable XDG_MENU_PREFIX to be set. The value of the variable should match the beginning of a file present in the /etc/xdg/menus/ directory. E.g. you can set the value in your .xinitrc file with the line:
export XDG_MENU_PREFIX="lxde-"
See these threads for more information: [1], and especially this post from the Linux Mint forums: [2]
```
看来是 gnome-menus 和 lxmenu-data 冲突了，那么有 gnome-menus 就用 nautilus 的 open with 来 associate apps

有关路径
```
/home/andy/.cache/menus
```
尝试1,failed
```
gedit ~/.xinitrc
export XDG_MENU_PREFIX=lxde-
#export XDG_CURRENT_DESKTOP=LXDE
```

```
/etc/xdg/menus
alacarte
```
```
export XDG_MENU_PREFIX="lxde-" to .initrc
```
好像不行呢

https://sourceforge.net/p/pcmanfm/bugs/864/

```
I would like to see values of XDG_CURRENT_DESKTOP and XDG_MENU_PREFIX environment variables when you start pcmanfm and also listing of ~/.config/menus and /etc/xdg/menus folders.
```

添加rar类型的
```
/home/andy/.local/share/mime/application/x-wine-extension-rar.xml
/home/andy/.local/share/mime/packages/x-wine-extension-rar.xml
```
有关位置
```
/home/andy/.local/share/mime/application/
/home/andy/.local/share/mime/packages/
/home/andy/.local/share/applications
/usr/share/mime/packages
/usr/share/mime/application
```
其他有关mime的文件
```
~/.config/mimeapps.list
```
！！ 如果通过选择默认程选了wine里面的rar,会在这里体现,可以删掉pcmanfm多的openwith

pcmanfm多的openwith就更新一下目标desktop文件就刷掉了

应该是指向/home/andy/.local/share/applications内的wine快捷图标就行了的

而不是指向/home/andy/.local/share/applications/wine内的快捷图标

指向/home/andy/.local/share/applications内的wine快捷图标的内容要对

/home/andy/.local/share/applications/mimeinfo.cache的内容要对

这样rar文件openwith winrar打开就对了

## 一个好的mime图形化工具
```
xfce4-mime-settings
```
nautilus的openwith正常能用



```
bcompare open folder with associated app change:
inode/directory= ?
from /usr/share/applications/mimeinfo.cache
or
/home/andy/.config/mimeapps.list
or
other mimeapps.list or mimeinfo.cache files
```

firefox下载好的在文件夹中打开“Open containing folder” 
```
If the already mentioned solutions don't work, try this.
Write the following to 
/usr/share/dbus-1/services/org.freedesktop.FileManager1.service
[D-BUS Service]
Name=org.freedesktop.FileManager1
#Exec=/usr/bin/nautilus --gapplication-service
Exec=/usr/bin/pcmanfm --gapplication-service
```
这里dbus-1/services看来最优先，其次是各个mimeapps.list或mimeinfo.cache的inode/directory= 


还有，标准名称包装了的程序，可以这样换默认调用
```
sudo update-alternatives --config x-terminal-emulator
sudo update-alternatives --config x-www-browser
sudo update-alternatives --config editor
```

```
xdg-mime query { filetype | default } ...
xdg-mime default application mimetype(s)
xdg-mime install [--mode mode] [--novendor] mimetypes-file
xdg-mime uninstall [--mode mode] mimetypes-file
xdg-mime { --help | --manual | --version }
比如
xdg-mime default nautilus.desktop inode/directory
The command above adds a line inode/directory=nautilus.desktop to your .local/share/applications/mimeapps.list

xdg-mime query filetype /media/andy/M4A/备份/desktop/workdir/*.xlsx
application/wps-office.xlsx

sudo apt-get install nautilus nautilus-sendto nautilus-share
```


***
# apt有关
http://blog.csdn.net/comcat/article/details/1549559

替换“var/cache/apt”为想要设置的缓存目录

源列表文件
`/etc/apt/source.list`

下载deb包的缓存位置
`/var/cache/apt/archives/`

下载的index files存放位置
`/var/lib/apt/lists/`

安装于系统的软件包的信息记录文件，很重要！可在依赖关系不满足时修改之，让其暂时通过：）
`/var/lib/dpkg/status`


apt缓存路径设置
http://blog.csdn.net/bsi_l4/article/details/49632709

`/etc/cron.daily/apt`



***
# zip文件解压乱码问题

用unar最优
```
unar file.zip
```

unzip方法

可能要给源码打补丁,打开jessie的src源

<https://link.zhihu.com/?target=https%3A//github.com/ikohara/dpkg-unzip-iconv>
```
git clone https://github.com/ikohara/dpkg-unzip-iconv.git
cd dpkg-unzip-iconv
$ make source
$ sudo make build-dep
$ make
$ sudo make install
```
使用
```
unzip -O GBK test.zip
unzip -O GB18030 test.zip
unzip -O CP936 test.zip
```
要一直生效就在/etc/environment或者在$HOME/.bashrc里加入
```
UNZIP="-O CP936"
ZIPINFO="-O CP936"
```
或者
```
alias unzip='unzip -O cp936'  ## 有效
```

解压之后替换文件名
```
LANG=C 7za x your-zip-file.zip
convmv -f GBK -t utf8 --notest -r .
```
python方案

unzip.py
```
#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import zipfile

#print "Processing File " + sys.argv[1]

file=zipfile.ZipFile(sys.argv[1],"r");
for name in file.namelist():
    utf8name=name.decode('gbk')
    print "Extracting " + utf8name
    pathname = os.path.dirname(utf8name)
    if not os.path.exists(pathname) and pathname!= "":
        os.makedirs(pathname)
    data = file.read(name)
    if not os.path.exists(utf8name):
        fo = open(utf8name, "w")
        fo.write(data)
        fo.close
file.close()
```
```
chmod +x unzip.py
./unzip.py test.zip
```


***
# 安装ddrescue
```
sudo apt-get install gddrescue
ddrescue /dev/sr1 20120218_194649.iso
```
光驱提取成iso
```
dd if=/dev/cdrom of=filename.iso
dd if=/dev/sr1 of=SHX005.iso
```


***
# nrg镜像转换成iso
```
sudo apt-get install nrg2iso
```
Usage :
```
nrg2iso image.nrg image.iso
```


***
# 图像查看器
```
sudo apt-get install gpicview
```


***
# 设置移动硬盘samba共享share
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
sudo /etc/init.d/nmbd restart
sudo /etc/init.d/smbd restart
```
```
sudo useradd andy
sudo smbpasswd -a andy
```
```
sudo vi /etc/samba/smb.conf
```
```
[dell]
    comment = Network Logon Service
    path = /media/andy
    valid users = andy
    guest ok = no
    read only = no
    writeable = yes
    browseable = yes
```
```
sudo /etc/init.d/nmbd restart
sudo /etc/init.d/smbd restart
```

***
# 安装 steam
记得go offline


***
# bin+cue 镜像转换
```
sudo apt-get install bchunk
```
以bin和cue为后缀名，先把它们转为iso文件，用bchunk软件

然后运行
```
bchunk filename.bin filename.cue filename
```
就能将其转化为filename.iso文件

用cdemu来挂载bin

bin2iso来把bin转成iso

挂载iso
```
sudo mount -o loop Wolfram.Research.Mathematica.v7.0.1.Linux-EDGEISO.iso /media/cdrom0
```


***
# 安装mathematica
修改了`/usr/local/bin/mathematica`和`/usr/local/bin/Mathematica`

都增加下面两句避免字体找不到的问题
```
LANG=C
export LANG
```


***
# 安装maple
添加了软链接`/usr/local/bin/xmaple`
```
sudo ln -s /opt/maple12/bin/xmaple /usr/local/bin/xmaple
```


***
# spice 仿真工具
```
sudo apt-get install ngspice
```

编译gspiceui
```
sudo apt-get install libwxgtk3.0-dev libpangox-1.0-dev gnucap
cd gspiceui-v1.1.00
make GSPICEUI_WXLIB=3.0
sudo make install
```

为了编译gwave2
先
```
aptitude install/remove guile-2.0-libs guile-2.0-dev guile-cairo libgnome2-dev
```
编译失败，放弃

换成gaw（有源码）,提供给gspiceui,不要安装或者编译gwave2
```
http://www.rvq.fr/linux/gaw.php
http://download.tuxfamily.org/gaw/download/gaw-20111016.tar.gz
https://aur.archlinux.org/packages/gaw/
```
还是用ltspice


***
# 下载安装audio-convert
http://download.savannah.gnu.org/releases/audio-convert/

```
sudo apt-get install lame vorbis-tools flac shntool bchunk
sudo apt-get install soundconverter
```


***
# 思维导图软件
```
sudo apt-get install freemind freemind-browser freemind-plugins-script freemind-plugins-svg freemind-plugins-help
The following NEW packages will be installed:
  antlr fop freemind freemind-browser freemind-doc freemind-plugins-help freemind-plugins-script freemind-plugins-svg groovy
  icc-profiles-free ivy javahelp2 libantlr-java libavalon-framework-java libbatik-java libbcel-java libbsf-java libcommons-io-java
  libfop-java libgetopt-java libgnu-regexp-java libhawtjni-runtime-java libjansi-java libjansi-native-java libjaxp1.3-java
  libjgoodies-forms-java libjibx1.1-java libmockobjects-java libqdox-java librhino-java libsaxon-java libxalan2-java
  libxmlgraphics-commons-java libxstream-java rhino simplyhtml
```

xmind下载
<http://www.xmindchina.net/xiazai.html>
<http://xiazai.xmindchina.cn/trail/xmind-8-linux.zip>



***
# SMath 下载
<http://en.smath.info/forum/yaf_postsm2314_Installation-in-Ubuntu.aspx>
```
sudo apt-get install mono-complete
sudo mono ~/Downloads/SMathStudioDesktop.0_88.Mono/SmathStudio_Desktop.exe
```
<https://sourceforge.net/projects/pcpu/files/SmathStudio/>
安装deb包

创建一个脚本smath，放置在`/usr/local/bin`
```
#!/bin/bash
mono /usr/share/SMathStudio/SMathStudio_Desktop.exe
```
修改成+x权限


***
# kicad + freecad
```
sudo apt-get install freecad kicad
The following extra packages will be installed:
  fonts-lyx kicad-common libboost-filesystem1.55.0 libboost-regex1.55.0
  libboost-signals1.55.0 libcoin80 libfreeimage3 libjs-jquery-ui
  liboce-foundation8 liboce-modeling8 liboce-ocaf-lite8 liboce-ocaf8
  liboce-visualization8 libpyside1.2 libraw10 libshiboken1.2 libsoqt4-20
  libspnav0 libxerces-c3.1 libzipios++0c2a python-collada python-matplotlib
  python-matplotlib-data python-mock python-nose python-pivy python-pyside
  python-pyside.phonon python-pyside.qtcore python-pyside.qtdeclarative
  python-pyside.qtgui python-pyside.qthelp python-pyside.qtnetwork
  python-pyside.qtopengl python-pyside.qtscript python-pyside.qtsql
  python-pyside.qtsvg python-pyside.qttest python-pyside.qtuitools
  python-pyside.qtwebkit python-pyside.qtxml python-qt4-gl python-tz
Suggested packages:
  freecad-doc kicad-doc-en kicad-doc-fr kicad-doc-de kicad-doc-es kicad-doc-hu
  kicad-doc-ru kicad-doc-zh-cn libopenal0a libsimage-dev libjs-jquery-ui-docs
  spacenavd dvipng ipython python-cairocffi python-excelerator
  python-matplotlib-doc python-tornado python-traits texlive-extra-utils
  texlive-latex-extra ttf-staypuft python-mock-doc python-coverage
  python-nose-doc
The following NEW packages will be installed:
  fonts-lyx freecad kicad kicad-common libboost-filesystem1.55.0
  libboost-regex1.55.0 libboost-signals1.55.0 libcoin80 libfreeimage3
  libjs-jquery-ui liboce-foundation8 liboce-modeling8 liboce-ocaf-lite8
  liboce-ocaf8 liboce-visualization8 libpyside1.2 libraw10 libshiboken1.2
  libsoqt4-20 libspnav0 libxerces-c3.1 libzipios++0c2a python-collada
  python-matplotlib python-matplotlib-data python-mock python-nose python-pivy
  python-pyside python-pyside.phonon python-pyside.qtcore
  python-pyside.qtdeclarative python-pyside.qtgui python-pyside.qthelp
  python-pyside.qtnetwork python-pyside.qtopengl python-pyside.qtscript
  python-pyside.qtsql python-pyside.qtsvg python-pyside.qttest
  python-pyside.qtuitools python-pyside.qtwebkit python-pyside.qtxml
  python-qt4-gl python-tz
0 upgraded, 45 newly installed, 0 to remove and 27 not upgraded.
```


***
# electric
```
sudo apt-get install electric
The following extra packages will be installed:
  antlr3 jython libatinject-jsr330-api-java libbsh-java libconstantine-java
  libguava-java libjaffl-java libjava3d-java libjava3d-jni libjffi-java
  libjffi-jni libjnr-netdb-java libjnr-posix-java libjnr-x86asm-java
  libjsr305-java liblivetribe-jsr223-java libreadline-java libslf4j-java
  libstringtemplate-java libvecmath-java
Suggested packages:
  jython-doc libmysql-java libpostgresql-jdbc-java
  libatinject-jsr330-api-java-doc libjava3d-java-doc libjnr-netdb-java-doc
  libjsr305-java-doc libreadline-java-doc
The following NEW packages will be installed:
  antlr3 electric jython libatinject-jsr330-api-java libbsh-java
  libconstantine-java libguava-java libjaffl-java libjava3d-java libjava3d-jni
  libjffi-java libjffi-jni libjnr-netdb-java libjnr-posix-java
  libjnr-x86asm-java libjsr305-java liblivetribe-jsr223-java libreadline-java
  libslf4j-java libstringtemplate-java libvecmath-java
0 upgraded, 21 newly installed, 0 to remove and 27 not upgraded.
```

***
# 更新vbox
```
sudo apt-get remove virtualbox-qt virtualbox-dkms
sudo apt-get remove virtualbox-guest-additions-iso
sudo apt-get autoremove
sudo dpkg -i virtualbox-5.1_5.1.18-114002~Debian~jessie_amd64.deb
```
安装附加软件包

更新内核配置
`sudo /sbin/vboxconfig`

```
sudo gedit /etc/apt/sources.list
```
添加
```
deb http://download.virtualbox.org/virtualbox/debian jessie contrib
```
添加公钥
```
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com A2F683C52980AECF
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install virtualbox-5.1
sudo apt-get install dkms
sudo apt-get autoremove
```
附加包在这样的地方
http://download.virtualbox.org/virtualbox/5.1.30/

```
VBoxManage list extpacks
andy@debian-dell:~$ cat /etc/group | grep vbox
vboxusers:x:129:
andy@debian-dell:~$ sudo usermod -a -G vboxusers andy 
andy@debian-dell:~$ cat /etc/group | grep vbox
vboxusers:x:129:andy
```
重启host，可以用usb筛选器了


***
# gradle
android studio 升级 gradle 位置在
```
/home/andy/.gradle/wrapper/dists
```
事先把这玩意放置到android studio下也行的。


***
# Pipe Viewer
```
sudo apt-get install pv
```


***
# phpmyadmin
```
sudo apt-get install mysql-server phpmyadmin
```

公司plm系统配置
http://plm.aohua.local:7001/Agile
```
sudo gedit hosts
添加
192.168.1.12       plm.aohua.local
192.168.1.13       plmfile.aohua.local
```
opera浏览器settings里设置`Allow all sites to show pop-ups`



***
# 170506 更新
```
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get dist-upgrade
$ sudo apt-get -u dist-upgrade
```

apt-get upgrade 和 apt-get dist-upgrade 本质上是没有什么不同的

只不过，dist-upgrade 会识别出当依赖关系改变的情形并作出处理，而upgrade对此情形不处理

例如软件包 a 原先依赖 b c d，但是在源里面可能已经升级了，现在是 a 依赖 b c e

这种情况下，dist-upgrade 会删除 d 安装 e，并把 a 软件包升级，而 upgrade 会认为依赖关系改变而拒绝升级 a 

问题处理
```
python-keyring (8.4.1-1) unstable; urgency=medium

  Now this package contains only the recommended secure backends for each
  platform — on Linux these are the Secret Service backend and the KWallet
  D-Bus based backend.

  All the other backends have been moved to the new keyrings.alt package
  (which provides python-keyrings.alt and python3-keyrings.alt binaries).

  Please make sure you have keyrings.alt installed if you need to use the
  old backends (for example the file backend).

  See https://github.com/jaraco/keyring/issues/117 for the reasoning of
  the split.

 -- Dmitry Shachnev <mitya57@debian.org>  Sun, 07 Feb 2016 13:22:13 +0300


Downloading Oracle Java 8...
--2017-05-06 21:43:08--  http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz

#####Important########
To set Oracle JDK8 as default, install the "oracle-java8-set-default" package.
E.g.: sudo apt install oracle-java8-set-default
On Ubuntu systems, oracle-java8-set-default is most probably installed
automatically with this package.
######################

/home/andy/.config/VirtualBox
```


***
# adb tools
```
sudo apt-get install android-tools-adb
sudo aptitude install android-tools-fastboot
```
lsusb得到
```
Bus 002 Device 003: ID 2a45:0c02 Meizu Corp. MX Phone (MTP & ADB)
```
```
gedit ~/.android/adb_usb.ini
```
添加0x2a45

实际上直接用360手机助手文件夹里的这个文件不是很好吗

不要在android-sdk/tools/运行
```
./android update adb
```
会覆盖`~/.android/adb_usb.ini`
```
/etc/udev/rules.d/50-android.rules
```
内容是
```
SUBSYSTEM=="usb", ENV{DEVTYPE} == "usb_device", ATTR{idVendor}=="2a45", MODE="0666"
```
修改udev配置后要
```
sudo /etc/init.d/udev restart
```
```
adb kill-server
adb devices （首次要在手机上确认）
List of devices attached 
810EBM638M3W	device

adb shell
su  （首次要在手机上确认）

修改手机分辨率，adb shell之后
wm density
wm density 320
wm size
wm size 720x1280
```


***
# telnet
```
$ sudo apt-get install xinetd
$ sudo apt-get install telnetd-ssl
$ sudo apt-get install telnetd

Adding user telnetd to group utmp
Note: xinetd currently is not fully supported by update-inetd.
      Please consult /usr/share/doc/xinetd/README.Debian and itox(8).
```

```
$ sudo gedit /etc/xinetd.d/telnet
```
```
# default: on
# description: The telnet server serves telnet sessions; it uses ＼
#       unencrypted username/password pairs for authentication.
service telnet
{
        disable = no
        flags           = REUSE
        socket_type     = stream
        wait            = no
        user            = root
        server          = /usr/sbin/in.telnetd
        server_args     = -h
        log_on_failure  += USERID
}
```
```
$ sudo /etc/init.d/xinetd restart
```
```
telnet 192.168.1.103
```


***
# termux 手机端
编辑 `/data/data/com.termux/files/usr/etc/apt/sources.list` 文件，修改 apt 源为清华大学开源镜像
```
# The main termux repository:
#deb [arch=all,arm] http://termux.net stable main
deb [arch=all,arm] http://mirrors.tuna.tsinghua.edu.cn/termux stable main
```
```
apt update
apt install openssl
apt install openssh
```
安装完成后 `/data/data/com.termux/files/usr/bin` 目录下会多几个有关 ssh 的可执行文件

开启 sshd 服务
```
sshd
```
查看 sshd 使用的端口，我这里是 8022
```
netstat -ntlp
```
ssh 密钥创建，接下来的问题一律回车默认
```
ssh-keygen
```
/data/data/com.termux/files/home/.ssh 多出两个文件 id_rsa.pub 和 id_rsa ，分别是公钥和私钥

将公钥导入到信任主机列表
```
cd /data/data/com.termux/files/home/.ssh
cat id_rsa.pub >>　authorized_keys
```
debian pc主机上，运行
```
ssh-keygen -t rsa
```
或者
```
ssh-keygen -t dsa
```
通过各种方式（直接usb或者通过网络adb）adb连接到手机上，将公钥adb push到手机上
```
adb push ~/.ssh/id_dsa.pub /data/data/com.termux/files/home/.ssh/id_dsa.pub
```
（先push进手机，再adb shell进去su了挪位置）

通过adb shell进入手机，cd到data/data/com.termux/files/home/.ssh/，将公钥内容添加到ssh的授权文件里
```
cat id_dsa.pub >> authorized_keys
```
手机上执行
```
whoami
```
核对权限
```
/data/data/com.termux/files/home # ls -al
chmod 700 .ssh
```
所属用户和组修改
```
chown u0_a89:u0_a89 .ssh
```

pc端的私钥权限要设置成600

核对手机的ip地址，要一个网段内

```
andy@debian-dell:~$ ssh u0_a89@192.168.1.105 -p 8022
Enter passphrase for key '/home/andy/.ssh/id_dsa': 
X11 forwarding request failed on channel 0
Welcome to Termux!

Online help:     https://termux.com/help
Community forum: https://termux.com/community
IRC channel:     #termux on freenode
Gitter chat:     https://gitter.im/termux/termux
Mailing list:    termux+subscribe@groups.io

Search packages:   packages search <query>
Install a package: packages install <package>
Upgrade packages:  packages upgrade
Learn more:        packages help
-bash-4.4$ screenfetch
       ╲ ▁▂▂▂▁ ╱
       ▄███████▄ 
      ▄██ ███ ██▄        android-625c80d64521c152
     ▄███████████▄       OS: Android 5.1
  ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄ █▄    Device: m2 note (m2note)
  ██ █████████████ ██    ROM: Flyme 6.7.1.17 beta
  ██ █████████████ ██    Baseband: unknown
  ██ █████████████ ██    Kernel: aarch64 Linux 3.10.65-user
  ██ █████████████ ██    Uptime: 4h 47m
     █████████████       CPU: AArch64 Processor rev 4 (aarch64)
      ███████████        GPU: AArch64 Processor rev 4 (aarch64)
       ██     ██
       ██     ██
-bash-4.4$ netstat -ntlp
netstat: showing only processes with your user ID
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 0.0.0.0:8022            0.0.0.0:*               LISTEN      30740/sshd
-bash-4.4$ whoami
u0_a89
```

termux可以
```
使用bash 和 zsh。
使用nano 和 vim编辑文件。
通过ssh访问服务器。
使用gcc、gdb、make、automake和clang编译代码。
使用python控制台来作为口袋计算器。
使用git 和 subversion检查项目。
使用frotz运行基于文本的游戏。
screenfetch
htop
tree
```

```
进入 JuiceSSH 的认证，用户名填写刚才的用户名
复制私钥到sd卡某个目录，搜索即可，端口8022
hacker's Keyboard要设置成横屏才更好使
Quick Keyboard Switch很好用
```

多个设备的adb解决more than one device and emulator问题

1.查找所有设备
```
adb devices
```
2.选择你要使用的设备
```
adb -s 设备名称 shell
```
OK!


安装sambadroid

修改
```
/data/data/berserker.android.apps.sambadroid/samba/smb.conf
```
```
# Generated by SambaDroid
[global]
interfaces = wlan0
bind interfaces only = yes
workgroup = WORKGROUP
server string = m2note
netbios name = m2note
remote announce = 255.255.255.255
encrypt passwords = yes
load printers = no
printcap name = /dev/null
disable spoolss = yes
deadtime = 5
delete readonly = yes
nt acl support = no
inherit permissions = yes
local master = no
unix extensions = yes
security = user
guest account = nobody
map to guest = Bad User
socket options = SO_SNDBUF=16384 SO_RCVBUF=16384
[sdcard]
comment = storage
path = /storage
read only = no
writable = yes
guest ok = yes
force user = root
map readonly = permissions
```
```
root@m2note:/ # /data/data/berserker.android.apps.sambadroid/samba/nmbd -D
root@m2note:/ # /data/data/berserker.android.apps.sambadroid/samba/smbd -D 
```
```
smbpasswd -a 增加用户（要增加的用户必须以是系统用户）
smbpasswd -d 冻结用户，就是这个用户不能在登录了
smbpasswd -e 恢复用户，解冻用户，让冻结的用户可以在使用
smbpasswd -n 把用户的密码设置成空.
             要在global中写入 null passwords -true
smbpasswd -x  删除用户
```


***
# eth0配置更新
```
/etc/network/interfaces
auto eth0
```
```
iface eth0 inet static
address 192.168.4.101
netmask 255.255.255.0
gateway 192.168.4.1
```
```
/etc/resolv.conf
```
```
search aohua.com
nameserver 192.168.1.253
```


***
# java环境变量设置
编辑`/etc/profile`文件
```
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$CLASSPATH:$JAVA_HOME/lib:$JRE_HOME/lib
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
```


***
# imagej
```
sudo apt-get install imagej
```


***
# aster
```
$ python setup.py install --prefix=/opt/aster
```
缺少gfortran
```
sudo apt-get install gfortran cfortran liblapack-dev
```


***
# 有机化学分子结构式
```
$ sudo aptitude install gchempaint avogadro
```


***
# 力学分析
```
sudo aptitude install step khelpcenter4
```


***
# 逻辑电路分析
```
sudo aptitude install logisim
```

***
# apt-file
查询一个文件包含在哪个包里面, 可以用 apt-file
```
$ apt-file search libstdc++.so.6
```
查询一个安装包安装文件的目录，用 dpkg -L
```
$ dpkg -L lib32stdc++6
```
```
$ sudo apt-get install libtcl8.5 libtcl8.5:i386
$ dpkg -L libtcl8.5:i386
```


***
# smplayer

For Debian 8.0 run the following as root:
```
echo 'deb http://download.opensuse.org/repositories/home:/smplayerdev/Debian_8.0/ /' > /etc/apt/sources.list.d/smplayer.list 
```
```
sudo apt-get update
sudo apt-get install smplayer
```
You can add the repository key to apt. Keep in mind that the owner of the key may distribute updates, packages and repositories that your system will trust (more information). To add the key, run:
```
wget -nv http://download.opensuse.org/repositories/home:smplayerdev/Debian_8.0/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
```


***
# monodevelop
```
$ sudo aptitude install monodevelop
$ ilasm --version 
Mono ILasm compiler version 3.2.8.0
$ dmcs  --version
Mono C# compiler version 3.2.8.0
$ mcs  --version
Mono C# compiler version 3.2.8.0
$ mono --version
```


***
# sublime
Install the GPG key:
```
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
```
Select the channel to use:
```
Stable

    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

Update apt sources and install Sublime Text

sudo apt-get update
sudo apt-get install sublime-text
$ subl
```


***
# kchmviewer
$ sudo aptitude install kchmviewer


***
# python
```
$ python -V
Python 2.7.9
$ python2 -V
Python 2.7.9
$ python3 -V
Python 3.4.2
```


***
# jlink
```
jlink_4.92_x86_64.deb
$ JLinkExe
```


***
# 更新到 debian sid 版本

`upgrade` 可以进x

`dis-upgrade` 无法进x

再一次 `upgrade` 可以进x

upgrade不会删除有相关依赖的软件，所以是安全的

dist-upgrade会删除有相关依赖的软件，使组件最新，所以要当心使用

## obmenu-generator挂了
```
sudo apt-get install build-essential cpanminus git
git clone git://github.com/trizen/obmenu-generator
sudo cp obmenu-generator/obmenu-generator /usr/bin
sudo cp -r obmenu-generator/schema.pl ~/.config/obmenu-generator/
sudo cpanm Linux::DesktopFiles
sudo cpanm Data::Dump
sudo chmod 777 /usr/bin/obmenu-generator 
```

## aptitude似乎被删了，安装回来


## 下面总结一下有关apt-get的常用但容易混淆的指令:
```
apt-get autoclean:

    如果你的硬盘空间不大的话，可以定期运行这个程序，将已经删除了的软件包的.deb安装文件从硬盘中删除掉。如果你仍然需要硬盘空间的话，可以试试apt-get clean，这会把你已安装的软件包的安装包也删除掉，当然多数情况下这些包没什么用了，因此这是个为硬盘腾地方的好办法。


apt-get clean:

    类似上面的命令，但它删除包缓存中的所有包。这是个很好的做法，因为多数情况下这些包没有用了。但如果你是拨号上网的话，就得重新考虑了。


apt-get autoremove:

    删除为了满足其他软件包的依赖而安装的，但现在不再需要的软件包。


其它：
apt-get remove 软件包名称：

    删除已安装的软件包（保留配置文件）。
apt-get --purge remove 软件包名称：

     删除已安装包（不保留配置文件)。


常用的APT命令参数：
apt-cache search package 搜索包
apt-cache show package 获取包的相关信息，如说明、大小、版本等
sudo apt-get install package 安装包
sudo apt-get install package --reinstall 重新安装包
sudo apt-get -f install 修复安装"-f = ——fix-missing"

sudo apt-get remove package 删除包
sudo apt-get remove package - - purge 删除包，包括删除配置文件等
sudo apt-get update 更新源
sudo apt-get upgrade 更新已安装的包
sudo apt-get dist-upgrade 升级系统
sudo apt-get dselect-upgrade 使用 dselect 升级
apt-cache depends package 了解使用依赖
apt-cache rdepends package 是查看该包被哪些包依赖
sudo apt-get build-dep package 安装相关的编译环境
apt-get source package 下载该包的源代码
sudo apt-get clean && sudo apt-get autoclean 清理无用的包
sudo apt-get check 检查是否有损坏的依赖
查看系统中软件包状态
$ dpkg -l
$ dpkg-query -l
查询系统中属于nano的文件:
$ dpkg --listfiles nano
查看软件nano的详细信息
$ dpkg -s nano
$ dpkg-query -s nano
查看某个文件的归属包:
$ dpkg-query -S nano
$ dpkg -S nano
移除deb包
$ dpkg -r debname
安装deb包
$ dpkg -i xxx.deb
 查看deb包含有哪些文件(不安装)
$ dpkg -c xxx.deb // 安装前根据deb文件查看
$ dpkg -L debname // 安装后根据包名查看
释放安装内容
dpkg -X mingw-w64-binutils_2.36.1-1_amd64.deb extract
释放控制信息
dpkg -e mingw-w64-binutils_2.36.1-1_amd64.deb extract/DEBIAN/
重新打包到build目录
dpkg-deb -b extract/ build/
```


***
# 图饼显示磁盘占用
```
sudo baobab
```


***
# vlc升级后被删除，降级组建重新安装
```
主要是依赖libflac++6，安装stable版本
      Remove the following packages:                                            
1)      libflac++6v5 [1.3.2-1 (now, unstable)]                                  
2)      libtag1v5 [1.11.1+dfsg.1-0.1 (now, unstable)]                           
3)      libtag1v5-vanilla [1.11.1+dfsg.1-0.1 (now, unstable)]                   

      Install the following packages:                                           
4)      gnome-packagekit [3.22.1-2 (unstable)]                                  
5)      gnome-packagekit-data [3.22.1-2 (unstable)]                             
6)      libtag1-vanilla [1.9.1-2.1 (now, stable)]                               
7)      libtag1c2a [1.9.1-2.1 (stable)]                                         
8)      libxfce4util6 [4.10.1-2 (now, stable)]                                  

      Downgrade the following packages:                                         
9)      gnome [1:3.22+3 (now, unstable) -> 1:3.14+3 (stable)]                   
10)     gnome-core [1:3.22+3 (now, unstable) -> 1:3.14+3 (stable)]              
11)     gstreamer1.0-plugins-good [1.10.4-1 (now, unstable) -> 1.4.4-2+deb8u3 (s
12)     k3b [2.0.3a-2+b2 (now, unstable) -> 2.0.2-8 (stable)]                   
13)     k3b-data [2.0.3a-2 (now, unstable) -> 2.0.2-8 (stable)]                 
14)     libk3b6 [2.0.3a-2+b2 (now, unstable) -> 2.0.2-8 (stable)]               
15)     libk3b6-extracodecs [2.0.3a-2+b2 (now, unstable) -> 2.0.2-8 (stable)]   
16)     libtagc0 [1.11.1+dfsg.1-0.1 (now, unstable) -> 1.9.1-2.1 (stable)]      
17)     thunar-media-tags-plugin [0.2.1-1+b2 (now, unstable) -> 0.2.1-1 (stable)
```


***
# wine 故障
```
Microsoft Visual C++ Runtime RuntimeError R6034
百度文档下载器3
winecfg的MSVCR90.dll改成内建先于原装，就ok了
```


***
# 登录管理器 和 runlevel
<https://wiki.archlinux.org/index.php/Display_manager>

查看当前登录管理器
```
$ ls -l /etc/systemd/system/display-manager.service
lrwxrwxrwx 1 root root 36 3月  29 2015 /etc/systemd/system/display-manager.service -> /usr/lib/systemd/system/lxdm.service
```
The configuration files for LXDM are all located in 
```
/etc/lxdm/
```
可执行文件在
```
/usr/lib/lxdm/
```

查看默认的运行级别配置
```
$ ls -l /lib/systemd/system/default.target
lrwxrwxrwx 1 root root 16 1月  29 06:32 /lib/systemd/system/default.target -> graphical.target
```
这是登陆器的桌面候选
```
$ ls /usr/share/xsessions/
```
更换登录管理器，比如slim
```
# systemctl enable slim.service
```
display manager有
```
kdm, gdm, lightdm, lxdm, wdm, xdm, slim, nodm, ldm
```

<https://wiki.archlinux.org/index.php/Systemd#Change_default_target_to_boot_into>
初始化运行级别配置
```
# systemctl set-default multi-user.target
```
修改运行级别配置
```
# systemctl set-default -f multi-user.target
```
实际上作用就是
```
$ sudo ln -s /lib/systemd/system/multi-user.target default.target
```
这样可以实现xstart登录，默认不开启X界面（# 字符界面启动 #）
```
$ sudo systemctl set-default multi-user.target

Created symlink /etc/systemd/system/default.target → /usr/lib/systemd/system/multi-user.target.
```
```
$ sudo systemctl set-default multi-user.target
$ echo "exec openbox-session" >> ~/.xinitrc
```

如何查看用得是systemd 还是 initscripts ？
```
sudo readlink -f /proc/1/exe
```

***
# xscreensaver
<https://wiki.archlinux.org/index.php/XScreenSaver#Configuration>
```
xscreensaver-demo
xscreensaver-command --lock
```


***
# 还原系统备份backup_0926.tar.bz2

还原备份后如果uuid被改变了，先在360急救盘里用
```
# tune2fs -U f5cd428a-7bcc-4026-80b7-9f570e5966cf /dev/sda2
```
还原uuid

如果gurb挂了，还要利用启动u盘的grub进入系统，更新grub
```
$ sudo grub-install /dev/sda
$ sudo update-grub2
```

重新安装证书
```
$ sudo cp /sbin/ifconfig /bin/
$ sudo apt-get install ca-certificates --reinstall
```

更新源并且更新系统
```
$ sudo gedit /etc/apt/sources.list
```
```
deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib
deb http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib
deb http://mirrors.aliyun.com/debian/ jessie-updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ jessie main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ jessie-updates main non-free contrib
deb http://mirrors.aliyun.com/debian/ jessie-backports main contrib non-free
deb-src http://mirrors.aliyun.com/debian/ jessie-backports main contrib non-free
# deb http://mirrors.aliyun.com/debian-security/ jessie/updates main non-free contrib
# deb-src http://mirrors.aliyun.com/debian-security/ jessie/updates main non-free contrib
deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main
# deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main
```
```
$ sudo apt-get update
$ sudo apt-get upgrade
```
一定要只存在一个codename的sourcelist才可以进行这个操作，否则升降级依赖就复杂了去了
```
$ sudo apt-get dselect-upgrade
安装中断
$ sudo rm /var/lib/dpkg/lock
$ sudo rm /var/cache/apt/archives/lock
$ sudo rm /var/lock/aptitude
$ sudo dpkg --configure -a
```
实在不行还要删/var/lib/dpkg/status的相关内容

Dpkg 使用文本文件来作为数据库.通称在 /var/lib/dpkg 目录下. 通称在 status 文件中存储软件状态,和控制信息. 

在 info/ 目录下备份控制文件, 并在其下的 .list 文件中记录安装文件清单, 其下的 .mdasums 保存文件的 MD5 编码.

必要的时候apt用代理
```
$ sudo apt-get -o Acquire::http::proxy="http://127.0.0.1:8087/" update
```

apt半安装的删除
```
$ sudo leafpad /var/lib/dpkg/status
```
例如要把firefox-mozilla-build状态改成install ok installed就可以删除了


***
# java8
开启源
```
deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main
deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main
```
导入GPG key
```
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
```
更新apt缓存并安装java8
```
$ sudo apt-get update
$ sudo apt-get install oracle-java8-installer
```
快速设置环境变量
```
$ sudo apt-get install oracle-java8-set-default
```
aptitude安装jdk8
```
$ sudo apt-get purge openjdk-7-jre*
$ sudo rm -rf /usr/lib/jvm/java-7-openjdk-amd64
$ sudo apt-get purge gcj-4.9-jre-lib
$ sudo rm -rf /usr/lib/jvm/java-1.5.0-gcj-4.9-amd64

W: There is no public key available for the following key IDs:
EF0F382A1A7B6500

$ sudo apt-get install debian-keyring debian-archive-keyring
$ sudo apt-get autoremove
$ sudo apt-get clean && sudo apt-get autoclean
```

 
***
# 与时间服务器上的时间同步的方法
<http://www.cnblogs.com/liuchangchun/p/4685032.html>

1.  安装ntpdate工具
```
$ sudo apt-get install ntpdate
```
2.  设置系统时间与网络时间同步
```
$ sudo ntpdate cn.pool.ntp.org
```
3.  将系统时间写入硬件时间
```
$ sudo hwclock --systohc  <comment> 就是 $ sudo hwclock -w </comment>
```
2个NTP服务器地址:
```
cn.pool.ntp.org
ntp.api.bz
```
随便修改一个时间
```
$ sudo date -s "2015-06-15 10:42"
```


***
# 修改时区
<http://blog.csdn.net/w786572258/article/details/51248053>
```
$ sudo tzconfig
WARNING: the tzconfig command is deprecated, please use:
 dpkg-reconfigure tzdata
$ sudo dpkg-reconfigure tzdata
Current default time zone: 'Asia/Shanghai'
Local time is now:      Sat Jun 17 20:14:52 CST 2017.
Universal Time is now:  Sat Jun 17 12:14:52 UTC 2017.
```
等效于
```
$ sudo cp /usr/share/zoneinfo/Asia/Chongqing /etc/localtime
```


***
# 更新内核到4 update kernel
```
$ sudo aptitude install linux-image-4.9.0-0.bpo.3-amd64

     Upgrade the following packages:                                  
1)     linux-base [3.5 (now, stable) -> 4.3~bpo8+1 (jessie-backports)]

Accept this solution? [Y/n/q/?] y
The following NEW packages will be installed:
  firmware-linux-free{a} irqbalance{a} linux-image-4.9.0-0.bpo.3-amd64 
The following packages will be upgraded:
  linux-base 
```

## 处理linux-headers
```
$ sudo apt-get install linux-headers-$(uname -r)

$ sudo apt-get install linux-headers-4.9.0-0.bpo.3-all
The following NEW packages will be installed:
  linux-compiler-gcc-4.9-x86 linux-headers-4.9.0-0.bpo.3-all linux-headers-4.9.0-0.bpo.3-all-amd64 linux-headers-4.9.0-0.bpo.3-amd64
  linux-headers-4.9.0-0.bpo.3-common linux-headers-4.9.0-0.bpo.3-common-rt linux-headers-4.9.0-0.bpo.3-rt-amd64 linux-kbuild-4.9
0 upgraded, 8 newly installed, 0 to remove and 0 not upgraded
    
$ sudo apt-get install linux-headers-4.9.0-0.bpo.3-all-amd64
The following NEW packages will be installed:
  linux-compiler-gcc-4.9-x86 linux-headers-4.9.0-0.bpo.3-all-amd64 linux-headers-4.9.0-0.bpo.3-amd64
  linux-headers-4.9.0-0.bpo.3-common linux-headers-4.9.0-0.bpo.3-common-rt linux-headers-4.9.0-0.bpo.3-rt-amd64 linux-kbuild-4.9
0 upgraded, 7 newly installed, 0 to remove and 0 not upgraded.
    
$ sudo apt-get install linux-headers-4.9.0-0.bpo.3-common
$ sudo apt-get purge linux-headers-3.16.0-4-*
```
        
        
***
# notepadqq
<https://launchpad.net/~notepadqq-team/+archive/ubuntu/notepadqq>
```
deb http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu trusty main 
#deb-src http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu trusty main
```
```
$ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 63DE9CD4
$ sudo apt-get update
$ sudo apt-get install notepadqq
```


***
# 浏览器 flashplayer
之前upgrade时候有告警
```
Setting up flashplugin-nonfree (1:3.6.1+deb8u1) ...
--2017-06-17 12:02:05--  https://fpdownload.adobe.com/get/flashplayer/pdc/24.0.0.186/flash_player_npapi_linux.x86_64.tar.gz
Resolving fpdownload.adobe.com (fpdownload.adobe.com)... 184.85.113.19
Connecting to fpdownload.adobe.com (fpdownload.adobe.com)|184.85.113.19|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2017-06-17 12:02:06 ERROR 404: Not Found.
ERROR: wget failed to download https://fpdownload.adobe.com/get/flashplayer/pdc/24.0.0.186/flash_player_npapi_linux.x86_64.tar.gz
```
```
$ sudo apt-get install flashplugin-nonfree --reinstall
```
还是失败

安装中断
```
$ sudo rm /var/lib/dpkg/lock
$ sudo rm /var/cache/apt/archives/lock
$ sudo rm /var/lock/aptitude
$ sudo dpkg --configure -a
```
添加源 <作废>
```
deb http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt all main
```
导入公钥
```
$ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2667CA5C
```
    
update时候报错
```
E: The method driver /usr/lib/apt/methods/https could not be found.
N: Is the package apt-transport-https installed?
```
```
$ sudo apt-get install apt-transport-https
```
    
好像都没有啥用处

原来是后面还安装了
```
$ sudo apt-get install pepperflashplugin-nonfree
$ sudo update-pepperflashplugin-nonfree --install
```
没毛病

最前面还有
```
$ sudo apt-get install flashplugin-nonfree-extrasound 
$ sudo update-flashplugin-nonfree --install
```
```
https://wiki.debian.org/PepperFlashPlayer
https://wiki.debian.org/PepperFlashPlayer/Installing
https://wiki.debian.org/Freshplayerplugin
添加
deb http://http.debian.net/debian jessie-backports main contrib
```
```
$ sudo apt-get update
$ sudo aptitude install pepperflashplugin-nonfree browser-plugin-freshplayer-pepperflash
```
<http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/f/freshplayerplugin/>

```
$ sudo update-pepperflashplugin-nonfree  --status

gpg --keyserver pgp.mit.edu --recv-keys 1397BC53640DB551
gpg --export --armor 1397BC53640DB551 | sudo sh -c 'cat >> /usr/lib/pepperflashplugin-nonfree/pubkey-google.txt'
```
<https://helpx.adobe.com/flash-player/release-note/readme-flash-player-linux.html>


未验证：

手动安装到诸如$HOME/.local/lib/opera/plugin
```
cp libflashplayer.so  /usr/lib/mozilla/plugins/
```

验证可用

复制文件进特定位置
```
sudo cp libpepflashplayer.so /usr/lib/pepperflashplugin-nonfree
sudo cp manifest.json /usr/lib/pepperflashplugin-nonfree
```
    
opera和chromium都是在
```
chrome://plugins/
```
启用插件


firefox如果要换flash插件按下面来，但是版本显示不知道怎么总是不对

在Firefox上使用PepperFlash,则需要通过第三方插件 FreshPlayerPlugin +(~/.config/freshwrapper.conf）来加载

<http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/f/freshplayerplugin/>
```
freshplayerplugin_0.3.3+git20151006-webupd8-precise_amd64.deb
```
旧版本os需要安装，debian8不能安装这个
```
freshplayerplugin_0.3.6-1-webupd8-trusty6_all.deb
```
只是一个doc，所以新版本os不安装也可（browser-plugin-freshplayer-pepperflash包含了这个doc）


firefox用的是
```
/usr/lib/browser-plugin-freshplayer-pepperflash/libfreshwrapper-flashplayer.so
```
```
about:plugins
```
禁用启用在
```
about:addons (再点plugins)
```
软链接是
```
/usr/lib/mozilla/plugins/flash-mozilla.so
```
<https://wiki.debian.org/Freshplayerplugin/>

更换flash plugin替换掉这个软链接到需要的地方就可以了，freshwrapper.conf是不需要的（不起作用）

直接把libflashplayer.so重命名为libfreshwrapper-flashplayer.so，再复制到/usr/lib/mozilla/plugins/，删掉flash-mozilla.so就可以了

```
cp /opt/google/chrome/PepperFlash/libpepflashplayer.so ~/Downloads/libfreshwrapper-flashplayer.so
sudo ln -s ~/Downloads/libfreshwrapper-flashplayer.so flash-mozilla.so
cd /opt/google/chrome/PepperFlash
sudo cp libpepflashplayer.so libfreshwrapper-flashplayer.so
```
软链接不行，名字也得是`libfreshwrapper-flashplayer.so`
```
cd /usr/lib/mozilla/plugins
sudo ln -s /opt/google/chrome/PepperFlash/libfreshwrapper-flashplayer.so flash-mozilla.so
```
原来的flash-mozilla.so -> /etc/alternatives/flash-mozilla.so

## 全部浏览器生效
```
cd /usr/lib/pepperflashplugin-nonfree
sudo mv libpepflashplayer.so libfreshwrapper-flashplayer.so
sudo ln -s libfreshwrapper-flashplayer.so libpepflashplayer.so
```
opera+chromium可用
```
sudo ln -s /usr/lib/pepperflashplugin-nonfree/libfreshwrapper-flashplayer.so flash-mozilla.so
```
ff
```
about:plugins
```
opera、chrome
```
chrome://plugins/
```
新的opera是
```
opera：plugins
```


最新

firefox使用flash_player_npapi_linux.x86_64.tar.gz
libfreshwrapper-flashplayer.so放到/usr/lib/mozilla/plugins

顺便修改一下flash-mozilla.so的指向

chrome使用flash_player_ppapi_linux.x86_64.tar.gz

libpepflashplayer.so和manifest.json放到/usr/lib/pepperflashplugin-nonfree

chrome和opera都取消了plugins的选项卡

```
$ sudo apt-get install browser-plugin-freshplayer-pepperflash --reinstall
ls /etc/alternatives/flash-mozilla.so -l
ls -l /var/lib/dpkg/alternatives/flash-mozilla.so
```
```
/home/andy/.mozilla/firefox/sv3du5zt.default/pluginreg.dat
```

验证可用，命令行指定plugin
```
opera --ppapi-flash-path=/opt/google/chrome/PepperFlash/libpepflashplayer.so
chromium --ppapi-flash-path=/opt/google/chrome/PepperFlash/libpepflashplayer.so --ppapi-flash-version=`grep -i version /opt/google/chrome/PepperFlash/manifest.json | awk '{print $2}' | awk -F"\"" '{print $2}'`
```


```
wget https://dl.google.com/linux/direct/google-chrome-stable-current_i386.deb
ar p google-chrome-stable-current_i386.deb data.tar.lzma | unxz | tar xf - ./opt/google/chrome/PepperFlash
cp opt/google/chrome/PepperFlash/libpepflashplayer.so /usr/lib/chromium/plugins
vi /etc/chromium/default
  CHROMIUM_FLAGS="--password-store=detect --ppapi-flash-path=/usr/lib/chromium/plugins/libpepflashplayer.so"
```
实际上
```
cat /etc/chromium.d/pepperflashplugin-nonfree 
flashso="/usr/lib/pepperflashplugin-nonfree/libpepflashplayer.so"
flashversion=`strings $flashso 2> /dev/null | grep LNX | cut -d ' ' -f 2 | sed -e "s/,/./g"`
CHROMIUM_FLAGS="$CHROMIUM_FLAGS --ppapi-flash-path=$flashso --ppapi-flash-version=$flashversion"
```


***    
# 安装opera
手动安装opera-stable_41.0.2353.46_amd64.deb
```
$ sudo update-alternatives --config x-www-browser
```


***    
# U盘使用exfat文件系统
```
sudo apt-get install exfat-utils exfat-fuse
```


***    
# opt中程序快速启动设置

## xxnet
```
//sudo ln -s /opt/XX-Net/start /usr/local/bin/xxnet
cd /usr/local/bin
sudo gedit xxnet
```
```
#!/bin/bash

/opt/XX-Net/start
```
```
sudo chmod +x xxnet
```
```
$ leafpad ~/.config/openbox/autostart
```
添加
```
(sleep 2 && xxnet) &
```

## xmind
```
cd /usr/local/bin
sudo gedit xmind
sudo chmod +x xmind
```
```
#!/bin/bash
cd /opt/xmind/XMind_amd64/
./XMind
```

```
cd /usr/local/bin
sudo gedit torbrowser
sudo chmod +x torbrowser
```
```
#!/bin/bash
/opt/tor-browser_en-US/Browser/start-tor-browser --detach
```


## cadence快速运行

这里是实现的办法之1
```
cd /usr/local/bin
sudo gedit Allegro
```
```
#!/bin/bash
cd /opt/cadence/allegro_166_patch/
source spb166
allegro
```
```
sudo gedit Pad_designer
```
```
#!/bin/bash
cd /opt/cadence/allegro_166_patch/
source spb166
pad_designer
```
```
sudo gedit Concepthdl
```
```
#!/bin/bash
cd /opt/cadence/allegro_166_patch/
source spb166
concepthdl
```
```
sudo chmod +x Allegro Pad_designer Concepthdl
```

这里是实现的办法之2
```
cd /usr/local/bin
sudo gedit allegro
```
```
#!/bin/bash
cd /opt/cadence/allegro_166_patch/
source spb166
/opt/cadence/SPB166/tools/pcb/bin/allegro
```
```
sudo gedit concepthdl
```
```
#!/bin/bash
cd /opt/cadence/allegro_166_patch/
source spb166
/opt/cadence/SPB166/tools/bin/concepthdl
```
```
sudo gedit pad_designer
```
```
#!/bin/bash
cd /opt/cadence/allegro_166_patch/
source spb166
/opt/cadence/SPB166/tools/pcb/bin/pad_designer
```
```
sudo chmod +x allegro pad_designer concepthdl
```
```
sudo gedit projmgr
```
```
#!/bin/bash
cd /opt/cadence/allegro_166_patch/
source spb166
/opt/cadence/SPB166/tools/bin/projmgr
```
```
sudo chmod +x projmgr
```

## eagle 8.1.0
```
cd /usr/local/bin
sudo gedit eagle
```
```
#!/bin/bash
cd /opt/eagle-8.1.0/
./eagle
```
```
sudo chmod +x eagle
ls eagle -l
```

## kompozer
```
cd /usr/local/bin
sudo gedit kompozer
```
```
#!/bin/bash
cd /opt/kompozer/
./kompozer
```
```
sudo chmod +x kompozer
ls kompozer -l
```
    

***
# 安装csh
```
$ sudo aptitude install csh    
```


***
# 安装libxmu
```
sudo apt-get install libxmu-dev:i386 libxmu-headers:i386
Suggested packages:
  libice-doc:i386 libsm-doc:i386 libxcb-doc:i386 libxext-doc:i386
  libxt-doc:i386
The following NEW packages will be installed:
  libice-dev:i386 libpthread-stubs0-dev:i386 libsm-dev:i386 libx11-dev:i386
  libxau-dev:i386 libxcb1-dev:i386 libxdmcp-dev:i386 libxext-dev:i386
  libxmu-dev:i386 libxmu6:i386 libxt-dev:i386
0 upgraded, 11 newly installed, 0 to remove and 0 not upgraded.
```
到这里pad_designer可运行，但图形显示不对> 考虑用ldd去看缺啥



***
# 安装doxygen
```
$ sudo apt-get install fakeroot
$ sudo apt-get install doxygen 
Suggested packages:
  doxygen-latex doxygen-doc doxygen-gui graphviz
The following NEW packages will be installed:
  doxygen libclang1-3.5 libobjc-4.9-dev
    
$ sudo apt-get install doxygen-doc
 doxygen doxygen-doc libclang1-3.5 libobjc-4.9-dev  
    
$ sudo apt-get install doxygen-gui
 doxygen doxygen-gui libclang1-3.5 libobjc-4.9-dev
    doxygen-doc doxygen-gui
```
   
    
    
***
# 安装 graphviz
```
$ sudo apt-get install graphviz graphviz-doc
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  libcdt5 libcgraph6 libgvc6 libgvpr2 libpathplan4 libxdot4
Suggested packages:
  graphviz-doc
The following NEW packages will be installed:
  graphviz libcdt5 libcgraph6 libgvc6 libgvpr2 libpathplan4 libxdot4
0 upgraded, 7 newly installed, 0 to remove and 0 not upgraded.

$ gvedit
```
    
    
    
***
# 删除 spacefm
```
$ sudo apt-get purge spacefm*
The following packages will be REMOVED:
  spacefm* spacefm-common*
```
    
 
    
***
# 安装 udevil
```
$ sudo apt-get install udevil cifs-utils  
Suggested packages:
  cryptsetup curlftpfs sshfs
The following NEW packages will be installed:
  cifs-utils keyutils pmount udevil  
```
 

***
# 删除 xarchiver
```
$ sudo apt-get install xarchiver    
$ sudo apt-get install idesk
$ sudo apt-get purge xarchiver
$ sudo apt-get purge idesk
```
    
    
***
# 安装 fluid
```
$ sudo apt-get install fluid
``` 
    
    
***
# opera、chrome更新
chrome自动添加
```
deb http://dl.google.com/linux/chrome/deb/ stable main
opera自动添加
deb https://deb.opera.com/opera-stable/ stable non-free
$ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com D615560BA5C7FF72
$ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 1397BC53640DB551
```

更新完成之后删掉这些鸡巴源
```
$ sudo rm -rf /etc/apt/sources.list.d/
```


***
# 清理 <危险>
```
sudo apt-get install p11-kit:i386
$ sudo apt-get autoremove 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be REMOVED:
  bogofilter bogofilter-bdb bogofilter-common espeak-data gcr
  gir1.2-accountsservice-1.0 gir1.2-gck-1 gir1.2-gcr-3 gir1.2-gdm3
  gir1.2-gkbd-3.0 gir1.2-gnomebluetooth-1.0 gir1.2-gpaste-2.0 gir1.2-gtop-2.0
  gir1.2-ibus-1.0 gir1.2-mutter-3.0 gir1.2-networkmanager-1.0 gir1.2-nmgtk-1.0
  gir1.2-polkit-1.0 gir1.2-upowerglib-1.0 gir1.2-wnck-3.0 gir1.2-xkl-1.0
  gnome-backgrounds gnome-orca gnome-tweak-tool gpaste libdotconf0
  libedata-cal-1.2-23 libespeak1 libevolution libgdm1 libgpaste2
  libgtkhtml-4.0-0 libgtkhtml-4.0-common libgtkhtml-editor-4.0-0
  libgtkspell3-3-0 liblouis-data liblouis2 libpst4 libsonic0 libspeechd2
  libytnef0 mailnag mutter-dbg python-dirspec python-httplib2 python-jwt
  python-oauthlib python3-brlapi python3-louis python3-pyatspi python3-speechd
  python3-xdg speech-dispatcher speech-dispatcher-audio-plugins xbrlapi
0 upgraded, 0 newly installed, 55 to remove and 0 not upgraded.
    
$ sudo apt-get install bogofilter bogofilter-bdb bogofilter-common espeak-data gcr gir1.2-accountsservice-1.0 gir1.2-gck-1 gir1.2-gcr-3 gir1.2-gdm3 gir1.2-gkbd-3.0 gir1.2-gnomebluetooth-1.0 gir1.2-gpaste-2.0 gir1.2-gtop-2.0   gir1.2-ibus-1.0 gir1.2-mutter-3.0 gir1.2-networkmanager-1.0 gir1.2-nmgtk-1.0  gir1.2-polkit-1.0 gir1.2-upowerglib-1.0 gir1.2-wnck-3.0 gir1.2-xkl-1.0 gnome-backgrounds gnome-orca gnome-tweak-tool gpaste libdotconf0  libedata-cal-1.2-23 libespeak1 libevolution libgdm1 libgpaste2 libgtkhtml-4.0-0 libgtkhtml-4.0-common libgtkhtml-editor-4.0-0  libgtkspell3-3-0 liblouis-data liblouis2 libpst4 libsonic0 libspeechd2  libytnef0 mailnag mutter-dbg python-dirspec python-httplib2 python-jwt  python-oauthlib python3-brlapi python3-louis python3-pyatspi python3-speechd  python3-xdg speech-dispatcher speech-dispatcher-audio-plugins xbrlapi
```


***
# u盘挂载问题解决
The specified directory '/media/andy/0E1639780E163978' is not valid
```
$ sudo chmod 755 /media/andy  
```


***
# 安装 xournal
```
$ sudo apt-get install xournal ghostscript-x
```   


***
# 安装vpn
```
$ sudo apt-get install openvpn
$ sudo apt-get install pptp-linux
$ sudo apt-get install network-manager-openvpn network-manager-pptp network-manager-vpnc network-manager-openconnect network-manager-iodine
$ sudo apt-get install pppoe ppp pppoeconf pppconfig
```
nm-applet 在 network-manager-gnome,如果nm-applet用不了呢（添加VPN配置文件闪退），直接用gnome-control-center>network，添加VPN
```
$ sudo apt-get install network-manager-gnome network-manager-openconnect-gnome network-manager-openvpn-gnome network-manager-pptp-gnome network-manager-vpnc-gnome
$ sudo apt-get install keyutils
$ sudo apt-get install keyringer
```
Import saved VPN connection has been Recently Broken
```
http://cache.baiducontent.com/c?m=9f65cb4a8c8507ed4fece7631046903358438014628497492e8ed11bc5735b361b31a5a677654545cec67c6c07a54257feb56b32610c7be8d995c80ccabbe37b388856752358d117&p=c967d51986cc41ac5ab2c7710f4183&newp=84769a47808002e408e2947d0f5083231610db2151d4d2433c97d8&user=baidu&fm=sc&query=import+a+saved&qid=bd2c2ed10004bcf3&p1=3
```
```
$ sudo openvpn (path)/example.ovpn
/etc/NetworkManager/system-connections
$ sudo systemctl restart network-manager
```
```
$ sudo apt-get install libnm-glib-dev libnm-gtk-dev libnmz7-dev
$ sudo apt-get install libnm-glib-vpn-dev libnm-gtk-common libnm-util-dev
```
用这个工具实现VPN配置导入
```
$ gnome-control-center network 
``` 


***
# 显卡驱动
```
$ sudo dmesg | grep radeon
$ lspci -v | grep VGA
Enable non-free repository
$ sudo apt-get update
$ apt-cache show firmware-linux-nonfree | grep RV630
$ sudo apt-get install firmware-linux-nonfree
$ sudo /sbin/reboot
$ sudo apt-get install firmware-amd-graphics
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be REMOVED:
  firmware-linux-nonfree
The following NEW packages will be installed:
  firmware-amd-graphics
```

 
***
# 下载工具 uget
```
$ sudo apt-get install uget
```




***
# git也可以使用proxy代理
```
export https_proxy="127.0.0.1:8087"
export http_proxy="127.0.0.1:8087"
```
```
git config --global http.sslVerify false
##git config --global http.sslCAinfo /etc/ssl/certs/ca-certificates.crt
```

***
# apt-get 使用 proxy 代理加速
0.新建文件 apt_proxy_conf(文件名任意)内容如下：
```
Acquire::http::proxy "http://127.0.0.1:8087";
Acquire::ftp::proxy "http://127.0.0.1:8087";
Acquire::https::proxy "http://127.0.0.1:8087";
```
往后就可以在apt-get之后加上 -c apt_proxy_conf 来执行。

命令行指定也行
```
$ sudo apt-get -o Acquire::http::proxy="http://127.0.0.1:8087/" install gstreamer-sdk-dev  
```  
如果报错证书没有
```
E: Failed to fetch http://www.freedesktop.org/software/gstreamer-sdk/data/packages/debian/wheezy/amd64/./gstreamer-sdk-gstreamer-tutorials-dev_2013.6-1_amd64.deb  server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
```
添加证书
```
$ sudo cp CA.crt /etc/ssl/certs/ca-certificates.crt 
```    

为啥是/etc/ssl/certs？看上面提示，或者
```
$ sudo update-ca-certificates
Updating certificates in /etc/ssl/certs    
```

1.这是较常用的方法，修改/etc/apt/apt.conf,加入以下内容：
```
Acquire::http::Proxy "http://wilson_ke:password@10.0.0.1:63333";
Acquire::https::Proxy "http://wilson_ke:password@10.0.0.1:63333";
Acquire::ftp::Proxy "http://wilson_ke:password@10.0.0.1:63333";
```

2.修改/etc/bash.bashrc,加入以下内容:
```
export http_proxy=http://wilson_ke:password@10.0.0.1:63333
export https_proxy=http://wilson_ke:password@10.0.0.1:63333
export ftp_proxy=http://wilson_ke:password@10.0.0.1:63333
```

3.修改/etc/environment，加入以下内容:
```
http_proxy=http://wilson_ke:password@10.0.0.1:63333
https_proxy=http://wilson_ke:password@10.0.0.1:63333
ftp_proxy=http://wilson_ke:password@10.0.0.1:63333
```

4.修改~/.bashrc
```
http_proxy=http://wilson_ke:password@10.0.0.1:63333
https_proxy=http://wilson_ke:password@10.0.0.1:63333
ftp_proxy=http://wilson_ke:password@10.0.0.1:63333
```


***
# 添加 streamer-sdk
```
$ sudo apt-get autoremove
$ sudo apt-get clean && sudo apt-get autoclean
```
添加源
```
deb http://www.freedesktop.org/software/gstreamer-sdk/data/packages/debian/wheezy/amd64 ./
```
```
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 1900C4BE
//su -c 'wget -q -O - http://www.freedesktop.org/software/gstreamer-sdk/sdk.gpg | apt-key add -'
//su -c 'apt-get update'
$ sudo apt-get update
//su -c 'apt-get install gstreamer-sdk-dev'
$ sudo apt-get install gstreamer-sdk-dev
```
如果速度慢
```
$ sudo apt-get -o Acquire::http::proxy="http://127.0.0.1:8087/" install gstreamer-sdk-dev
```
设置环境变量的脚本
```
/opt/gstreamer-sdk/bin/gst-sdk-shell
```
gcc 参数
```
-Wl,-rpath=/opt/gstreamer-sdk/lib `pkg-config --cflags --libs gstreamer-0.10`
```
例子
```
$ gcc `pkg-config --cflags --libs gstreamer-0.10` basic-tutorial-1.c -o basic-tutorial-1
$ gcc `pkg-config --cflags --libs gstreamer-interfaces-0.10 gtk+-2.0 gstreamer-0.10` basic-tutorial-5.c -o basic-tutorial-5
```
测试
```
$ gst-launch-0.10 videotestsrc ! ffmpegcolorspace ! autovideosink
$ gst-launch-0.10 videotestsrc ! video/x-raw-gray ! ffmpegcolorspace ! autovideosink
$ gst-launch-0.10 audiotestsrc ! audioconvert ! autoaudiosink
$ gst-launch-0.10 videotestsrc pattern=11 ! ffmpegcolorspace ! autovideosink
$ gst-launch-0.10 videotestsrc ! ffmpegcolorspace ! tee name=t ! queue ! autovideosink t. ! queue ! autovideosink
$ gst-launch-0.10 souphttpsrc location=http://docs.gstreamer.com/media/sintel_trailer-480p.webm ! matroskademux name=d d.video_00 ! matroskamux ! filesink location=sintel_video.mkv
$ gst-launch-0.10 souphttpsrc location=http://docs.gstreamer.com/media/sintel_trailer-480p.webm ! matroskademux name=d d.audio_00 ! vorbisparse ! matroskamux ! filesink location=sintel_audio.mka
gst-launch-0.10 souphttpsrc location=http://docs.gstreamer.com/media/sintel_trailer-480p.webm ! matroskademux ! filesink location=test
gst-launch-0.10 souphttpsrc location=http://docs.gstreamer.com/media/sintel_trailer-480p.webm ! matroskademux ! video/x-vp8 ! matroskamux ! filesink location=sintel_video.mkv
gst-launch-0.10 playbin2 uri=http://docs.gstreamer.com/media/sintel_trailer-480p.webm
gst-launch-0.10 playbin2 uri=file:///home/andy/gst-sdk-tutorials/gst-sdk/tutorials/sintel_trailer-480p.webm
gst-launch-0.10 filesrc location=http://docs.gstreamer.com/media/sintel_trailer-480p.webm ! decodebin2 ! autovideosink
//gst-launch-0.10 filesrc location=file:///home/andy/gst-sdk-tutorials/gst-sdk/tutorials/sintel_trailer-480p.webm ! decodebin2 ! autovideosink
gst-launch-0.10 souphttpsrc location=http://docs.gstreamer.com/media/sintel_trailer-480p.webm ! matroskademux name=d ! queue ! vp8dec ! ffmpegcolorspace ! autovideosink d. ! queue ! vorbisdec ! audioconvert ! audioresample ! autoaudiosink
gst-launch-0.10 uridecodebin uri=http://docs.gstreamer.com/media/sintel_trailer-480p.webm name=d ! queue ! theoraenc ! oggmux name=m ! filesink location=sintel.ogg d. ! queue ! audioconvert ! audioresample ! flacenc ! m.
gst-launch-0.10 uridecodebin uri=file:///home/andy/gst-sdk-tutorials/gst-sdk/tutorials/sintel_trailer-480p.webm name=d ! queue ! theoraenc ! oggmux name=m ! filesink location=sintel.ogg d. ! queue ! audioconvert ! audioresample ! flacenc ! m.
gst-launch-0.10 uridecodebin uri=http://docs.gstreamer.com/media/sintel_trailer-480p.webm ! queue ! videoscale ! video/x-raw-yuv,width=320,height=200 ! ffmpegcolorspace ! autovideosink
gst-launch-0.10 uridecodebin uri=file:///home/andy/gst-sdk-tutorials/gst-sdk/tutorials/sintel_trailer-480p.webm ! queue ! videoscale ! video/x-raw-yuv,width=320,height=200 ! ffmpegcolorspace ! autovideosink
gst-inspect
gst-discoverer-0.10 http://docs.gstreamer.com/media/sintel_trailer-480p.webm -v
gst-discoverer-0.10 file:///home/andy/gst-sdk-tutorials/gst-sdk/tutorials/sintel_trailer-480p.webm -v
gst-launch-0.10 videotestsrc ! video/x-raw-rgb,framerate=30/1 ! videorate ! video/x-raw-rgb,framerate=1/1 ! ffmpegcolorspace ! autovideosink
gst-launch-0.10 uridecodebin uri=http://docs.gstreamer.com/media/sintel_trailer-480p.webm ! videoscale ! video/x-raw-yuv,width=178,height=100 ! ffmpegcolorspace ! autovideosink
gst-launch-0.10 uridecodebin uri=file:///home/andy/gst-sdk-tutorials/gst-sdk/tutorials/sintel_trailer-480p.webm ! videoscale ! video/x-raw-yuv,width=178,height=100 ! ffmpegcolorspace ! autovideosink
gst-launch-0.10 uridecodebin uri=http://docs.gstreamer.com/media/sintel_trailer-480p.webm ! audioresample ! audio/x-raw-float,rate=4000 ! audioconvert ! autoaudiosink
gst-launch-0.10 uridecodebin uri=file:///home/andy/gst-sdk-tutorials/gst-sdk/tutorials/sintel_trailer-480p.webm ! audioresample ! audio/x-raw-float,rate=4000 ! audioconvert ! autoaudiosink
gst-launch-0.10 audiotestsrc ! tee name=t ! queue ! audioconvert ! autoaudiosink t. ! queue ! wavescope ! ffmpegcolorspace ! autovideosink
```
<http://docs.gstreamer.com/display/GstSDK/Tutorials>



***
# 浏览器证书问题
chrome访问很多https网站弹出证书警示，需要将local/CA.crt证书导入
解决办法：
```
sudo apt-get install libnss3-tools
```
假设goagent在用户的家目录：
```
certutil -d sql:$HOME/.pki/nssdb -A -t "C,," -n GoAgent -i '~/goagent/local/CA.crt'
certutil -L -d sql:${HOME}/.pki/nssdb
```
重启chrome浏览器，这下ok了。
```  
$ sudo apt-get install libnss3-tools libnss3:i386
```
    
    
    
***
# 截图工具
```
$ sudo apt-get install shutter
```
简单截屏用gnome-screenshot
设置openbox快捷键rc.xml



***
# 剪贴板
```
//$ sudo apt-get install diodon
//$ sudo apt-get install klipper
$ sudo apt-get install parcellite
```


***
# battery monitor 电池电量显示
```
$ acpi
$ apt-cache search battery
$ sudo apt-get install ibam

$ git clone https://github.com/valr/cbatticon
$ cd cbatticon
$ make WITH_GTK3=0 WITH_NOTIFY=0
$ sudo make install
$ cbatticon &
```


***
# something
```
$ sudo apt-get install glibc-source
$ sudo apt-get install u-boot-tools lrzsz minicom nfs-kernel-server tftpd xinetd libncurses5-dev
$ sudo apt-get install slang-xfig
$ sudo apt-get install quilt
$ sudo apt-get install e2fsck-static
```
```
$ ls /bin/sh -l
/bin/sh -> dash
$ sudo rm /bin/sh
$ sudo ln -s /bin/bash /bin/sh
```
```
$ sudo apt-get install git-core libcrypt-ssleay-perl ccache libusb-dev libexpect-perl mono-devel
$ sudo apt-get install python3-dev python3-setuptools python3-crypto python3-keyring python3-lxml python3-pyinotify python3-secretstorage
$ sudo apt-get install python-pip
$ sudo apt-get install libssl-dev libssl1.0.0
$ sudo easy_install3 pip
Searching for pip
Reading https://pypi.python.org/simple/pip/
Download error on https://pypi.python.org/simple/pip/: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:600) -- Some packages may not be found!
Couldn't find index page for 'pip' (maybe misspelled?)
Scanning index of all packages (this may take a while)
Reading https://pypi.python.org/simple/
Download error on https://pypi.python.org/simple/: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:600) -- Some packages may not be found!
No local packages or download links found for pip
error: Could not find suitable distribution for Requirement.parse('pip')
$ wget http://curl.haxx.se/ca/cacert.pem
$ mv cacert.pem ca-bundle.crt
$ sudo cp ca-bundle.crt /etc/pki/tls/certs/
```
```
    /etc/pki/tls/certs/ca-bundle.crt not found
    On ubuntu/debian, this file is in /etc/ssl/certs/ca-certificates.crt. You could symlink it. 
    The /etc/pki/ path is used on Redhat.
```
```
$ sudo easy_install3 pip
Searching for pip
Reading https://pypi.python.org/simple/pip/
Best match: pip 9.0.1
Downloading https://pypi.python.org/packages/11/b6/abcb525026a4be042b486df43905d6893fb04f05aac21c32c638e939e447/pip-9.0.1.tar.gz#md5=35f01da33009719497f01a4ba69d63c9
Processing pip-9.0.1.tar.gz
Writing /tmp/easy_install-ksi97d1h/pip-9.0.1/setup.cfg
Running pip-9.0.1/setup.py -q bdist_egg --dist-dir /tmp/easy_install-ksi97d1h/pip-9.0.1/egg-dist-tmp-ipyv89t6
/usr/lib/python3.4/distutils/dist.py:260: UserWarning: Unknown distribution option: 'python_requires'
  warnings.warn(msg)
warning: no previously-included files found matching '.coveragerc'
warning: no previously-included files found matching '.mailmap'
warning: no previously-included files found matching '.travis.yml'
warning: no previously-included files found matching '.landscape.yml'
warning: no previously-included files found matching 'pip/_vendor/Makefile'
warning: no previously-included files found matching 'tox.ini'
warning: no previously-included files found matching 'dev-requirements.txt'
warning: no previously-included files found matching 'appveyor.yml'
no previously-included directories found matching '.github'
no previously-included directories found matching '.travis'
no previously-included directories found matching 'docs/_build'
no previously-included directories found matching 'contrib'
no previously-included directories found matching 'tasks'
no previously-included directories found matching 'tests'
Adding pip 9.0.1 to easy-install.pth file
Installing pip3.4 script to /usr/local/bin
Installing pip3 script to /usr/local/bin
Installing pip script to /usr/local/bin

Installed /usr/local/lib/python3.4/dist-packages/pip-9.0.1-py3.4.egg
Processing dependencies for pip
Finished processing dependencies for pip
```
```
$ sudo pip3 install --upgrade pycrypto
$ sudo pip3 install --upgrade keyring
    
$ sudo pip install requests
$ sudo apt-get install python-tk
    
$ sudo apt-get install mathomatic gnuplot rlwrap filelight baobab colordiff hardinfo calcurse when units freehdl
    
$ sudo apt-get install geda pcb gerbv geda-utils geda-examples geda-gschem geda-xgsch2pcb    
$ sudo apt-get install liblua5.1-0-dev liblua5.2-dev
$ sudo apt-get install scons
    
$ sudo apt-get install libluabind-doc libluabind-dev liblua5.2-dev libluabind0.9.1 liblua50-dev liblualib50-dev libluabind-examples liblua5.2-dev liblua5.1-0-dev  liblua50-dev

$ sudo apt-get install libtolua-dev libtolua++5.1-dev libimlib2 libimlib2-dev libiml0 libiml-dev    
$ sudo apt-get install games-minesweeper
$ sudo apt-get install libxp-dev libxp6 libxpa-dev libxpa1 libxplc0.3.13-dev libxplc0.3.13 xorg-dev xserver-xorg-dev primus-libs-ia32
$ sudo apt-get install libxtst6:i386 libxt6:i386 libxp6:i386 libxpa1:i386
    
$ sudo apt-get install libstdc++5 libstdc++5:i386
$ sudo apt-get install libc-dev libc6-amd64:i386    

$ sudo apt-get install mdbtools mdbtools-gmdb mdbtools-dev
$ sudo apt-get install unixodbc mdbtools
$ gmdb2    
```
```
/etc/udev/rules.d/51-altera-usb-blaster.rules
```
```
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6002", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6003", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6010", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6810", MODE="0666"
``` 
```
$ sudo apt-get install lzma lzma-dev liblzma-dev liblzma5 liblzma5:i386 python-lzma
$ sudo apt-get install devscripts
$ sudo apt-get install libxmu-dev:i386 libxmu-headers:i386
$ sudo apt-get install putty
$ sudo apt-get install hexedit dhex dmg2img
$ sudo apt-get install libxft2:i386
```
重装uex，bcomapre
``` 
$ sudo apt-get install isomaster    
$ sudo apt-get install okteta
    
$ sudo apt-get install gimagereader
$ sudo apt-get install bluefish
$ sudo apt-get install mldonkey-gui
$ sudo apt-get install bittorrent-gui rtorrent
$ sudo apt-get install ffmpeg   
    
$ sudo apt-get install shutter
$ sudo apt-get install calibre
$ sudo apt-get install mpv
$ sudo apt-get install golang
$ sudo apt-get install agrep
$ sudo apt-get install catfish
$ sudo apt-get install xdm   
    
peco
lucidor    
locator

$ sudo apt-get install libv4l-dev v4l-utils v4l-utils v4l-utils v4l-utils dov4l dv4l
$ sudo aptitude install libpulse-dev
$ sudo apt-get install libsdl-image1.2-dev libsdl1.2-dev libpulse-dev
$ sudo apt-get install libavcodec-dev libswscale-dev i2c-tools 
$ sudo aptitude install qt5-default
$ sudo apt-get install libqwt5-qt4 libqwt5-qt4-dev
$ sudo apt-get install qt4-dev-tools qt4-doc qt4-qtconfig qt4-demos qt4-designer qt4-qmlviewer
$ sudo apt-get install libqt4-sql-mysql 
$ sudo apt-get install libxcb1 libxcb1-dev libx11-xcb1 libx11-xcb-dev libxcb-keysyms1 libxcb-keysyms1-dev libxcb-image0 libxcb-image0-dev libxcb-shm0 libxcb-shm0-dev libxcb-sync-dev libxcb-render-util0 libxcb-render-util0-dev libxcb-xfixes0-dev
$ sudo apt-get install libxcb-keysyms1-dev libxcb-image0-dev libxcb-shm0-dev libxcb-icccm4-dev libxcb-sync0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-randr0-dev libxcb-render-util0-dev
    
$ sudo apt-get install qmlscene
$ sudo apt-get install gstreamer1.0-tools gstreamer1.0-doc gstreamer0.10-plugins-ugly gstreamer0.10-doc gstreamer-tools gstreamer-sdk-dev gstreamer-sdk gstreamer0.10-plugins-good gstreamer0.10-plugins-good
$ sudo apt-get install module-assistant build-essential
$ sudo apt-get install fakeroot dh-make debconf libstdc++5 linux-headers-$(uname -r)
$ sudo apt-get install xserver-xorg-video-fglrx fglrx-driver fglrx-control
$ sudo apt-get install libgl1-fglrx-glx fglrx-driver fglrx-control radeontool radeontop fglrx-atieventsd libdrm-radeon1 xserver-xorg-video-radeon   
$ sudo apt-get purge fglrx-modules-dkms
$ sudo apt-get purge glx-alternative-fglrx
    
$ sudo apt-get install fp-utils lksctp-tools dropbear
$ sudo apt-get install lazarus-ide mldonkey-server xcb lazarus   
    
$ sudo apt-get install bzr
$ bzr branch lp:onboard 
$ bzr help ssl.ca_certs
$ bzr branch lp:onboard ssl.cert_reqs=none    

    
sudo apt-get install privoxy
sudo apt-get install fbset
sudo apt-get install alien
sudo apt-get install xorriso
sudo apt-get install dumpet
sudo apt-get install squashfs-tools
sudo apt-get install jwm
sudo apt-get install lsb-core
sudo apt-get install librecad
sudo apt-get install dia

openproj

dpkg --add-architecture i386
sudo apt-get install libgtk2.0-0:i386 libcanberra-gtk0:i386 libdbus-glib-1-2:i386 libgconf-2-4:i386 liborbit-2-0:i386 libusb-0.1-4:i386 libgnomevfs2-0:i386 libice6:i386 libncurses5:i386 libsm6:i386 libxtst6:i386 libxt6:i386 libasound2:i386 libudev1:i386
sudo ln -siT /lib/i386-linux-gnu/libudev.so.1 /lib/i386-linux-gnu/libudev.so.0
sudo ln -s /lib/i386-linux-gnu/libusb-1.0.so.0.1.0  /lib/i386-linux-gnu/libusb-1.0.so
$ sudo apt-get install libdbus-glib-1-2
sudo apt-get install setserial
sudo apt-get install gcp
sudo apt-get install playonlinux
sudo apt-get install firefox-esr icedove
sudo apt-get install qtqr python-qrtools python-zbar
sudo apt-get install sqlitebrowser
sudo aptitude install sqlite3
sudo apt-get install libsqlite3-dev


sudo gedit /usr/bin/nutstore
sh -c "nohup ~/.nutstore/dist/bin/nutstore-pydaemon.py >/dev/null 2>&1 &"
sudo chmod +x /usr/bin/nutstore
/usr/local/bin    

    
sudo apt-get install libftdi-dev fxload libc6-dev libusb-dev build-essential
sudo apt-get install gddrescue
sudo apt-get install nrg2iso
sudo apt-get install gpicview
sudo apt-get install bchunk
steam
linking /home/andy/.steam/steam to /home/andy/.local/share/Steam
    
sudo apt-get install ngspice
sudo apt-get install libwxgtk3.0-dev libpangox-1.0-dev gnucap

audio-convert
sudo apt-get install lame vorbis-tools flac shntool bchunk
sudo apt-get install soundconverter

sudo apt-get install freemind freemind-browser freemind-plugins-script freemind-plugins-svg freemind-plugins-help

sudo apt-get install freecad kicad
sudo apt-get install electric
    
sudo apt-get install pv
sudo apt-get install mysql-server phpmyadmin
sudo apt-get install android-tools-adb
sudo aptitude install android-tools-fastboot
    
sudo apt-get install xinetd
sudo apt-get install telnetd-ssl
sudo apt-get install telnetd
sudo apt-get install imagej
sudo apt-get install gfortran cfortran liblapack-dev

sudo aptitude install gchempaint avogadro
sudo aptitude install step khelpcenter4
sudo aptitude install logisim
sudo aptitude install monodevelop

sublime

sudo aptitude install kchmviewer    
  
jlink
gftp
cpu-g
i-net
qucs
ltspice
    
sudo apt-get install geda pcb gerbv geda-utils geda-examples geda-gschem geda-xgsch2pcb
sudo apt-get remove geda-utils geda-xgsch2pcb pcb geda-gschem gerbv geda geda-examples geda-gattrib geda-gnetlist geda-gsymcheck pcb-common pcb-gtk geda-doc geda-symbols geda-gaf geda-xorn libgeda43 libgeda-common

sudo apt-get install geda-utils geda-xgsch2pcb pcb geda-gschem gerbv geda geda-examples geda-gattrib geda-gnetlist geda-gsymcheck pcb-common pcb-gtk geda-doc geda-symbols libgeda42 libgeda-common

sudo apt-get install games-minesweeper
    
fuseiso_20070708-3ubuntu1_amd64.deb
acetoneiso_2.4-1_amd64.deb
```


***
# 安装 kwplayer
```
sudo apt-get install python3-feedparser python3-html2text python3-ply kwplayer
//# dpkg -i kwplayer_xx.deb
//# apt-get -f install
```


***
# 重建 iptux
处理apt-get安装的iptux传输（准确说是发送）文件大小为0的问题
```
$ sudo apt-get install libgst-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  libgst7
The following NEW packages will be installed:
  libgst-dev libgst7

sudo apt-get purge iptux
sudo apt-get install git libgtk2.0-dev libgconf2-dev g++ make autoconf libtool automake
git clone git://github.com/iptux-src/iptux.git
cd iptux
./configure
make
sudo make install
iptux
```
iptux设置
```
为了与windows网络通信，
networking
把通信用的coding改成gbk    
候选设置是utf-16,utf-8
```
更新版本的用cmake编译
```
sudo apt-get install git libgtk2.0-dev libglib2.0-dev libgconf2-dev libgstreamer1.0-dev g++ make cmake
git clone git://github.com/iptux-src/iptux.git
cd iptux
mkdir build && cd build && cmake .. && make
sudo make install
iptux
```


***
# Unknown media type
```
Processing triggers for shared-mime-info (1.3-1) ...
Unknown media type in type 'all/all'
Unknown media type in type 'all/allfiles'
Unknown media type in type 'uri/mms'
Unknown media type in type 'uri/mmst'
Unknown media type in type 'uri/mmsu'
Unknown media type in type 'uri/pnm'
Unknown media type in type 'uri/rtspt'
Unknown media type in type 'uri/rtspu'
```
```
$ sudo gedit /usr/share/mime/packages/kde.xml
```
删除上面有关的部分内容


***
# freemat octave
```
$ sudo apt-get install freemat octave
```
运行 
```
freemat
```
或者
```
octave --force-gui
```


***
# 安装 xz
``` 
$ aptitude search lzma
$ sudo apt-get install lzma lzma-dev liblzma-dev liblzma5 liblzma5:i386 python-lzma
```
安装xz-git
5.2.2的xz-utils，默认配置安装后，要建立so文件的软链
```
./autogen.sh
./configure --prefix=/usr --disable-rpath --enable-werror
make
sudo make install
```
```
$ sudo rm /lib/x86_64-linux-gnu/liblzma.so.5
$ sudo ln -s /usr/lib/liblzma.so.5.2.2 /lib/x86_64-linux-gnu/liblzma.so.5
$ sudo ln -s /usr/lib/liblzma.so.5.2.2 /lib/x86_64-linux-gnu/liblzma.so
```
这样就能用-T=0 -z

卸载
```
sudo make uninstall
```
liblzma.so.5重新定向到liblzma.so.5.0

重装deb包就行

受liblzma.so.5影响的包,临时做软链接
```
$ sudo rm /lib/x86_64-linux-gnu/liblzma.so.5
$ sudo rm /lib/x86_64-linux-gnu/liblzma.so
$ sudo ln -s /lib/x86_64-linux-gnu/liblzma.so.5.0.0 /lib/x86_64-linux-gnu/liblzma.so.5

//sudo cp /mnt/e_win/debian/xz-utils/xz-git/src/xz/src/liblzma/.libs/liblzma.so.5.3.99 /lib/x86_64-linux-gnu/
//sudo rm /lib/x86_64-linux-gnu/liblzma.so.5
//cd /lib/x86_64-linux-gnu/
//ln -s liblzma.so.5.3.99 liblzma.so.5

// xz最新版可用，支持-T哦
$ xz --help
```


***
# 安装 gparted
```
$ sudo apt-get install gparted jfsutils gpart
```    


*** 
# gdb图形界面前端
```
$ sudo apt-get install ddd
```   


*** 
# ntfs文件系统的权限问题
```
sudo apt-get install ntfs-config
sudo ntfs-config
```
点击ok，勾选`Enable write support for external device`
```
$ sudo apt-get install fuse
$ id
$ sudo mount -t ntfs-3g -o users,auto,rw,dev,exec,locale=zh_CN.UTF-8 /dev/sdd1 /media/sdd1/
```


***
# ftp server
```
$ sudo apt-get install vsftpd
$ sudo gedit /etc/vsftpd.conf
```
```
#禁止匿名访问
anonymous_enable=NO
#接受本地用户
local_enable=YES
#允许上传
write_enable=YES
    
chroot_local_user=YES
allow_writeable_chroot=YES
```
更多见《Ubuntu 用vsftpd 配置FTP服务器》
```
$ sudo /etc/init.d/vsftpd restart
```

配置ftp受限账户,只用于远程访问用

收集资料
```
/etc/passwd中修改shell
/usr/sbin/nologin
```
用户禁止shell登录、允许ftp登录方法

最近装了个Ubuntu服务器，需要创建专用的ftp用户，为了安全要禁止ftp用户登录shell。按照在freebsd的操作习惯，我把ftp用户的shell设定为/usr/bin/nologin。岂料该用户居然无法登录ftp，把shell改成/bin/bash后，ftp又能登录了。难道不能禁止登录。网上一遍，解决方法居然很多，包括禁止22端口、设置/etc/hosts.deny或者/etc/hosts.allow等。然而这些方法都有不少局限性，最后发现原因是/usr/bin/nologin不在/etc/shells列表内，ftp登录时要检查该用户的shell设定是否正确，我把shell强行改成不存在的/usr/bin/nologin，结果就出错了。

修改/etc/shells，在shell列表中添加一行/usr/sbin/nologin。把ftp用户的shell改为/usr/sbin/nologin

```
cat /etc/passwd
cat /etc/group
cat /etc/passwd | grep ftp
cat /etc/group | grep ftp
```
```
sudo useradd andy-ftp -d /home/andy -s /usr/sbin/nologin
andy@debian-dell:~/Downloads$ sudo passwd andy-ftp
Enter new UNIX password: 
Retype new UNIX password: 
passwd: password updated successfully
andy@debian-dell:~/Downloads$ su - andy-ftp
Password: 
sudo usermod -s /bin/bash andy-ftp
andy@debian-dell:~/Downloads$ su - andy-ftp
Password: 
andy-ftp@debian-dell:~$ logout
andy@debian-dell:~/Downloads$ which nologin
/usr/sbin/nologin
andy@debian-dell:~/Downloads$ sudo usermod -s /usr/sbin/nologin andy-ftp
andy@debian-dell:~/Downloads$ su - andy-ftp
Password: 
This account is currently not available.
```

更改/etc/pam.d/vsftpd
```
#注释掉下列行
#auth required pam.shells.so
```
```
sudo /etc/init.d/vsftpd restart
```
这样可以用andy-ftp帐号访问ftp服务器，这个帐号不能登录shell
```
sudo usermod -d /home/andy/Downloads andy-ftp
$ chmod 777 ~/Downloads
```
```
sudo gedit /etc/vsftpd.conf
```
添加
```
user_config_dir=/etc/vsftpd/vsftpd_user_conf
```
```
sudo mkdir /etc/vsftpd/vsftpd_user_conf
sudo gedit /etc/vsftpd/vsftpd_user_conf/andy-ftp
```
禁止删除和重命名
```
write_enable=YES
cmds_denied=DELE,RNFR
```
可以从下面的命令选
```
cmds_allowed=ABOR,CWD,DELE,LIST,MDTM,MKD,NLST,PASS,PASV,PORT,PWD,QUIT,RETR,\ 
        RMD,RNFR,RNTO,SIZE,STOR,TYPE,USER,ACCT,APPE,CDUP,HELP,MODE,\ 
        NOOP,REIN,STAT,STOU,STRU,SYST 
cmds_denied=ABOR,CWD,DELE,LIST,MDTM,MKD,NLST,PASS,PASV,PORT,PWD,QUIT,RETR,\ 
        RMD,RNFR,RNTO,SIZE,STOR,TYPE,USER,ACCT,APPE,CDUP,HELP,MODE,\ 
        NOOP,REIN,STAT,STOU,STRU,SYST 
```
```
$ sudo gedit /etc/passwd
```
最后几行如下，注意andy-ftp后面几个数字，shell改成了/bin/false
```
ftp:x:130:140:ftp daemon,,,:/srv/ftp:/bin/false
andy-ftp:x:134:145::/home/andy/Downloads:/bin/false
mysql:x:131:141:MySQL Server,,,:/nonexistent:/bin/false
telnetd:x:132:143::/nonexistent:/bin/false
debian-tor:x:133:144::/var/lib/tor:/bin/false    
```


***
# 安装 genymotion android 模拟器
```
$ ./genymotion-2.6.0-linux_x64.bin -d /opt/
You can now use these tools from [/opt/genymotion]:
 - genymotion
 - genymotion-shell
 - gmtool
```
<https://help.ubuntu.com/community/VirtualBox>
```
If you update virtualbox. The modules and the module API may change. Which means you have to compile the modules for your kernel.

If you start an virtual machine in the gui you get a message. That you should run::

    $ sudo /etc/init.d/vboxdrv setup 

But there is no such script. But when you are starting virtualbox via CLI. You get informative message::

    WARNING: The character device /dev/vboxdrv does not exist.
        Please install the virtualbox-ose-dkms package and the appropriate headers, most likely linux-headers-generic. You will not be able to start VMs until this problem is fixed. 

So you have to install the virtualbox-ose-dkms::

    $ sudo apt-get install virtualbox-ose-dkms 

Then we can see if the vbox module is added::

    dkms status 

Then install it::

    $ # dkms install virtualbox/<version> $ sudo dkms install virtualbox/4.1.12 

If you dont have the kernel headers you will get this error::

    Error! Your kernel headers for kernel 3.2.0-26-generic cannot be found. Please install the linux-headers-3.2.0-26-generic package, or use the --kernelsourcedir option to tell DKMS where it's located 

So you have to install them::

    $ sudo apt-get install linux-headers-3.2.0-26-generic 

Then we have to 'start' the modules::

    $ sudo /etc/init.d/virtualbox start 
```

下载的镜像在
`/home/andy/.Genymobile/Genymotion/ova`


***
# locale
```
$ sudo gedit /etc/default/locale
```
```
#  File generated by update-locale
#LANG=en_US.UTF-8
LANGUAGE="en_US:en"
LANG="zh_CN.UTF-8"
#LANGUAGE="zh_CN:zh"
```
这样foxit就能完美注释了


***
# URL字符编码解码
url-encode
```
#!/usr/bin/perl
 
use URI::Escape;

print "Input original string:\n";
my $string = <STDIN>;
print "\nOriginal string:\n$string\n";

my $encode = uri_escape($string);
print "URL Encoded string:\n$encode\n\n";
```

url-decode
```
#!/usr/bin/perl
 
use URI::Escape;

print "Input original string:\n";
my $string = <STDIN>;
print "\nOriginal string:\n$string\n";

my $decode = uri_unescape($string);
print "URL Decoded string:\n$decode\n";

my $encode = uri_escape($decode);
print "URL Encoded string:\n$encode\n\n";
```
都chmod 777, 复制到/bin去, 就可以转换了


***
# realVNC
```
sudo apt-get remove tightvncserver
sudo apt-get remove vnc4server
sudo apt-get remove xtightvncviewer

sudo dpkg -i VNC-Server-6.0.2-Linux-x64.deb

Installed systemd unit for VNC Server in Service Mode daemon
Start or stop the service with:
  systemctl (start|stop) vncserver-x11-serviced.service
Mark or unmark the service to be started at boot time with:
  systemctl (enable|disable) vncserver-x11-serviced.service

Installed systemd unit for VNC Server in Virtual Mode daemon
Start or stop the service with:
  systemctl (start|stop) vncserver-virtuald.service
Mark or unmark the service to be started at boot time with:
  systemctl (enable|disable) vncserver-virtuald.service

sudo systemctl start vncserver-x11-serviced.service
sudo systemctl enable vncserver-virtuald.service
sudo systemctl enable vncserver-x11-serviced.service
Created symlink /etc/systemd/system/multi-user.target.wants/vncserver-x11-serviced.service → /usr/lib/systemd/system/vncserver-x11-serviced.service.
```
<https://www.realvnc.com/docs/man/vncserver-x11-serviced.html>

realvnc注册码
```
BQ24G-PDXE4-KKKRS-WBHZE-F5RCA
BQ24G-PDXE4-KKKRS-WBHZE-F5RCA
8ZEZH-QPANM-NX3A5-8C4TS-8B97A
7AB4X-3YNXF-C5MRR-59DJG-7HGNA
UPL8P-CN2MT-85ERA-N3E3B-GERDA
X24XP-V247M-HEMNV-ZTMZK-FNB7A
```
要在 realvnc server 的option选项里添加用户，默认是root，不能以root远程登录吧，就添加用户账户(经测试,root就可以,远程还是要输入一下用户名密码,如果已经普通用户登录了,就直接看到普通用户的桌面)

查看监听端口
```
netstat -tnl
```
重启服务
```
$ sudo service vncserver-virtuald restart
$ sudo service vncserver-x11-serviced restart
```


***
# teamviewer
```
sudo systemctl start teamviewerd.service
sudo systemctl enable teamviewerd.service
Created symlink /etc/systemd/system/multi-user.target.wants/teamviewerd.service → /etc/systemd/system/teamviewerd.service.
```


***
# 备份ackup_170617.tar.xz
不含/opt和/home


***
# ftp 服务器 bugfix
```
/etc/vsftpd.conf
/etc/vsftpd.chroot_list
/etc/vsftpd/vsftpd_user_conf/andy-ftp  
```
```
$ sudo gedit /etc/vsftpd.conf
```
添加
```
allow_writeable_chroot=YES
```
效果是避免
```
500 OOPS: vsftpd: refusing to run with writable root inside chroot()
```
```
chroot_local_user=YES
```
修改为
```
chroot_local_user=NO
```
效果是根目录换成了系统根目录，而不是限于ftp账户的目录

也可以
```
chroot_local_user=YES
chroot_list_enable=YES
chroot_list_file=/etc/vsftpd.chroot_list    
```
vsftpd.chroot_list里面是andy-ftp

效果是vsftpd.chroot_list里面的用户没有限制，可以访问系统根目录
而andy等普通用户没有权限在ftp客户端访问自己的home目录以外的目录

```
    1、当chroot_list_enable=YES，chroot_local_user=YES时，在/etc/vsftpd/chroot_list文件中列出的用户，可以切换到其他目录；未在文件中列出的用户，不能切换到其他目录。
    2、当chroot_list_enable=YES，chroot_local_user=NO时，在/etc/vsftpd/chroot_list文件中列出的用户，不能切换到其他目录；未在文件中列出的用户，可以切换到其他目录。
    3、当chroot_list_enable=NO，chroot_local_user=YES时，所有的用户均不能切换到其他目录。
    4、当chroot_list_enable=NO，chroot_local_user=NO时，所有的用户均可以切换到其他目录。 
```   
```
# local_umask=022
```  
修改为
```
local_umask=002
```
```
sudo /etc/init.d/vsftpd restart
```
到这里，普通用户andy还是可以通过ftp登录，这样还是不安全的

只允许指定用户登录ftp的方法，没有密码传输，更安全
```
$ sudo gedit /etc/vsftpd.conf
```
```
#/etc/ftpusers #这个黑名单总是有效的
#userlist_file=/etc/vsftpd.user_list #这名单根据下面设置是白名单, yes或no后面不要带任何东西, 否则设置会失效
userlist_enable=YES
userlist_deny=NO
```
```
$ man vsftpd.conf
```
```
cat /etc/vsftpd.user_list
```
```
# vsftpd userlist  
# If userlist_deny=NO, only allow users in this file  
# If userlist_deny=YES (default), never allow users in this file, and  
# do not even prompt for a password.  
# Note that the default vsftpd pam config also checks /etc/ftpusers  
# for users that are denied.  
andy-ftp
```
禁止某些用户登录的方法1，没有密码传输，更安全
```
$ sudo gedit /etc/vsftpd.conf
```
```
#/etc/ftpusers #这个黑名单总是有效的
#userlist_file=/etc/vsftpd.user_list #这名单根据下面设置是黑名单
userlist_enable=YES
userlist_deny=YES   
```
```
$ man vsftpd.conf
```
```
cat /etc/vsftpd.user_list
```
```
# vsftpd userlist  
# If userlist_deny=NO, only allow users in this file  
# If userlist_deny=YES (default), never allow users in this file, and  
# do not even prompt for a password.  
# Note that the default vsftpd pam config also checks /etc/ftpusers  
# for users that are denied.  
root  
bin  
daemon  
adm  
lp  
sync  
shutdown  
halt  
mail  
news  
uucp  
operator  
games  
nobody
andy
```
禁止某些用户登录的方法2，会要求密码

找ftpusers
```
$ man pam_ftp
```
```
$ cat /etc/pam.d/vsftpd
```
```
cat /etc/ftpusers
```
```
# /etc/ftpusers: list of users disallowed FTP access. See ftpusers(5).

# root
# daemon
# bin
# sys
# sync
# games
# man
# lp
# mail
# news
# uucp
# nobody

root  
bin  
daemon  
adm  
lp  
sync  
shutdown  
halt  
mail  
news  
uucp  
operator  
games  
nobody 
andy
```


***
# 用户、组、文件权限管理
查看所有用户
```
cat /etc/passwd
```
查看所有组
```
cat /etc/group
```
为了解决`cannot find name for group ID 145 145`

需要在/etc/group添加组描述

```
$ sudo gedit /etc/passwd  
andy-ftp:x:134:145::/home/andy/Downloads:/bin/false    
$ sudo gedit /etc/group
andy-ftp:x:145:
前面的1001组删掉
```
添加andy用户到andy-ftp组
```
$ sudo usermod -G andy-ftp andy
$ cat /etc/group
```
有变化
```
andy-ftp:x:145:andy
```
```
$ id andy
uid=1000(andy) gid=1000(andy) groups=1000(andy),145(andy-ftp)
```
但是ftp客户端默认新建文件、文件夹都是700权限（可以右键修改之），但是还是不方便

添加普通用户andy到andy-ftp用户组，也不能访问的嘛
    
## umask
```
默认情况下的umask值是022(可以用umask命令查看）
新建文件 时候的默认权限是644(掩码是022)
新建文件夹 时候的默认权限是755(掩码是022)
可以看出，权限就是
文件      666减umask
文件夹     777减umask
特例：文件权限为0的位对应umask位是7,对于文件来说6-7=-1,不应该有负值，所以还是0
```
    
## uid, gid,sticky(粘性)位
<http://www.cnblogs.com/zjutzz/p/4229856.html> 
```
set uid bit(SUID): 设置使文件在执行阶段具有文件所有者的权限.
set gid bit(SGID): 目录被设置该位后, 任何用户在此目录下创建的文件都具有和该目录所属的组相同的组.SGID位目录的文件，只有在复制时加上-p参数，才能保留原来的组群设置
             文件也是可以被设置为SGID的，比如一个可执行文件为赋予SGID，它就具有所有组的特权，任意存取所有组所能使用的系统资源，复制到拥有
sticky bit: 防删除位. 对文件使用sticky bit位. 设置该位后, 就算用户对目录具有读写权限, 也不能删除、移动该文件.
 
ls -l
rwsrw-r– 表示有setuid标志
rwxrwsrw- 表示有setgid标志
rwxrw-rwt 表示有sticky标志
SUID占用属主x（执行）位，SGID占用组x位，sticky-bit占用其他x位，
如果本来在该位上有x, 则这些特殊标志显示为小写字母 (s, s, t). 否则, 显示为大写字母 (S, S, T)

chmod 4777是设sid
chmod 2777是设置gid
chmod 1777是设sticky    

只说第一位8进制代表权限
0: 不设置特殊权限
1: 只设置sticky
2: 只设置SGID
3: 只设置SGID和sticky
4: 只设置SUID
5: 只设置SUID和sticky
6: 只设置SUID和SGID
7: 设置3种权限    
```

## chmod操作
<http://www.cnblogs.com/SunnyRainPlant/p/3749704.html>
```
r-->4
w-->2
x-->1    
    
chmod a+x filenema  

参数（例如上面的a+x）的三部分
u 文件属主权限
g 同组用户权限
o 其它用户权限
a 所有用户（包括以上三种）
    
+ 增加权限
- 取消权限
= 唯一设定权限
    
r 读权限
w 写权限
x 执行权限
X 表示只有当该档案是个子目录或者该档案已经被设定过为可执行。
s 文件属主和组id
l 给文件加锁，使其它用户无法访问
    
修改文件访问权限命令：chmod [-Rv] 0777 文件名
-v : 显示权限变更的详细资料
-R : 对目前目录下的所有档案与子目录进行相同的权限变更(即以递归的方式逐个变更) 
修改文件所属组命令：chgrp [-R] 组名 文件名
其中-R为递归设置
修改文件的所有者和组命令：chown [-R] 用户[:用户组] 文件名
其中-R为递归设置    
    
   
ls -al
-rw-------  1 root root    35 08-05 10:02 .lesshst
drwx------  3 root root  4096 08-02 14:54 .metacity
[权限属性信息] [文件数] [拥有者] [拥有者所属用户组] [大小] [最后修改时间] [文件名]    

文件属性这块共有十个字段，如：drwxr-xr-x
这10个列分成4块：[d] [rwx] [r-x] [r-x]
第一块：也就是第一列，用来表示这个文件的类型，有如下值：
（1）[ d ]则是目录，我这里的是d，表示的是一个目录
（2）[ - ]则是文件；
（3）[ l ]则表示为连结档(link file)；
（4）[ b ]则表示为装置文件里面的可供储存的接口设备；
（5）[ c ]则表示为装置文件里面的串行端口设备，例如键盘、鼠标。
第二块：第 2到4 列，表示文件拥有者的权限。
第三块：第5到7 列，表示拥有者同组人的权限。
第四块：第8到10列，表示是非拥有者组人的权限。
```
## 用户组
``` 
查看当前用户的用户组命令：groups
查看特定用户的用户组命令：groups username
第一个用户组为用户的有效用户组
$ groups
andy cdrom floppy audio dip video plugdev netdev lpadmin scanner bluetooth vboxusers
$ groups andy-ftp
andy-ftp : andy-ftp
    
切换有效用户组命令：newgrp 用户组名
要离开新的有效用户组，则输入exit回车
    
新建用户命令：useradd 用户名 -g 初始用户组 -G 其他用户组（修改/etc/group） -c 用户说明 -u 指定UID

建完用户需要为用户设置密码：passwd 用户名
passwd相关参数操作：
-l 锁用户
-u 解锁用户
-n 天数  密码不可改天数
-x 天数  密码过期天数
-w 天数  警告天数
    
修改用户信息命令：usermod 参数 用户名
参数:
-c 说明
-g 组名 初始用户组
-e 过期日期 格式：YYYY-MM-DD
-G 组名 其他用户组
-l 修改用户名
-L 锁定账号（在/etc/shadow文件中用户对应密码密码串的前面加上两个叹号(!!)）
-U 解锁

删除用户命令：userdel [-r] 用户名
参数-r为删除用户的home目录。
要完整删除一个用户和其文件要先找到系统其他地方属于他的文件：find / -user 用户名   
然后删除，再运行userdel删除用户。
    
查看可用shell命令：chsh -l
修改自己的shell命令：chsh -s

查看自己或某人UID/GID信息：id [用户名]

新增用户组命令：groupadd 用户组名
修改用户组名命令：groupmod -n 名称
删除用户组命令：groupdel 用户组名
设置用户组密码命令：gpasswd 用户组名    
设置用户组管理员命令：gpasswd -A 用户名 用户组名
添加某帐号到组命令：gpasswd -M 用户名 用户组名
从组中删除某帐号命令：gpasswd -d 用户名 用户组名    

```
    
根据上面的材料

修改了`/etc/vsftpd.conf`的`local_umask=002`
ftp新建一个文件夹xxxxxx
```
ls -l | grep xxxxxx
```
重启系统之后组用户andy就能删掉andy-ftp用户上传上来的文件夹和文件了


***
# 全局PATH修改
```
$ sudo leafpad /etc/profile
```
```
if [ "`id -u`" -eq 0 ]; then
  PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
else
  PATH="/usr/local/bin:/usr/bin:/bin:/sbin:/usr/local/games:/usr/games:/usr/sbin:/usr/local/sbin"
fi
export PATH
```


***
# tty1~7的开启
还是设置了吧原来就tty1是开的，现在全开;没有看出什么区别
```
$ for i in {1..7};do sudo systemctl enable getty@tty$i; done
```
检查
```
$ for i in {1..7};do echo -n "tty$i is ";systemctl is-enabled getty@tty$i; done
```
《[Ubuntu 17.04] XWayland on tty1, Xorg on tty2, tty3-8 not accessible》

 
***
# thunderbird
```
$ sudo apt-get install thunderbird lightning

Suggested packages:
  calendar-google-provider apparmor
```    
备份的配置文件可以还原


***
# 编译 gspiceui
```
sudo apt-get install libwxgtk3.0-dev libpangox-1.0-dev gnucap
cd gspiceui-v1.1.00
make GSPICEUI_WXLIB=3.0
sudo make install    
```


***
# 安装/恢复 Universe Sandbox 2
断网!!!

首先steam go offline

备份解压到
```
/home/andy/.steam/steam/steamapps/common/
```


***
# 安装 gwave(abort) 和 gaw
```
$ sudo apt-get install guile-2.0-libs guile-2.0-dev guile-cairo libgnome2-dev 
$ sudo apt-get install libgnome-2-0:i386 guile-1.8 guile-1.8-libs guile-library
```
编译gspiceui、gwave和gaw
```
configure: error: required guile module not found: (gnome-2)
    
This is because guile is installing itself in /usr/pkg/guile/1.8
instead of /usr/pkg, and guile-gnome hasn't been adjusted to match so
guile can't find it.

configure: error: Can not find Guile-gnome-platform
```
虽然deb包都安装了，但是还找不到 guile-gnome-platform，所以还是编译不了gwave2-20170109.tar.gz

<http://gwave.sourceforge.net/>

<http://gwave.sourceforge.net/oldbranch.html>

降版本编译gwave-20080127.tar.gz，还是不行
```
checking for GTK - version >= 1.2.1... no
```
下载   guile-gnome-platform 源码

编译安装之后还是找不到 guile-gnome-platform

不干了，不编译gwave2了

<https://www.gnu.org/software/guile/manual/html_node/Load-Paths.html>

看看configure文件
```
$ pkg-config --exists --print-errors "guile-gnome-gtk-2"
Package guile-cairo was not found in the pkg-config search path.
```
好像gwave源码要求了guile-cairo，这样就好办，找guile-cairo
```
$ sudo apt-get install guile-cairo-dev
````
至此configure通过

编译时候guile/gh.h找不到，在guile-1.8-dev里，解压到指定位置，编译能过这个，但是也会在后面错误，所以，彻底放弃这个gwave2



***
# 一些可以用的设置    
新建一个用户会产生一些默认配置，系统默认的配置在哪里呢
```
/etc/xdg
```
如果新建主目录
```
$ mkdir Desktop Downloads Templates Public Documents Music Pictures Videos    
$ chmod 777 Downloads (为了让ftp账户可以操作这个目录)
$ xscreensaver-demo
$ sudo apt-get install python3-urllib3 python-urllib3
``` 


***
# 安装zhcon(abort)
```
$ sudo aptitude install zhcon unicon-imc2
$ sudo apt-get remove unicon-imc2 zhcon
```


***
# console 英文化
修改配置文件
```
/etc/default/locale
```
将原来的配置内容修改为
```
LANG=”en_US.UTF-8″
LANGUAGE=”en_US:en”
```
再在终端下运行：
```
$ locale-gen -en_US:en
```
注销或重启后，Ubuntu Server真正服务器实体终端就恢复成了英文的语言环境。


***
# 恢复 nutstore
存档一个配置文件夹备份


***
# 使用 qvfb
在10.04上
```
$ dpkg -S /usr/bin/qvfb
```
可以知道qvfb在qt4-dev-tools包里
```
$ dpkg -s qt4-dev-tools
$ dpkg --listfiles qt4-dev-tools
```
找到了可执行文件在
```
/usr/lib/x86_64-linux-gnu/qt4/bin
```


***  
# bash prompt 修改
原始的PS1
```
echo $PS1
\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$
```
就是
```
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
```
等于
```
PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
```
临时修改成
```
PS1="\[\033[1;34m\][\$(date +%H%M)][\u@\h:\w]$\[\033[0m\] "
```
从cygwin来的也挺好看啊
```
PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ "
```
```
PS1="${debian_chroot:+($debian_chroot)}\[\033[0;32m\]\u@\h\[\033[00m\] \[\033[0;33m\]\w\[\033[00m\]\n\$ "
    
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
等于
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;33m\]\w\[\033[00m\]\n\$ "
```
参考关键词`bash_prompt`和`PS1`

```
echo -e "\033[1;33mxwx\033[00m"
echo -e "\033[0;33mxwx\033[00m"   
echo -e "\033[1;33;44mxwx\033[00m"
echo -e "\E[1;33;44mxwx\033[00m"  
```
```
\033=\E
\033[00m=\E(B\E[m
```

## bash prompt 有效控制字
```
1 加粗（高亮）
4 下划线
7 反相
9 删除线

for C in {30..47}; do     echo -en "\e[${C}m$C "; done
3+前景色彩代码0~7
for C in {0..255}; do     tput setaf $C;     echo -n "$C "; done
4+背景色彩代码0~7
for C in {0..255}; do     tput setab $C;     echo -n "$C "; done
```

```
Capability 	Escape sequence 	Description
Text attributes
blink 	\E[5m 	blinking text on
bold 	\E[1m 	bold text on
dim 	\E[2m 	dim text on
rev 	\E[7m 	reverse video on (switch text/background colors)
sitm 	\E[3m 	italic text on
ritm 	\E[23m 	italic text off
smso 	\E[7m 	highlighted text on
rmso 	\E[27m 	highlighted text off
smul 	\E[4m 	underlined text on
rmul 	\E[24m 	underlined text off
setab #1 	\E[4#1m 	set background color #1 (0-7)
setaf #1 	\E[3#1m 	set text color #1 (0-7)
sgr0 	\E(B\E[m 	reset text attributes
Cursor movement
sc 	\E7 	save cursor position
rc 	\E8 	restore saved cursor position
clear 	\E[H\E[2J 	clear screen and move cursor to top left
cuu #1 	\E[#1A 	move cursor up #1 rows
cud #1 	\E[#1B 	move cursor down #1 rows
cuf #1 	\E[#1C 	move cursor right #1 columns
cub #1 	\E[#1D 	move cursor left #1 columns
home 	\E[H 	move cursor to top left
hpa #1 	\E[#1G 	move cursor to column #1
vpa #1 	\E[#1d 	move cursor to row #1, first column
cup #1 #2 	\E[#1;#2H 	move cursor to row #1, column #2
Removing characters
dch #1 	\E#1P 	remove #1 characters (like backspacing)
dl #1 	\E#1M 	remove #1 lines
ech #1 	\E#1X 	clear #1 characters (without moving cursor)
ed 	\E[J 	clear to bottom of screen
el 	\E[K 	clear to end of line
el1 	\E[1K 	clear to beginning of line     
```


***
# 终端字符 logo
```
$ sudo apt-get install lsb-release scrot
$ sudo apt-get install screenfetch
wget http://github.com/downloads/djmelik/archey/archey-0.2.8.deb
    dpkg -i archey-0.2.8.deb
    then type "archey" in a terminal
```
<https://linoxide.com/ubuntu-how-to/install-archey-ubuntu>
<http://linuxforcynics.com/how-to/install-screenfetch-and-archey-in-ubuntu-or-debian>
```
$ wget http://served.kittykatt.us/projects/screenfetch/screenfetch-2.5.0.deb  
$ sudo dpkg -i screenfetch-2.5.0.deb 
```
   
<https://community.linuxmint.com/tutorial/view/850>
```
Install Archey:

    sudo apt-get install lsb-release scrot
    wget http://github.com/downloads/djmelik/archey/archey-0.2.8.deb
    sudo dpkg -i archey-0.2.8.deb

Install Screenfetch:

    Get: wget -O screenfetch 'https://raw.github.com/KittyKatt/screenFetch/master/screenfetch-dev'
    Make executable: chmod +x screenfetch
    Move: sudo mv screenfetch /usr/bin/
```


***
# qt5 examples
```    
$ sudo aptitude install qtbase5-examples    
```


***
# 为了运行pyw文件
```   
$ sudo apt-get install python3-tk    
```


***
# dos2unix
vim只能一个个转换，用这个配合脚本可以批量互相转换
``` 
$ sudo apt-get install dos2unix
```


***
# 编译TTKMusicplayer
```
$ sudo apt-get install libqt5x11extras5-dev libqt5multimediawidgets5 qtmultimedia5-dev qtmultimedia5-examples libphonon4qt5-4
    #不要安装libopusfile0 qmmp
//手动安装libqmmp
//http://mirrors.163.com/debian/pool/main/q/qmmp/
//http://mirrors.kernel.org/ubuntu/pool/universe/q/qmmp/
//libqmmp0_0.7.4-1_amd64.deb
//libqmmp-dev_0.7.4-1_amd64.deb
```


***
# pcmanfm 右键选择总是以某应用打开
还原这个目录的内容$HOME/.cache/menus  

就可有选择用什么默认程序打开了.依据是pcmanfm的archwiki


***
# pyqt
```
$ sudo apt-get install python3-pyqt5 python3-pyqt4 pyqt4-dev-tools pyqt5-dev-tools pyqt5-dev pyqt5-doc pyqt5-examples python-sip-doc
$ sudo apt-get install python-qt4-doc python-qt4 python-qt4-dev python-qt4-gl python-qt4-phonon python-qt4-sql python-qt4reactor python-sip-dev
$ sudo apt-get install ipython-qtconsole python-qscintilla2 ipython-doc libqscintilla2-designer
```


***
# mp4v2
```
$ sudo apt-get install mp4v2-utils libmp4v2-dev
```


***
# ffmpeg
```
$ sudo apt-get install libavformat-dev libavfilter-dev
$ sudo apt-get install libsdl2-dev
$ sudo apt-get install linphone
$ sudo apt-get install valgrind
```
/etc/apt/sources.list添加jessie-backports源
```
# Backports repository
deb http://httpredir.debian.org/debian jessie-backports main contrib non-free
```
```
$ sudo aptitude -t jessie-backports install libavformat-dev
$ sudo aptitude -t jessie-backports install libavfilter-dev
$ sudo aptitude -t jessie-backports install libavdevice-dev    
```
```
$ sudo apt-get install yasm
$ ffmpeg  -f  video4linux2  -s  320x240  -i  /dev/video0  ~/test.avi
```


***
# something
```
$ sudo apt-get install mono-vbnc
$ sudo apt-get install libx264-148 libx264-dev x264 libx265-dev x265 libx265-doc
$ x264 -V
$ sudo apt-get install libjs-excanvas
$ sudo dpkg -i mercurial-common_3.1.2-2+deb8u3_all.deb
$ sudo dpkg -i mercurial_3.1.2-2+deb8u3_amd64.deb
$ sudo apt-get install libglew-dev freeglut3-dev
```
```
/usr/lib/x86_64-linux-gnu/libGL.so.1: error adding symbols: DSO missing from command line
指定-lGL就可以
```

***
# latxt texlive
```
$ sudo apt-get install dia
$ sudo apt-get install latex-cjk-common latex-cjk-chinese latex-cjk-chinese-arphic-bkai00mp latex-cjk-chinese-arphic-bsmi00lp latex-cjk-chinese-arphic-gbsn00lp latex-cjk-chinese-arphic-gkai00mp
```
latxt太巨大了，又不会怎么用到，去他妈的，不用了，在win下用ctex很好很方便的
```
$ sudo apt-get install texlive-lang-chinese texlive-lang-cjk texlive-base
Suggested packages:
  hbf-kanji48 latexdiff latexmk dvidvi fragmaster lacheck purifyeps xindy
  chktex dvipng latex-fonts-sipa-arundina libtcltk-ruby dot2tex
The following NEW packages will be installed:
  fonts-ipaexfont-gothic fonts-ipaexfont-mincho fonts-ipafont-gothic
  fonts-ipafont-mincho fonts-texgyre latex-cjk-all latex-cjk-japanese
  latex-cjk-japanese-wadalab latex-cjk-korean latex-cjk-thai
  libfile-homedir-perl prerex preview-latex-style prosper swath tex-gyre
  texlive texlive-extra-utils texlive-fonts-recommended
  texlive-fonts-recommended-doc texlive-generic-recommended
  texlive-lang-chinese texlive-lang-cjk texlive-lang-japanese
  texlive-lang-korean texlive-lang-other texlive-latex-extra
  texlive-latex-extra-doc texlive-latex-recommended
  texlive-latex-recommended-doc texlive-pictures texlive-pictures-doc
  texlive-pstricks texlive-pstricks-doc tipa vprerex
```
```
$ sudo apt-get install dot2tex python3-pydot python-pydot xdot 
Suggested packages:
  latexdiff latexmk dvidvi fragmaster lacheck purifyeps xindy chktex dvipng
  libtcltk-ruby texlive-latex-extra
The following NEW packages will be installed:
  dot2tex libfile-homedir-perl pgf prerex preview-latex-style prosper
  python-pydot python3-pydot python3-pyparsing texlive-extra-utils
  texlive-generic-recommended texlive-latex-recommended
  texlive-latex-recommended-doc texlive-pictures texlive-pictures-doc
  texlive-pstricks texlive-pstricks-doc vprerex xdot
```
编辑好一个dot文件后，用xdot预览
```
xdot test1.dot
dot2tex test1.dot -o test1.tex
pdflatex test1.tex
```
就产生pdf文件
```
dot -Tpdf test2.dot -o test2.pdf
```
一样的效果



<https://tex.stackexchange.com/questions/137428/tlmgr-cannot-setup-tlpdb>

tlmgr install xxx 如果出现这样的错误
```
(running on Debian, switching to user mode!) cannot setup TLPDB in /home/USER/texmf at /usr/bin/tlmgr line 5308.
```
要初始化tlmgr仓库
```
$ tlmgr init-usertree
```
接下来如果出现这样的错误
```
  (running on Debian, switching to user mode!)
  Unknown directive ...containerchecksum
  c59200574a316416a23695c258edf3a32531fbda43ccdc09360ee105c3f07f9fb77df17c4ba4c2ea4f3a5ea6667e064b51e3d8c2fe6c984ba3e71b4e32716955...
  , please fix it! at /usr/share/texlive/tlpkg/TeXLive/TLPOBJ.pm line
  210, <$retfh> line 5579.
```
是 tlmgr 不是对应最新版本仓库导致的
<https://darrengoossens.wordpress.com/2016/06/20/a-little-trick-with-tlmgr-unknown-directive-containerchecksum-error/>
切换旧仓库
```
$ tlmgr option repository ftp://tug.org/historic/systems/texlive/2015/tlnet-final
```
这样差啥补啥吧，ctex cjk什么的包，碰到就算了，安装太巨大，用win下的ctex包更方便

```
$ pdflatex flowchar1.tex
```

前面的tex有关的包全安装上，磁盘足够用
```    
$ sudo apt-get install texlive-lang-chinese texlive-lang-cjk texlive-base
$ pdflatex --shell-escape --synctex=1 test.tex
```
主要是simyou.ttf、simsun.ttc字体找不到
<https://tex.stackexchange.com/questions/168732/how-to-install-correctly-simhei-ttf-and-simsun-ttc-for-pdflatex-on-tex-live-2013>

复制字体到/usr/share/texlive/texmf-dist/fonts/truetype
```
$ sudo mktexlsr
```
就可以用了
```
$ pdflatex --shell-escape --synctex=1 test.tex
```
搞几个tex编辑器, 特别是texstudio
```
$ sudo apt-get install lyx texstudio texworks
Suggested packages:
  rcs groff gnuhtml2latex wv chktex noweb sgmltools-lite linuxdoc-tools
  writer2latex latex2rtf texlive-xetex etoolbox lyx-dbg texworks-scripting-lua
  texworks-scripting-python
The following NEW packages will be installed:
  dvipng elyxer lyx lyx-common psutils texlive-generic-extra texlive-science
  texlive-science-doc texstudio texstudio-doc texstudio-l10n texworks
  texworks-help-en
```
查看系统中文字体
```
fc-list :lang=zh-cn
```
查看系统字体缓存
```
fc-cache -fv
```
```
/home/andy/.wine/drive_c/windows/Fonts
```
目前没有复制到系统字体的truetype下并在目录下执行
```
/usr/share/fonts/truetype
mkfontdir
mkfontscale
fc-cache
```


***
# UML建模工具
```
$ sudo apt-get install umbrello
```


***
# 结合emacs编辑的tex一体化工具
```
$ sudo apt-get install auctex
```


***
# something
```
$ sudo apt-get install phonon-backend-gstreamer libphonon4 libphonon-dev phonon
$ sudo apt-get install libqt4-phonon # 危险,不要用

$ sudo apt-get install intltool
$ sudo apt-get install libecm-dev
```


***
# 手动安装extra-cmake-modules
只有stretch及以上版本才有
<https://packages.debian.org/stretch/amd64/extra-cmake-modules/download>
jessie可以安装这个包。
```
FindKDE4Internal.cmake
$ sudo aptitude -t jessie-backports install kdelibs5-dev
The following NEW packages will be installed:
  automoc{a} kdelibs5-dev libkidletime4{a} libkimproxy4{a} libknewstuff2-4{a} libkrossui4{a} libkunitconversion4{a} libkutils4{a} 
  libsoprano-dev{a}
```


***
# 链接用引号包起来
```
aria2c "url"
```


***
# language: rust
```
install:
  - sudo add-apt-repository "deb mirror://mirrors.ubuntu.com/mirrors.txt trusty main restricted universe multiverse" -y
  - sudo apt-get update -qq
  - sudo apt-get install -qq libqt5core5a libqt5gui5 libqt5quick5 libqt5qml5 qtbase5-dev qtdeclarative5-dev cmake
```


***
# qtquickc
```
sudo apt-get install qtquickcontrols5-examples qtquickcontrols5-doc-html qtquick1-5-examples qtquick1-5-dev libqt5core5a libqt5gui5 libqt5quick5 libqt5qml5 qtbase5-dev qtdeclarative5-dev cmake
```
qml文件中
```
import QtQuick 2.2
import QtQuick.Controls 1.2
```
要用qmlscene而不是qmlviewer
```
$ qmlscene application.qml
```


***
# dns服务器搭建
```
$ sudo apt-get install bind9 dnsutils bind9-doc
$ sudo gedit /etc/bind/named.conf.options
forwarders {
		8.8.8.8;
	};
$ sudo /etc/init.d/bind9 restart
$ sudo gedit /etc/resolv.conf
```
未完,不研究这个了


***
# 一些硬件查询命令
```
$ sudo apt-get install ufraw
$ sudo apt-get install lsscsi lshw
$ sudo apt-get install inxi
```
查看 CPU 和处理单元的信息
```
$ lscpu
```
查看 PCI 总线相连的设备的详细信息
```
$ lspci
```
过滤pci设备,比如显卡
```
$ lspci -v | grep "VGA"
$ lspci -v | grep "VGA" -A 12
```
列出多种硬件单元的详细或者概要的信息，比如 CPU、内存、usb 控制器、硬盘等。lshw能够从各个“/proc”文件中提取出相关的信息
```
$ lshw -short
```
列出像硬盘和光驱等 scsi/sata 设备的信息
```
$ lsscsi
```
列出 USB 控制器和与 USB 控制器相连的设备的详细信息
```
$ lsusb
```

Inxi是一个 bash 脚本，能够从系统的多个来源和命令获取硬件信息，并打印出一个非技术人员也能看懂的友好的报告
```
$ inxi -Fx
```

列出不同分区的概要信息、挂载点、已用的和可用的空间
```
$ df -H
```
查看系统中使用的、闲置的和 RAM 的总体数量
```
$ free -m
```

用 dmidecode 从硬件中的 DMI 表中读取信息

查看处理器的信息
```
$ sudo dmidecode -t processor
```
看内存的信息
```
$ sudo dmidecode -t memory
```
查看 bios 的信息
```
$ sudo dmidecode -t bios
```

hdparm命令可以用来显示像硬盘这样的 sata 设备的信息
```
$ sudo hdparm -i /dev/sda
```

文件数目参考javfree


***
# 锁屏
```
gnome-screensaver-command -l
slimlock
xscreensaver-command --lock
```
slock 这个空白正常，输入正确login就能进桌面

在~/.config/rc.xml 合适位置添加如下内容
```
    <keybind key="W-l">
      <action name="Execute">
        <command>xscreensaver-command --lock</command>
        <startupnotify>
          <enabled>yes</enabled>
          <name>Lock Screen</name>
        </startupnotify>
      </action>
    </keybind>
```
然后运行`reconfigure openbox`，就可以通过快捷键锁屏了


***
# opencv
```
$ sudo apt-get install libcv-dev libopencv-dev opencv-data opencv-doc python-opencv
The following extra packages will be installed:
  libcvaux-dev libdc1394-22-dev libhighgui-dev libilmbase-dev libjasper-dev
  libopencv-calib3d-dev libopencv-contrib-dev libopencv-core-dev
  libopencv-features2d-dev libopencv-flann-dev libopencv-gpu-dev
  libopencv-gpu2.4 libopencv-highgui-dev libopencv-imgproc-dev
  libopencv-legacy-dev libopencv-ml-dev libopencv-objdetect-dev
  libopencv-ocl-dev libopencv-ocl2.4 libopencv-photo-dev libopencv-photo2.4
  libopencv-stitching-dev libopencv-stitching2.4 libopencv-superres-dev
  libopencv-superres2.4 libopencv-ts-dev libopencv-ts2.4 libopencv-video-dev
  libopencv-videostab-dev libopencv-videostab2.4 libopencv2.4-java
  libopencv2.4-jni libopenexr-dev libraw1394-dev libraw1394-tools
Suggested packages:
  libraw1394-doc
```


***
# 条形码工具 bar code
```
$ sudo apt-get install zbar-tools barcode
```


***
# 安装 amule
```
$ sudo apt-get install amule amule-utils-gui amule-gnome-support
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  amule-common amule-utils libcrypto++9
The following NEW packages will be installed:
  amule amule-common amule-gnome-support amule-utils amule-utils-gui
  libcrypto++9
```


***
# 安装mldonkey
```
$ sudo apt-get install mldonkey-gui mldonkey-server
```
mldonkey本身没有图形界面，所以你看不到它的运行。可以尝试打开网页：http://127.0.0.1:4080，进入 mldonkey

网页使用还是多有不便，我们推荐使用 mldonkey 的图形前端软件：mldonkey-gui 或kmldonkey
```
$ sudo apt-get install kmldonkey
```
```
$ mlnet
```
打开浏览器 http://127.0.0.1:4080/ 或 http://localhost:4080/

kmldonkey设置参考

Linux电驴:mldonkey初体验
<http://www.mintos.org/skill/linux-mldonkey-skill.html>


***
# something
```
sudo apt-get install bluez bluez-hcidump
sudo apt-get install blueman gnome-bluetooth
sudo apt-get purge blueman gir1.2-appindicator3-0.1 libappindicator3-1 libdbusmenu-gtk3-4 libindicator3-7

sudo apt-get install kscope cscope ctags
$ kscopeapp
sudo apt-get purge kscope

sudo apt-get install bison g++-multilib git gperf libxml2-utils make python-networkx zip
sudo apt-get install flex libncurses5-dev zlib1g-dev gawk minicom
Android源代码的下载需要使用repo

sudo apt-get install remake
```


***
# 像ubunut一样使用add-apt-repository
```
$ sudo apt-get install python-software-properties 
The following NEW packages will be installed:
  python-software-properties unattended-upgrades

$ sudo apt-get install software-properties-common
The following NEW packages will be installed:
  python3-software-properties software-properties-common
```


***
# 自动挂载移动硬盘为uuid
用gparted删除卷标就可以了
```
sudo blkid
```

Permissions in external NTFS devices
```
sudo gedit /etc/udev/rules.d/99-usb-disks.rules
```
添加
```
ENV{ID_FS_TYPE}=="ntfs", ENV{ID_FS_TYPE}="ntfs-3g"
```
```
cat /etc/mtab
```
没有default_permissions了吧

缺陷是对vfat文件系统无效

勉强算是一个解决方法吧,可以看出还是能够修改通过udev的挂载点权限的
```
sudo udevadm control --reload-rules
```


***
# ntfs分区修复
```
sudo ntfsfix /dev/sda6
```


***
# usbmount
```
sudo apt-get install usbmount
```
这个vfat格式挂载出来也还可以了,但是位置名称还是很扯.
```
sudo apt-get purge usbmount
```


***
# udev
```
umount /dev/sdd1
udisksctl mount -b /dev/sdd1 -o dmask=0022
sudo udevadm info -a -p $(udevadm info -q path -n /dev/sdd1)
sudo udevadm monitor --environment --udev
sudo udevadm info -a -n /dev/sdd1
sudo udevadm test $(udevadm info -q path -n /dev/sdd1) 2>&1
$ sudo journalctl -f
```

```
$ sudo gedit /etc/udev/rules.d/99-usb-disks.rules
```
```
KERNEL=="sd[a-z]*", ACTION=="add", RUN="/bin/systemctl restart media-mymount@%k.service"
```
```
$ sudo gedit /etc/systemd/system/media-mymount@.service
```
```
[Service]
Type=forking
GuessMainPID=no
ExecStart=/usr/bin/udisksctl mount -o dmask=0022 -b /dev/%I
```
```
$ sudo gedit /etc/udev/rules.d/99-usb-disks.rules
```
```
KERNEL=="sd[a-z]*", ACTION=="add", RUN="/bin/systemctl restart media-mymount@%k.service"
```
```
$ sudo gedit /etc/systemd/system/media-mymount@.service
```
```
[Service]
Type=forking
GuessMainPID=no
ExecStart=/home/andy/workspace/test.sh %I
```
```
$ gedit /home/andy/workspace/test.sh
```
```
#!/bin/bash

if ! [ "$1" ]
then
    echo "missing arguments!"
    exit 1
else
    dev=$1
fi
sleep 1
echo $dev
umount /dev/$dev
udisksctl mount -b /dev/$dev -o dmask=0022
```
```
sudo udevadm control --reload-rules
sudo udevadm trigger
sudo /etc/init.d/udev restart
sudo systemctl daemon-reload
```


***
# icon 图标
```
$ sudo apt-get install gtrayicon
$ sudo apt-get install gnome-icon-theme gnome-icon-theme-extras
```


***
# 解决obmenu-generator失效的问题
```
sudo cpanm --reinstall Linux::DesktopFiles
sudo cpanm --reinstall Data::Dump
```

***
# apache2服务启动失败的问题
```
sudo apt-get purge apache2 apache2-utils apache2-doc
sudo apt-get install apache2 apache2-utils apache2-doc
```

***
# mysql-server phpmyadmin的报错
```
sudo apt-get install mysql-server phpmyadmin --reinstall
sudo apt autoremove
```
root_bk171118.tar.xz还原后

已知出现过php运行不正常的情况,可以这样恢复正常. 但有时候恢复了,又能用.(难道和~下面的config有关?)
```
sudo apt-get purge mysql-server phpmyadmin
sudo apt-get autoremove
sudo apt-get install mysql-server phpmyadmin
```
<http://localhost/phpmyadmin/user_password.php>
```
root
*
```

***
# udev

没有用,最后确认更新udisk2才行
```
$ sudo aptitude -t jessie-backports install udev udevil systemd-sysv libudev-dev libpam-systemd
The following packages will be upgraded: 
  ifupdown libapparmor1 libpam-systemd libsystemd0 libsystemd0:i386 libudev-dev libudev1 libudev1:i386 systemd systemd-sysv udev 
  udevil usb-modeswitch 
13 packages upgraded, 0 newly installed, 0 to remove and 386 not upgraded.
Need to get 4,940 kB of archives. After unpacking 699 kB will be freed.
```
增加stretch源,更新一把udev,没有用,最后确认更新udisk2才行
```
$ sudo apt-get install udev udevil systemd-sysv libudev-dev libpam-systemd
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following package was automatically installed and is no longer required:
  libc6-i686:i386
Use 'apt-get autoremove' to remove it.
The following extra packages will be installed:
  bash-completion binutils console-setup console-setup-linux dmsetup ebtables hdparm init-system-helpers kbd keyboard-configuration
  libc-bin libc-dev-bin libc-l10n libc6 libc6:i386 libc6-amd64:i386 libc6-dbg libc6-dev libc6-dev-i386 libc6-dev-x32 libc6-i386
  libc6-i686:i386 libc6-x32 libdevmapper1.02.1 libfdisk1 libgssapi-krb5-2 libgssapi-krb5-2:i386 libip4tc0 libk5crypto3
  libk5crypto3:i386 libkrb5-3 libkrb5-3:i386 libkrb5support0 libkrb5support0:i386 liblvm2app2.2 liblz4-1 liblz4-1:i386 libmount1
  libncurses5 libncurses5:i386 libncurses5-dev libncursesw5 libncursesw5-dev libseccomp2 libselinux1 libselinux1:i386
  libselinux1-dev libsepol1 libsepol1-dev libsmartcols1 libsystemd0 libsystemd0:i386 libtinfo-dev libtinfo5 libtinfo5:i386 libtirpc1
  libudev1 libudev1:i386 linux-libc-dev locales lvm2 mount ncurses-bin nfs-common nfs-kernel-server rpcbind setserial systemd
  sysvinit-utils util-linux
Suggested packages:
  binutils-doc apmd libc-l10n:i386 locales:i386 krb5-doc krb5-user krb5-doc:i386 krb5-user:i386 ncurses-doc thin-provisioning-tools
  open-iscsi watchdog systemd-ui systemd-container curlftpfs sshfs
The following NEW packages will be installed:
  libc-l10n libfdisk1 libip4tc0 liblvm2app2.2 liblz4-1 liblz4-1:i386
The following packages will be upgraded:
  bash-completion binutils console-setup console-setup-linux dmsetup ebtables hdparm init-system-helpers kbd keyboard-configuration
  libc-bin libc-dev-bin libc6 libc6:i386 libc6-amd64:i386 libc6-dbg libc6-dev libc6-dev-i386 libc6-dev-x32 libc6-i386
  libc6-i686:i386 libc6-x32 libdevmapper1.02.1 libgssapi-krb5-2 libgssapi-krb5-2:i386 libk5crypto3 libk5crypto3:i386 libkrb5-3
  libkrb5-3:i386 libkrb5support0 libkrb5support0:i386 libmount1 libncurses5 libncurses5:i386 libncurses5-dev libncursesw5
  libncursesw5-dev libpam-systemd libseccomp2 libselinux1 libselinux1:i386 libselinux1-dev libsepol1 libsepol1-dev libsmartcols1
  libsystemd0 libsystemd0:i386 libtinfo-dev libtinfo5 libtinfo5:i386 libtirpc1 libudev-dev libudev1 libudev1:i386 linux-libc-dev
  locales lvm2 mount ncurses-bin nfs-common nfs-kernel-server rpcbind setserial systemd systemd-sysv sysvinit-utils udev udevil
  util-linux
69 upgraded, 6 newly installed, 0 to remove and 3564 not upgraded.
Need to get 54.5 MB of archives.
After this operation, 14.3 MB of additional disk space will be used.
```
没有用,最后确认更新udisk2才行
```
$ sudo apt-get install fuse fusefat 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  libfuse2
The following NEW packages will be installed:
  fusefat
The following packages will be upgraded:
  fuse libfuse2
2 upgraded, 1 newly installed, 0 to remove and 3562 not upgraded.
Need to get 226 kB of archives.
After this operation, 113 kB of additional disk space will be used.
```
到下面这个,真正有效了,u盘在media下的mount点权限就给得基本上满意了
```
$ sudo apt-get install udisks2
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  libudisks2-0
Suggested packages:
  btrfs-progs btrfs-tools cryptsetup-bin mdadm reiserfsprogs xfsprogs
The following packages will be upgraded:
  libudisks2-0 udisks2
2 upgraded, 0 newly installed, 0 to remove and 3560 not upgraded.
Need to get 392 kB of archives.
After this operation, 135 kB disk space will be freed.
```


***
# something
```
sudo apt-get install fbterm fbterm-ucimf
The following NEW packages will be installed:
  fbterm fbterm-ucimf libucimf0 ucimf

sudo apt-get install libucimf0 ucimf-openvanilla openvanilla-imgeneric

libucimf0 is already the newest version.
libucimf0 set to manually installed.
The following extra packages will be installed:
  openvanilla-imgeneric-data-all openvanilla-imgeneric-data-ja
  openvanilla-imgeneric-data-ko openvanilla-imgeneric-data-th
  openvanilla-imgeneric-data-vi openvanilla-imgeneric-data-zh-cn
  openvanilla-imgeneric-data-zh-hk openvanilla-imgeneric-data-zh-tw

sudo apt-get install xfonts-wqy
sudo apt-get install git-cola
```


***
# qt
解压 qt 4.7 的三个包


***
# leafpad乱码问题
```
leafpad --codeset=gbk
```


***
# wqy fonts
```
sudo apt-get install ttf-wqy-zenhei fonts-wqy-zenhei ttf-wqy-microhei
sudo dpkg-reconfigure locales
sudo apt-get install fonts-noto fonts-arphic-ukai
```
<http://edyfox.codecarver.org/html/debian_testing_chinese.html>

和`/usr/share/fontconfig/conf.avail`

搞一个`~/.config/fontconfig/fonts.conf`

刷新字体缓存
fc-cache -f -s -v


***
# vivado安装后有一个烦人的Xilinx Information Center
<https://wiki.archlinux.org/index.php/Autostarting_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#.E5.9B.BE.E5.BD.A2.E7.A8.8B.E5.BA.8F>
<https://wiki.archlinux.org/index.php/Desktop_entries#Autostart>
可知在
```
/etc/xdg/autostart/
~/.config/autostart/
```
中的desktop文件会被自动运行

删掉里面的Xilinx Information Center就好


***
# 分辨率设置
`lxrandr`


***
# debiancn源
```
sudo apt update;
sudo apt install apt-transport-https;
printf "deb https://repo.debiancn.org/ unstable main" > /etc/apt/sources.list.d/debiancn.list;
wget https://repo.debiancn.org/pool/main/d/debiancn-keyring/debiancn-keyring_0~20161212_all.deb -O /tmp/debiancn-keyring.deb;
apt install /tmp/debiancn-keyring.deb;
apt update;

W: GPG error: https://repo.debiancn.org jessie InRelease: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 0D466E1DA2992C9C
andy@debian-dell ~
$ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0D466E1DA2992C9C
```
有一些有趣的包


***
# 外观管理器
```
xfce4-appearance-settings
```
选择font


***
# bcompare中文部分不正常
option里面fonts选择simsun


***
# fcitx
/etc/environment中加入：
```
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```
好像foxit reader也还是不能输入中文呢
这个配置在`~/.xinitrc`中已经有了

foxit reader linux版本也还好用啊, 那还wine个屁



***
# pcmanfm的menu
```
sudo aptitude install libjs-jquery-livequery lxmenu-data
```
<https://forums.linuxmint.com/viewtopic.php?t=53986>
```
~/.config/openbox/environment
# Set up environmental variables for Openbox
# Set up applications menu for pcmanfm
export XDG_MENU_PREFIX="lxde-"

Then logged out and back in and it worked.
```
work?work个屁啊,更新了之后pcmanfm的menu://applications/就没有任何东西

不管了, 用nautilus去管理也能管用

```
sudo apt-get install menu menu-xdg
update-menus
```


***
# something
```
$ sudo apt-get install mtd-utils
$ sudo apt-get install linux-source-3.16
$ sudo apt-get install linux-source-4.9
```


***
# IPv6 Linux
安装虚拟网卡miredo
```
sudo apt-get install miredo
sudo miredo
```
重启系统之后，需要重新开启miredo


***
# 安装 ise 14.7
```
$ sudo apt-get install fxload
git clone git://git.zerfleddert.de/usb-driver

$ ./setup_pcusb /opt/Xilinx/14.7/ISE_DS/ISE
```

`lsusb`

```
Bus 001 Device 004: ID 03fd:0008 Xilinx, Inc.
```

ise的启动desktop
```
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=ISE 14.7
Comment=ISE 14.7
Icon=/opt/Xilinx/14.7/ISE_DS/ISE/data/images/pn-ise.png
Exec=/opt/Xilinx/14.7/ISE_DS/ise
```

/opt/Xilinx/14.7/ISE_DS/ise
```
#!/bin/bash
ISE_DS_DIR=/opt/Xilinx/14.7/ISE_DS
export gmake=/usr/bin/make

cd "$ISE_DS_DIR"
source "$ISE_DS_DIR"/settings64.sh

export LANG=''  # reset locale to English to fix decimal/comma seperation

"$ISE_DS_DIR"/ISE/bin/lin64/ise

```
记得给777权限


***
# ubifs
在PC上ubuntu使用mkfs.ubifs and ubinize,则我们要用普通的gcc来编译它们，

同时在ubuntu上装上lzo库：
```
sudo apt-get install liblzo2-dev
```
ubiformat用arm-gcc编译


***
# geany
```
$ sudo apt-get install geany geany-common
```


***
# somethinh
```
$ sudo apt-get install python-bsddb3
$ sudo apt-get install gnote
$ sudo apt-get install gnome-search-tool
```

***
# 安装arm-linux-gnueabihf-gcc等等
```
$ sudo apt-get install binutils-arm-linux-gnueabihf c-compiler-arm-linux-gnueabi
```
<https://wiki.debian.org/CrossToolchains>
```
$ deb http://emdebian.org/tools/debian/ jessie main
// curl http://emdebian.org/tools/debian/emdebian-toolchain-archive.key | sudo apt-key add -

$ sudo apt-get install emdebian-archive-keyring
$ sudo apt-get update
$ sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 7DE089671804772E
$ sudo dpkg --add-architecture armhf
```
源整理virtualbox等关闭,163和aliyun的源都没有支持所有架构,http://mirrors.ustc.edu.cn/debian/还行

http://ftp.hk.debian.org/debian/

http://ftp.jp.debian.org/debian/

http://ftp.tw.debian.org/debian/

http://ftp.kr.debian.org/debian/

```
$ sudo apt-get update
$ sudo apt-get install cross-gcc-dev
$ sudo apt-get install crossbuild-essential-armhf
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  cpp-4.9-arm-linux-gnueabihf dpkg-cross g++-4.9-arm-linux-gnueabihf
  g++-arm-linux-gnueabihf gcc-4.9-arm-linux-gnueabihf gcc-4.9-base:armhf
  gcc-arm-linux-gnueabihf libasan1:armhf libatomic1:armhf libc6:armhf
  libc6-dev:armhf libconfig-auto-perl libdebian-dpkgcross-perl
  libgcc-4.9-dev:armhf libgcc1:armhf libgomp1:armhf libstdc++-4.9-dev:armhf
  libstdc++6:armhf libubsan0:armhf linux-libc-dev linux-libc-dev:armhf
Suggested packages:
  binutils-multiarch libstdc++6-4.9-dbg:armhf libgcc1-dbg:armhf
  libgomp1-dbg:armhf libitm1-dbg:armhf libatomic1-dbg:armhf libasan1-dbg:armhf
  liblsan0-dbg:armhf libtsan0-dbg:armhf libubsan0-dbg:armhf
  libcilkrts5-dbg:armhf libquadmath-dbg:armhf locales:armhf manpages-dev:armhf
  libstdc++-4.9-doc:armhf
The following packages will be REMOVED:
  g++-multilib gcc-multilib
The following NEW packages will be installed:
  cpp-4.9-arm-linux-gnueabihf crossbuild-essential-armhf dpkg-cross
  g++-4.9-arm-linux-gnueabihf g++-arm-linux-gnueabihf
  gcc-4.9-arm-linux-gnueabihf gcc-4.9-base:armhf gcc-arm-linux-gnueabihf
  libasan1:armhf libatomic1:armhf libc6:armhf libc6-dev:armhf
  libconfig-auto-perl libdebian-dpkgcross-perl libgcc-4.9-dev:armhf
  libgcc1:armhf libgomp1:armhf libstdc++-4.9-dev:armhf libstdc++6:armhf
  libubsan0:armhf linux-libc-dev:armhf
The following packages will be upgraded:
  linux-libc-dev
1 upgraded, 21 newly installed, 2 to remove and 95 not upgraded.
Need to get 26.1 MB of archives.
After this operation, 86.7 MB of additional disk space will be used.


#$ sudo dpkg --remove-architecture armhf
$ sudo dpkg --add-architecture armel
$ sudo apt-get update
$ sudo apt-get install crossbuild-essential-armel
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  cpp-4.9-arm-linux-gnueabi g++-4.9-arm-linux-gnueabi g++-arm-linux-gnueabi gcc-4.9-arm-linux-gnueabi gcc-4.9-base:armel
  libasan1:armel libatomic1:armel libc6:armel libc6-dev:armel libgcc-4.9-dev:armel libgcc1:armel libgomp1:armel
  libstdc++-4.9-dev:armel libstdc++6:armel libubsan0:armel linux-libc-dev:armel
Suggested packages:
  libstdc++6-4.9-dbg:armel libgcc1-dbg:armel libgomp1-dbg:armel libitm1-dbg:armel libatomic1-dbg:armel libasan1-dbg:armel
  liblsan0-dbg:armel libtsan0-dbg:armel libubsan0-dbg:armel libcilkrts5-dbg:armel libquadmath-dbg:armel locales:armel
  manpages-dev:armel libstdc++-4.9-doc:armel
The following NEW packages will be installed:
  cpp-4.9-arm-linux-gnueabi crossbuild-essential-armel g++-4.9-arm-linux-gnueabi g++-arm-linux-gnueabi gcc-4.9-arm-linux-gnueabi
  gcc-4.9-base:armel libasan1:armel libatomic1:armel libc6:armel libc6-dev:armel libgcc-4.9-dev:armel libgcc1:armel libgomp1:armel
  libstdc++-4.9-dev:armel libstdc++6:armel libubsan0:armel linux-libc-dev:armel
0 upgraded, 17 newly installed, 0 to remove and 95 not upgraded.
Need to get 25.1 MB of archives.
After this operation, 89.2 MB of additional disk space will be used.
```
```
gcc-4.9-arm-linux-gnueabi
g++-arm-linux-gnueabi
```

<https://releases.linaro.org/components/toolchain/binaries/7.2-2017.11/>

<https://releases.linaro.org/components/toolchain/binaries/4.9-2017.01/>

<https://collaborate.linaro.org/display/TCWGPUB/ARM+and+AArch64+Target+Triples>

如果要删除,先要
```
sudo apt-get remove `dpkg-query -f'${Package}:${Architecture}\n' -W '*:armhf'`
$ sudo dpkg --remove-architecture armhf
sudo apt-get remove `dpkg-query -f'${Package}:${Architecture}\n' -W '*:armel'`
$ sudo dpkg --remove-architecture armel
sudo apt-get remove .*:arm64
sudo dpkg --remove-architecture arm64
```


***
# crosstool-ng
```
$ sudo apt-get install xxgdb
$ sudo apt-get install help2man
```


***
# c c++ 代码风格检查
```
$ sudo apt-get install cppcheck // 静态分析工具
$ sudo apt-get install checkstyle // 不知道咋用,配合xml脚本?
$ pip install cpplint // failed
$ git clone https://github.com/google/styleguide.git
```
这里面有cpplint.py

内核的
```
scripts/checkpatch.pl -f **.c
```
也可以检查代码风格,参考Documentation/CodingStyle（内核源文档）



***
# npm <不要安装这个,中间无数错误>
```
$ sudo apt-get install npm

The following extra packages will be installed:
  gyp libc-ares-dev libjs-node-uuid libv8-3.14-dev libv8-3.14.5 node-abbrev
  node-ansi node-ansi-color-table node-archy node-async node-block-stream
  node-combined-stream node-cookie-jar node-delayed-stream node-forever-agent
  node-form-data node-fstream node-fstream-ignore node-github-url-from-git
  node-glob node-graceful-fs node-gyp node-inherits node-ini
  node-json-stringify-safe node-lockfile node-lru-cache node-mime
  node-minimatch node-mkdirp node-mute-stream node-node-uuid node-nopt
  node-normalize-package-data node-npmlog node-once node-osenv node-qs
  node-read node-read-package-json node-request node-retry node-rimraf
  node-semver node-sha node-sigmund node-slide node-tar node-tunnel-agent
  node-underscore node-which nodejs nodejs-dev
Suggested packages:
  node-hawk node-aws-sign node-oauth-sign node-http-signature
The following NEW packages will be installed:
  gyp libc-ares-dev libjs-node-uuid libv8-3.14-dev libv8-3.14.5 node-abbrev
  node-ansi node-ansi-color-table node-archy node-async node-block-stream
  node-combined-stream node-cookie-jar node-delayed-stream node-forever-agent
  node-form-data node-fstream node-fstream-ignore node-github-url-from-git
  node-glob node-graceful-fs node-gyp node-inherits node-ini
  node-json-stringify-safe node-lockfile node-lru-cache node-mime
  node-minimatch node-mkdirp node-mute-stream node-node-uuid node-nopt
  node-normalize-package-data node-npmlog node-once node-osenv node-qs
  node-read node-read-package-json node-request node-retry node-rimraf
  node-semver node-sha node-sigmund node-slide node-tar node-tunnel-agent
  node-underscore node-which nodejs nodejs-dev npm

$ git clone git://github.com/mozilla/PDF.js.git 
$ cd PDF.js 
$ sudo npm install -g gulp-cli
$ npm install 
$ gulp server 
http://localhost:8888/web/viewer.html
```


***
# pdf查看
还是foxit reader好.linux版本还是不错的.实际上wine的版本输入法和粘贴没有问题的话,就已经完美了.



***
# dd配pv显示dd进度
```
sudo dd if=/dev/zero | pv | sudo dd of=/bigemptyfile bs=4096k
```
指定大小的dd,例如
```
dd if=/dev/zero of=sdcard.img bs=1M count=256
sudo dd if=s5p4418-debian-sd8g-20171017.img | pv | sudo dd of=/dev/sdc bs=4M
```
dd其实也有支持进度显示(测试无效)
```
dd if=/dev/zero of=/dev/null status=progress
```


***
#复制东西的时候要显示进度

安装使用gcp就可以，好像依赖x11
```
rsync -a --progress src dest
pv src > dest
```
cp命令本身有一些显示选项比如-v


***
# vncviewer访问开发板
实际上vncviewer访问nanofire2a板, 加端口号就可以了
```
192.168.4.102:1
密码fa123456
```


***
# something

https://www.yoctoproject.org/docs/current/yocto-project-qs/yocto-project-qs.html
```
$ sudo apt-get install chrpath
```
http://processors.wiki.ti.com/index.php/DaVinci_PSP_03.01_GA_(r39)_Release_Notes

http://arago-project.org/wiki/index.php/Classic_Setting_Up_Build_Environment
```
$ sudo apt-get install texi2html cvs
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Suggested packages:
  mksh rcs latex2html
The following NEW packages will be installed:
  cvs texi2html
0 upgraded, 2 newly installed, 0 to remove and 95 not upgraded.
Need to get 3,065 kB of archives.
After this operation, 6,033 kB of additional disk space will be used.
```

```
$ sudo apt-get install libcupti-dev libcupti-doc libcupti6.0
$ sudo apt-get install ack-grep libfile-next-perl
```

***
# bitbake
http://blog.csdn.net/redhat7890/article/details/5619503

在OE bitbake配置完毕的情况下，执行bitbake 命令时出现：
```
$ bitbake midinux-image
/home/fedora11/stuff/bitbake/lib/bb/COW.py:29: DeprecationWarning: the sets module is deprecated
  import types, sets
ERROR:  Openembedded's config sanity checker detected a potential misconfiguration.
    Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    /proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu so please fix the value (as root).
```
解决办法：
```
[root@redora11 stuff]# vim /etc/sysctl.conf

增加一句：vm.mmap_min_addr = 0

[root@redora11 stuff]# sysctl -p
vm.mmap_min_addr = 0
 ```
重新执行bitbake就可以通过。



***
# 十六进制查看编辑
```
xxd: 按字节解释。因为它来自于文本编辑器 Vim 嘛。
hexdump: 默认类似于 -x 格式，两字节数值解释。你的机器是小端序的。
od: -t x 指定格式为十六进制整数，省略了大小所以是 sizeof(int)。你指定 -t c 就是字符了。指定 -t x1 就是单字节十六进制整数。
```


***
# python 2.7 install tensorflow CPU support only
```
$ sudo apt-get install python-pip python-dev
$ pip install tensorflow
```


***
# tftp客户端,用于测试本机服务和登录其他服务器
```
$ sudo apt-get install tftp
```


***
# axel开20个线程下载
```
axel -a -n 20 http://pan.baidu.com/file.tar.gz
```


***
# 系统更新
Sun Dec 31 12:07:47 CST 2017
```
$ sudo apt-get upgrade 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Calculating upgrade... Done
The following packages have been kept back:
  pkg-config
The following packages will be upgraded:
  gimp gimp-data icedove libgimp2.0 lightning linux-compiler-gcc-4.8-x86
  linux-compiler-gcc-4.9-x86 linux-headers-3.16.0-4-amd64
  linux-headers-3.16.0-4-common linux-image-3.16.0-4-amd64 linux-kbuild-4.9
  linux-libc-dev linux-libc-dev:armhf linux-libc-dev:armel linux-source-3.16
  linux-source-4.9 rsync sensible-utils thunderbird unzip
20 upgraded, 0 newly installed, 0 to remove and 1 not upgraded.
```


***
# 解压zip乱码
```
sudo apt-get install p7zip convmv
```
```
LANG=C 7za x your-zip-file.zip
convmv -f GBK -t utf8 --notest -r .
```
第一条命令用于解压缩，而LANG=C表示以US-ASCII这样的编码输出文件名，如果没有这个语言设置，它同样会输出乱码，只不过是UTF8格式的乱码(convmv会忽略这样的乱码)。第二条命令是将GBK编码的文件名转化为UTF8编码，-r表示递归访问目录，即对当前目录中所有文件进行转换。

unar方法

这个最简单省力，默认debian已经安装了额unar，这个工具会自动检测文件的编码，也可以通过-e来指定：
```
unar file.zip
```
即可解压出中文文件

```
git clone https://github.com/ikohara/dpkg-unzip-iconv.git
cd dpkg-unzip-iconv

$ make source
$ sudo make build-dep
$ make
$ sudo make install

unzip_6.0-16+deb8u3iconv1_amd64.deb


$ sudo aptitude install libc6-amd64
选择降级unzip，

不要用
$ sudo apt-get -f install
更不要用
$ sudo aptitude -f install

比较
unzip_6.0-16+deb8u3_amd64.deb和unzip_6.0-16+deb8u3iconv1_amd64.deb
发现control文件需要修改
libc6-amd64为libc6


解压修改并重新生成deb包
mkdir extract
mkdir extract/DEBIAN
mkdir build
dpkg -X unzip_6.0-16+deb8u3iconv1_amd64.deb extract/
dpkg -e unzip_6.0-16+deb8u3iconv1_amd64.deb extract/DEBIAN/
现在可以修改。
修改完之后
dpkg-deb -b extract/ build/
检查无误之后替换
unzip_6.0-16+deb8u3iconv1_amd64.deb
解决了安装失败问题


unzip -O cp936 xxx.zip
```


***
# 旋转屏幕
```
To rotate your screen you can try xrandr command:

xrandr -o left

To turn back:

xrandr -o normal

You need to have DISPLAY variable setted:

export DISPLAY=:0

To be honest, it doesn't work with full-screen text consoles of my computer (it does with 7th GUI screen) but I had a lot of problems with fglrx drivers lately and I don't want to experiment since I barely managed to set everything up. In case of problems you can check here: http://ubuntuforums.org/showthread.php?t=1815538 for help with that command.
```
https://askubuntu.com/questions/237963/how-do-i-rotate-my-display-when-not-using-an-x-server

https://wiki.archlinux.org/index.php/Xrandr_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)

http://blog.163.com/alynx@126/blog/static/17292220520098144460560/

http://blog.csdn.net/wangzhen209/article/details/45218825


***
# 安装一个编辑器scite
```
sudo apt-get install scite sciteproj
```


***
# quilt
```
$ quilt edit hello.c 
File hello.c is already in patch patches/hello.patch

Select an editor.  To change later, run 'select-editor'.
  1. /bin/ed
  2. /bin/nano        <---- easiest
  3. /usr/bin/emacs24
  4. /usr/bin/vim.basic
  5. /usr/bin/vim.gtk
  6. /usr/bin/vim.tiny
```


***
# 从dot文件产生图片
```
dot -Tpng test.dot -o test.png
dot -Tjpg test.dot -o test.jpg
```
xdot可以直接查看dot文件


***
# 安装cmake-gui
```
sudo apt-get install cmake-gui
```


***
# 多线程编译
```
make -j $(nproc)
```
实际上我这里是j8

用nproc来说命令移植性好


***
# opencv相关
```
sudo ln -s /usr/include/libv4l1-videodev.h /usr/include/linux/videodev.h

sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
```


***
# 库路径和环境变量
两种方法

一种是设置环境变量LD_LIBRARY_PATH

一种是修改把库路径添加到/etc/ld.so.conf，再运行
```
sudo ldconfig
```


***
# 批量递归删除某类型文件
```
find  . -name  '*.exe' -type  f -print -exec  rm -rf  {} \;  
```

其他find . -type  f -name "*.o"  | xargs rm -f 对含空格和特殊符号的文件名路径名似乎没有起作用
```
*.PcbLib.Zip
*.PcbDoc.Zip
*.SchDoc.Zip
*.SchLib.Zip
*.PrjPCB.Zip
```
发现无法清除干净的.fuse_hiddenxxxxxx文件

删除文件的动作，貌似是执行了的。但是，会马上生成另外一个文件名的文件——也是.fuse_hiddenxxxxxx开头，只是最后一位数字有变化。最后，我这个问题移动硬盘是NTFS文件系统。

tips：SystemTap
```
https://serverfault.com/questions/478558/how-to-delete-fuse-hidden-files
    Log in to the system where the file physically resides. (no network mount)
    Execute lsof dir-name/.fuse_hidden000bd8c100000185 to find out what processes are holding the file handle open.
    Terminate those processes if it makes sense to, or figure out what steps you can perform to "gracefully" release the open file handle without terminating the process.
```

没有深入研究，因为用解压软件打开来看，就占用了这样一个临时文件。关闭archive manager就可以删掉了


***
# 为了能运行UniFlash
```
andy@debian-dell /opt/ti/uniflash_4.0/node-webkit
$ ./nw
./nw: error while loading shared libraries: libudev.so.0: cannot open shared object file: No such file or directory
andy@debian-dell /lib/x86_64-linux-gnu
$ sudo ln -s libudev.so.1.5.0 libudev.so.0
```
这样就可以了


***
# 安装dcmtk
```
sudo apt-get install dcmtk dcmtk-doc libdcmtk-dev dcmtk-www libdcmtk2 libdcmtk2
```

***
# device-tree-compiler
根据zynq文档
```
sudo apt-get install device-tree-compiler
```


***
# 关于miredo服务开启
```
sudo systemctl enable systemd-networkd-wait-online.service
sudo systemctl enable miredo.service
```
/lib/systemd/system/ 里面本来就有miredo.service
```
[Unit]
Description=Teredo IPv6 tunneling
After=network.target

[Service]
ExecStartPre=/usr/sbin/miredo-checkconf -f /etc/miredo/miredo.conf
ExecStart=/usr/sbin/miredo -f
ExecReload=/bin/kill -HUP $MAINPID

[Install]
WantedBy=multi-user.target
```

和参考文件的miredo.service
```
[Unit]
Description=Teredo IPv6 tunneling
Requires=network-online.target
After=network-online.target

[Service]
ExecStartPre=/usr/sbin/miredo-checkconf -f /etc/miredo/miredo.conf
ExecStart=/usr/sbin/miredo -f
ExecReload=/bin/kill -HUP $MAINPID
Restart=always
RestartSec=5s

[Install]
WantedBy=multi-user.target
```
放到 /etc/systemd/system/

执行sudo systemctl enable miredo.service 会冲突的

所以只用/lib/systemd/system/miredo.service
```
sudo systemctl start miredo.service
```


***
# github操作
1. github导入本地已有的repo

github新建一个空的project

本地检出所有分支
```
git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
git fetch --all
git pull --all
```
然后更换本地的remote地址
```
git remote rm origin
git remote add origin https://github.com/yxgi5/my_os_log.git
git push -u origin master
```
之后提示输入账号和密码，等到更新完成即可。
```
git push -u origin [其他分支]
```
本地局域网可以这样地址像这样
```
andy@192.168.4.101:/home/andy/repositories/dm368_kernel.git
```
2. 删除 github repo

https://github.com/yxgi5/my_os_log/settings

最下面 Danger Zone



***
# lantern(4.5.7)
```
sudo dpkg -i lantern-installer-64-bit.deb

/home/andy/.lantern/bin/lantern: error while loading shared libraries: libappindicator3.so.1: cannot open shared object file: No such file or directory

sudo apt-get install libappindicator3-1

The following NEW packages will be installed:
  libappindicator3-1 libdbusmenu-gtk3-4 libindicator3-7
```


***
# github设置 ssh pgp
```
gpg --list-secret-keys --keyid-format LONG
gpg --import 公钥和密钥
gpg --list-secret-keys --keyid-format LONG
gpg --list-secret-key
gpg --list-key
gpg --armor --export CD804564527D8490
按github的指令办
git config commit.gpgsign true
git config --global user.signingkey CD804564527D8490
//git config --global commit.gpgsign true
```
邮件要加到github的settings里，并且在邮箱里去确认才会verified

cat /home/andy/.gitconfig
```
[user]
	name = Andreas Zhang
	email = denglitsch@gmail.com
	signingkey = CD804564527D8490
[color]
	ui = auto
[commit]
	gpgsign = true
[http]
	sslVerify = false
```
为啥要这么干呢，用本地保存的gpg私钥，加密提交的内容，github或者gitlab上用gpg公钥解密，就保证了数据的加密和不被篡改。

gpg的私钥为啥要设置密码

gpg的私钥一旦泄露，就只有密码这最后一道防线了，所以，私钥最好应该加密码，这样最安全。
```
$ git commit -S -m your commit message
# Creates a signed commit
$ git tag -s mytag
# Creates a signed tag
$ git tag -v mytag
# Verifies the signed tag
$ git push
# Pushes your local commits to the remote repository
```
对于github，目前还是没有必要使用加了密码的私钥去加密/签名。

取消验证gpg签名
```
git config commit.gpgsign false
```

这个是俺的gpg公钥
```
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1

mQENBFVI3E8BCAClyuTALxs9BwehP6yTfqCJp8mHupSdWdEoC6f9DZ3Mf+2LZ0+n
cCtK0bbcVzqhZb4l52GnSHNiEGmytKTrHrfSaHc5KmAcNRnvR3jD47fmZK63fUKT
O7dEHAemMlJxcmctM2jeQTZpksmvt9tjS/dp3eVL5kHTfabp+DFaT3+I3nPfINtt
WwdXEjpjDOMMDARhRPvxxZtUJwv6j6dX/RKAuyYNSWOvdEpiEzRR2orDpXB8Wivz
U9vLwlR5RG+TigXZp78cwcX/uoaXvEBE1LYtBzwHY4xHZCsLBmofQRrvhOfLyjbU
uefq6KlNCnybS5q4C67A4T34OAprci2FdC+LABEBAAG0JEFuZHJlYXMgWmhhbmcg
PGRlbmdsaXRzY2hAZ21haWwuY29tPokBcgQQAQIAXAUCVUjcTzAUgAAAAAAgAAdw
cmVmZXJyZWQtZW1haWwtZW5jb2RpbmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoC
GQEFGwMAAAAFFgADAgEFHgEAAAAGFQgJCgMCAAoJEM2ARWRSfYSQOBgIAJr1gdaM
xS1P5mbrEUBGQmQ4anPrK4JtbCVEDBmecK0VG3XOCvOsvc759y8n0AbZFDz6pmnx
jBO00eCL1+Szxy+6e/93jlNa7MdcenH2KLnOrc3R+Bdl6poSr5RLXpi7zdShw9Fy
InHLdWq3Sc+E9nZKXnnsEL7JFq7oW/tTpz7RFvHSeilc5i3iOfKbZLxUtzRZAlCu
hysxwcV833q3B4TnXrtpdlyKSzH39ikcW13UTJr6AE1S9EQZCy9LASknjYCopY3n
I/IqVUD4MRVtXQ1TKCF5ZF7EXSwHUvX4V6qGvyZk3FhZdPecjB8hPV9SL1L3gf/0
pZrXFJhx4hTFC0u5AQ0EVUjcTwEIALxn6P3Jkj0BKhhOVM6dphADw1KsPMkgJTqH
8txQ5wLgxe1T9BSxO5EPeKyi6lA/KaADXjyjB0/E8DlJ5D5OyXnySYbqn0OoeFqT
gpuVLSclsiDVoGgwk+8gYpz89YMdVm4tKwCmRW/T1nbdIpU0+TNH5x83bqsA6BZg
IgKouAs625RGWlWXnbT0wWcTemH0f7K57ZSUhtKMDHAtlgWu3o0Mk0HuN/KJqXZG
5dut9VDf9IBEOGlaH443oSUsp3ghLG8CJXXzt1bhGVfu3PvPxKabYBw2l7hKGd+h
UlcLzt4uCopefgPgU5CMcNE+huOqJMyqzUyD8DhRzOKvD85u1F0AEQEAAYkCQQQY
AQIBKwUCVUjcUAUbDAAAAMBdIAQZAQgABgUCVUjcTwAKCRCNRQHBEOjOuGcIB/wL
99CfuUGA6c9GHSlcW3X84Ih5Tp6fTFxCwShW5fCWqle5Zz17qa3527BqgZPvKlVO
rFbaToDWaS1Xd02kTKm2uR7KyzgaH+BeUXPU/EGoo0F5sHP4qNIQXbqtPmRRHWIv
n7PqkvrMXoeCdSg5IWD16UbIZXSbIyIfWTliY68MlqnuDGnO6/Y4BYwj8Gj4S5Xp
RMWuFSM5WWKqVEF3Eql4MZWDXdUVC1YQ3Tp5MUaIbwbMx/v7HLf1v398PLaKDL0t
Kva1rl2WPD5enCfj5m2LbrKhRQjGYraNMOQRXPikYlGwa/BapFXCoACcc5rmmfqs
jcW6/aYiAoQxo7Mt7Z+kAAoJEM2ARWRSfYSQtrEH/RVfeAOvlMD0glSIIjVaV9IJ
xdle8fujRa6BeemF0y9D72/JKjnW3OWnBEuIhgM9gk1luo3SHJPZLvQN/8CjHGZ0
Tb9UPaTXohXc89VNUloSZYFI9T6o3SmywTQ8fY/oJywmWYuJ30KA5w+hY6FLKk1C
JkYTNPK/d7jilWcOn+RlxHYbkzWXqhYzFfmXnpGSNJZvtwtQXZdFwPqQ6cOP6y5N
EG7f6GSJNbSPnWVNb5z+6r2gMMfiGaPXP/b/hcjrzU59KphH5ZUQMUir3qizmK+C
C4Ajlo8XT55kDlMTi48IMoLLpaYfDCfmgmb/+vIrdIKAq4RmDG98yJAYPXTLSHs=
=wYsT
-----END PGP PUBLIC KEY BLOCK-----
```

打开客户机本地git bash,使用如下命令生成ssh公钥和私钥对
```
$ ssh-keygen -t rsa -C 'xxx@xxx.com'
cat $HOME/.ssh/id_rsa.pub
```
添加这个公钥到gitlab
客户也可以登录BS网页管理，root登录。。。
在最右上管理里的settings，然后再左边条里（目前是root账户 ，那么这个公钥就是root的公钥）
```
$ ssh -T git@github.com
```
```
16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48这个是github的公钥指纹，表明下载了这个公钥
```
```
Hi yxgi5! You've successfully authenticated, but GitHub does not provide shell access.
```
添加客户机公钥之后，就可以通过ssh方式免密码拉取和提交了
```
$ git clone ssh://git@192.168.5.177:222/root/gitlab_test.git
$ git clone git@github.com:yxgi5/my_os_log.git 
```   
默认端口等效于
```
$ git clone ssh://git@github.com:22/yxgi5/my_os_log.git
$ git clone ssh://git@192.30.253.112:22/yxgi5/my_os_log.git
```
这个是俺的ssh公钥, 命令`cat $HOME/.ssh/id_rsa.pub`
```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDGmzfCtRm+PN6YxOwvrH9xLs+1N7AIJpRiHCdrBKlNwlxw0CCCWKQDi73ZhSA9KTHzp2zAnEfAQ37bFEQ6xoPo5yQcDBTj8CwArbaZ1nxn527BgX58CW8ZJYmzQ/xDqR3ktd1Z356gOfqNMICzPJM5kK4AtjMlmqQXbLhR0eYKu19ZTmUlh+EIss7S+kzeRfKBeW+QgwqLPWnrj8so0GoyMfvsUIfxK/pyvqYIUvFGD6RBTH/8WVH276yFEc7+E5nmz58oqAY1kDMD2DVNB7xImD6nINYsM8XytPSj9GXoCHW0Ld60ZsJVSFmFMTEiu+pG5SI5WYzmHcjRaJzRWWf denglitscg@gmail.com
```


***
# gcc-arm-none-eabi
```
sudo apt-get install gcc-arm-none-eabi libnewlib-arm-none-eabi binutils-arm-none-eabi gdb-arm-none-eabi
```


***
# insight 等
```
$ wget ftp://sourceware.org/pub/insight/releases/insight-6.8-1a.tar.bz2
$ tar jxvf insight-6.8-1a.tar.bz2
$ cd insight-6.8-1/
$ ./configure --target=arm-none-linux-gnueabi --prefix=/home/andy/insight-arm --disable-werror
修复bug
sed -i -e 's/@colophon/@@colophon/' \
       -e 's/doc@cygnus.com/doc@@cygnus.com/' bfd/doc/bfd.texinfo
sed -i 's/subsubsection/subsection/' ./bfd/doc/elf.texi

$ make
$ make install
```
解决端口号无法修改的bug，没有成功
```
$ ./configure --target=arm-none-linux-gnueabi --prefix=/home/andy/insight-arm --disable-werror --with-solib-absolute-prefix=/opt/codesourcery/arm-2009q1/arm-none-linux-gnueabi/libc/lib
```
端口号直接用1000暂时也没问题，不过配合jlink的话会有端口问题，修改代码 或者 使用界面上的gdb命令手动敲啦

```
$ sudo apt-get install kdbg
$ sudo apt-get install cgdb
```

gdb前端还是insight最好使！旧版本(6.8及之前)由于编译器原因各种问题
```
git clone git://sourceware.org/git/insight.git
cd insight
git submodule init
git submodule update
autoconf

$ ./configure --libdir=/home/andy/insight/lib64 --disable-binutils --disable-elfcpp --disable-gas --disable-gold--disable-gprof --disable-ld --disable-rpath --disable-zlib --with-gdb-datadir=/home/andy/insight/share/insight --with-jit-reader-dir=/home/andy/insight/lib64/insight --with-separate-debug-dir='/home/andy/insight/lib/debug' --with-expat --with-python --without-libunwind --prefix=/home/andy/insight

make && make install
```
运行insight-git(8.1.50)需要的库
```
$ sudo apt-get install itcl3 itcl3-dev itcl3-doc itk3 itk3-dev itk3-doc iwidgets4 
```

启动gdb时候有个告警
```
warning: the debug information found in "/lib64/ld-2.19.so" does not match "/lib64/ld-linux-x86-64.so.2" (CRC mismatch)
```
据说是libc6 libc6-dbg版本不一致

https://stackoverflow.com/questions/28834807/can-crc-mismatch-cause-error-in-connection-with-libnetcdff-so-6
```
$ sudo apt-get install libc6 libc6-dbg libc6-dev libc6-i386 libc6-x32
```
无效
```
$ ls /lib64/ld-2.19.so 
/lib64/ld-2.19.so
andy@debian-dell ~/insight/bin
$ ls /lib64/ld-linux-x86-64.so.2 -l
lrwxrwxrwx 1 root root 32 Jun 18  2017 /lib64/ld-linux-x86-64.so.2 -> /lib/x86_64-linux-gnu/ld-2.19.so
andy@debian-dell ~/insight/bin
$ ./insight 
^Candy@debian-dell ~/insight/bin
$ md5sum /lib64/ld-2.19.so
cb9d6ceb30bbf18b06b2281ee6f882f6  /lib64/ld-2.19.so
andy@debian-dell ~/insight/bin
$ md5sum /lib/x86_64-linux-gnu/ld-2.19.so
c9bd48abebc39c0881f847ecdc23029b  /lib/x86_64-linux-gnu/ld-2.19.so
```
这两个文件的确不一样哈


Confused about packages libc6-amd64 and libc6:amd64

https://askubuntu.com/questions/660759/confused-about-packages-libc6-amd64-and-libc6amd64

查询文件属于那个安装包
```
andy@debian-dell ~/insight/bin
$ dpkg-query -S /lib/x86_64-linux-gnu/ld-2.19.so
libc6:amd64: /lib/x86_64-linux-gnu/ld-2.19.so
andy@debian-dell ~/insight/bin
$ dpkg-query -S /lib64/ld-2.19.so
libc6-amd64: /lib64/ld-2.19.so
andy@debian-dell ~/insight/bin
$ aptitude search libc6:amd64
i   libc6                           - GNU C Library: Shared libraries           
andy@debian-dell ~/insight/bin
$ aptitude search libc6-amd64
i   libc6-amd64:i386                - GNU C Library: 64bit Shared libraries for
```
查询安装包依赖关系
```
apt-cache rdepends libc6:amd64
apt-cache rdepends libc6-amd64
```
```
sudo apt-get remove libc6-amd64:i386
$ ls /lib64/ld-2.19.so
ls: cannot access /lib64/ld-2.19.so: No such file or directory
```
问题解决！

再编译一个支持arm调试的，8.1.50.20180330-git
```
export PATH=/opt/codesourcery/arm-2009q1/bin:$PATH
./configure --libdir=/home/andy/insight-arm/lib --disable-binutils --disable-elfcpp --disable-gas --disable-gold--disable-gprof --disable-ld --disable-rpath --disable-zlib --with-gdb-datadir=/home/andy/insight-arm/share/insight --with-jit-reader-dir=/home/andy/insight-arm/lib/insight --with-separate-debug-dir='/home/andy/insight-arm/lib/debug' --with-expat --with-python --without-libunwind --prefix=/home/andy/insight-arm --target=arm-none-linux-gnueabi
```
完美解决port不能修改的问题

如果无法run了，删掉~/.gdbtkinit 配置就重置了


***
# 下载回来的压缩包不完整可能报错
```
tar: Skipping to next header
tar: Exiting with failure status due to previous errors
```
不论是否sudo都有这个错误，就要检查sha1 sha256


***
# gnuarmeclipse
```
$ sudo ln -s /opt/gnuarmeclipse/qemu/2.8.0-201703022210-head/bin/qemu-system-gnuarmeclipse /usr/local/bin/qemu-system-gnuarmeclipse
```


***
# 全文搜索工具
```
$ sudo apt-get install recoll
```
gedit ~/.recoll/recoll.conf
```
indexallfilenames = 1
indexedmimetypes = text/abcd
```




mlocate.db文件操作

mlocate -d mlocate.db / > mlocate.txt
这样dump出来的是带完整路径的文件名

strings mlocate.db > mlocate.txt
这样dump出来的仅仅有文件名没有路径

前面的一个命令比后面的一个命令要好

mlocate -d mlocate.db / | sort > mlocate.txt
strings mlocate.db | sort > mlocate.txt
排序会相当慢





Sat Apr 14 22:06:10 CST 2018

$ sudo apt-get install geany-plugin-markdown markdown
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  geany-plugins-common libmarkdown2
The following NEW packages will be installed:
  geany-plugin-markdown geany-plugins-common libmarkdown2 markdown


Sun Apr 15 23:59:09 CST 2018

meld - a graphical tool to diff and merge files
sudo apt-get install meld
The following NEW packages will be installed:
  meld python-gi-cairo



pgadmin3 graphical administration tool for PostgreSQL
http://wiki.ubuntu.org.cn/PostgreSQL
https://stackoverflow.com/questions/15301826/psql-fatal-role-postgres-does-not-exist
https://launchschool.com/blog/how-to-install-postgres-for-linux
https://stackoverflow.com/questions/12552929/failed-to-build-gem-native-extension-rails-install

sudo apt-get install pgadmin3 postgresql-contrib postgresql-9.4 postgresql-doc-9.4 pgadmin3-data pgagent postgresql-client postgresql-client-9.4 postgresql-client-common 
Suggested packages:
  oidentd ident-server locales-all libdbd-pg-perl

$ sudo /etc/init.d/postgresql start
sudo -u <administrator account> createuser <standard account> -d -P
sudo -u postgres createuser --superuser $USER -d -P
psql -l
sudo -u postgres createdb $USER
touch .psql_history

//pip install --upgrade pip
sudo pip install psycopg2-binary
sudo pip install pgcli


sudo apt-get install postgresql postgresql-contrib libpq-dev
The following NEW packages will be installed:
  comerr-dev krb5-multidev libgssrpc4 libkadm5clnt-mit9 libkadm5srv-mit9
  libkdb5-7 libpq-dev postgresql


Type "psql" on your terminal to connect to the server:

Enter "\q" to quit

sudo apt-get install ruby-dev
sudo gem install pg
sudo apt-get install bundler
The following NEW packages will be installed:
  bundler ruby-net-http-persistent ruby-thor
bundle init
cd ~
echo "gem 'pg'" >> Gemfile
bundle install


$ sudo apt-get install sqlite
The following NEW packages will be installed:
  libsqlite0 sqlite


sudo apt-get update
sudo apt-get install ruby
没有能更新到要求的版本

sudo gem install activesupport -v '5.1.6'

gem sources -l
gem sources --remove https://rubygems.org/
gem sources -a https://rubygems.org/


sudo apt-get install ruby-build
Recommended packages:
  libxslt-dev
The following NEW packages will be installed:
  libxslt1-dev rbenv ruby-build



//#安装ruby
//# https://github.com/rbenv/ruby-build#readme
//git clone https://github.com/rbenv/ruby-build.git
//ruby -v


$ psql -U postgres -h localhost
password？

sudo /etc/init.d/postgresql stop

危险
sudo deluser postgres

sudo -u postgres createuser andy -d -P

不高兴用这个玩意了

sudo apt-get --reinstall install pgadmin3 postgresql-contrib postgresql-9.4 postgresql-doc-9.4 pgadmin3-data pgagent postgresql-client postgresql-client-9.4 postgresql-client-common 

sudo service postgresql restart 

psql -U postgres -d postgres

sudo service postgresql status



sudo apt-get purge pgadmin3 postgresql-contrib postgresql-9.4 postgresql-doc-9.4 pgadmin3-data pgagent postgresql-client postgresql-client-9.4 postgresql-client-common

修改密码
sudo su postgres -c psql template1
postgres=# ALTER USER postgres WITH PASSWORD 'postgres';




Bless hex editor
sudo apt-get install bless


Pinta - a Simple drawing/painting program
sudo apt-get install pinta


Teigha File Converter 是一个免费的cad文件版本转换器,可把 .dwg和 .DXF 文件转换为不同的 AutoCAD 版本可以正常打开的文件,支持 AutoCAD 2000-2014
https://www.opendesign.com/guestfiles/teigha_file_converter

sudo dpkg -i TeighaFileConverter_QT5_lnxX64_4.7dll.deb


yEd Graph Editor
https://www.yworks.com/products/yed/download#download
chmod +x yEd-3.18.0.2_64-bit_setup.sh
./yEd-3.18.0.2_64-bit_setup.sh


BeeBEEP (Secure Lan Messenger)
http://beebeep.sourceforge.net/download.php


zenmap - The Network Mapper Front End
sudo apt-get install zenmap


网页API集成的微信
wget https://github.com/geeeeeeeeek/electronic-wechat/releases/download/V2.0/linux-x64.tar.gz
tar zxvf linux-x64.tar.gz -C /opt

desktop文件参考
electronic-wechat.desktop
-------
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Name=Electronic WeChat
Icon=/opt/electronic-wechat-linux-x64/wechat.png
Exec=/opt/electronic-wechat-linux-x64/electronic-wechat
StartupNotify=false
StartupWMClass=electronic-wechat
OnlyShowIn=Unity;
X-UnityGenerated=true
--------

icon可以在这找
http://www.iconfont.cn/


 
jd-gui - Java Decompiler
http://jd.benow.ca/
wget https://github.com/java-decompiler/jd-gui/releases/download/v1.4.0/jd-gui_1.4.0-0_all.deb
wget https://github.com/java-decompiler/jd-eclipse/releases/download/v1.0.0/jd-eclipse-site-1.0.0-RC2.zip

sudo dpkg -i jd-gui_1.4.0-0_all.deb
到opt里面去执行

jd-eclipse这个嘛要用再安装





st-flash
https://github.com/texane/stlink
http://startingelectronics.org/tutorials/STM32-microcontrollers/programming-STM32-flash-in-Linux/
https://github.com/texane/stlink.git

sudo apt-get install libusb-1.0-0-dev git
git clone https://github.com/texane/stlink stlink.git
cd stlink.git
make
cd flash
sudo cp st-flash /usr/bin
cd ..
sudo cp *.rules /etc/udev/rules.d
sudo restart udev
st-flash write v1 myflash.bin 0x8000000




atom-ide
https://flight-manual.atom.io/getting-started/sections/installing-atom/#platform-linux
https://packagecloud-prod.global.ssl.fastly.net/5969/6634/any/package_files/505662.deb?t=1523970178_968440c3e2aa614d8eb61620bb54f1a7a3c2f667

sudo dpkg -i atom-beta_1.26.0-beta2_amd64.deb
打开markdown文件，ctrl+shift+m
还是这个看起来比较好一点

最佳方法是使用vs code加插件




vscode
sudo dpkg -i code_1.22.2-1523551015_amd64.deb
命令是code


sudo apt-get install pandoc
Suggested packages:
  texlive-xetex texlive-luatex pandoc-citeproc etoolbox
The following NEW packages will be installed:
  pandoc pandoc-data



MdCharm
https://github.com/zhangshine/MdCharm/releases
sudo dpkg -i mdcharm_1.2_amd64.deb
sudo apt-get install libhunspell-dev
这个也还行啊，预览比geany插件要好


dillinger
https://dillinger.io/

Cmd Markdown
https://www.zybuluo.com/mdeditor
下载客户端
https://www.zybuluo.com/cmd/#






sudo apt-get install texlive-full fonts-freefont musixlyr
Suggested packages:
  perl-tk fontforge context-nonfree context-doc-nonfree jadetex passivetex
  xindy xmltex
Recommended packages:
  fonts-freefont musixlyr
The following NEW packages will be installed:
  chktex cm-super cm-super-minimal context context-modules dvidvi feynmf
  fonts-cabin fonts-comfortaa fonts-crosextra-caladea fonts-crosextra-carlito
  fonts-ebgaramond fonts-ebgaramond-extra fonts-font-awesome
  fonts-freefont-otf fonts-gfs-artemisia fonts-gfs-baskerville
  fonts-gfs-bodoni-classic fonts-gfs-complutum fonts-gfs-didot
  fonts-gfs-didot-classic fonts-gfs-gazis fonts-gfs-neohellenic fonts-gfs-olga
  fonts-gfs-porson fonts-gfs-solomos fonts-gfs-theokritos fonts-hosny-amiri
  fonts-inconsolata fonts-junicode fonts-lato fonts-linuxlibertine
  fonts-lobster fonts-lobstertwo fonts-oflb-asana-math fonts-stix fragmaster
  lacheck latexdiff latexmk lcdf-typetools m-tx musixtex pfb2t1c2pfb pmx
  purifyeps tex4ht tex4ht-common texlive-bibtex-extra texlive-fonts-extra
  texlive-fonts-extra-doc texlive-formats-extra texlive-full texlive-games
  texlive-humanities texlive-humanities-doc texlive-lang-african
  texlive-lang-arabic texlive-lang-cyrillic texlive-lang-czechslovak
  texlive-lang-english texlive-lang-european texlive-lang-french
  texlive-lang-german texlive-lang-greek texlive-lang-indic
  texlive-lang-italian texlive-lang-polish texlive-lang-portuguese
  texlive-lang-spanish texlive-luatex texlive-math-extra texlive-metapost
  texlive-metapost-doc texlive-music texlive-omega texlive-plain-extra
  texlive-publishers texlive-publishers-doc texlive-xetex ttf-adf-accanthis
  ttf-adf-gillius ttf-adf-universalis
0 upgraded, 83 newly installed, 0 to remove and 150 not upgraded.
Need to get 825 MB of archives.
After this operation, 1,607 MB of additional disk space will be used.


sudo apt-get install biber
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  libautovivification-perl libbtparse1 libbusiness-isbn-data-perl libbusiness-isbn-perl libbusiness-ismn-perl libbusiness-issn-perl
  libdata-compare-perl libdata-dump-perl libdate-simple-perl libdevel-globaldestruction-perl libdist-checkconflicts-perl
  libemail-date-format-perl libencode-eucjpms-perl libencode-hanextra-perl libencode-jis2k-perl libfile-find-rule-perl
  libfile-slurp-perl libfile-slurp-tiny-perl libfile-slurp-unicode-perl libipc-run3-perl libipc-shareable-perl liblist-allutils-perl
  liblog-dispatch-perl liblog-log4perl-perl libmime-lite-perl libmime-types-perl libmodule-implementation-perl
  libmodule-runtime-perl libnumber-compare-perl libparams-classify-perl libparams-validate-perl libreadonly-perl
  libsub-exporter-progressive-perl libtext-bibtex-perl libtext-glob-perl libtie-cycle-perl libtry-tiny-perl
  libxml-libxml-simple-perl libxml-libxslt-perl libxml-writer-perl
Suggested packages:
  libgd-barcode-perl libscalar-properties-perl libdbd-csv-perl libxml-dom-perl libmojolicious-perl libscalar-number-perl
The following NEW packages will be installed:
  biber libautovivification-perl libbtparse1 libbusiness-isbn-data-perl libbusiness-isbn-perl libbusiness-ismn-perl
  libbusiness-issn-perl libdata-compare-perl libdata-dump-perl libdate-simple-perl libdevel-globaldestruction-perl
  libdist-checkconflicts-perl libemail-date-format-perl libencode-eucjpms-perl libencode-hanextra-perl libencode-jis2k-perl
  libfile-find-rule-perl libfile-slurp-perl libfile-slurp-tiny-perl libfile-slurp-unicode-perl libipc-run3-perl
  libipc-shareable-perl liblist-allutils-perl liblog-dispatch-perl liblog-log4perl-perl libmime-lite-perl libmime-types-perl
  libmodule-implementation-perl libmodule-runtime-perl libnumber-compare-perl libparams-classify-perl libparams-validate-perl
  libreadonly-perl libsub-exporter-progressive-perl libtext-bibtex-perl libtext-glob-perl libtie-cycle-perl libtry-tiny-perl
  libxml-libxml-simple-perl libxml-libxslt-perl libxml-writer-perl
0 upgraded, 41 newly installed


sudo apt-get install texlive-lang-german texlive-lang-french texlive-lang-italian texlive-lang-japanese texlive-lang-korean texlive-lang-latin texlive-lang-swedish texlive-lang-english texlive-lang-european texlive-lang-dutch texlive-lang-cjk texlive-lang-all texlive-full texlive-doc-zh texlive-doc-en texlive-xetex texlive-base-bin texlive-base texlive


sudo apt-get install texmaker texworks



sudo apt-get install texlive-lang-all texlive-fonts-extra
Suggested packages:
  fontforge cm-super
The following NEW packages will be installed:
  fonts-cabin fonts-comfortaa fonts-crosextra-caladea fonts-crosextra-carlito
  fonts-ebgaramond fonts-ebgaramond-extra fonts-font-awesome
  fonts-freefont-otf fonts-gfs-artemisia fonts-gfs-baskerville
  fonts-gfs-complutum fonts-gfs-didot fonts-gfs-neohellenic fonts-gfs-olga
  fonts-gfs-porson fonts-gfs-solomos fonts-hosny-amiri fonts-inconsolata
  fonts-junicode fonts-lato fonts-linuxlibertine fonts-lobster
  fonts-lobstertwo fonts-oflb-asana-math fonts-stix texlive-fonts-extra
  texlive-fonts-extra-doc texlive-lang-african texlive-lang-all
  texlive-lang-arabic texlive-lang-cyrillic texlive-lang-czechslovak
  texlive-lang-english texlive-lang-european texlive-lang-french
  texlive-lang-german texlive-lang-greek texlive-lang-indic
  texlive-lang-italian texlive-lang-polish texlive-lang-portuguese
  texlive-lang-spanish ttf-adf-accanthis ttf-adf-gillius ttf-adf-universalis
0 upgraded, 45 newly installed, 0 to remove and 150 not upgraded.
Need to get 544 MB of archives.
After this operation, 1,099 MB of additional disk space will be used.



markdown最好还是用haroopad，下载安装
下面这个也能用
sudo apt-get install retext
Suggested packages:
  python-markdown-doc python-pil-doc python3-pil-dbg ttf-bitstream-vera
The following NEW packages will be installed:
  python3-docutils python3-enchant python3-markdown python3-markups
  python3-pil python3-pygments python3-pyqt5.qtwebkit python3-roman
  python3-yaml retext



复制这几个字体到
ls ~/.fonts | grep sim
simfang.ttf
simhei.ttf
simkai.ttf
simli.ttf
simsunb.ttf
simsun.ttc
simyou.ttf


fc-cache 
fc-list | grep sim
查看系统中文字体
fc-list :lang=zh-cn
查看系统字体缓存
fc-cache -fv




后来觉得，最好还是用 texlive.live 镜像安装最新的
sudo apt-get install perl-tk
cd /media/andy/TeXLive2017
sudo ./install-tl --gui perltk

安装了perl-tk就可以用图形化tlmgr了
tlmgr --gui

卸载
tlmgr uninstall

sudo apt-get install texlive

cd /usr/share/texlive/texmf-dist/fonts/truetype
sudo cp simkai.ttf SIMKAI.TTF
sudo mktexlsr
fc-cache -fv

texmaker 选 xelatex
latex_tikz/test1/test1.tex


Installing code2000 package.

    Download the package from its respective link http://www.fonts2u.com/code2000.font
    Copy code2000.ttf to /usr/share/fonts/
    fc-cache -fv to refresh font list.




texstudio 也可以选 xelatex 编译






texlive-full它的各种配置文件啊、环境变量啊，都放在哪里呢？使用tlmgr conf命令即可查看
tlmgr conf


/usr/share/texlive/texmf-dist/tex/latex/ctex/fontset/ctex-xecjk-winfonts.def

\setCJKmainfont[BoldFont={SimHei},ItalicFont={[SIMKAI.TTF]}]
  {SimSun}
\setCJKsansfont{SimHei}
\setCJKmonofont{[SIMFANG.TTF]}

\setCJKfamilyfont{zhsong}{SimSun}
\setCJKfamilyfont{zhhei}{SimHei}
\setCJKfamilyfont{zhkai}{[SIMKAI.TTF]}
\setCJKfamilyfont{zhfs}{[SIMFANG.TTF]}
% \setCJKfamilyfont{zhli}{LiSu}
% \setCJKfamilyfont{zhyou}{YouYuan}

\newcommand*{\songti}{\CJKfamily{zhsong}} % 宋体
\newcommand*{\heiti}{\CJKfamily{zhhei}}   % 黑体
\newcommand*{\kaishu}{\CJKfamily{zhkai}}  % 楷书
\newcommand*{\fangsong}{\CJKfamily{zhfs}} % 仿宋
% \newcommand*{\lishu}{\CJKfamily{zhli}}    % 隶书
% \newcommand*{\youyuan}{\CJKfamily{zhyou}} % 幼圆

\endinput

---------------------
修改为

\setCJKmainfont[BoldFont={SimHei},ItalicFont={KaiTi}]
  {SimSun}
\setCJKsansfont{SimHei}
\setCJKmonofont{FangSong}

\setCJKfamilyfont{zhsong}{SimSun}
\setCJKfamilyfont{zhhei}{SimHei}
\setCJKfamilyfont{zhkai}{KaiTi}
\setCJKfamilyfont{zhfs}{FangSong}
% \setCJKfamilyfont{zhli}{LiSu}
% \setCJKfamilyfont{zhyou}{YouYuan}

\newcommand*{\songti}{\CJKfamily{zhsong}} % 宋体
\newcommand*{\heiti}{\CJKfamily{zhhei}}   % 黑体
\newcommand*{\kaishu}{\CJKfamily{zhkai}}  % 楷书
\newcommand*{\fangsong}{\CJKfamily{zhfs}} % 仿宋
% \newcommand*{\lishu}{\CJKfamily{zhli}}    % 隶书
% \newcommand*{\youyuan}{\CJKfamily{zhyou}} % 幼圆

\endinput

------------------------





sudo apt-get install nasm





gvedit
从graphviz-2.40.1编译gvedit，graphviz-2.40.1/cmd/gvedit/.libs/gvedit 复制到/usr/bin/








Sat Apr 21 09:40:44 CST 2018


sudo apt-get install clang
Suggested packages:
  gnustep gnustep-devel clang-3.5-doc llvm-3.5-doc
The following NEW packages will be installed:
  clang clang-3.5 libclang-common-3.5-dev libffi-dev llvm-3.5 llvm-3.5-dev
  llvm-3.5-runtime


sudo apt-get install clang clang-3.5-doc llvm-3.5-doc

## sudo aptitude install gnustep gnustep-devel






安装、更新autocad替代软件

draftSight.deb
BricsCAD-V17.2.11-1-zh_CN-amd64.deb
ARES_Commander_2018-2018.1.1.2107-64.deb
这三个默认就在/opt

qcad-3.20.1-trial-linux-x86_64.run
这个用管理员权限应该安装在/opt，普通用户权限是安装在~/opt/


cd /usr/local/bin
sudo gedit draftsight
------------------------------------
#!/bin/bash
/opt/dassault-systemes/DraftSight/Linux/DraftSight
------------------------------------
sudo chmod +x draftsight


vs code的sync
54fcf1cf77dd77f18b9491514dc545346e5a479e



markdown-preview.vim
配置文件添加
Bundle 'iamcco/mathjax-support-for-mkdp'
Bundle 'iamcco/markdown-preview.vim'
这里是用的0.9的版本的Bundle插件，和最新的命令稍微不同的
:BundleInstall
打开md文件后启用
:MarkdownPreview

to check if vim supports python:
vim ‐‐version | grep +python
:version
或者这样
:echo has("python")
:echo has("python3")



vundle来管理plugin之外，还可以选vim-plug
https://github.com/junegunn/vim-plug







Sat Apr 28 19:10:50 CST 2018
sudo apt-get install qemu
sudo apt-get install qemu-kvm

sudo apt-get install virt-manager
Suggested packages:
  python-gnomekeyring python-guestfs
The following NEW packages will be installed:
  gir1.2-gtk-vnc-2.0 gir1.2-libvirt-glib-1.0 gir1.2-spice-client-glib-2.0
  gir1.2-spice-client-gtk-3.0 python-ipaddr python-libvirt python-urlgrabber
  virt-manager virt-viewer virtinst


virt-manager
报错不能建立连接（选用ssh新建一个连接可以）
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=765045
$ virsh --connect qemu:///system --debug 4
error: failed to connect to the hypervisor
error: authentication failed: no agent is available to authenticate
$ virt-manager --debug --no-fork
看看报错信息
$ /usr/lib/kde4/libexec/polkit-kde-authentication-agent-1 # 这个我没有安装kde也不需要
https://wiki.archlinux.org/index.php/Polkit_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)

添加文件（好像没有用）
sudo vim /etc/polkit-1/localauthority/50-local.d/org.libvirt.unix.manage.pkla
===============================
[Allow group libvirt management permissions]
Identity=unix-group:libvirt
Action=org.libvirt.unix.manage
ResultAny=yes
ResultInactive=yes
ResultActive=yes
===============================

我这里运行pkexec
$ pkexec bash
Authentication is needed to run `/bin/bash' as user andy,,, (andy)
Authenticating as: ,,, (postgres)
Password: 
或者
$ pkexec --user andy /bin/bash
Authentication is needed to run `/bin/bash' as the super user
Authenticating as: ,,, (postgres)
Password: 

无论是andy，root或者postgres的密码都不能
==== AUTHENTICATION COMPLETE ===
都是
==== AUTHENTICATION FAILED ===
Error executing command as another user: Not authorized

解决办法
https://blog.xiaoben.li/p/497

groupadd libvirt # 实际上已经有libvirt组了

usermod -a -G libvirt user_name # 比如添加andy到libvirt组


virt-manager就能建立connection了

但是pkexec还是不知道怎么通过authorize，既然virt-manager能用起来了，就不管那么多了。

https://bugzilla.redhat.com/show_bug.cgi?id=1437933
http://blog.wikichoon.com/2016/01/polkit-password-less-access-for-libvirt.html
usermod --append --groups libvirt `whoami`
这样也一样



Qemu独占鼠标之后，要用Ctrl-Alt+g解除
按下 Ctrl-Alt-1 切到 serial




git clone https://github.com/aric1987/stlink.git







sudo apt-get install libchm-dev




sudo apt-get install gitg
git difftool -d









~/.gitconfig 一个例子

[user]
	email = denglitsch@gmail.com
	name = Andreas Zhang
[core]
	editor = xed
	quotepath = false
	autocrlf = false
[diff]
	tool = meld
[cola]
	fontdiff = Ubuntu Mono, 9, -1, 5, 50, 0, 0, 0, 0, 0
	blameviewer = git gui blame
[merge]
	tool = meld
[gui]
	fontui = -family \"WenQuanYi Micro Hei\" -size 12 -weight normal -slant roman -underline 0 -overstrike 0
	fontdiff = -family \"WenQuanYi Micro Hei Mono\" -size 12 -weight normal -slant roman -underline 0 -overstrike 0
	spellingdictionary = none
	tabsize = 4
[credential]
	helper = store




bcompare
的配置在~/.config/bcompare,其中BCPreferences.xml文件是预置过滤配置存放的文件 



mintlinx (Linux Mint 18.3 Sylvia)
增加shutter和parcellite（desktop文件复制放到~/.config/autostar）
tips：添加到桌面，再切过去
好像没有自启动效果



其他剪贴板管理器，像diodon，clipit，glipper，parcellite





Tue Jul 24 15:56:11 CST 2018

HOME目录下默认路径名称有关的配置文件
.config/user-dirs.dirs
/etc/xdg/user-dirs.conf
/etc/xdg/user-dirs.defaults

$(XDG_CONFIG_HOME)/user-dirs.dirs (XDG_CONFIG_HOME defaults to ~/.config)

默认的中文路径改成英文路径
export LANG=en_US
xdg-user-dirs-gtk-update
不保留原来名字

export LANG=zh_CN.UTF-8
xdg-user-dirs-gtk-update
保留原来名字







$ sudo apt-get install kdevelop
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  cpp-4.9-arm-linux-gnueabi libfltk-cairo1.3
Use 'apt-get autoremove' to remove them.
The following extra packages will be installed:
  kdevelop-data kdevplatform8-libs libgrantlee-core0 libprocesscore4abi1
  libprocessui4a libsublime8
Suggested packages:
  kapptemplate kdevelop-l10n ninja-build kdevplatform-l10n konsole
The following NEW packages will be installed:
  kdevelop kdevelop-data kdevplatform8-libs libgrantlee-core0
  libprocesscore4abi1 libprocessui4a libsublime8
0 upgraded, 7 newly installed, 0 to remove and 669 not upgraded.
Need to get 7,763 kB of archives.





安装haroopad
最好的markdown编辑器





查看库文件符号表
nm -g --defined-only Appro_2a_lib.a
objdump -t Appro_2a_lib.a
nm -g --defined-only libcontrolcan.so
objdump -t libcontrolcan.so 



Mon Aug 13 13:36:38 CST 2018
$ sudo apt-get install wireshark
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  cpp-4.9-arm-linux-gnueabi libfltk-cairo1.3
Use 'apt-get autoremove' to remove them.
The following extra packages will be installed:
  geoip-database-extra libjs-openlayers libnghttp2-5 libsmi2ldbl
  libwireshark-data libwireshark8 libwiretap6 libwscodecs1 libwsutil7
  wireshark-common wireshark-qt
Suggested packages:
  snmp-mibs-downloader wireshark-doc
The following NEW packages will be installed:
  geoip-database-extra libjs-openlayers libnghttp2-5 libsmi2ldbl
  libwireshark-data libwireshark8 libwiretap6 libwscodecs1 libwsutil7
  wireshark wireshark-common wireshark-qt
0 upgraded, 12 newly installed, 0 to remove and 668 not upgraded.
Need to get 30.9 MB of archives.
After this operation, 135 MB of additional disk space will be used.
Do you want to continue? [Y/n] y




2018年 08月 15日 星期三 13:55:18 CST

Mon Aug 20 22:16:59 CST 2018
处理插u盘不能进入图形界面的问题
原因是设备号有变化，比如/dev/sda1是/，但是插了个盘让这个玩意变化了，那就不能正确找到要挂载的分区
解决办法，直接用UUID
sudo blkid查看所有分区的UUID
用UUID=xxx替代原来在/etc/fstab里面的/dev/sdXX
问题解决！





禁用笔记本触摸板
~/.bashrc 文件，为这两条命令添加别名。
alias tpOff=”xinput set-prop ‘SynPS/2 Synaptics TouchPad’ ‘Device Enabled’ 0”
alias tpOn=”xinput set-prop ‘SynPS/2 Synaptics TouchPad’ ‘Device Enabled’ 1”
执行source .bashrc，使刚才起的别名生效。








$ sudo pip install --upgrade pip
$ sudo pip install intelhex-2.1-py2.py3-none-any.whl




1、安装miredo
sudo apt install miredo
2、在 /etc/systemd/system新建miredo.service文件
sudo gedit /etc/systemd/system/miredo.service
3、将以下内容复制粘贴并保存：
[Unit]
Description=Teredo IPv6 tunneling
Requires=network-online.target
After=network-online.target

[Service]
ExecStartPre=/usr/sbin/miredo-checkconf -f /etc/miredo/miredo.conf
ExecStart=/usr/sbin/miredo -f
ExecReload=/bin/kill -HUP $MAINPID
Restart=always
RestartSec=5s

[Install]
WantedBy=multi-user.target
4、设置服务开机启动
sudo systemctl enable systemd-networkd-wait-online.service
sudo systemctl enable miredo.service

已在两台笔记本上验证成功，但我并不明白命令的具体含义，只是将几个命令拼在一起。
#参考文档：https://bugs.launchpad.net/ubuntu/+source/miredo/+bug/1482069
http://tieba.baidu.com/p/1937157864
https://www.v2ex.com/t/186840
http://www.jinbuguo.com/systemd/systemd-networkd-wait-online.service.html






## this failed ## 
pip install sip

pip install pyqt5

sudo python -m pip install --upgrade pip

pip install xxx -i https://mirrors.163.com/pypi/simple --trusted-host mirrors.163.com






$ sudo apt-get install libssl-dev openssl 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  libssl1.0.0 libssl1.0.0:i386
The following packages will be upgraded:
  libssl-dev libssl1.0.0 libssl1.0.0:i386 openssl



$ sudo apt-get install idle-python*
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Note, selecting 'idle-python2.5' for regex 'idle-python*'
Note, selecting 'idle-python2.6' for regex 'idle-python*'
Note, selecting 'idle-python2.7' for regex 'idle-python*'
Note, selecting 'idle-python3.4' for regex 'idle-python*'
The following NEW packages will be installed:
  idle-python2.7 idle-python3.4



$ sudo apt-get install -y python3-pip
[sudo] password for andy: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  python3-colorama python3-distlib python3-html5lib python3-requests
  python3-wheel
Suggested packages:
  python3-genshi python3-ndg-httpsclient python3-openssl python3-pyasn1
The following NEW packages will be installed:
  python3-colorama python3-distlib python3-html5lib python3-pip
  python3-requests python3-wheel
0 upgraded, 6 newly installed, 0 to remove and 389 not upgraded.
Need to get 557 kB of archives

sudo apt-get install build-essential libssl-dev libffi-dev python-dev






$ sudo apt-get install -y python3-venv
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  python-chardet-whl python-colorama-whl python-distlib-whl
  python-html5lib-whl python-pip-whl python-requests-whl python-setuptools-whl
  python-six-whl python-urllib3-whl python3.4-venv
The following NEW packages will be installed:
  python-chardet-whl python-colorama-whl python-distlib-whl
  python-html5lib-whl python-pip-whl python-requests-whl python-setuptools-whl
  python-six-whl python-urllib3-whl python3-venv python3.4-venv
0 upgraded, 11 newly installed, 0 to remove and 389 not upgraded.




$ sudo apt-get install virtualenv
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  python3-virtualenv
The following NEW packages will be installed:
  python3-virtualenv virtualenv
0 upgraded, 2 newly installed, 0 to remove and 389 not upgraded.





$ sudo apt-get install software-properties-common

$ sudo add-apt-repository ppa:deadsnakes/ppa

sudo add-apt-repository ppa:jonathonf/python-3.5
sudo apt-get update
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 8CF63AD3F06FC659
	
	
$ sudo apt-get install screen
Reading package lists... Done
Building dependency tree        
Reading state information... Done
Suggested packages:
  iselect screenie byobu
The following NEW packages will be installed:
  screen


$ sudo apt-get install libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libsqlite3-dev is already the newest version.
libssl-dev is already the newest version.
Suggested packages:
  db5.3-doc
The following NEW packages will be installed:
  libdb5.3-dev libgdbm-dev
0 upgraded, 2 newly installed, 0 to remove and 440 not upgraded.




python3.5以上源码安装好了
wget https://www.python.org/ftp/python/3.5.6/Python-3.5.6.tar.xz
tar -Jxvf Python-3.5.6.tar.xz
cd Python-3.5.6
./configure
make all -j8
sudo make install
sudo make altinstall


sudo pip3.5 install --upgrade pip -i https://mirrors.163.com/pypi/simple




wget https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tar.xz
tar -Jxvf Python-3.6.4.tar.xz
cd Python-3.6.4
##./configure --enable-optimizations
./configure
make -j8
#sudo make altinstall
sudo make install
sudo pip3.6 install --upgrade pip
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev
sudo apt-get install -y libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm
The following NEW packages will be installed:
  llvm llvm-runtime
sudo apt-get install -y libncurses5-dev libncursesw5-dev xz-utils tk-dev

andy@debian-dell ~/Downloads/eric6-18.09
$ sudo python3.6 install.py

$ sudo pip3 install pyinstaller -i https://mirrors.163.com/pypi/simple




$ sudo apt-get install -y libopenblas-dev liblapack-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
liblapack-dev is already the newest version.
The following NEW packages will be installed:
  libopenblas-dev
0 upgraded, 1 newly installed, 0 to remove and 435 not upgraded.

$ sudo apt-get install -y libopencv-dev


python3.6 -m pip -V

$ sudo pip3 install mxnet -i https://mirrors.163.com/pypi/simple
$ sudo pip3 install tensorflow -i https://mirrors.163.com/pypi/simple
$ sudo pip3 install graphviz -i https://mirrors.163.com/pypi/simple
$ sudo pip3 install mxnet-mkl -i https://mirrors.163.com/pypi/simple

$ git clone https://github.com/mli/gluon-tutorials-zh




aria2c  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh
https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/

http://mirrors.ustc.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh



sudo pip3.6 install tensorflow==1.5 -i https://mirrors.163.com/pypi/simple
sudo pip3.6 install mxnet==1.1 -i https://mirrors.163.com/pypi/simple

下面这一句会删除pip3.5,所以要做个备份
sudo pip3.6 install --upgrade pip -i https://mirrors.163.com/pypi/simple






$ sudo apt-get install python3.5 python3.5-dev python3.5-doc
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  libmpdec2 libpython3.5 libpython3.5-dev libpython3.5-minimal
  libpython3.5-stdlib python3.5-minimal
Suggested packages:
  python3.5-venv
The following NEW packages will be installed:
  libpython3.5 libpython3.5-dev libpython3.5-minimal libpython3.5-stdlib
  python3.5 python3.5-dev python3.5-doc python3.5-minimal
The following packages will be upgraded:
  libmpdec2
1 upgraded, 8 newly installed





## python3 ## 汇总
python3 -V
pip3 -V
sudo easy_install -U pip -i https://mirrors.163.com/pypi/simple
sudo pip3 install --upgrade pip -i https://mirrors.163.com/pypi/simple
sudo python3 -m pip install -U pip -i https://mirrors.163.com/pypi/simple

sudo pip3 install QScintilla  -i https://mirrors.163.com/pypi/simple
sudo pip3 install PyQt5 -i https://mirrors.163.com/pypi/simple
sudo pip3 install pyqt5_tools -i https://mirrors.163.com/pypi/simple ## only for win
sudo pip3 install pyqtdoc -i https://mirrors.163.com/pypi/simple
sudo pip3 install pyinstaller -i https://mirrors.163.com/pypi/simple
sudo pip3 install virtualenv -i https://mirrors.163.com/pypi/simple
sudo pip3 install jupyter_client -i https://mirrors.163.com/pypi/simple
sudo pip3 install notedown -i https://mirrors.163.com/pypi/simple
sudo pip3 install matplotlib -i https://mirrors.163.com/pypi/simple
sudo pip3 install mxnet==11 -i https://mirrors.163.com/pypi/simple
sudo pip3 install graphviz -i https://mirrors.163.com/pypi/simple
sudo pip3 install mxnet-mkl -i https://mirrors.163.com/pypi/simple
sudo pip3 install scipy -i https://mirrors.163.com/pypi/simple
sudo pip3 install pytest -i https://mirrors.163.com/pypi/simple
sudo pip3 install tensorflow -i https://mirrors.163.com/pypi/simple
sudo pip3 install PyHamcrest -i https://mirrors.163.com/pypi/simple
sudo pip3 install spacy -i https://mirrors.163.com/pypi/simple
sudo python3 -m spacy download en








$ sudo apt-get install kicad-doc-zh-cn 
$ sudo apt-get install kicad-doc-en

$ sudo apt install cmake doxygen libboost-context-dev libboost-dev libboost-system-dev libboost-test-dev libcairo2-dev libcurl4-openssl-dev libgl1-mesa-dev libglew-dev libglm-dev liboce-foundation-dev liboce-ocaf-dev libssl-dev libwxbase3.0-dev libwxgtk3.0-dev python-dev python-wxgtk3.0-dev swig wx-common
The following extra packages will be installed:
  liboce-modeling-dev liboce-ocaf-lite-dev liboce-visualization-dev swig2.0
Suggested packages:
  swig-doc swig-examples swig2.0-examples swig2.0-doc
The following NEW packages will be installed:
  libglm-dev liboce-foundation-dev liboce-modeling-dev liboce-ocaf-dev
  liboce-ocaf-lite-dev liboce-visualization-dev python-wxgtk3.0-dev swig
  swig2.0
0 upgraded, 9 newly installed

源码安装kicad5
$ sudo apt-get install swig3.0 ##实际上是源码安装
$ sudo apt-get remove swig2.0
是否可以编译安装完之后再补回来？





https://www.ipaddress.com/
http://tool.chinaz.com/dns
github.com和github.global.ssl.fastly.net的ip

## /etc/hosts ##
192.30.253.112	github.com
151.101.185.194	github.global.ssl.fastly.net
151.101.184.133 avatars0.githubusercontent.com
151.101.184.133 avatars1.githubusercontent.com
151.101.184.133 assets-cdn.github.com

$ sudo systemctl restart networking.service

ssh alex@47.92.87.217 -X
scp -r local_folder remote_username@remote_ip:remote_folder
scp local_file remote_username@remote_ip:remote_folder
scp local_file remote_username@remote_ip:remote_file 
scp root@192.168.120.204:/opt/soft/nginx-0.5.38.tar.gz /opt/soft/

scp teamviewer_12.0.93330_i386.deb alex@47.92.87.217:/home/alex/Downloads
scp alex@47.92.87.217:/home/alex/kicad-symbols-git.tar.bz2 .




## github xxnet加速 ##

export https_proxy="127.0.0.1:8087"
export http_proxy="127.0.0.1:8087"
export https_proxy="127.0.0.1:1080"
export http_proxy="127.0.0.1:1080"
git config --global http.sslVerify false
##git config --global http.sslCAinfo /etc/ssl/certs/ca-certificates.crt
或者git clone -c http.sslverify=false https://github.com/KiCad/kicad-packages3D.git
export https_proxy="127.0.0.1:9150"
export http_proxy="127.0.0.1:9150"







pcbnew找不到库
/etc/ld.so.conf.d
里面有/usr/local/lib
sudo /sbin/ldconfig
使得修改生效,ok

~/.config/kicad
fp-lib-table还是要从安装目录下面去找过来才能看到所有的pcb库




执行locate前先sudo updatedb




## kicad-doc ##
$ sudo apt-get install dblatex
[sudo] password for andy: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Suggested packages:
  docbook opensp
The following NEW packages will be installed:
  dblatex
0 upgraded, 1 newly installed,

$ sudo apt-get install po4a
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  libmime-charset-perl libsgmls-perl libsombok3 libsp1c2
  libunicode-linebreak-perl sp
Suggested packages:
  libencode-hanextra-perl sgmlspl sgmls-doc
The following NEW packages will be installed:
  libmime-charset-perl libsgmls-perl libsombok3 libsp1c2
  libunicode-linebreak-perl po4a sp
0 upgraded, 7 newly installed


$ sudo apt-get install asciidoc
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  docbook-dsssl docbook-utils jadetex libosp5 libostyle1c2 openjade sgmlspl
  xmlto
Suggested packages:
  source-highlight docbook-dsssl-doc sgmls-doc xmltex
The following NEW packages will be installed:
  asciidoc docbook-dsssl docbook-utils jadetex libosp5 libostyle1c2 openjade
  sgmlspl xmlto
0 upgraded, 9 newly installed



sudo apt-get install asciidoc cmake dblatex fonts-freefont-ttf \
fonts-vlgothic gettext git make po4a source-highlight \
texlive-lang-cyrillic texlive-lang-english texlive-lang-european \
texlive-lang-french texlive-lang-german texlive-lang-italian \
texlive-lang-japanese texlive-lang-other texlive-lang-polish \
texlive-lang-spanish texlive-xetex texlive-lang-chinese



sudo apt-get install asciidoc cmake dblatex fonts-freefont-ttf \
fonts-vlgothic gettext git make po4a source-highlight \
texlive-lang-all texlive-xetex


安装texindy及所需依赖包(https://launchpad.net上面有deb包)
$ sudo apt-get install libffcall1 libffcall1-dev





andy@debian-dell ~/Downloads/kicad/kicad-doc/build
$ cmake -DLANGUAGES=en ..


doc在/usr/local/share/doc/kicad



AppStream cache update completed, but some metadata was ignored due to errors
appstreamcli --version
sudo appstreamcli refresh --force
apt list --upgradable








$ sudo apt-get remove `dpkg-query -f'${Package}:${Architecture}\n' -W '*:armhf'`
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  cpp-4.9-arm-linux-gnueabihf dpkg-cross libconfig-auto-perl
  libdebian-dpkgcross-perl
Use 'apt-get autoremove' to remove them.
The following packages will be REMOVED:
  crossbuild-essential-armhf g++-4.9-arm-linux-gnueabihf
  g++-arm-linux-gnueabihf gcc-4.9-arm-linux-gnueabihf gcc-4.9-base:armhf
  gcc-arm-linux-gnueabihf libasan1:armhf libatomic1:armhf libc6:armhf
  libc6-dev:armhf libgcc-4.9-dev:armhf libgcc1:armhf libgomp1:armhf
  libstdc++-4.9-dev:armhf libstdc++6:armhf libubsan0:armhf
  linux-libc-dev:armhf
0 upgraded, 0 newly installed, 17 to remove and 230 not upgraded.
After this operation, 70.7 MB disk space will be freed.

$ sudo dpkg --remove-architecture armhf






忽略升级
$ apt list --upgradable
$ sudo apt-mark hold firefox-esr   ##或者修改/etc/apt/apt.conf.d/里的配置文件
$ sudo apt-get upgrade

比如uex和bcompare什么的





sudo apt-get purge sqlitebrowser libqcustomplot1.2
https://packages.debian.org/search?suite=jessie&mode=filename&searchon=contents&keywords=linguist
sudo apt-get install qttools5-dev qttools5-dev-tools libqscintilla2-dev libantlr-dev

sudo apt install build-essential git-core cmake libsqlite3-dev qt5-default qttools5-dev-tools libsqlcipher-dev




$ sudo updatedb -U /media/andy/KINGIDISK/ -o /home/andy/Downloads/offen_used/locate/mlocate_n.db
$ sudo chmod 777 mlocate_n.db


sqlite3 test.db
CREATE TABLE `files` (`files` TEXT);
.tables
select * from files
.import mlocate_n.txt files
.exit;
sqlitebrowser test.db


gui导入乱码，命令行导入ok， 编译如下，失败
$ sudo apt install build-essential git-core cmake libsqlite3-dev qt5-default qttools5-dev-tools libsqlcipher-dev
$ git clone https://github.com/sqlitebrowser/sqlitebrowser
$ cd sqlitebrowser
$ mkdir build
$ cd build
$ cmake -Dsqlcipher=1 -Wno-dev -DFORCE_INTERNAL_QSCINTILLA=ON ..
$ make
$ sudo make install



操作速记
mlocate -d mlocate_n.db / > mlocate_n.txt
sort mlocate_n.txt > mlocate_n_ascii.txt
find -name 'mlocate_n_ascii.txt' | xargs perl -pi -e 's|^/media/andy||g'
sqlite3 mlocate_n1.db
drop table files;
CREATE TABLE `files` (`files` TEXT);
.tables
select * from files;
.import mlocate_n_ascii.txt files
.exit
sqlitebrowser mlocate_n1.db







watch -n 1 "cat /proc/cpuinfo"
watch -n 1 "ps aux"






将文件夹的内容制作为ISO镜像@tech_log/cd_burning/cdrecord.doc
genisoimage -V 20100724B -J -jcharset=utf8 -joliet-long -r -o /TargetImage.iso /media/CB71A5FF367EFAC1/Temp/

file(1) will show the volume label in an ISO file.
% file /tmp/FreeBSD-8.2-RC1-i386-livefs.iso

I can use command "file" to view the volume label.
I can use editors/bvi or editors/hexedit to modify the volume label. (notice: only modify the ISO9660 label, not Joliet label)
Under X Windows, I can use sysutils/isomaster to do everything.

isomaster建立和编辑iso也是ok的
 
据说linux下用chmcmd可以创建chm文件


递归显示目录内容
ls -al -R




ntfs分区的卷标不喜欢，可以用ntfslabel换掉，然后自动挂载
sudo fdisk -l 或者 df -hT
sudo umount /dev/sda5
sudo ntfslabel /dev/sda5 music







$ sudo apt-get install iperf







Run
sudo dpkg-reconfigure ca-certificates
That should give you a list where you can deselect CAs.
The list of CAs is stored in the file /etc/ca-certificates.conf. If you edit this file manually you need to run
sudo update-ca-certificates
to update the actual certificates in /etc/ssl/certs/ (if you use dpkg-reconfigure that is done automatically).
See /usr/share/doc/ca-certificates/README.Debian for more information.



git svn clone https://47.254.25.14/svn/repo_us repo_us -T trunk -b branches -t tags
Error validating server certificate for 'https://47.254.25.14:443':
 - The certificate is not issued by a trusted authority. Use the
   fingerprint to validate the certificate manually!
 - The certificate hostname does not match.
Use of uninitialized value in printf at /usr/share/perl5/Git/SVN/Prompt.pm line 55.
Certificate information:
 - Hostname: 
 - Valid: from Aug  6 19:28:19 2018 GMT until Aug  6 19:28:19 2019 GMT
 - Issuer: Default Company Ltd, Default City
 - Fingerprint: D8:25:84:DB:94:6E:B6:2A:B8:8F:7E:26:07:88:59:EF:33:F6:24:5A
Certificate problem.
(R)eject, accept (t)emporarily or accept (p)ermanently? p
Authentication realm: <https://47.254.25.14:443> SVN Repos
Password for 'andy': 
Authentication realm: <https://47.254.25.14:443> SVN Repos
Username: alex 
Password for 'alex': 

svn ls https://47.254.25.14/svn/repo_us
== svn list https://47.254.25.14/svn/repo_us

sudo certutil -L
certutil: function failed: SEC_ERROR_LEGACY_DATABASE: The certificate/key database is in an old, unsupported format.

ls ~/.subversion/auth/svn.simple/
832bbdd4a613f14f73dd66e46af83d6c
$ cat ~/.subversion/auth/svn.simple/832bbdd4a613f14f73dd66e46af83d6c 

密钥号
CD804564527D8490







How to remove all .svn directories from my application directories？
find . -name .svn | rm -fr
It didn't work...


Before running a command like that, I often like to run this first:
find . -type d -name .svn -exec ls '{}' \;
Try this:
find . -type d -name .svn -exec rm -rf '{}' \;
find . -name .svn | xargs rm -fr
find . -type d -name .svn -print0 | xargs -0 rm -rf
find . -name .svn -exec rm -rf {} \;
find . -depth -name .svn -exec rm -fr {} \;
find . -name .svn -exec rm -v {} \;

Newer implementations of rm allow you to conclude the command with a + indicating that rm will accept as many arguments as possible:
find . -name .svn -exec rm -rf {} +

No need for pipes, xargs, exec, or anything（-delete won't touch a directory if it contains files）
find . -name .svn -delete

Alternatively, if you want to export a copy without modifying the working copy, you can use rsync:
rsync -a --exclude .svn path/to/working/copy path/to/export

svn checkout --non-interactive --trust-server-cert --username name --password password --no-auth-cache -r revision https://server.address/trunk/
echo "t" | svn checkout --username name --password password --no-auth-cache -r revision https://server.address/trunk/
yes 't' | svn checkout --username name --password password --no-auth-cache -r revision https://server.address/trunk/
svn checkout --username name --password password --no-auth-cache -r revision https://server.address/trunk/
{sleep 3; echo "t"; } | svn checkout ...








Revoke a Certificate
openssl ca -config openssl.cnf（/etc/ssl里有一个） -revoke certs/$domain.crt
Enter pass phrase for ./private/ca.key: $password



//git config --global merge.tool vimdiff  
Git可以接受kdiff3, tkdiff, meld, xxdiff, emerge, vimdiff, gvimdiff, ecmerge, 和 opendiff作为有效的合并工具
git help config

git config --list
命令来列出Git可以在该处找到的所有的设置


$ cat /home/andy/.gitconfig
[user]
	name = Andreas Zhang
	email = denglitsch@gmail.com
	signingkey = CD804564527D8490
[color]
	ui = auto
[commit]
	gpgsign = false
[http]
	sslVerify = false






$ sudo apt-get install qt5-doc-html pyqt5-doc --reinstall
[sudo] password for andy: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  qtbase5-doc-html qtdeclarative5-doc-html qtenginio5-doc-html
  qtgraphicaleffects5-doc-html qtmultimedia5-doc-html qtpositioning5-doc-html
  qtscript5-doc-html qtsensors5-doc-html qtserialport5-doc-html
  qtsvg5-doc-html qttools5-doc-html qtwebkit5-doc-html
  qtwebkit5-examples-doc-html qtwebsockets5-doc-html qtx11extras5-doc-html
  qtxmlpatterns5-doc-html
The following NEW packages will be installed:
  qt5-doc-html qtbase5-doc-html qtdeclarative5-doc-html qtenginio5-doc-html
  qtgraphicaleffects5-doc-html qtmultimedia5-doc-html qtpositioning5-doc-html
  qtscript5-doc-html qtsensors5-doc-html qtserialport5-doc-html
  qtsvg5-doc-html qttools5-doc-html qtwebkit5-doc-html
  qtwebkit5-examples-doc-html qtwebsockets5-doc-html qtx11extras5-doc-html
  qtxmlpatterns5-doc-html
0 upgraded, 17 newly installed, 1 reinstalled

sudo pip2 install pyqtdoc -i https://mirrors.163.com/pypi/simple
/usr/local/Lib\site-packages\PyQt4\doc\qch


sudo updatedb
locate .qch
locate qnetworkconfiguration.html
locate qtnetwork.html
locate site-packages
其实pyqt的参考文档在
http://pyqt.sourceforge.net/Docs/PyQt4/modules.html
也可以在对应win安装包里找到的
/usr/share/doc/python-qt4-doc/html
/usr/share/doc/python-qt4-doc/examples
/usr/share/doc/pyqt5-doc/html
/usr/share/doc/pyqt5-examples/examples
/usr/lib/qt4/examples
/usr/lib/x86_64-linux-gnu/qt5/examples/
/usr/share/qt5/doc
/usr/share/doc/python2.7/examples
/usr/share/doc/python3.5/examples





sudo pip3.6 install --upgrade pip -i https://mirrors.163.com/pypi/simple
sudo pip3.5 install --upgrade pip -i https://mirrors.163.com/pypi/simple
sudo pip2 install --upgrade pip -i https://mirrors.163.com/pypi/simple

sudo pip3.5 install dot2tex -i https://mirrors.163.com/pypi/simple
sudo pip3.6 install dot2tex -i https://mirrors.163.com/pypi/simple
sudo pip2 install dot2tex -i https://mirrors.163.com/pypi/simple

sudo pip3.5 uninstall dot2tex
sudo pip3.6 uninstall dot2tex
sudo pip2 uninstall dot2tex
sudo apt-get install dot2tex --reinstall

sudo apt-get purge dot2tex


安装sphinx-build
sudo pip2 install sphinx -i https://mirrors.163.com/pypi/simple

sphinx-build -b latex -d _build/doctrees   . _build/latex
Running Sphinx v1.8.1
Extension error:
Could not import extension sphinx.ext.pngmath (exception: No module named pngmath)


$ sudo apt-get install python-sphinx
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  python-jinja2 python-markupsafe sphinx-common sphinx-doc
Suggested packages:
  python-jinja2-doc
The following NEW packages will be installed:
  python-jinja2 python-markupsafe python-sphinx sphinx-common sphinx-doc
0 upgraded, 5 newly installed



$ sudo pip3.6 install sphinx -i https://mirrors.163.com/pypi/simple
$ sudo pip3.5 install -U sphinx -i https://mirrors.163.com/pypi/simple
$ sudo pip2 install -U sphinx -i https://mirrors.163.com/pypi/simple
$ sudo pip3.6 install -U sphinx -i https://mirrors.163.com/pypi/simple


$ sudo apt-get install sphinxbase-utils 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  libsphinxbase1
The following NEW packages will be installed:
  libsphinxbase1 sphinxbase-utils
0 upgraded, 2 newly installed


http://gmt.soest.hawaii.edu/boards/1/topics/6109
Think your sphinx is too old. Mine is 1.6.5 and I remember there was a change from some older name (pngmath) to the imgmath around the 1.3,1.4 releases.

修改dot2tex-git/docs/conf.py
sphinx.ext.pngmath -> sphinx.ext.imgmath
运行make latex
再运行make latexpdf，或到dot2tex-git/docs/_build/latex/运行make
就生成dot2tex.pdf了





$ tlmgr install collection-latexextra




sudo apt-file update
apt-file -x search '/multind.sty$'
https://www.ctan.org/pkg/multind?lang=en







抓取网站的mirror目录
wget -c -r -npH -k -e robots=off -E https://mirrors.tuna.tsinghua.edu.cn/CTAN/info/
-c：断点续传
-r：递归下载
-np：递归下载时不搜索上层目录
-nd：递归下载时不创建一层一层的目录,把所有文件下载当前文件夹中
-p：下载网页所需要的所有文件(图片,样式,js文件等)
-H：当递归时是转到外部主机下载图片或链接
-k：将绝对链接转换为相对链接,这样就可以在本地脱机浏览网页了
-m //镜像，就是整站抓取
-e robots=off //忽略robots协议
-E //将所有text/html文档以.html扩展名保存
find  . -name  '*?C*' -print -exec  rm -rf  {} \;







* * *
# 为 python3 安装 PyQt4
pip3查不到有PyQt4，但是书上的例子是python2+pyqt4

## 一般python包的安装
```
python configure.py
make
sudo make install

```

- - -
## 为 python3 安装 PyQt4 -- 这样编译PyQt4

== 源码安装 pyqt4 for pyhthon 3.5 ==
```
sudo pip3.5 uninstall sip
cd sip-4.19.12/
python3.5 configure.py	## 这次是配置 编译PyQt 要用的SIP v4 (i.e. the sip.sipconfig module)
make
sudo make install

cd ../PyQt4_gpl_x11-4.12.3/
##python3.5 configure.py ## 就用 SIP v4 编译
python3.5 configure-ng.py ## qmake 编译 ，还是需要配置编译SIP v4，不然版本不够
make -j $(nproc)
sudo make install

cd ../sip-4.19.12/
make clean
#python3.5 configure.py --sip-module PyQt4.sip --no-dist-info --no-tools
#会报错 ValueError: PyCapsule_GetPointer called with incorrect name
python3.5 configure.py --sip-module PyQt4.sip
make	## 这次是配置运行 import PyQt4 所需要的 PyQt4.sip
sudo make install
```

ok，可以用了，python3.5支持PyQt4了(就是可以import了)

==如果有问题就还原sip为安装版本==
```
sudo pip3.5 uninstall sip
sudo pip3.5 install --upgrade  sip -i https://mirrors.163.com/pypi/simple
```

运行情况
```
$ python3.5 signals.pyw 1
Traceback (most recent call last):
  File "signals.pyw", line 13, in <module>
    from PyQt4.QtCore import *
ValueError: PyCapsule_GetPointer called with incorrect name
```
我操哦，不能用。现在机器上3.5是apt安装的3.6是源码安装的，看来源码安装python是最好的


- - -

== 源码安装 python 3.5 ==
```
wget https://www.python.org/ftp/python/3.5.6/Python-3.5.6.tar.gz
tar -zxvf Python-3.5.6.tar.xz
cd Python-3.5.6
##./configure --enable-optimizations
./configure
make -j $(nproc)
#sudo make altinstall
sudo make install -n
sudo make install
sudo pip3.5 install --upgrade pip -i https://mirrors.163.com/pypi/simple
```


- - -

== 源码安装 pyqt4 for pyhthon 3.6 ==
```
sudo pip3.6 uninstall sip
cd sip-4.19.12/
python3.6 configure.py	## 这次是配置 编译PyQt 要用的SIP v4 (i.e. the sip.sipconfig module)
make
sudo make install

cd ../PyQt4_gpl_x11-4.12.3/
##python3.6 configure.py ## 就用 SIP v4 编译
python3.6 configure-ng.py ## qmake 编译 ，还是需要配置编译SIP v4，不然版本不够
make -j $(nproc)
sudo make install

cd ../sip-4.19.12/
make clean
#python3.6 configure.py --sip-module PyQt4.sip --no-dist-info --no-tools
#会报错 ValueError: PyCapsule_GetPointer called with incorrect name
python3.6 configure.py --sip-module PyQt4.sip
make	## 这次是配置运行 import PyQt4 所需要的 PyQt4.sip
sudo make install
```

ok，可以用了，python3.6支持PyQt4了(就是可以import了)

如果有问题就还原sip为安装版本
```
sudo pip3.6 uninstall sip
sudo pip3.6 install --upgrade  sip -i https://mirrors.163.com/pypi/simple
```



- - -


查看要安装的文件和位置
```
sudo make install -n
```
查看要卸载的文件和位置
```
sudo make uninstall -n
```



指定单次安装源
```
pip install <包名> -i http://pypi.v2ex.com/simple
```

指定全局安装源
在unix和macos，配置文件为：$HOME/.pip/pip.conf
在windows上，配置文件为：%HOME%\pip\pip.ini
```
[global]
timeout = 6000
  index-url = http://pypi.douban.com/simple
```







端口占用情况
netstat -tunlp 














sudo apt install /home/alex/New/_NividaTX2/JETPACK/jetpack_download/libopencv_3.3.1_amd64.deb /home/alex/New/_NividaTX2/JETPACK/jetpack_download/libopencv-dev_3.3.1_amd64.deb /home/alex/New/_NividaTX2/JETPACK/jetpack_download/libopencv-python_3.3.1_amd64.deb /home/alex/New/_NividaTX2/JETPACK/jetpack_download/libopencv-samples_3.3.1_amd64.deb















find /var/log -maxdepth 1 -print0 -type f | xargs -0 ls -ld
find /var/log  -type f -exec ls -ld {} \;
find /var/log/ -type f -ls
find /usr/share/man/ | sed -e "s#/usr/share/man##" | grep \^/man | awk -F/ '{ print $3 }' | sed -e "s/\.[0-9].gz//"




find man doc
man -k [a-z] | more
to search for anything hex related as an example:
man -k hex | more








查看命令类型
type -a xxx













~/.gitconfig

-------------------------------
[user]
	name = Andreas Zhang
	email = denglitsch@gmail.com
	signingkey = CD804564527D8490
[core]
	autocrlf = false    
	longpaths = true
[color]
	ui = auto
[commit]
	gpgsign = false
[http]
	sslVerify = false
-------------------------------















date

autoconf libjpeg-dev libpng12-dev libfreetype6-dev libgtk2.0-dev libjpeg-dev libpng12-dev libfreetype6-dev libsqlite3-dev libxml2-dev  electric-fence
#libssl1.0-dev cannot







sudo apt-get install qtbase5-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  libqt5concurrent5 libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5
  libqt5opengl5 libqt5opengl5-dev libqt5printsupport5 libqt5sql5
  libqt5sql5-sqlite libqt5test5 libqt5widgets5 libqt5xml5 qt5-qmake
  qtbase5-dev-tools qtbase5-examples
Suggested packages:
  firebird-dev
The following packages will be upgraded:
  libqt5concurrent5 libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5
  libqt5opengl5 libqt5opengl5-dev libqt5printsupport5 libqt5sql5
  libqt5sql5-sqlite libqt5test5 libqt5widgets5 libqt5xml5 qt5-qmake
  qtbase5-dev qtbase5-dev-tools qtbase5-examples
17 upgraded, 0 newly installed, 0 to remove and 1124 not upgraded.
Need to get 16.3 MB of archives.

https://packages.debian.org/jessie/libbotan1.10-dev
$ sudo apt-get install libbotan1.10-dev 


编译libQtShadowsocks-1.11.0
https://github.com/shadowsocks/libQtShadowsocks/wiki/Compiling
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make -j4
sudo make install


https://github.com/shadowsocks/shadowsocks-qt5/wiki/Compiling


botan2.10
https://github.com/randombit/botan
sudo apt-get install libasio-dev
python3 configure.py
make -j8
sudo make install


修改libQtShadowsocks-2.1.0的makelist的qt版本为5.3
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make -j8
sudo make install






非要qt5.5,




apt-get install shadowsocks-libev




sudo apt-get install shadowsocks-qt5 
ss-qt5






源过期处理
InRelease is expired. Updates for this repository will not be applied.
sudo apt-get -o Acquire::Check-Valid-Until=false update



deb http://ppa.launchpad.net/hzwhuang/ss-qt5/ubuntu trusty main
sudo apt-get -o Acquire::Check-Valid-Until=false update
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 6DA746A05F00FA99
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 648ACFD622F3D138
sudo apt-get install shadowsocks-qt5




ss-local -v -c ./config.json
------------
{
    "server":"104.238.150.238",
    "server_port":5000,
    "local_address": "127.0.0.1",
    "local_port":1081,
    "password":"202619.5",
    "timeout":300,
    "method":"aes-256-ctr",
    "fast_open": false,
    "workers": 1
}
-------------


sudo apt-get install android-tools-fsutils



sudo apt-get install klatexformula

The following packages were automatically installed and are no longer required:
  libavdevice55 libproxy-tools vlc-plugin-pulse
Use 'apt-get autoremove' to remove them.
The following extra packages will be installed:
  libklatexformula3
The following NEW packages will be installed:
  klatexformula libklatexformula3


sudo apt-get install equalx




sudo dpkg-reconfigure dash
sudo apt-get install libav-tools 
sudo apt-get install libav-tools 
sudo apt-get update -qq && sudo apt-get -y install   autoconf   automake   build-essential   cmake   git-core   libass-dev   libfreetype6-dev   libsdl2-dev   libtool   libva-dev   libvdpau-dev   libvorbis-dev   libxcb1-dev   libxcb-shm0-dev   libxcb-xfixes0-dev   pkg-config   texinfo   wget   zlib1g-dev
sudo apt-get -y install   autoconf   automake   build-essential   cmake   git-core   libass-dev   libfreetype6-dev   libsdl2-dev   libtool   libva-dev   libvdpau-dev   libvorbis-dev   libxcb1-dev   libxcb-shm0-dev   libxcb-xfixes0-dev   pkg-config   texinfo   wget   zlib1g-dev
sudo aptitude install   autoconf   automake   build-essential   cmake   git-core   libass-dev   libfreetype6-dev   libsdl2-dev   libtool   libva-dev   libvdpau-dev   libvorbis-dev   libxcb1-dev   libxcb-shm0-dev   libxcb-xfixes0-dev   pkg-config   texinfo   wget   zlib1g-dev
sudo apt-get install libav-tools 
sudo apt-get install ffmpeg
sudo aptitude install ffmpeg
sudo apt-get install nasm
apt-get install libav-tools 
sudo apt-get install yasm
sudo apt-get install nasm
sudo apt-get install libx264-dev
sudo apt-get install libx265-dev libnuma-dev libvpx-dev libfdk-aac-dev libmp3lame-dev libopus-dev 
sudo aptitude install libx265-dev libnuma-dev libvpx-dev libfdk-aac-dev libmp3lame-dev libopus-dev 
sudo apt install libnuma-dev libvpx-dev libfdk-aac-dev libmp3lame-dev libopus-dev 
sudo aptitude install libx265-dev
sudo aptitude install libx265
sudo aptitude install libx265-116
sudo aptitude install libx265-dev
sudo aptitude install libx265-116
sudo aptitude remove libnuma1
sudo aptitude install libnuma1
sudo aptitude install libx265-dev 
sudo gedit /etc/apt/sources.list
sudo apt-get update 
sudo aptitude install libx265-dev
sudo aptitude install libx265---
sudo aptitude install libx265-87 
sudo apt install libx265-87 
sudo apt install libx265-dev
sudo gedit /etc/apt/sources.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys  5C808C2B65558117
sudo apt-get -o Acquire::Check-Valid-Until=false update
sudo apt install libx265-dev
sudo apt install ffmpeg
sudo aptitude install ffmpeg
sudo aptitude install libx265-dev libnuma-dev
sudo apt-get install libvpx-dev
sudo apt-get install libfdk-aac-dev libmp3lame-dev libopus-dev libaom-dev 
sudo apt-get install libfdk-aac-dev libmp3lame-dev libopus-dev
sudo apt-get install ffmpeg
sudo apt-get install libavcodec56 libavdevice56
sudo apt-get install libavcodec56 libavdevice56 libfdk-aac1
sudo apt-get install ffmpeg
ffmpeg 
ffprobe 
sudo apt-get install libfdk-aac-dev libmp3lame-dev libopus-dev

sudo apt-get install make libc6:i386 lib32z1 lib32stdc++6 zlib1g-dev libncurses5-dev ncurses-term libncursesw5-dev g++ u-boot-tools:i386 texinfo texlive gawk libssl-dev openssl bc curl upx
sudo aptitude install nautilus-share samba samba-common smbclient smbfs system-config-samba winbind cifs-utils
sudo apt-get install zlib1g-dev liblzo2-dev uuid-dev pkg-config ffmpeg mtd-utils autoconf automake
sudo apt-get install zlib1g-dev liblzo2-dev uuid-dev pkg-config mtd-utils autoconf automake
sudo apt-get install ffmpeg
ffmpeg
sudo gedit /etc/apt/sources.list
sudo apt-get install autoconf automake build-essential libass-dev     libfreetype6-dev libgpac-dev libsdl1.2-dev libtheora-dev libtool     libva-dev libvdpau-dev libvorbis-dev libx11-dev libxext-dev     libxfixes-dev pkg-config texi2html zlib1g-dev yasm
ffmpeg
ffprobe
sudo apt-get install libfdk-aac-dev libmp3lame-dev libopus-dev
sudo apt-get update 
sudo apt-get install ffmpeg
sudo aptitude install ffmpeg
avconv -formats
ffmpeg
ffprobe
ffmvforce --help
sudo apt-get install libav-tools
x264 --help








wps的et,等效于excel


readelf -d xxx 也有 类似 ldd的效果,查看交叉编译的目标文件调用库依赖





$ sudo apt-get install linaro-image-tools
[sudo] password for andy: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libavdevice55 libproxy-tools vlc-plugin-pulse
Use 'apt-get autoremove' to remove them.
The following extra packages will be installed:
  btrfs-tools command-not-found cryptsetup-bin liblvm2app2.2 python-gdbm
  python-linaro-image-tools python-parted udisks
Suggested packages:
  python-gdbm-dbg xfsprogs reiserfsprogs mdadm
The following NEW packages will be installed:
  btrfs-tools command-not-found cryptsetup-bin liblvm2app2.2
  linaro-image-tools python-gdbm python-linaro-image-tools python-parted
  udisks
0 upgraded, 9 newly installed, 0 to remove and 89 not upgraded.
Need to get 1,632 kB of archives.
After this operation, 7,594 kB of additional disk space will be used.
Do you want to continue? [Y/n] 






sudo apt-get install build-essential vim tofrodos iproute2 gawk gcc git make net-tools zlib1g-dev libssl-dev flex bison libselinux1 libncurses5-dev tftpd lib32z1 lib32ncurses5 libbz2-1.0:i386 lib32stdc++6 xvfb chrpath socat autoconf libtool

./petalinux-v2017.4-final-installer.run /opt/petalinux

Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
 $ . /opt/petalinux/components/yocto/source/microblaze_lite/environment-setup-microblazeel-v10.0-bs-cmp-ml-xilinx-linux



# 恢复wine的版本foxitreader
```
新foxitreader书签太坑人, 旧的怎么恢复wine的版本?
wine-extension-pdf.desktop
env WINEPREFIX="/home/andy/.wine" wine start /ProgIDOpen FoxitReader.Document %f
FoxitReader.Document是在./.wine/system.reg中定义的, 修改成正确的就可以用了. 之前是定位到移动硬盘上的exe去了, 所以插移动硬盘能开pdf
D:\\software\\reader\\pdf\\foxit\\Foxit Reader.exe替换成
C:\\Program Files\\Foxit Software\\Foxit Reader\\Foxit Reader.exe
```


# 编译安装DSView, 并设置单独的运行库
```
git clone https://github.com/DreamSourceLab/DSView.git
sudo apt-get install libzip-dev check libfftw3-bin libfftw3-dev libfftw3-long3 libfftw3-quad3


 $ cd libsigrok4DSL
 $ ./autogen.sh
 $ ./configure
 $ make
 $ sudo make install
 $ cd ..

 $ cd libsigrokdecode4DSL
 $ ./autogen.sh
 $ ./configure
 $ make
 $ sudo make install
 $ cd ..

 $ cd DSView
 $ cmake .

 $ make
 $ sudo make install
```

## 重新编译python3.6
```
./configure --enable-shared CFLAGS=-fPIC
make -j$(nproc)
sudo make install


参考:
运行ldd /usr/local/bin/python3，看看python3运行所需要的库，结果显示如下:

linux-vdso.so.1 =>  (0x00007fff70da5000)
libpython3.6m.so.1.0 => not found
libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f1496ff1000)
libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f1496c27000)
/lib64/ld-linux-x86-64.so.2 (0x00007f149720e000)
发现那个依赖文件的确没有找到.。

查找一下文件的位置:

find /-name 'libpython3.3m.so.1.0'
文件位置为:

/usr/local/lib/libpython3.6m.so.1.0
之后在目录/etc/ld.so.conf.d下，建立python3.conf文件

cd /etc
cd ld.so.conf.d
sudo touch python3.conf
然后编辑该文件，加入libpython3.6m.so.1.0文件所在的目录

sudo gedit python3.conf                   #编辑文件

/usr/local/lib/                           #加入文件所在的目录
最后运行：sudo ldconfig
```
## 现在可以继续编译了

```
 $ cd DSView
 $ cmake .

干你娘, apt安装的qt5版本还是太低了, 解决办法是安装高版本qt并设置环境变量并设置cmake配置路径就行了
The Qt:AA_EnableHighDpiScaling was introduced in QT 5.6 ( http://blog.qt.io/blog/2016/01/26/high-dpi-support-in-qt-5-6/ ) 
Ubuntu Trusty provides 5.2.1, xenial provides 5.5.1 thus OBS will not compile without manually updating Qt until yakkety providing 5.6.1. 
找到Qt5Core_DIR之类的路径指定为/opt/Qt5.10.1/5.10.1/gcc_64/lib/cmake/Qt5Core

 $ make
 $ sudo make install
cp /usr/share/applications/DSView.desktop ~/Desktop/


cd /usr/local/bin
sudo mv DSView ../share/DSView/
复制/usr/local/share/DSView到/opt
建立相对目录如下
/opt/DSView/bin,把可执行文件复制到这里
/opt/DSView/share/DSView

cd /usr/local/bin
sudo gedit DSView
sudo chmod +x DSView
-------------------------------------------------
#!/bin/bash
export QTDIR=/opt/Qt5.10.1/5.10.1/gcc_64
export PATH=$QTDIR/bin:/opt/Qt5.10.1/Tools/QtCreator/bin:$PATH
export LD_LIBRARY_PATH=$QTDIR/lib:/opt/Qt5.10.1/Tools/QtCreator/lib/qtcreator:$LD_LIBRARY_PATH
/opt/DSView/bin/DSView
-------------------------------------------------
修改/usr/share/applications/DSView.desktop里的desktop文件,图标要修改路径了
```



# 终于受不了qt5版本问题了,干脆弄个5.10版本的

qt account
202619.Mm5
yxgi5@163.com

## 安装qt5.10到opt
```
----------------------1 不安全,看总结
sudo gedit /etc/profile
#启动QtCreator
export QTDIR=/opt/Qt5.10.1/5.10.1/gcc_64
export PATH=$QTDIR/bin:/opt/Qt5.10.1/Tools/QtCreator/bin:$PATH
export LD_LIBRARY_PATH=$QTDIR/lib:/opt/Qt5.10.1/Tools/QtCreator/lib/qtcreator:$LD_LIBRARY_PATH


source /etc/profile
source ~/.bashrc

sudo gedit /etc/ld.so.conf.d/qt5.10.conf
然后编辑该文件，加入
/opt/Qt5.10.1/5.10.1/gcc_64/lib
最后运行：sudo ldconfig


--------------------2 不安全,看总结
或者
sudo gedit /usr/lib/x86_64-linux-gnu/qt-default/qtchooser/default.conf
#/usr/lib/x86_64-linux-gnu/qt4/bin
#/usr/lib/x86_64-linux-gnu
修改成
/opt/Qt5.10.1/
/opt/Qt5.10.1/5.10.1/gcc_64/bin


```

## cmake配置
找到类似Qt5Core_DIR之类的路径指定为/opt/Qt5.10.1/5.10.1/gcc_64/lib/cmake/Qt5Core

## 系统QT库设置变更之后的库依赖的错乱现象
```

https://bitbucket.org/gusphdproj/deeparg-ss
https://files.pythonhosted.org/packages/a0/c5/d2238762d780dde84a20b8c761f563fe882b88c5a5fb03c056547c442a19/scikit_learn-0.21.3-cp36-cp36m-manylinux1_x86_64.whl
sudo pip3.6 install nolearn

sudo pip3.6 install PyQtWebEngine -i https://mirrors.163.com/pypi/simple
自动更新qt5 lib到最新
markups

sudo pip3.6 install retext -i https://mirrors.163.com/pypi/simple
FT_Get_Font_Format

tar -xf freetype-2.10.0.tar.bz2
cd freetype-2.10.0/
./configure --prefix=/usr/lib/freetype
make
make install
libfreetype.so.6 替换掉原先的libfreetype.so.6
sudo pip3.6 install docwriter -i https://mirrors.163.com/pypi/simple
//sudo pip3.6 uninstall retext

andy@debian-dell /usr/lib/x86_64-linux-gnu
$ sudo ln -s libfreetype.so.6.17.0 libfreetype.so
$ sudo ln -s libfreetype.so.6.17.0 libfreetype.so.6
retext能用,qtqr依然能用,就ok了嘛

$ sudo apt-get purge retext
5.0.1
现在可以修改重命名/usr/local/share/applications里的desktop文件了, 名字是retext.desktop,小写.
这样还是可以右键开启文件的



for i in /opt/fsl/lib/*.so; do echo $i; nm -D $i | grep -in glGenVertexArrays; done



retext输入字符闪退....



apt安装的retext果然是因为Qt库指定为5.10(ldconfig)才挂了.



sudo pip3.6 install retext -i https://mirrors.163.com/pypi/simple
7.0.4
sudo pip3.6 uninstall retext
sudo pip3.6 install retext==5.0.1 -i https://mirrors.163.com/pypi/simple
sudo pip3.6 uninstall retext
sudo apt-get install retext


retext还原ok, ldconfig没有动, qtchooser没有动, DSView单独用5.10的库, 或者指向pyqt的更高版本的库

retext没有icon,
sudo apt-get install retext retext-wpgen
没有效果


需要配置文件~/.config/ReText\ project/ReText.conf,添加：

[General] 
iconTheme=gnome

搞定!

sudo apt-get install libjs-mathjax
sudo apt-get install python-pygments
gedit ~/.config/markdown-extensions.txt
添加
codehilite
mathjax


css用github.css(我目前放到~/.config/ReText project/github.css)
/usr/share/wpgen/style_Blue.css



更新的版本编译安装
https://github.com/retext-project/retext

--user安装到用户目录
/home/andy/.local/bin
测试还是存在闪退现象. 不玩了, TMD


pip3.6  uninstall retext
然后删掉
/home/andy/.local/bin/
/home/andy/.local/lib/python3.6/

```

## 更安全的办法,使用qtchooser
```
$ qtchooser  -l
4
5
default
qt4-x86_64-linux-gnu
qt4
qt5-x86_64-linux-gnu
qt5

应该是对应
/usr/lib/x86_64-linux-gnu/qtchooser
下面的几个软链接

实际位置
/usr/share/qtchooser/
文件为
qt4-x86_64-linux-gnu.conf
qt5-x86_64-linux-gnu.conf

/usr/lib/x86_64-linux-gnu/qt-default/qtchooser
下面实际上是个软链接
指向/usr/share/qtchooser/中qt的某个conf文件




qtchooser -install qt5.10 /opt/Qt5.10.1/5.10.1/gcc_64/bin/qmake
/home/andy/.config/qtchooser/
会有
qt5.10.conf
内容是
/opt/Qt5.10.1/5.10.1/gcc_64/bin
/opt/Qt5.10.1/5.10.1/gcc_64/lib

$ export QT_SELECT=qt5.10

$ qmake -v
QMake version 3.1
Using Qt version 5.10.1 in /opt/Qt5.10.1/5.10.1/gcc_64/lib


qmake -qt=qt5.10 -v
和
export QT_SELECT=qt5.10是一样的
```


## 再就是qtcreator了
```
export QTDIR=/opt/Qt5.10.1/5.10.1/gcc_64
export PATH=/opt/Qt5.10.1/Tools/QtCreator/bin:$QTDIR/bin:$PATH
export LD_LIBRARY_PATH=$QTDIR/lib:/opt/Qt5.10.1/Tools/QtCreator/lib/qtcreator:$LD_LIBRARY_PATH

which qtcreator
whereis qtcreator

cp /usr/share/applications/qtcreator.desktop ~/.local/share/applications/
修改一下路径就可以用

最后
./profile里面有个
export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/x86_64-linux-gnu/qt5/plugins/platforms
```

## 总结:如果全部换成qt5.10, 其他都不要动, 只需要临时设置环境变量
```
export QTDIR=/opt/Qt5.10.1/5.10.1/gcc_64
export PATH=/opt/Qt5.10.1/Tools/QtCreator/bin:$QTDIR/bin:$PATH
export LD_LIBRARY_PATH=$QTDIR/lib:/opt/Qt5.10.1/Tools/QtCreator/lib/qtcreator:$LD_LIBRARY_PATH
export QT_QPA_PLATFORM_PLUGIN_PATH=/opt/Qt5.10.1/5.10.1/gcc_64/plugins/platforms
或者
export QTDIR=/opt/Qt5.10.1/5.10.1/gcc_64
export PATH=/opt/Qt5.10.1/Tools/QtCreator/bin:$QTDIR/bin:$PATH
export LD_LIBRARY_PATH=$QTDIR/lib:/opt/Qt5.10.1/Tools/QtCreator/lib/qtcreator:$LD_LIBRARY_PATH
export QT_QPA_PLATFORM_PLUGIN_PATH=

为啥不动系统配置,要动配置也配置成用户配置,为了之前安装的东西还能继续用啊.
```




# 安装glmark
```
sudo apt-get -o Acquire::Check-Valid-Until=false update
sudo apt-get install git g++ build-essential pkg-config
sudo aptitude install libx11-dev libgl1-mesa-dev

cd ~/Downloads
git clone https://github.com/glmark2/glmark2.git
cd glmark2/
./waf configure --with-flavors=x11-gl
./waf build -j 4
./waf install --destdir=glmark2-out
./waf configure --with-flavors=x11-glesv2
./waf build -j 4
./waf install --destdir=glmark2-out 
（本机安装，执行"./waf install"）

sudo strip -s glmark2-out/usr/local/bin/glmark2
sudo strip -s glmark2-out/usr/local/bin/glmark2-es2

打包
或者复制out目录到系统路径


$ taskset -c 4-5 glmark2-es2
```






# apt强制更新过期源
```
sudo apt-get -o Acquire::Check-Valid-Until=false update
sudo aptitude -o Acquire::Check-Valid-Until=false update
```

# 蓝牙 Bluetooth
```
sudo apt-get install blueman
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  gir1.2-appindicator3-0.1 libopenobex1 obex-data-server
The following NEW packages will be installed:
  blueman gir1.2-appindicator3-0.1 libopenobex1 obex-data-server
0 upgraded, 4 newly installed, 0 to remove and 319 not upgraded.
Need to get 1,847 kB of archives.

sudo apt-get install blueman bluez*

hcitool scan
bluez-simple-agent hci075:EF:82:69:D2:83
bluez-test-device trusted75:EF:82:69:D2:83 yes
bluez-test-input connect75:EF:82:69:D2:83
$ sudo -i
# bluetoothctl
[bluetooth]# power off
[bluetooth]# power on
[bluetooth]# scan on
[bluetooth]# connect XX:XX:XX:XX:XX:XX
[Arc Touch Mouse SE]# trust
[Arc Touch Mouse SE]# pair
[Arc Touch Mouse SE]# unblock
[Arc Touch Mouse SE]# power off
[bluetooth]# power on

/etc/bluetooth/main.conf
[Policy]
AutoEnable
sudo vi /lib/udev/rules.d/50-bluetooth-hci-auto-poweron.rules
每行都加上 # 开头，其实也可以删除了这个文件。


sudo apt-get purge blueman
sudo apt purge blueproximity
```



解压进度条
参考海思解压脚本
run_command_progress_float在scripts/common.sh定义的



几个讨厌的autorun程序去掉
/home/andy/.config/autostart
其他位置查autostart



EDID调试讯息
cat /proc/umap/hdmi0_sink



# 百度云盘
cd /usr/local/bin
sudo gedit baidunetdisk
------------------------------------
#!/bin/bash
/opt/baidunetdisk/baidunetdisk
------------------------------------
sudo chmod +x baidunetdisk




sudo apt-get install hwinfo
sudo apt-get install mediainfo
sudo apt-get install libgpac-dev




sudo gedit /etc/resolv.conf
sudo /etc/init.d/networking restart

ping6 fe80::20c:29ff:fe1c:8c75%eth0

ping -6 fe80::20c:29ff:fe1c:8c75






sudo apt-get install archivemount





gcc a.c -o a.S -S 就可以生成汇编
收发二进制可使用 dump 命令，cat 只是测试字符







sudo apt install qemu-kvm qemu virt-manager libvirt-bin bridge-utils iptables dnsmasq uml-utilities








sudo gedit /etc/libvirt/libvirtd.conf
unix_sock_group = "libvirt"
unix_sock_ro_perms = "0777"
unix_sock_rw_perms = "0770"

sudo systemctl start libvirtd
sudo systemctl enable libvirtd

sudo usermod -a -G libvirt $(whoami)
注销并重新登录
可以通过命令行 （virsh） 或通过 virt-manager 图形界面管理 libvirt 系统


/var/lib/libvirt/images



shadowsocks有关
安装 shadowsocks-libev(c++) 或者 shadowsocks(Python)

shadowsocks-qt5采用aes-256-cfb可能会出现
ERR_SSL_VERSION_OR_CIPHER_MISMATCH
自带的ss-qt5不会出现这个问题
可能和botan有关


$ sudo apt-get install shadowsocks
The following NEW packages will be installed:
  python-m2crypto shadowsocks

$ sudo apt-get shadowsocks-libev


编辑/etc/shadowsocks/config.json

ss-local -c /etc/shadowsocks/config.json
或者
sslocal -c /etc/shadowsocks/config.json

参考
https://wiki.archlinux.org/index.php/Shadowsocks_(简体中文)

作为systemd服务启动
从
https://www.archlinux.org/packages/community/x86_64/shadowsocks-libev/
https://www.archlinux.org/packages/community/any/shadowsocks/
搞到systemd有关的文件
community 源里安装的shadowsocks好像自带 systemd 服务
只要编辑 /etc/shadowsocks/config.json 配置文件
然后 sudo systemctl enable shadowsocks@config.service 就可以了
##sudo systemctl start shadowsocks@config.service


/usr/lib/systemd/system/shadowsocks@.service
-------------------------------
[Unit]
Description=Shadowsocks Client Service
After=network.target

[Service]
Type=simple
User=nobody
ExecStart=/usr/bin/sslocal -c /etc/shadowsocks/%i.json

[Install]
WantedBy=multi-user.target
-------------------------------

/etc/shadowsocks/config.json
-------------------------------
{
    "server":"119.28.9.79",
    "server_port":3588,
    "local_address": "127.0.0.1",
    "local_port":1081,
    "password":"xinhai",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false,
    "workers": 10
}
-------------------------------

sudo systemctl start shadowsocks@config.service

netstat -ntlp | grep 1081


Failure to obtain a Verilog simulation license. Unable to checkout any of these license features: alteramtivsim or alteramtivlog
/opt/altera/11.0/modelsim_ae/bin/vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L maxii_ver -L rtl_work -L work -voptargs="+acc" Top
./lmutil lmdiag -c /opt/altera/license.dat alteramtivsim
分明已经可以了,但是还是报错
AE版本的modelsim是没辙了



sudo systemctl enable shadowsocks@config.service








配置lattice diamand

sudo apt-get install alien
sudo alien diamond_3_2-base_x64-134-x86_64-linux.rpm
#sudo dpkg --install diamond-3-2-base-x64_3.2-135_amd64.deb
解压到/opt/lscc/

cd /opt/lscc/diamond/3.2_x64/bin/lin64
mv libpng12.so.0 libpng12.so.0.old
cp /lib/x86_64-linux-gnu/libpng12.so.0.50.0 .
ln -s libpng12.so.0.50.0 libpng12.so.0

配置lattice diamand 的 USB2A and HW-USBN-2B下载线驱动识别规则
cd /etc/udev/rules.d
sudo gedit /etc/udev/rules.d/10-local.rules
----------------------------------------------------------------
#Lattice
SUBSYSTEM=="usb",ACTION=="add",ATTRS{idVendor}=="1134",ATTRS{idProduct}=="8001",MODE=="0660",GROUP=="andy",SYMLINK+="lattice-%n"
#FTDI
SUBSYSTEM=="usb",ACTION=="add",ATTRS{idVendor}=="0403",ATTRS{idProduct}=="6010",MODE=="0666",GROUP=="andy",SYMLINK+="ftdi-%n"
SUBSYSTEM=="usb",ATTRS{idVendor}=="0403",ATTRS{idProduct}=="6010",RUN+="/bin/sh -c 'basename %p > /sys/bus/usb/drivers/ftdi_sio/unbind'"
---------------------------------------------------------------
sudo chmod 755 10-local.rules
sudo udevadm control --reload-rules
sudo rmmod ftdi_sio




/opt/lscc/diamond/3.9_x64/bin/lin64添加到~/.bashrc的PATH环境变量
/opt/lscc/license.dat添加到~/.bashrc的LM_LICENSE_FILE环境变量


cd /usr/local/bin
sudo gedit diamond
sudo chmod +x diamond
-------------------------------------------------
#!/bin/bash
cd /opt/lscc/diamond/3.9_x64/bin/lin64/
./diamond
-------------------------------------------------






定期清理内存占用, 释放内存

buff/cache占据了的内存,是可以被释放的

andy@debian-dell ~
$ free -m
             total       used       free     shared    buffers     cached
Mem:         15850      13950       1899        401       3164       3110
-/+ buffers/cache:       7675       8174
Swap:            0          0          0

andy@debian-dell ~ [其实应该先sync]
$ sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'
andy@debian-dell ~
$ sudo sh -c 'echo 2 > /proc/sys/vm/drop_caches'
andy@debian-dell ~
$ sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'

andy@debian-dell ~
$ free -m
             total       used       free     shared    buffers     cached
Mem:         15850       1997      13852        386         61        795
-/+ buffers/cache:       1140      14709
Swap:            0          0          0


see, 释放了吧

更安全的操作

1. 切换到管理员权限
$ sudo su

2. 多次执行 sync 命令
# sync
# sync
sync 命令将所有未写的系统缓冲区写到磁盘中，包含已修改的 i-node、已延迟的块 I/O 和读写映射文件）。数据一般是先从硬盘调到内存来被CPU进行处理，sync是一个非常牛逼的命令，他可以将放在内存中暂时没有写入硬盘的数
据写入到硬盘中，避免数据的丢失。在关机的时候默认的有这个命令.

3. 将/proc/sys/vm/drop_caches值设为3
# echo 3 > /proc/sys/vm/drop_caches
/proc是一个虚拟文件系统，我们可以通过对它的读写操作做为与kernel实体间进行通信的一种手段。也就是说可以通过修改/proc中的文件，来对当前kernel的行为做出调整。那么我们可以通过调整/proc/sys/vm/drop_caches来释放内存。
drop_caches的值可以是0-3之间的数字，代表不同的含义：
0：不释放（系统默认值）;默认情况下表示不释放内存，由操作系统自动管理;
1：释放页缓存;To free pagecache.
2：释放dentries和inodes；To free dentries and inodes.
3：释放所有缓存；To free pagecache, dentries and inodes.

4. free -m 查看内存使用情况
$ free -m
    参数 说明
    total 内存总数
    used 已经使用的内存数
    free 空闲的内存数
    shared 多个进程共享的内存总额
    buffers Buffer Cache和cached Page Cache 磁盘缓存的大小
    -buffers/cache 的内存数:used – buffers – cached
    +buffers/cache 的内存数:free + buffers + cached
    可用的memory=free memory+buffers+cached。










thunderbird是可以最小化到托盘的
MinimizeToTray Reanimated插件












xlsx文件设置open with et (WPS)

~/.config/mimeapps.list
添加
application/wps-office.xlsx=wps-office-et.desktop;
---不行

修改zip的部分
application/zip=org.gnome.FileRoller.desktop;libreoffice-calc.desktop;wps-office-wps.desktop;wps-office-et.desktop;wps-office-wpp.desktop;libreoffice-writer.desktop;xarchiver.desktop;wine-extension-zip.desktop;

sudo update-mime-database /usr/share/mime
update-mime-database ~/.local/share/mime

这样, 虽然xlsx, docx, pptx等还是识别为zip格式, 但是通过右键open with 可以选wps的对应软件打开

$ file --mime-type 11111.xlsx 
11111.xlsx: application/zip












据说assogiate可以修改mime数据库
https://launchpad.net/ubuntu/+source/assogiate/0.2.1-3拿到src

解决配置报的缺失
No package 'gnome-doc-utils' found
$ sudo apt-get install gnome-doc-utils

No package 'glibmm-2.4' found
$ sudo apt-get install libglibmm-2.4-dev

No package 'gtkmm-2.4' found
$ sudo apt-get install libgtkmm-2.4-dev

No package 'libxml++-2.6' found
$ sudo apt-get install libxml++2.6-dev

No package 'gnome-vfsmm-2.6' found
??

sudo update-desktop-database
没用


$ sudo apt-get install rox-filer
没用



andy@debian-dell ~/Downloads
$ file -b 11111.xlsx 
Zip archive data, at least v1.0 to extract
andy@debian-dell ~/Downloads
$ file --version
file-5.22
magic file from /etc/magic:/usr/share/misc/magic

sudo apt-get install file

The following extra packages will be installed:
  libmagic-mgc libmagic1
The following packages will be REMOVED:
  python3-magic
The following NEW packages will be installed:
  libmagic-mgc
The following packages will be upgraded:
  file libmagic1

$ file --version
file-5.35

$ file -b 11111.xlsx 
Zip archive data, at least v1.0 to extract



libfm-1.3.1
sudo apt-get install libmenu-cache-dev

sudo apt-get install libfm-dev libfm-gtk-dev









zip解压安装的eric6运行问题
PyQt: undefined symbol:FT_Get_Font_Format Error
cd /usr/local/lib/python3.6/site-packages/PyQt5/Qt/lib
sudo ln -s libfreetype.so.6.17.0 libfreetype.so
sudo ln -s libfreetype.so.6.17.0 libfreetype.so.6

export QTDIR=/usr/local/lib/python3.6/site-packages/PyQt5/Qt
export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH

$ eric6
ok


修改/usr/local/bin/eric6
sudo gedit /usr/local/bin/eric6

添加上面两个export语句

直接就可以运行

/usr/lib/x86_64-linux-gnu里面的
libfreetype.so和libfreetype.so.6保持链接到libfreetype.so.6.11.1






pycharm添加启动
pycharm-2018.2.3.desktop
------------------------------------------
[Desktop Entry]
Name=pycharm-community-2018.2.3
Comment=Pycharm IDE
Exec=/opt/pycharm-community-2018.2.3/bin/pycharm.sh
Icon=/opt/pycharm-community-2018.2.3/bin/pycharm.png
Terminal=false
Type=Application
Categories=GNOME;Application;Development;
StartupNotify=true
------------------------------------------

cd /usr/local/bin
sudo gedit pycharm
---------------------------------
#!/bin/bash
cd /opt/pycharm-community-2018.2.3/bin/
./pycharm.sh &
---------------------------------
sudo chmod +x pycharm






Accept this solution? [Y/n/q/?] y
The following NEW packages will be installed:
  g++-multilib gcc-multilib gcj-4.9-jre-lib gnome-shell-dbg gnome-shell-extension-autohidetopbar 
  gnome-shell-extension-suspend-button gnome-shell-extensions-gpaste gnome-shell-mailnag gnome-shell-pomodoro gnome-shell-timer 
  idesk libconfig-auto-perl postgresql printer-driver-foo2zjs printer-driver-m2300w spacefm spacefm-common wine64 xarchiver 
The following packages will be REMOVED:
  fonts-horai-umefont{u} gir1.2-appindicator3-0.1{u} libavdevice55{u} libgsoap5{u} libproxy-tools{u} libvncserver0{u} 
  qemu-user{u} vlc-plugin-pulse{u} wine-gecko2.34:i386{u} 
The following packages are RECOMMENDED but will NOT be installed:
  wine32:i386 
0 packages upgraded, 19 newly installed, 9 to remove and 358 not upgraded.


The following NEW packages will be installed:
  libwine:i386{a} wine32:i386 wine64 
The following packages will be REMOVED:
  libwine-development{u} libwine-development:i386{u} libwine-gecko-2.24{u} wine32-development:i386{u} wine64-development{u} 
The following packages are RECOMMENDED but will NOT be installed:
  libasound2-plugins:i386 
0 packages upgraded, 3 newly installed, 5 to remove and 462 not upgraded.

The following NEW packages will be installed:
  libwine:i386{a} mesa-vdpau-drivers{a} wine wine32:i386 wine64 
The following packages will be upgraded:
  vdpau-va-driver 
The following packages are RECOMMENDED but will NOT be installed:
  libasound2-plugins:i386 
1 packages upgraded, 5 newly installed, 0 to remove and 461 not upgraded.
Need to get 1,343 kB/16.9 MB of archives. After unpacking 124 MB will be used.

The following NEW packages will be installed:
  wine{a} 
The following packages will be REMOVED:
  wine1.7{a} wine1.7-amd64 wine1.7-i386:i386{a} 
0 packages upgraded, 1 newly installed, 3 to remove and 444 not upgraded.

$ sudo aptitude install -f
The following packages will be REMOVED:  
  libasyncns0:i386{u} libcap2:i386{u} libflac8:i386{u} libjson-c2:i386{u} libpcap0.8:i386{u} libpulse0:i386{u} 
  libsndfile1:i386{u} libvorbisenc2:i386{u} libwrap0:i386{u} ocl-icd-libopencl1:i386{u} wine-mono4.5.4{u} 
0 packages upgraded, 0 newly installed, 11 to remove and 441 not upgraded.
Need to get 0 B of archives. After unpacking 56.8 MB will be freed.



dpkg: error processing /var/cache/apt/archives/*.deb

sudo dpkg -i --force-overwrite <filename>
sudo dpkg -i --force-overwrite *.deb

再使用sudo apt-get -f install 即可修复



$ sudo apt-get install wine1.7 wine1.7-amd64
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  i965-va-driver:i386 libexosip2-11 libgsm1:i386 libjack-jackd2-0:i386 liblinphone5 libmediastreamer-base3 libopenjpeg5:i386
  libopus0:i386 libortp9 libosip2-11 libsamplerate0:i386 libschroedinger-1.0-0:i386 libspeex1:i386 libspeexdsp1:i386 libtheora0:i386
  libva1:i386 libvdpau1:i386 libx264-142:i386 linphone-common linphone-nogtk
Use 'apt-get autoremove' to remove them.
The following extra packages will be installed:
  fonts-horai-umefont libasyncns0:i386 libcap2:i386 libflac8:i386 libgsm1:i386 libjson-c2:i386 libpcap0.8 libpcap0.8:i386
  libpulse0:i386 libsndfile1 libsndfile1:i386 libvorbis-dev libvorbis0a libvorbis0a:i386 libvorbisenc2 libvorbisenc2:i386
  libvorbisfile3 libvorbisfile3:i386 libwrap0:i386 ocl-icd-libopencl1:i386 wine-gecko2.34:i386 wine-mono4.5.4 wine1.7-i386:i386
Suggested packages:
  opencl-icd:i386 dosbox:any
Recommended packages:
  wine1.5-i386:i386 libgnutls26 libjpeg8 libasound2-plugins:i386 libgnutls26:i386 libjpeg8:i386 wine-mono4.5.4:i386
The following packages will be REMOVED:
  linphone mpv
The following NEW packages will be installed:
  fonts-horai-umefont libasyncns0:i386 libcap2:i386 libflac8:i386 libgsm1:i386 libjson-c2:i386 libpcap0.8:i386 libpulse0:i386
  libsndfile1:i386 libvorbisenc2:i386 libwrap0:i386 ocl-icd-libopencl1:i386 wine-gecko2.34:i386 wine-mono4.5.4 wine1.7 wine1.7-amd64
  wine1.7-i386:i386
The following packages will be upgraded:
  libpcap0.8 libsndfile1 libvorbis-dev libvorbis0a libvorbis0a:i386 libvorbisenc2 libvorbisfile3 libvorbisfile3:i386
8 upgraded, 17 newly installed, 2 to remove and 434 not upgraded.
Need to get 128 MB of archives.
After this operation, 479 MB of additional disk space will be used.


sudo apt-get install wine1.7 wine1.7-amd64 winetricks




export WINEPREFIX=$HOME/.wine/
export WINEARCH=win32
export LANG=zh_CN.UTF-8
wine xxx.exe
==
env LANG=zh_CN.UTF-8 WINEARCH=win32 WINEPREFIX=/home/andy/.wine wine xxx.exe





visio画的vsd文件
可以用LibreOffice Draw编辑, 但是保存为odg文件





在Debian上安装完整的内核源码
sudo apt-get install dpkg-dev
sudo gedit /etc/apt/sources.list
打开deb-src http://mirrors.ustc.edu.cn/debian/ jessie main non-free contrib
sudo apt-get -o Acquire::Check-Valid-Until=false update
sudo apt-get source linux-image-$(uname -r)
sudo apt-get build-dep linux-image-$(uname -r)
然后关闭deb-src http://mirrors.ustc.edu.cn/debian/ jessie main non-free contrib
sudo apt-get -o Acquire::Check-Valid-Until=false update




r language 安装 r 语言
$ sudo apt-get install r-base r-base-dev
[sudo] password for andy: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  cdbs r-base-core r-base-html r-cran-boot r-cran-class r-cran-cluster
  r-cran-codetools r-cran-foreign r-cran-kernsmooth r-cran-lattice r-cran-mass
  r-cran-matrix r-cran-mgcv r-cran-nlme r-cran-nnet r-cran-rpart
  r-cran-spatial r-cran-survival r-doc-html r-recommended
Suggested packages:
  ess r-doc-info r-doc-pdf r-mathlib
The following NEW packages will be installed:
  cdbs r-base r-base-core r-base-dev r-base-html r-cran-boot r-cran-class
  r-cran-cluster r-cran-codetools r-cran-foreign r-cran-kernsmooth
  r-cran-lattice r-cran-mass r-cran-matrix r-cran-mgcv r-cran-nlme r-cran-nnet
  r-cran-rpart r-cran-spatial r-cran-survival r-doc-html r-recommended
0 upgraded, 22 newly installed, 0 to remove and 446 not upgraded.
Need to get 36.0 MB of archives.




pycharm设置r-interpreter
File->Settings->Languages & .. -> R Language
填入/usr/bin/R
重启pycharm




python安装opencv模块
sudo pip3.6 install opencv-python -i https://mirrors.163.com/pypi/simple
python安装直方图模块
sudo pip3.6 install matplotlib -i https://mirrors.163.com/pypi/simple


JIRA安装配置
java -version
mysql -uroot -pa
mysql> create database jira default character set utf8 collate utf8_bin;

$ locate my.cnf
/etc/mysql/my.cnf

http://localhost/phpmyadmin 可视化管理mysql
端口80


atlassian-jira-software-7.2.2-x64.bin
安装路径
/opt/atlassian/jira
/var/atlassian/application-data/jira
端口是
HTTP Port: 8080 
RMI Port: 8005
配置文件
/opt/software/jira/conf/server.xml

开关jira的脚本在
/opt/atlassian/jira/bin

访问地址
http://localhost:8080

host name 修改见
/opt/atlassian/jira/conf/server.xml

破解
sudo /opt/atlassian/jira/bin/stop-jira.sh
atlassian-extras-3.1.2.jar和mysql-connector-java-5.1.39-bin.jar
两个文件复制到/opt/atlassian/jira/atlassian-jira/WEB-INF/lib/目录下
sudo /opt/atlassian/jira/bin/startup.sh

具体见 <JIRA安装配置记录.doc>

关闭jira服务
sudo /opt/atlassian/jira/bin/stop-jira.sh

帐号
andy
*




Jenkins安装配置
https://pkg.jenkins.io/debian-stable/
http://updates.jenkins-ci.org
选择了
jenkins_2.89.2_all.deb
实际上要安装一些插件要更新到jenkins_2.150.3_all.deb或以上

andy@debian-dell ~/Downloads
$ sudo dpkg -i jenkins_2.89.2_all.deb 
[sudo] password for andy: 
Selecting previously unselected package jenkins.
(Reading database ... 770638 files and directories currently installed.)
Preparing to unpack jenkins_2.89.2_all.deb ...
Unpacking jenkins (2.89.2) ...
dpkg: dependency problems prevent configuration of jenkins:
 jenkins depends on daemon; however:
  Package daemon is not installed.

dpkg: error processing package jenkins (--install):
 dependency problems - leaving unconfigured
Processing triggers for systemd (215-17+deb8u7) ...
Errors were encountered while processing:
 jenkins
andy@debian-dell ~/Downloads
$ sudo apt-get install -f
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Correcting dependencies... Done
The following extra packages will be installed:
  daemon
The following NEW packages will be installed:
  daemon
0 upgraded, 1 newly installed, 0 to remove and 433 not upgraded.
1 not fully installed or removed.
Need to get 97.4 kB of archives.
After this operation, 283 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 https://mirrors.aliyun.com/debian/ jessie/main daemon amd64 0.6.4-1 [97.4 kB]
Fetched 97.4 kB in 0s (241 kB/s)
Selecting previously unselected package daemon.
(Reading database ... 770649 files and directories currently installed.)
Preparing to unpack .../daemon_0.6.4-1_amd64.deb ...
Unpacking daemon (0.6.4-1) ...
Processing triggers for man-db (2.7.0.2-5) ...
Setting up daemon (0.6.4-1) ...
Setting up jenkins (2.89.2) ...
insserv: warning: script 'K01jira' missing LSB tags and overrides
insserv: warning: script 'jira' missing LSB tags and overrides
Processing triggers for systemd (215-17+deb8u7) ...


修改jenkins端口
sudo vim /etc/default/jenkins

#修改如下内容
HTTP_PORT=8090

#重启jenkins服务
$ sudo /etc/init.d/jenkins restart

#启动jenkis
sudo /etc/init.d/jenkins [start|restart|stop]


sudo systemctl start jenkins
sudo systemctl status jenkins

sudo netstat -ntlp | grep 8090


$ sudo cat /var/lib/jenkins/secrets/initialAdminPassword
64c10730c5c747fc84c7673672ce008d

/etc/default/jenkins 中可以看出来
$JENKINS_HOME就是
/var/lib/jenkins


在http://localhost:8090/
创建了admin用户为
admin
202*****

sudo gedit /var/lib/jenkins/hudson.model.UpdateCenter.xml
原内容
<?xml version='1.0' encoding='UTF-8'?>
<sites>
  <site>
    <id>default</id>
    <url>https://updates.jenkins.io/update-center.json</url>
  </site>
</sites>
修改镜像源为国内源
https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json

或者
进入jenkins系统管理 
进入插件管理
点击高级，修改升级站点的地址为清华大学镜像地址


关闭jenkins服务
sudo /etc/init.d/jenkins stop
sudo systemctl stop jenkins





Gitlab环境搭建
sudo apt-get install curl openssh-server ca-certificates
sudo apt-get install postfix
选 internet site

$ sudo apt-get install -y postfix
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Suggested packages:
  postfix-mysql postfix-pgsql postfix-ldap postfix-pcre sasl2-bin
  dovecot-common resolvconf postfix-cdb ufw postfix-doc
The following packages will be REMOVED:
  exim4 exim4-base exim4-config exim4-daemon-light
The following NEW packages will be installed:
  postfix


企业版
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
或免费版
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt-get -o Acquire::Check-Valid-Until=false update

sudo netstat -anptl | grep 80
sudo kill -9 <pid>
暂时释放80和8080端口
sudo EXTERNAL_URL="http://." apt-get install gitlab-ce
sudo EXTERNAL_URL="http://127.0.0.1" apt-get install gitlab-ce
sudo EXTERNAL_URL="http://." apt-get install gitlab-ee
sudo EXTERNAL_URL="http://127.0.0.1:8091" apt-get install gitlab-ee --reinstall
sudo EXTERNAL_URL="http://." apt-get install gitlab-ee --reinstall

https://packages.gitlab.com/gitlab/gitlab-ee
https://packages.gitlab.com/gitlab/gitlab-ee/packages/debian/jessie/gitlab-ee_12.7.5-ee.0_amd64.deb
wget --content-disposition https://packages.gitlab.com/gitlab/gitlab-ee/packages/debian/jessie/gitlab-ee_12.7.5-ee.0_amd64.deb/download.deb

或者安装
https://packages.gitlab.com/gitlab/gitlab-ce/packages/debian/jessie/gitlab-ce_12.7.5-ce.0_amd64.deb/download.deb

修改Nginx端口
sudo gedit /etc/gitlab/gitlab.rb
把文件中的
external_url 'http://localhost'
  改为：
external_url 'http://127.0.0.1:8091'

影响
sudo gedit /var/opt/gitlab/nginx/conf/gitlab-http.conf

继续修改Unicorn端口
unicorn['port'] = 8092
gitlab_workhorse['auth_backend'] = "http://localhost:8092"

sudo netstat -tunlp | grep 8080
sudo lsof -Pni |grep <port number>
先关闭8080端口占用

生效配置
sudo gitlab-ctl reconfigure
重启运行中的服务, 也可有stop再start
sudo gitlab-ctl restart



sudo gedit /var/opt/gitlab/gitlab-rails/etc/unicorn.rb
把文件中的
listen "127.0.0.1:8080"
改为：
listen "127.0.0.1:8092"

sudo gedit /opt/gitlab/embedded/service/gitlab-shell/config.yml
8092

重新配置(之后要重启服务)
sudo gitlab-ctl reconfigure
重启服务
sudo gitlab-ctl restart
service sshd start
service postfix start





查看gitlab服务器状态
sudo gitlab-ctl status


// sudo apt-get install nginx
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  nginx-common nginx-full
Suggested packages:
  fcgiwrap nginx-doc
The following NEW packages will be installed:
  nginx nginx-common nginx-full


详细运行状态查看
sudo gitlab-rake gitlab:env:info
sudo gitlab-rake gitlab:check SANITIZE=true

Nginx端口8091 (安装默认是80)
Unicorn端口8092 (安装默认是8080)

访问
http://localhost:8091
强制刷新几次

设置默认账户 root 的密码 12345678
接下来 account-->new user之类的普通账户设置
创建仓库和设置项目分支用户权限


卸载gitlab
sudo gitlab-ctl uninstall
sudo dpkg -r gitlab-ce
sudo rpm -e gitlab-ce
sudo reboot


仓库存储位置, 邮件发送等参数
http://blog.sina.com.cn/s/blog_4152a9f50102zo49.html


关闭gitlab服务
sudo gitlab-ctl stop












$ sudo apt-get install libcunit1-dev
[sudo] password for andy: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  libcunit1
Suggested packages:
  libcunit1-doc
The following NEW packages will be installed:
  libcunit1 libcunit1-dev





sudo apt-get install splint
一般启用严格检查
splint --strict *.c
头文件找不到时, 比如在/usr/local/include, 可以这样
splint -I/usr/local/include *.c



这个的规则还是自己写个好了, 不要用默认的规则
##sudo pip3.6 install cpplint -i https://mirrors.163.com/pypi/simple
sudo pip3.6 uninstall cpplint



wine的环境变量
wine regedit
全局环境变量在HLM->System->CurrentControlSet->Control->SessionManager->Environment
用户环境变量在HCU->Environment
wineboot 重启wine




#这个不是最新的
#sudo apt-get install libcmocka-dev
#sudo apt-get remove cmocka-doc libcmocka-dev libcmocka0

源码编译安装cmocka
https://cmocka.org/files/1.1/cmocka-1.1.5.tar.xz
cd cmocka-1.1.5
mkdir build
cd build
cmake -DWITH_STATIC_LIB=on ..
==
cmake -DBUILD_STATIC_LIB=on ..
make
sudo make install


-- Install configuration: ""
-- Installing: /usr/local/lib/pkgconfig/cmocka.pc
-- Installing: /usr/local/lib/cmake/cmocka/cmocka-config.cmake
-- Installing: /usr/local/lib/cmake/cmocka/cmocka-config-version.cmake
-- Installing: /usr/local/include/cmocka.h
-- Installing: /usr/local/include/cmocka_pbc.h
-- Installing: /usr/local/lib/libcmocka.so.0.7.0
-- Installing: /usr/local/lib/libcmocka.so.0
-- Installing: /usr/local/lib/libcmocka.so

cmocka测试导出报表
CMOCKA_XML_FILE='./out.xml' CMOCKA_MESSAGE_OUTPUT=xml ./sample_test

打桩可以利用链接工具ld的wrapper支持, 实现mock函数替换. will_return()和mock()照常使用
__wrap_uptime()可以替换uptime()
链接器选项
ld --wrap=uptime
间接传递连接器选项
gcc -Wl,--wrap=uptime

查看LD符号信息
LD_DEBUG=symbols ./example/uptime/test_uptime


makefile报错查原因
比如
make UNIT_TESTING=-DUNIT_TESTING test
报错

那么通过下面命令查看为啥出错
remake -x -d UNIT_TESTING=-DUNIT_TESTING test
make -d --debug=v V=s UNIT_TESTING=-DUNIT_TESTING test


可以这样指定临时动态库
LD_PRELOAD=./xxx.so ./run_test




编译安装cmockery [其实cmocka就源于cmockery]
/usr/local/share/doc/cmockery*
/usr/local/include/google
/usr/local/lib/libcmockery*
修改默认头文件安装位置到/usr/local/include









编译安装gtest
git clone https://github.com/google/googletest
cd googletest
mkdir build
cd build
//cmake ..
cmake -DBUILD_SHARED_LIBS=on ..
make
sudo make install

-- Install configuration: ""
-- Up-to-date: /usr/local/include
-- Installing: /usr/local/include/gmock
-- Installing: /usr/local/include/gmock/gmock-more-matchers.h
-- Installing: /usr/local/include/gmock/gmock-matchers.h
-- Installing: /usr/local/include/gmock/gmock-function-mocker.h
-- Installing: /usr/local/include/gmock/gmock-generated-actions.h
-- Installing: /usr/local/include/gmock/gmock-nice-strict.h
-- Installing: /usr/local/include/gmock/internal
-- Installing: /usr/local/include/gmock/internal/custom
-- Installing: /usr/local/include/gmock/internal/custom/gmock-matchers.h
-- Installing: /usr/local/include/gmock/internal/custom/README.md
-- Installing: /usr/local/include/gmock/internal/custom/gmock-generated-actions.h
-- Installing: /usr/local/include/gmock/internal/custom/gmock-port.h
-- Installing: /usr/local/include/gmock/internal/custom/gmock-generated-actions.h.pump
-- Installing: /usr/local/include/gmock/internal/gmock-port.h
-- Installing: /usr/local/include/gmock/internal/gmock-internal-utils.h
-- Installing: /usr/local/include/gmock/internal/gmock-pp.h
-- Installing: /usr/local/include/gmock/gmock-spec-builders.h
-- Installing: /usr/local/include/gmock/gmock-cardinalities.h
-- Installing: /usr/local/include/gmock/gmock-more-actions.h
-- Installing: /usr/local/include/gmock/gmock-generated-actions.h.pump
-- Installing: /usr/local/include/gmock/gmock-actions.h
-- Installing: /usr/local/include/gmock/gmock.h
-- Installing: /usr/local/lib/libgmock.a
-- Installing: /usr/local/lib/libgmock_main.a
-- Installing: /usr/local/lib/pkgconfig/gmock.pc
-- Installing: /usr/local/lib/pkgconfig/gmock_main.pc
-- Installing: /usr/local/lib/cmake/GTest/GTestTargets.cmake
-- Installing: /usr/local/lib/cmake/GTest/GTestTargets-noconfig.cmake
-- Installing: /usr/local/lib/cmake/GTest/GTestConfigVersion.cmake
-- Installing: /usr/local/lib/cmake/GTest/GTestConfig.cmake
-- Up-to-date: /usr/local/include
-- Installing: /usr/local/include/gtest
-- Installing: /usr/local/include/gtest/gtest-param-test.h
-- Installing: /usr/local/include/gtest/gtest-printers.h
-- Installing: /usr/local/include/gtest/gtest-typed-test.h
-- Installing: /usr/local/include/gtest/gtest-message.h
-- Installing: /usr/local/include/gtest/gtest-test-part.h
-- Installing: /usr/local/include/gtest/gtest.h
-- Installing: /usr/local/include/gtest/internal
-- Installing: /usr/local/include/gtest/internal/gtest-filepath.h
-- Installing: /usr/local/include/gtest/internal/gtest-port.h
-- Installing: /usr/local/include/gtest/internal/custom
-- Installing: /usr/local/include/gtest/internal/custom/gtest-port.h
-- Installing: /usr/local/include/gtest/internal/custom/gtest-printers.h
-- Installing: /usr/local/include/gtest/internal/custom/README.md
-- Installing: /usr/local/include/gtest/internal/custom/gtest.h
-- Installing: /usr/local/include/gtest/internal/gtest-string.h
-- Installing: /usr/local/include/gtest/internal/gtest-type-util.h
-- Installing: /usr/local/include/gtest/internal/gtest-internal.h
-- Installing: /usr/local/include/gtest/internal/gtest-death-test-internal.h
-- Installing: /usr/local/include/gtest/internal/gtest-param-util.h
-- Installing: /usr/local/include/gtest/internal/gtest-port-arch.h
-- Installing: /usr/local/include/gtest/gtest-death-test.h
-- Installing: /usr/local/include/gtest/gtest-spi.h
-- Installing: /usr/local/include/gtest/gtest-matchers.h
-- Installing: /usr/local/include/gtest/gtest_prod.h
-- Installing: /usr/local/include/gtest/gtest_pred_impl.h
-- Installing: /usr/local/lib/libgtest.a
-- Installing: /usr/local/lib/libgtest_main.a
-- Installing: /usr/local/lib/pkgconfig/gtest.pc
-- Installing: /usr/local/lib/pkgconfig/gtest_main.pc










sudo apt-get install libuptimed-dev






测试mysql
mysqlcheck -u root -p --all-databases




gcov代码覆盖统计工具和前端处理
sudo dpkg -i lcov_1.14-2_all.deb
sudo pip3.6 install gcovr -i https://mirrors.163.com/pypi/simple


















好像不是这个，看起来有趣的玩意。先删
$ sudo apt-get install morse-simulator
[sudo] password for andy: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  blender blender-data libavdevice55 libopencolorio1 libopenimageio1.4 libyaml-cpp0.3 morse-simulator-data morse-simulator-doc
  python3-morse-simulator
The following NEW packages will be installed:
  blender blender-data libavdevice55 libopencolorio1 libopenimageio1.4 libyaml-cpp0.3 morse-simulator morse-simulator-data
  morse-simulator-doc python3-morse-simulator

sudo apt-get remove blender blender-data libavdevice55 libopencolorio1 libopenimageio1.4 libyaml-cpp0.3 morse-simulator morse-simulator-data   morse-simulator-doc python3-morse-simulator



摩尔斯电码
xdemorse
morse2ascii
morsegen
morse




<log 更新安装opera>

60.0.3255.27，download页面打不开
--> 66.0.3515.72





Getting Started with TensorFlow.pdf
sudo pip3.6 install pandas  -i https://mirrors.163.com/pypi/simple

















andy@debian-dell ~/Downloads/docker
$ curl -fsSL https://get.docker.com -o get-docker.sh
andy@debian-dell ~/Downloads/docker
$ sudo sh get-docker.sh
[sudo] password for andy: 
# Executing docker install script, commit: f45d7c11389849ff46a6b4d94e0dd1ffebca32c1
+ sh -c 'apt-get update -qq >/dev/null'
E: Release file for http://archive.debian.org/debian/dists/jessie-backports/InRelease is expired (invalid since 370d 4h 46min 12s). Updates for this repository will not be applied.
andy@debian-dell ~/Downloads/docker
$ sudo sh get-docker.sh
# Executing docker install script, commit: f45d7c11389849ff46a6b4d94e0dd1ffebca32c1
+ sh -c 'apt-get -o Acquire::Check-Valid-Until=false update -qq >/dev/null'
+ sh -c 'DEBIAN_FRONTEND=noninteractive apt-get install -y -qq apt-transport-https ca-certificates curl >/dev/null'
+ sh -c 'curl -fsSL "https://download.docker.com/linux/debian/gpg" | apt-key add -qq - >/dev/null'
+ sh -c 'echo "deb [arch=amd64] https://download.docker.com/linux/debian jessie stable" > /etc/apt/sources.list.d/docker.list'
+ sh -c 'apt-get -o Acquire::Check-Valid-Until=false update -qq >/dev/null'
+ '[' -n '' ']'
+ sh -c 'apt-get install -y -qq --no-install-recommends docker-ce >/dev/null'
+ sh -c 'docker version'
Client:
 Version:           18.06.3-ce
 API version:       1.38
 Go version:        go1.10.3
 Git commit:        d7080c1
 Built:             Wed Feb 20 02:28:55 2019
 OS/Arch:           linux/amd64
 Experimental:      false

Server:
 Engine:
  Version:          18.06.3-ce
  API version:      1.38 (minimum version 1.12)
  Go version:       go1.10.3
  Git commit:       d7080c1
  Built:            Wed Feb 20 02:27:21 2019
  OS/Arch:          linux/amd64
  Experimental:     false
If you would like to use Docker as a non-root user, you should now consider
adding your user to the "docker" group with something like:

  sudo usermod -aG docker your-user

Remember that you will have to log out and back in for this to take effect!

WARNING: Adding a user to the "docker" group will grant the ability to run
         containers which can be used to obtain root privileges on the
         docker host.
         Refer to https://docs.docker.com/engine/security/security/#docker-daemon-attack-surface
         for more information.


andy@debian-dell ~/Downloads/docker
$ sudo usermod -aG docker andy
[sudo] password for andy: 


newgrp docker


$ docker run hello-world

sudo systemctl enable docker
//sudo systemctl disable docker
//echo manual | sudo tee /etc/init/docker.override
sudo apt-get install chkconfig
查询服务列表
sudo chkconfig --list
默认就是开启服务的
//sudo chkconfig docker on
服务管理也可以用sysv-rc-conf
sudo apt-get install sysv-rc-conf
sudo sysv-rc-conf





32 bit
https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/0.32.3/0.32.3-linux-ia32.zip
64 bit
https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/0.32.3/0.32.3-linux-x64.zip
unzip 0.32.3-linux-x64.zip
sudo mv /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so /usr/lib/x86_64-linux-gnu/opera/libffmpeg.so.bk
sudo cp libffmpeg.so /usr/lib/x86_64-linux-gnu/opera/
其他地方暂时不动
/opt/electronic-wechat-linux-x64/libffmpeg.so
/usr/lib/x86_64-linux-gnu/opera/libffmpeg.so
/usr/share/atom/libffmpeg.so
/usr/share/code/libffmpeg.so

dpkg -S libffmpeg.so
测试https://www.youtube.com/watch?v=4LoSNnJaxNA
经过验证，用/opt/baidunetdisk/libffmpeg.so
sudo cp /opt/baidunetdisk/libffmpeg.so /usr/lib/x86_64-linux-gnu/opera/


查看网速
sudo apt install nethogs
nethogs eth0











工具找出USB驱动器的名称
lsblk







查看历史记录：
$ history
$ $USER/.bash_history
对于查询不到刚刚执行的命令，是因为还在缓存中, 写缓存
$ history -w
清除历史记录
$ history -c
可以通过修改 /etc/profile 中 HISTSIZE 的大小来改变记录历史的记录条数








安装sunloginclient10
然后就可以运行
/usr/local/sunlogin/bin/sunloginclient
既可以作为主机,也可以作为客户机
主机开机就默认后台运行,客户机可以从远端登录主机


创建快速启动命令
cd /usr/local/bin
sudo gedit sunloginclient
------------------------------------
#!/bin/bash
/usr/local/sunlogin/bin/sunloginclient
------------------------------------
sudo chmod +x sunloginclient


sunlogin_remote
可以从远端访问账户绑定的主机, 可以被sunloginclient取代

从10版本起,已经不通过bs方式配置主机了
http://127.0.0.1:30080
就没有了




删除sunloginclient需要删掉
/usr/share/gdm/dconf/50-slscreenagrentsvr.conf
否则gdm服务启动失败
还是9的client版本方便，修改一下支持debian就好了，已经存档

$ sudo systemctl status gdm.service 
● gdm.service - GNOME Display Manager
   Loaded: loaded (/lib/systemd/system/gdm.service; enabled)
   Active: failed (Result: start-limit) since Wed 2020-03-04 20:57:07 CST; 3min 9s ago
  Process: 4636 ExecStartPre=/usr/share/gdm/generate-config (code=exited, status=1/FAILURE)
  Process: 4631 ExecStartPre=/bin/sh -c [ "$(cat /etc/X11/default-display-manager 2>/dev/null)" = "/usr/sbin/gdm3" ] (code=exited, status=0/SUCCESS)

那么执行
$ /usr/share/gdm/generate-config
/usr/share/gdm/dconf/50-slscreenagrentsvr.conf: [SeatDefaults]: greeter-setup-script: invalid value: xhost + (0-5:unknown keyword)

$ cat /usr/share/gdm/dconf/50-slscreenagrentsvr.conf
[SeatDefaults]
greeter-setup-script=xhost +
display-setup-script=xhost +


得出这玩意影响了gdm
删掉
sudo rm /usr/share/gdm/dconf/50-slscreenagrentsvr.conf

实际上在/etc/gdm3/Init/Default添加一行 xhost + 到头部



dpkg -i --force-all xxx
dpkg -r xxx





串口调试助手
sudo apt-get install cutecom lrzsz






minigui的repo添加
1. Add FMSoft GPG Key
wget -qO - http://files.fmsoft.cn/ubuntu/key/fmsoft.gpg | sudo apt-key add -
2. Add MiniGUI Software Source
sudo gedit /etc/apt/sources.list
添加
#deb http://files.fmsoft.cn/ubuntu/ trusty restricted #没有trusty分支
deb http://files.fmsoft.cn/ubuntu/ xenial restricted
sudo apt -o Acquire::Check-Valid-Until=false update
拉倒吧,不能展开.






查询局域网主机名对应的ip
sudo apt install nbtscan
nbtscan -v -s : 192.168.1.0/24 | grep printer
arp -a
nmap命令应该也可以







xilinx驱动
/opt/Xilinx/Vivado/2017.4/data/xicom/cable_drivers/lin64/install_script/install_drivers
安装后在/etc/udev/rules.d



sudo apt-get install tofrodos iproute2 gawk
sudo apt-get install gcc git make
sudo apt-get install xvfb
sudo apt-get install net-tools libncurses5-dev tftpd
sudo apt-get install zlib1g-dev zlib1g-dev:i386 libssl-dev flex bison libselinux1
sudo apt-get install gnupg wget diffstat chrpath socat xterm
sudo apt-get install autoconf libtool tar unzip texinfo zlib1g-dev gcc-multilib build-essential libsdl1.2-dev libglib2.0-dev
sudo apt-get install screen pax gzip tar
sudo apt-get install lib32z1 lib32ncurses5 libbz2-1.0:i386 lib32stdc++6
//sudo apt-get install tftp-hpa tftpd-hpa xinetd

$ mkdir -p /opt/petalinux/v2017.4
$ ./petalinux-v2018.1-final-installer.run /opt/petalinux/v2017.4










wine安装ORCAD Capture 16.3精简版，只是为了看或者画16.2以上格式的原理图
//首先，修改安装文件exe的名字，不要有中文

//export LANG=zh_CN.utf8
//wine capture.exe
//这个屌货强制安装到d:盘哇
先到虚拟机里安装一个复制出来好了


以前wine过orcad10
~/.local/share/applications/wine-extension-dsn.desktop
查到Exec=env LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine start /ProgIDOpen OrCADDesign-FileType %f
OrCADDesign-FileType是在~/.wine/system.reg中定义的

Z:\\home\\andy\\DOWN~NTG\\ORCA~RWC\\Capture\\Capture.exe
Z:\\home\\andy\\Downloads\\OrCAD_Demo\\Capture\\Capture.exe
替换成
C:\\Program Files\\ORCAD16.3\\Capture.exe

看上去是C:\\Program Files\\ORCAD16.3\\Capture.exe
实际上gedit用C:\\\\Program Files\\\\ORCAD16.3\\\\Capture.exe注意区别

重启wine
wineboot

试一下
env LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine start /ProgIDOpen OrCADDesign-FileType  machxo3-9400_dev_board_schematic_source.DSN
缺少 MFC80.DLL
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks --gui

env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks win2k vcrun2005
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks vcrun2005sp1
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks win2k vcrun2005sp1

安装vcrun2005不能
那么直接给mfc80.dll文件吧，可以运行了

export CDS_LIC_FILE=/home/andy/.wine/drive_c/Program\ Files/ORCAD16.3/license.txt
env LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine start /ProgIDOpen OrCADDesign-FileType  machxo3-9400_dev_board_schematic_source.DSN


修改一下~/.local/share/applications/wine-extension-dsn.desktop
Exec=env CDS_LIC_FILE=/home/andy/.wine/drive_c/Program\ Files/ORCAD16.3/license.txt LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine start /ProgIDOpen OrCADDesign-FileType %f

另外修改
gedit ~/.local/share/applications/wine-extension-opj.desktop
Exec=env CDS_LIC_FILE=/home/andy/.wine/drive_c/Program\ Files/ORCAD16.3/license.txt LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine start /ProgIDOpen OrCADProject-FileType %f



解决wine程序打印问题
sudo apt-get install cups-pdf
The following NEW packages will be installed:
  cups-pdf printer-driver-cups-pdf

sudo apt install libcups2:i386
重启之后可以打印到pdf什么的
sudo systemctl status cups.service

输出pdf用pdf打印机的话是输出到~/PDF目录，不用选输出到文件(prn格式)

关于SystemPrinting
https://wiki.debian.org/SystemPrinting
管理SystemPrinting
http://localhost:631






wine运行pads9.3精简版
假设放到
/home/andy/.wine/drive_c/Program Files/MentorGraphics/

license文件在/home/andy/.wine/drive_c/Program Files/MentorGraphics/flexlm
需要修改mac地址

需要修改比如/home/andy/.wine/drive_c/Program Files/MentorGraphics/9.3PADS/SDD_HOME/Programs/powerpcb.ini文件
否则会出现: "The directory pointed by the FileDir INI file entry cannot be found.Aborting."


然后按set.txt来设置linux环境变量和执行pads
env MGLS_LICENSE_FILE=/home/andy/.wine/drive_c/Program\ Files/MentorGraphics/flexlm/LICENSE.dat LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine powerpcb.exe

修改
gedit ~/.local/share/applications/wine-extension-pcb.desktop
Exec=env MGLS_LICENSE_FILE=/home/andy/.wine/drive_c/Program\ Files/MentorGraphics/flexlm/LICENSE.dat LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine start /ProgIDOpen PowerPCB.Design %f





安装 hopper-v3, (反汇编分析工具)
修改了deb包，补全了一些缺的库，steam里面找来的，安装好就能用




安装 quilt（补丁管理工具）
sudo apt install quilt gquilt

cat > ~/.quiltrc<<EOF  
QUILT_DIFF_ARGS="--no-timestamps --no-index -p ab --color=auto"  
QUILT_REFRESH_ARGS="--no-timestamps --no-index -p ab"  
QUILT_PATCH_OPTS="--unified"  
QUILT_DIFF_OPTS="-p"  
EDITOR="vi"  






通过shadowsocks加速github
安装和配置shadowsocks客户端, 在前面有，我的本地端口是1081
安装和配置proxychains
sudo apt install proxychains
The following NEW packages will be installed:
  libproxychains3 proxychains

sudo gedit /etc/proxychains.conf
----------------------------
[ProxyList]
# add proxy here ...
# meanwile
# defaults set to "tor"
socks5  127.0.0.1 1081
----------------------------
测试代理
proxychains curl www.google.com
加速github
proxychains git clone https://github.com/xxx/xxx.git

全局github代理加速
git config --global http.proxy 'socks5://127.0.0.1:1081'
git config --global https.proxy 'socks5://127.0.0.1:1081'
查询是否启用代理
git config --global http.proxy
git config --list
取消代理
git config --global --unset http.proxy

这下好了，不用忍龟速了。

sudo proxychains aptitude install r-base r-base-core r-base-dev


sudo apt-get install privoxy
sudo gedit /etc/privoxy/config
------
listen-address  localhost:8118
forward-socks5 / 127.0.0.1:1081 .
------
privoxy /etc/privoxy/config启动
systemctl status privoxy.service
sudo systemctl start privoxy.service
sudo systemctl enable privoxy.service
Created symlink /etc/systemd/system/multi-user.target.wants/privoxy.service → /usr/lib/systemd/system/privoxy.service.

类似于这样
aria2c --all-proxy='http://127.0.0.1:8118' -D


export https_proxy="127.0.0.1:8118"
export http_proxy="127.0.0.1:8118"
(可以添加到类似/etc/profile的地方去)

测试
curl www.google.com


yay
就可以加速了




解决git clone 完成后提示'error: RPC failed; curl 56 GnuTLS recv error (-9)

sudo apt-get install gnutls-bin
The following NEW packages will be installed:
  gnutls-bin libopts25

git config --global http.sslVerify false
git config --global http.postBuffer 1048576000
还是不行



查询源码包
sudo apt-cache showsrc tree


考证应该是 Gnutls_handshake() Failed
sudo apt-get build-dep libcurl4-openssl-dev
sudo apt-get install libcurl4-openssl-dev
sudo apt-get build-dep git
这里，如果实在安装不了libcurl4-gnutls-dev，就把其他缺的安装好就行了
sudo apt-get install cvsps libdbd-sqlite3-perl
sudo apt-get install libcurl4-openssl-dev 用于替换libcurl4-gnutls-dev
apt-get source git


debian/control
Replace all the occurences of “libcurl4-gnutls-dev” to “libcurl4-openssl-dev”
debian/rules
delete the line “TEST =test”


sudo dpkg-buildpackage -rfakeroot -b
sudo dpkg -i git_... 

目前可排除curl 56 GnuTLS recv error (-9)


但是出现error: RPC failed; result=18, HTTP code = 200
经查是curl的报错导致

git config --global http.postBuffer 1048576000
git config --global https.postBuffer 1048576000
无法排除
--depth 1
也无法排除

curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs
git lfs install

git lfs clone ...


git config --global ssh.postBuffer 1048576000


那么新建一个空repo用pull方式来拉取？未验证
git remote remove origin
git remote add origin https://github..com/user/repo
git push --set-upstream origin master


git clone --progress -v ....
git clone --depth 1

GIT_CURL_VERBOSE=1 git clone --progress -v https://github.com/pamsimochen/ipnc_5.1-acs1910.git --depth 1
可以看到curl的报错信息，但是不给出curl的错误号

sudo apt-get install libcurl4-gnutls-dev
sudo apt-get install libcurl4-openssl-dev


GIT_CURL_VERBOSE=1 git clone --progress -v git@github.com:pamsimochen/ipnc_5.1-acs1910.git
没有详细输出

git的更多详细信息输出
#on linux
export GIT_TRACE_PACKET=1
export GIT_TRACE=1
export GIT_CURL_VERBOSE=1

#on windows
set GIT_TRACE_PACKET=1
set GIT_TRACE=1
set GIT_CURL_VERBOSE=1


经过验证，ssh方式可以获取超级大的repo





下载
git_2.11.0.orig.tar.xz
git_2.11.0-3+deb9u5.debian.tar.xz
git_2.11.0-3+deb9u5.dsc
sudo apt-get install dh-exec dh-apache2
dpkg-source -x git_2.11.0-3+deb9u5.dsc
cd git-2.11.0
dpkg-buildpackage -rfakeroot -uc -b

这里'-rfakeroot'指定命令使用fakeroot程序来模仿root权限(来实现所有者(ownership)目的)，'-uc'表示"Don't cryptographically sign the changelog"，'-b'代表只建立二进制包。


sudo proxychains apt-get install -f 安装其他依赖包
sudo proxychains aptitude install -f 彻底清理依赖关系

dpkg的状态标志都写在/var/lib/dpkg/status





sudo apt-get build-dep curl
proxychains apt-get source curl
cd curl-7.38.0/
//sudo dpkg-buildpackage -rfakeroot -b
dpkg-buildpackage -rfakeroot -uc -b





sudo gedit /etc/apt/apt.conf.d/apt.conf








which virtualenv 
/usr/local/bin/virtualenv

virtualenv --no-site-packages venv
最新的virtualenv没有--no-site-packages，默认就是
最后支持--no-site-packages的virtualenv==16.7.9
sudo pip3 install --upgrade virtualenv==16.7.9 -i https://mirrors.163.com/pypi/simple


source venv/bin/activate

pip install six==1.12.0 -i https://mirrors.163.com/pypi/simple
pip install colorama==0.3.9 -i https://mirrors.163.com/pypi/simple
pip install contextlib2==0.5.1 -i https://mirrors.163.com/pypi/simple
pip install future==0.16.0 -i https://mirrors.163.com/pypi/simple
pip install mutablerecords==0.4.1 -i https://mirrors.163.com/pypi/simple
pip install oauth2client==1.5.2 -i https://mirrors.163.com/pypi/simple
pip install protobuf==3.6.0 -i https://mirrors.163.com/pypi/simple
pip install pyOpenSSL==17.1.0 -i https://mirrors.163.com/pypi/simple
pip install PyYAML==3.13 -i https://mirrors.163.com/pypi/simple
pip install sockjs-tornado==1.0.3 -i https://mirrors.163.com/pypi/simple
pip install tornado==4.3 -i https://mirrors.163.com/pypi/simple
pip install spintop-openhtf -i https://mirrors.163.com/pypi/simple

git clone https://github.com/google/openhtf.git
cd openhtf/
python setup.py install
cd examples/
python frontend_example.py
http://localhost:4444

















串口助手
sudo apt-get install cutecom












安装ffmpy3
https://ffmpy3.readthedocs.io/en/latest/
sudo pip3 install ffmpy3 -i https://mirrors.163.com/pypi/simple










更新spb166到spb172
cd /usr/local/bin

sudo gedit allegro
-------------------------------------------------
#!/bin/bash
cd /opt/cadence/allegro_172_patch/
source spb172
/opt/cadence/SPB172/tools/bin/allegro
-------------------------------------------------
sudo gedit concepthdl
-------------------------------------------------
#!/bin/bash
cd /opt/cadence/allegro_172_patch/
source spb172
/opt/cadence/SPB172/tools/bin/concepthdl
-------------------------------------------------
sudo gedit pad_designer
-------------------------------------------------
#!/bin/bash
cd /opt/cadence/allegro_172_patch/
source spb172
/opt/cadence/SPB172/tools/bin/padstack_editor
-------------------------------------------------
sudo chmod +x allegro pad_designer concepthdl

sudo gedit projmgr
-------------------------------------------------
#!/bin/bash
cd /opt/cadence/allegro_172_patch/
source spb172
/opt/cadence/SPB172/tools/bin/projmgr
-------------------------------------------------
sudo chmod +x projmgr





cd /usr/local/bin
sudo gedit diamond
-------------------------------------------------
#!/bin/bash
cd /opt/lscc/diamond/3.9_x64/bin/lin64/
#cd /opt/lscc/diamond/3.11_x64/bin/lin64/
./diamond
-------------------------------------------------





v2ray
原始的go.sh脚本需要修改
已经修改好的go_mod.sh
v2ray-linux-64.zip下载到相同目录就可以安装到本机
然后
sudo gedit /etc/v2ray/config.json
sudo service v2ray start
可以使用 service v2ray start|stop|status|reload|restart|force-reload 控制 V2Ray 的运行

然后是opera和chrome等浏览器的代理自动切换设置，协议和端口查/etc/v2ray/config.json


anti-g*f*w 20200630
首先，用X-Tunnel或者tor-browser-linux64-9.5获取最新的free vmess
虚拟机里贴进v2rayN
再得到最新的uuid填入/etc/v2ray/config.json


CC fucking P， 你丫拦得住俺？





v2ray for terminal

export ALL_PROXY="socks5://127.0.0.1:10808"
或者
export https_proxy="socks5://127.0.0.1:10808"
export http_proxy="socks5://127.0.0.1:10808"
export ftp_proxy="socks5://127.0.0.1:10808"




Scientific_Toolworks_Understand





magnetw现在还算好用吧

使用文档
https://magnetw.app/advanced/rule-apply.html

下载地址
https://github.com/xiandanin/magnetW/releases

这样运行linux版本
./magnetw-3.1.1-linux.AppImage --no-sandbox

设置v2ray
设置-->启用代理
Socks5, 127.0.0.1:10808
也可以设置为ss代理
Socks5, 127.0.0.1:1080


运行freecad最新版本
./FreeCAD_0.18-16146-Linux-Conda_Py3Qt5_glibc2.12-x86_64.AppImage




diagrams的AppImage版本这样运行
chmod +x draw.io-x86_64-13.3.9.AppImage
./draw.io-x86_64-13.3.9.AppImage --no-sandbox

可以直接安装diagrams的deb包
sudo dpkg -i draw.io-amd64-13.3.9.deb



wine 一些游戏
env LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine age2.exe


perl脚本 Can't locate autobox/Core.pm 之类的模块未安装问题
cpan方式安装
sudo cpanm autobox::Core
sudo cpanm Try::Tiny
sudo cpanm XML::TreePP
sudo cpanm XML::TreePP::XMLPath
sudo cpanm Text::Xslate
sudo cpanm Readonly

或者apt方式安装
# 查找在哪个apt包 apt-cache search perl autobox::Core




dos emulator dos模拟器
sudo apt-get install dosbox dosemu





ttf字体编辑工具
sudo apt-get install fontforge







source insight 中文显示等
原理
env LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine XXXXXXXX.exe


双击打开也想支持, 修改
~/.local/share/applications/wine-extension-pr.desktop




livecd+chroot维护系统（也可安装debootstrap安装包）
//sudo fdisk -l
//sudo mount /dev/sda1 /mnt
cd /media/andy/3702fe4a-d5cc-435a-8875-1b5ac9a9a7be
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
//mount -t vfat /dev/sdx1 /boot/efi/
//grub-install /dev/sdx --efi-directory=/boot/efi/ --boot-directory=/boot --removable
efi分区fat32格式512MB，flag：boot，esp
ls -l显示
drwx------  3 root root     4096 1月   1  1970 efi/
mount | grep efi 显示
/dev/nvme0n1p1 on /boot/efi type vfat (rw,relatime,fmask=0077,dmask=0077,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro)

sudo fdisk -l
sudo grub-install /dev/sdx
磁盘mbr分区才可以BIOS引导+EFI引导
?sudo grub-install --root-directory=/boot/ /dev/sdx
sudo grub-install --boot-directory=/boot/ /dev/sdx
sudo grub-install /dev/sdx --efi-directory=/mnt/boot/efi --boot-directory=/mnt/boot
sudo grub-install /dev/sdx --efi-directory=/mnt/boot/efi --boot-directory=/mnt/boot --removable
(
sudo apt-get -y purge grub
sudo apt-get install grub-efi-amd64 grub-efi-amd64-bin grub-efi-amd64-signed
)
grub-mkconfig -o /boot/grub/grub.cfg

umount /dev/sdx3
umount /dev/sdx2
umount /run/lock
rmdir /run/lock
umount /dev/pts
umount /sys
umount /proc
exit
umount /media/andy/3702fe4a-d5cc-435a-8875-1b5ac9a9a7be/var/lib/os-prober/mount
umount /media/andy/3702fe4a-d5cc-435a-8875-1b5ac9a9a7be/dev

sudo dpkg -i baidunetdisk_3.3.2_amd64.deb
cd /opt/baidunetdisk
./baidunetdisk --no-sandbox

cd /usr/local/bin
sudo gedit baidunetdisk
-------------------------------------------------
#!/bin/bash
cd /opt/baidunetdisk/
./baidunetdisk --no-sandbox
-------------------------------------------------
sudo chmod +x baidunetdisk




sudo gedit /etc/fstab
-------------------------------------------------
UUID=f5cd428a-7bcc-4026-80b7-9f570e5966cf	/               ext4    errors=remount-ro 0       1
UUID=08D8BF9DD8BF8788	/mnt/c_win	ntfs-3g	users,auto,rw,dev,exec,locale=zh_CN.UTF-8      0      0
UUID=0CC416CC0CC416CC	/mnt/d_win	ntfs-3g	users,auto,rw,dev,exec,locale=zh_CN.UTF-8      0      0
UUID=0CC416BF0CC416BF	/mnt/e_win	ntfs-3g	users,auto,rw,dev,exec,locale=zh_CN.UTF-8      0      0
UUID=bdeccf6e-c968-4741-86e0-e0b3f15e62ff	/home	ext4	errors=remount-ro 	0       1
UUID=3bc97d5e-cdc7-49fc-aeeb-4b455100c5df	/opt	ext4	errors=remount-ro 	0       1
-------------------------------------------------



cat /etc/*-release



gedit ~/Documents/apt_proxy_conf
Acquire::http::proxy "http://127.0.0.1:10808";
Acquire::ftp::proxy "ftp://127.0.0.1:10808";
Acquire::https::proxy "https://127.0.0.1:10808";
or
Acquire::http::proxy "socks5://127.0.0.1:10808";
Acquire::ftp::proxy "socks5://127.0.0.1:10808";
Acquire::https::proxy "socks5://127.0.0.1:10808";

sudo apt-get -c ~/Documents/apt_proxy_conf upgrade
Proxy CONNECT aborted


export -p
查看有没有类似proxy的环境变量，例如

declare -x ftp_proxy="127.0.0.1:8118"
declare -x http_proxy="127.0.0.1:8118"
declare -x https_proxy="127.0.0.1:8118"

如果有，则全部删掉（具体名字要看你自己的终端显示）：

export -n ftp_proxy 
export -n http_proxy
export -n https_proxy 

然后再sudo apt-get update

gedit ~/.bashrc
set proxy
export http_proxy="http://127.0.0.1:8118"
export https_proxy="https://127.0.0.1:8118"
export ftp_proxy="ftp://127.0.0.1:8118"

还是不行算了





不就是美国源 security.debian.org 慢的问题嘛
下面的两个应该等效
deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib
deb-src http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib




pcmanfm的application为空处理
/home/andy/.config/menus/lxde-applications.menu

<!DOCTYPE Menu PUBLIC '-//freedesktop//DTD Menu 1.0//EN'
 'http://www.freedesktop.org/standards/menu-spec/menu-1.0.dtd'>
<Menu>
    <Name>Applications</Name>
    <MergeFile type='parent'>/etc/xdg/menus/lxde-applications.menu</MergeFile>
    <!-- added by LibFM -->
    <Include>
        <Filename>demo.ui.desktop</Filename>
    </Include>
    <!-- added by LibFM -->
    <Include>
        <Filename>compile-on-the-fly.pyw.desktop</Filename>
    </Include>
    <Menu>
        <Name>C52ADCCD-884E-4EF7-A803-3DB9313A459C-dm365_jpegenc_01_00_00_05_production</Name>
        <!-- deleted by LibFM -->
        <Deleted/>
    </Menu>
    <Menu>
        <Name>08292447-1685-4FD9-BBE3-CCBBF48436A0-dsplib_3_1_1_1</Name>
        <!-- deleted by LibFM -->
        <Deleted/>
    </Menu>
    <Menu>
        <Name>6BF36CF3-26CB-453C-ABB0-686E833439E6-dvsdk</Name>
        <!-- deleted by LibFM -->
        <Deleted/>
    </Menu>
    <Menu>
        <Name>61297B0C-1FFA-41FF-B644-948D0D6C28A4-GraphicsSDK</Name>
        <!-- deleted by LibFM -->
        <Deleted/>
    </Menu>
    <Menu>
        <Name>08292447-1685-4FD9-BBE3-CCBBF48436A0-imglib_1_,__1</Name>
        <!-- deleted by LibFM -->
        <Deleted/>
    </Menu>
    <Menu>
        <Name>E02F7109-DD46-4DE9-B1DC-2186FB78EEA2-PrivateTI_IPNC_RDK</Name>
        <!-- deleted by LibFM -->
        <Deleted/>
    </Menu>
    <Menu>
        <Name>60556FE5-C1A1-4061-8DF8-FFB8393BAE2D-TexasInstruments</Name>
        <!-- deleted by LibFM -->
        <Deleted/>
    </Menu>
    <Menu>
        <Name>08292447-1685-4FD9-BBE3-CCBBF48436A0-TexasInstruments</Name>
        <!-- deleted by LibFM -->
        <Deleted/>
    </Menu>
    <Menu>
        <Name>MCSDK-1_01_00_02-TexasInstruments</Name>
        <!-- deleted by LibFM -->
        <Deleted/>
    </Menu>
    <Menu>
        <Name>Xilinx Design Tools</Name>
        <!-- deleted by LibFM -->
        <Deleted/>
    </Menu>
</Menu>









xrandr --output default --gamma 1:1:1 --mode 1920x1080
cvt
lspci -vnn
xrandr -q
inxi -G
sudo lshw -C display
Xorg -configure
xrandr --verbose
lspci | grep VGA












you should be able to repair your system by repeatedly running dpkg --configure --pending, apt-get -f install, and apt-get dist-upgrade until there are no errors.
$ aptitude search '~i(!~ODebian)'
$ apt-forktracer | sort
# apt -f install
# dpkg --configure --pending
# dpkg -r --force-depends package_name
# apt-get autoremove
# apt purge $(dpkg -l | awk '/^rc/ { print $2 }')

# aptitude search '~c'
# aptitude purge '~c'
# aptitude search '~o'
# aptitude purge '~o'


sudo dpkg --purge --force-depends xxx
sudo apt-get install -f 

dpkg --configure -a



# dpkg --configure -a
Setting up apt-listchanges (3.10) ...
Traceback (most recent call last):
  File "/tmp/tmp.mWbHTSdMcb.aptlc/debconf-helper.py", line 6, in <module>
    import debconf
ModuleNotFoundError: No module named 'debconf'
dpkg: error processing package apt-listchanges (--configure):
 subprocess installed post-installation script returned error exit status 1
Errors were encountered while processing:
 apt-listchanges



dpkg --status debconf
ls -l /usr/lib/python*/dist-packages/debconf.py
cp /usr/lib/python3/dist-packages/debconf.py /usr/local/lib/python3.6/site-packages/
cp /usr/lib/python3/dist-packages/debconf.py /usr/local/lib/python3.5/dist-packages/
cp /usr/lib/python3/dist-packages/debconf.py /usr/local/lib/python3.4/dist-packages/
//sudo gedit /etc/profile







aptitude install -f

Try 'xdg-icon-resource --help' for more information.
dpkg: error processing package google-chrome-stable (--remove):
 subprocess installed pre-removal script returned error exit status 1
xdg-icon-resource: size argument must be numeric
Try 'xdg-icon-resource --help' for more information.
dpkg: error while cleaning up:
 subprocess installed post-installation script returned error exit status 1
Errors were encountered while processing:


rm /var/lib/dpkg/info/google-chrome-stable.*
sudo dpkg --purge --force-depends google-chrome-stable

rm /var/lib/dpkg/info/jd-gui*
sudo dpkg --purge --force-depends jd-gui





dpkg --configure -a
dpkg: dependency problems prevent configuration of va-driver-all:amd64:
apt-get install -f
trying to overwrite 'YYY', which is also in package xxx：[ver]
dpkg --force-depends -r xxx






ok

 更好啊
aptitude update
aptitude safe-upgrade
aptitude full-upgrade




关于xrandr 
Failed to get size of gamma for output default

启动参数加上i915.alpha_support=1
未验证

lspci -k | grep -iEA5 'vga|display|3d'
sudo lshw -numeric -class video
lspci -vnn 
inxi -G
inxi -Fxz






-------strech---
sudo apt-get install compiz

 Debian 9系统下修改默认网卡为eth0的方法
方法操作

vim /etc/default/grub

查找

GRUB_CMDLINE_LINUX=""

修改为

GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"

重新生成grub引导配置文件

grub-mkconfig -o /boot/grub/grub.cfg

最后重启即可恢复默认网卡为eth0，操作结束。



sudo apt-get install libnet-ifconfig-wrapper-perl



------------buster--------------------------------------

not initialized in udev database even after waiting 10000000 microseconds
mount --bind /run/lvm run/lvm  ??



sudo apt-get install orage
sudo apt-get purge dropbear


sudo update-initramfs -u
https://www.kutu66.com//ubuntu/article_164784


dnsmasq 替代 bind9
sudo systemctl stop bind9.service
sudo systemctl status dnsmasq.service


sudo rm /lib/systemd/system/bind9.service


sudo apt-get dselect-upgrade



https://bbs.archlinux.org/viewtopic.php?pid=1807200

https://blog.csdn.net/weixin_42720824/article/details/104790247
sudo apt-get install firmware-misc-nonfree
??

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915

下载kbl_dmc_ver1_04.bin

最后拷贝到/lib/firmware文件夹下：

cd /lib/firmware
sudo mkdir i915
sudo cp Downloads/kbl_dmc_ver1_04.bin /lib/firmware/i915







---------------jessie---------------
cat /sys/class/scsi_host/host*/link_power_management_policy
sudo blkid
sudo systemctl status nxserver.service
sudo rm /etc/systemd/system/multi-user.target.wants/nxserver.service
sudo systemctl stop nxserver.service
sudo cat /var/log/kern.log
sudo journalctl -f _TRANSPORT=kernel


ls /etc/apt/sources.list.d/
docker.list          github_git-lfs.list  opera-stable.list
rm /etc/apt/sources.list.d/*






dmenu_run
Missing menu entries
$ rm ~/.dmenu_cache
$ rm ~/.cache/dmenu_run    #这条有效，ref https://wiki.archlinux.org/index.php/Dmenu

rc.xml
修改
    <keybind key="A-F3">
      <action name="Execute">
        <command>~/.config/dmenu/dmenu-bind.sh</command>
        <startupnotify>
          <enabled>yes</enabled>
          <name>dmenu</name>
        </startupnotify>
      </action>
    </keybind>

修改W-r组合键
    <keybind key="W-r">
      <action name="Execute">
        <command>~/.config/dmenu/dmenu-bind.sh</command>
        <startupnotify>
          <enabled>yes</enabled>
          <name>dmenu</name>
        </startupnotify>
      </action>
    </keybind>





/home/andy/.config/opera/Opera Add-ons Downloads
sudo rm /usr/local/share/applications/CCSv5-ReleaseNote.desktop
sudo rm /etc/xdg/menus/applications-merged/60556FE5-C1A1-4061-8DF8-FFB8393BAE2D-TexasInstruments-60556FE5-C1A1-4061-8DF8-FFB8393BAE2D-CodeComposerStudio5.menu
sudo rm /usr/share/desktop-directories/60556FE5-C1A1-4061-8DF8-FFB8393BAE2D-CodeComposerStudio5.5.0.directory


$ cat /etc/xdg/menus/applications-merged/60556FE5-C1A1-4061-8DF8-FFB8393BAE2D-TexasInstruments-60556FE5-C1A1-4061-8DF8-FFB8393BAE2D-CodeComposerStudio5.menu 
<!DOCTYPE Menu PUBLIC "-//freedesktop//DTD Menu 1.0//EN"
    "http://www.freedesktop.org/standards/menu-spec/menu-1.0.dtd">
<!-- Do not edit manually - generated and managed by xdg-desktop-menu -->
<Menu>
    <Name>Applications</Name>
<Menu>
    <Name>60556FE5-C1A1-4061-8DF8-FFB8393BAE2D-TexasInstruments</Name>
    <Directory>60556FE5-C1A1-4061-8DF8-FFB8393BAE2D-TexasInstruments.directory</Directory>
<Menu>
    <Name>60556FE5-C1A1-4061-8DF8-FFB8393BAE2D-CodeComposerStudio5</Name>
    <Directory>60556FE5-C1A1-4061-8DF8-FFB8393BAE2D-CodeComposerStudio5.5.0.directory</Directory>
    <Include>
        <Filename>Code</Filename>
        <Filename>Composer</Filename>
        <Filename>Studio</Filename>
        <Filename>5.5.0-program.desktop</Filename>
        <Filename>CCSv5-ReleaseNote.desktop</Filename>
        <Filename>5.5.0-uninstall.desktop</Filename>
    </Include>
</Menu>
</Menu>
</Menu>



sudo systemctl status dnsmasq.service
sudo systemctl stop dnsmasq.service






steam repair
Unable to preload the following plugins:
	libAsyncGPUReadbackPlugin.so
	libresonanceaudio.so

cd /home/andy/.local/share/Steam/steamapps/common/Universe\ Sandbox\ 2/Universe\ Sandbox_Data/Plugins
ldd libAsyncGPUReadbackPlugin.so
/usr/lib/x86_64-linux-gnu/libstdc++.so.6: version `GLIBCXX_3.4.21' not found 


strings /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.21 | grep GLIBCXX
strings /usr/lib/x86_64-linux-gnu/libstdc++.so.6 | grep GLIBCXX







------------------------buster----------------------------------
安装opera并设置默认浏览器
sudo update-alternatives --config x-www-browser

sudo update-alternatives --config gnome-www-browser 


安装bcompare




cd .wine/drive_c/windows/
wine regedit.exe
cp /usr/share/doc/wine-development/examples/wine.desktop /home/andy/.local/share/applications
xfce4-mime-settings
这样就能右键wine可执行的windows的exe程序


安装VNC-Server
systemctl (enable|disable|start|stop) vncserver-virtuald.service
systemctl (enable|disable|start|stop) vncserver-x11-serviced.service

安装VNC-Viewer


库里也没有leafpad了，编译安装好了
sudo apt-get install build-essential checkinstall intltool libgtk2.0-dev

mkdir -v $HOME/leafpad_build && cd $HOME/leafpad_build && \
wget http://savannah.nongnu.org/download/leafpad/leafpad-0.8.18.1.tar.gz && \
tar xvf leafpad-0.8.18.1.tar.gz && cd leafpad-0.8.18.1 && \
./configure && make && \
制作deb包
sudo checkinstall -D --install=yes --fstrans=no --pakdir "$HOME/leafpad_build" \
     --pkgname leafpad --backup=no --deldoc=yes --deldesc=yes --delspec=yes \
     --default --pkgversion "0.8.18.1" && \
make distclean && sudo ldconfig


安装vbox


重新配置conky
mv /home/andy/.conkyrc conkyrc.bk
/------------------------
background yes
use_xft yes
xftfont monospace:size=9
xftalpha 1
update_interval 1.0
total_run_times 0
own_window yes
own_window_transparent yes
own_window_type desktop
own_window_hints undecorated,below,sticky,skip_taskbar,skip_pager
own_window_colour black
double_buffer yes
minimum_size 1 1
maximum_width 240
draw_shades no
draw_outline no
draw_borders no
draw_graph_borders no
default_color gray
default_shade_color 000000
default_outline_color d9d7d6
alignment tr
gap_x 12
gap_y 12
no_buffers yes
uppercase no
cpu_avg_samples 8
override_utf8_locale no
color1 red
color2 gray
##############################################
#  Output
##############################################
TEXT
CPU:
#CPU0: $alignr${cpu cpu0}%
#${cpubar cpu0}
#CPU1: $alignr${cpu cpu1}%
#${cpubar cpu1}
#CPU2: $alignr${cpu cpu2}%
#${cpubar cpu2}
#CPU3: $alignr${cpu cpu3}%
#${cpubar cpu3}
#CPU4: $alignr${cpu cpu4}%
#${cpubar cpu4}
#CPU5: $alignr${cpu cpu5}%
#${cpubar cpu5}
#CPU6: $alignr${cpu cpu6}%
#${cpubar cpu6}
#CPU7: $alignr${cpu cpu7}%
#${cpubar cpu7}
${if_match "${cpu cpu0}"!=""}${cpubar cpu0}${endif}
${if_match "${cpu cpu1}"!=""}${cpubar cpu1}${endif}
${if_match "${cpu cpu2}"!=""}${cpubar cpu2}${endif}
${if_match "${cpu cpu3}"!=""}${cpubar cpu3}${endif}
${if_match "${cpu cpu4}"!=""}${cpubar cpu4}${endif}
${if_match "${cpu cpu5}"!=""}${cpubar cpu5}${endif}
${if_match "${cpu cpu6}"!=""}${cpubar cpu6}${endif}
${if_match "${cpu cpu7}"!=""}${cpubar cpu7}${endif}
${if_match "${cpu cpu8}"!=""}${cpubar cpu8}${endif}
${if_match "${cpu cpu9}"!=""}${cpubar cpu9}${endif}
${if_match "${cpu cpu10}"!=""}${cpubar cpu10}${endif}
${if_match "${cpu cpu11}"!=""}${cpubar cpu11}${endif}
${if_match "${cpu cpu12}"!=""}${cpubar cpu12}${endif}
${if_match "${cpu cpu13}"!=""}${cpubar cpu13}${endif}
${if_match "${cpu cpu14}"!=""}${cpubar cpu14}${endif}
${if_match "${cpu cpu15}"!=""}${cpubar cpu15}${endif}
RAM: $alignr$mem/$memmax
$membar
NET1: wireless 
${upspeed wlan0}/s$alignr${totalup wlan0}
${upspeedgraph wlan0 25,150 0000ff ff0000}
${downspeed wlan0}/s$alignr${totaldown wlan0}
${downspeedgraph wlan0 25,150 00ff00 d000d0}
NET2: wired
${upspeed eth0}/s$alignr${totalup eth0}
${upspeedgraph eth0 25,150 0000ff ff0000}
${downspeed eth0}/s$alignr${totaldown eth0}
${downspeedgraph eth0 25,150 00ff00 d000d0}
#
#${font sans-serif:bold:size=8}SYSTEM ${hr 2}
#${font sans-serif:normal:size=8}$sysname $kernel $alignr $machine
#Host:$alignr$nodename
#Uptime:$alignr$uptime
#RUNNING:$alignr$running_processes
#PROCESSES:$alignr${processes}
#SWAP:$alignr${swapperc}
#
${font sans-serif:bold:size=8}TOP PROCESSES ${hr 2}
${font sans-serif:normal:size=8}${top_mem name 1}${alignr}${top mem 1} %
${top_mem name 2}${alignr}${top mem 2} %
$font${top_mem name 3}${alignr}${top mem 3} %
$font${top_mem name 4}${alignr}${top mem 4} %
$font${top_mem name 5}${alignr}${top mem 5} %
$font${top_mem name 6}${alignr}${top mem 6} %

${font sans-serif:bold:size=8}SHORTCUT KEYS ${hr 2}
${font sans-serif:normal:size=8}
Super+space$alignr Main Menu
Super+t$alignr Terminal
Super+f$alignr File Manager
Super+e$alignr Editor
Super+w$alignr Web Browser
Super+q$alignr Force Quit
Super+r$alignr Read the DOC
Super+a$alignr Toggle Maximize
Super+h$alignr Toggle Horizontal
Super+v$alignr Toggle Vertical
Super+c$alignr Move to Center
Super+Arrow$alignr Move
Alt+F3$alignr Dmenu
Alt+Super+Arrow$alignr Resize
------------------------/

mkdir -p /home/andy/.config/conky
/home/andy/.config/conky/conky.conf
/------------------------
-- Conky config for ArchBang
-- by Mr Green

conky.config = {
background = true,
use_xft = true,
font = 'monospace:size=9',
xftalpha = 1,
update_interval = 1.0,
total_run_times = 0,
own_window = true,
own_window_transparent = true,
own_window_type = 'desktop',
own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
own_window_colour = 'black',
double_buffer = true,
minimum_height = 390,
maximum_width = 340,
draw_shades = false,
draw_outline = false,
draw_borders = false,
draw_graph_borders = false,
default_color = 'white',
default_shade_color = '000000',
default_outline_color = 'd9d7d6',
alignment = 'top_right',
gap_x = 12,
gap_y = 12,
no_buffers = true,
uppercase = false,
cpu_avg_samples = 2,
override_utf8_locale = false,
color1 = 'gray',
color2 = 'gray',
color3 = 'gray',
}

conky.text = [[
#${pre_exec nproc}
#${execi 86400 nproc}
${color2}${font sans:normal:size=9}CPU ${cpu cpu0}%${color1}
#${cpu cpu0} is the total usage
${cpubar cpu1}
${cpubar cpu2}
${cpubar cpu3}
${cpubar cpu4}
${cpubar cpu5}
${cpubar cpu6}
${cpubar cpu7}
${cpubar cpu8}
${color2}${font sans:normal:size=9}RAM ${color1}
${membar}
NET1: wireless 
${upspeed wlan0}/s$alignr${totalup wlan0}
${upspeedgraph wlan0 25,150 0000ff ff0000}
${downspeed wlan0}/s$alignr${totaldown wlan0}
${downspeedgraph wlan0 25,150 00ff00 d000d0}
NET2: wired
${upspeed eth0}/s$alignr${totalup eth0}
${upspeedgraph eth0 25,150 0000ff ff0000}
${downspeed eth0}/s$alignr${totaldown eth0}
${downspeedgraph eth0 25,150 00ff00 d000d0}
#
#${color2}${font sans:normal:size=9}SYSTEM ${color1}${hr 2}
#${color1}${font sans:normal:size=9}$sysname $kernel $alignr $machine
#Host:$alignr$nodename
#Uptime:$alignr$uptime
#
${color2}${font sans:bold:size=9}TOP PROCESSES ${color1}${hr 2}
${color1}${font sans:normal:size=9}${top_mem name 1}${alignr}${top mem 1} %
${top_mem name 2}${alignr}${top mem 2} %
${top_mem name 3}${alignr}${top mem 3} %

${color2}${font sans:bold:size=9}SHORTCUT KEYS ${color1}${hr 2}${color1}${font sans:normal:size=9}
Super+space$alignr Main Menu
Super+t$alignr Terminal
Super+f$alignr File Manager
Super+e$alignr Editor
Super+w$alignr Web Browser
Super+q$alignr Force Quit
Super+r$alignr Read the DOC
Super+a$alignr Toggle Maximize
Super+h$alignr Toggle Horizontal
Super+v$alignr Toggle Vertical
Super+c$alignr Move to Center
Super+Arrow$alignr Move
Alt+F3$alignr Dmenu
Alt+Super+Arrow$alignr Resize]]
------------------------/

调试conky配置
conky -DD -c ~/.config/conky/conky.conf
ref
http://conky.sourceforge.net/variables.html







临时修改mac地址
sudo ifconfig eth0 hw ether e0:d5:5e:f8:a6:7a
可能需要，debian 10 看来不需要这样
sudo ifconfig eth0 down
sudo ifconfig eth0 hw ether e0:d5:5e:f8:a6:7a
sudo ifconfig eth0 up

重启也有效就在etc/rc.local添加
ifconfig eth0 hw ether e0:d5:5e:f8:a6:7a

物理mac读取失败
"ethtool -e wlan0" and "ethtool -E wlan0..." give the error "Cannot get EEPROM data: Operation not supported".






sudo apt-get install ros-desktop-full ros-desktop-full-dev


sudo apt-get install fonts-ipafont-gothic fonts-ipafont-mincho fonts-wqy-microhei fonts-wqy-zenhei fonts-indic


sudo apt-get install vlc

替代shutter
sudo apt-get install flameshot

sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable
sudo ufw status

sudo apt-get install maxima fig2ps
sudo apt-get install octave
sudo apt-get install gimp shotwell zim gftp  network-manager-gnome
sudo apt-get install libwnck-dev

设置默认终端
sudo update-alternatives --config  x-terminal-emulator


恢复shutter
https://shutter-project.org/downloads/source-code/
https://launchpad.net/debian/buster/+source/shutter
https://launchpad.net/shutter/+download
git clone https://github.com/shutter-project/shutter.git
cd shutter
make install



重新安装wps
重新安装baidunetdisk

sudo apt-get install libgtkimageview-dev libunique-dev libwnck-dev libgnomecanvas2-dev libgoocanvas-2.0-dev libgoocanvas2-perl libgoocanvasmm-2.0-dev
sudo cpanm Number::Bytes::Human
sudo cpanm Gnome2::Wnck
sudo cpanm Gtk2::ImageView
sudo cpanm Gtk2::Unique
sudo cpanm Gnome2::Canvas
sudo cpanm Gnome2
sudo cpanm File::Copy::Recursive
sudo cpanm Proc::Simple
sudo cpanm Sort::Naturall
sudo cpanm Proc::Killfam
sudo cpanm Goo::Canvas

sudo cpanm --mirror http://mirrors.163.com/cpan/ --mirror-only Image::ExifTool
也可以在vim ~/.bashrc中添加alias cpanm='cpanm --mirror http://mirrors.163.com/cpan/ --mirror-only'使alias生效既可解决
sudo cpanm --mirror http://mirrors.163.com/cpan/ --mirror-only App::cpanminus

sudo cpanm --mirror http://mirrors.163.com/cpan/ --mirror-only JSON::MaybeXS
sudo cpanm --mirror http://mirrors.163.com/cpan/ --mirror-only WWW::Mechanize

sudo apt-get install libappindicator-dev gir1.2-appindicator-0.1
sudo cpanm --mirror http://mirrors.163.com/cpan/ --mirror-only Gtk2::AppIndicator

echo $PKG_CONFIG_PATH 
/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/local/lib/pkgconfig
wget http://ftp.gnome.org/pub/GNOME/sources/goocanvas/1.0/goocanvas-1.0.0.tar.gz
解压
./configure
make
sudo make install

Making install in src
make[1]: Entering directory '/home/andy/Downloads/goocanvas-1.0.0/src'
make  install-am
make[2]: Entering directory '/home/andy/Downloads/goocanvas-1.0.0/src'
make[3]: Entering directory '/home/andy/Downloads/goocanvas-1.0.0/src'
test -z "/usr/local/lib" || /bin/mkdir -p "/usr/local/lib"
 /bin/sh ../libtool   --mode=install /usr/bin/install -c   libgoocanvas.la '/usr/local/lib'
libtool: install: /usr/bin/install -c .libs/libgoocanvas.so.3.5.0 /usr/local/lib/libgoocanvas.so.3.5.0
libtool: install: (cd /usr/local/lib && { ln -s -f libgoocanvas.so.3.5.0 libgoocanvas.so.3 || { rm -f libgoocanvas.so.3 && ln -s libgoocanvas.so.3.5.0 libgoocanvas.so.3; }; })
libtool: install: (cd /usr/local/lib && { ln -s -f libgoocanvas.so.3.5.0 libgoocanvas.so || { rm -f libgoocanvas.so && ln -s libgoocanvas.so.3.5.0 libgoocanvas.so; }; })
libtool: install: /usr/bin/install -c .libs/libgoocanvas.lai /usr/local/lib/libgoocanvas.la
libtool: install: /usr/bin/install -c .libs/libgoocanvas.a /usr/local/lib/libgoocanvas.a
libtool: install: chmod 644 /usr/local/lib/libgoocanvas.a
libtool: install: ranlib /usr/local/lib/libgoocanvas.a
libtool: finish: PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/sbin" ldconfig -n /usr/local/lib
----------------------------------------------------------------------
Libraries have been installed in:
   /usr/local/lib

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the `-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
     during execution
   - add LIBDIR to the `LD_RUN_PATH' environment variable
     during linking
   - use the `-Wl,-rpath -Wl,LIBDIR' linker flag
   - have your system administrator add LIBDIR to `/etc/ld.so.conf'

See any operating system documentation about shared libraries for
more information, such as the ld(1) and ld.so(8) manual pages.
----------------------------------------------------------------------
test -z "/usr/local/include/goocanvas-1.0" || /bin/mkdir -p "/usr/local/include/goocanvas-1.0"
 /usr/bin/install -c -m 644 goocanvasellipse.h goocanvasgrid.h goocanvasgroup.h goocanvasimage.h goocanvasitem.h goocanvasitemmodel.h goocanvasitemsimple.h goocanvaspolyline.h goocanvaspath.h goocanvasrect.h goocanvasstyle.h goocanvastable.h goocanvastext.h goocanvasutils.h goocanvaswidget.h goocanvas.h goocanvasenumtypes.h goocanvasmarshal.h '/usr/local/include/goocanvas-1.0'
make[3]: Leaving directory '/home/andy/Downloads/goocanvas-1.0.0/src'
make[2]: Leaving directory '/home/andy/Downloads/goocanvas-1.0.0/src'
make[1]: Leaving directory '/home/andy/Downloads/goocanvas-1.0.0/src'
Making install in demo
make[1]: Entering directory '/home/andy/Downloads/goocanvas-1.0.0/demo'
make[2]: Entering directory '/home/andy/Downloads/goocanvas-1.0.0/demo'
make[2]: Nothing to be done for 'install-exec-am'.
make[2]: Nothing to be done for 'install-data-am'.
make[2]: Leaving directory '/home/andy/Downloads/goocanvas-1.0.0/demo'
make[1]: Leaving directory '/home/andy/Downloads/goocanvas-1.0.0/demo'
Making install in docs
make[1]: Entering directory '/home/andy/Downloads/goocanvas-1.0.0/docs'
make[2]: Entering directory '/home/andy/Downloads/goocanvas-1.0.0/docs'
make[2]: Nothing to be done for 'install-exec-am'.
-- Installing ./html/ch01.html
-- Installing ./html/ch02.html
-- Installing ./html/ch03.html
-- Installing ./html/ch04.html
-- Installing ./html/ch05.html
-- Installing ./html/goocanvas-architecture.html
-- Installing ./html/goocanvas-coordinates.html
-- Installing ./html/goocanvas-creating-items.html
-- Installing ./html/goocanvas.devhelp
-- Installing ./html/goocanvas.devhelp2
-- Installing ./html/GooCanvasEllipse.html
-- Installing ./html/GooCanvasEllipseModel.html
-- Installing ./html/goocanvas-GooCanvas-Types.html
-- Installing ./html/GooCanvasGrid.html
-- Installing ./html/GooCanvasGridModel.html
-- Installing ./html/GooCanvasGroup.html
-- Installing ./html/GooCanvasGroupModel.html
-- Installing ./html/GooCanvas.html
-- Installing ./html/GooCanvasImage.html
-- Installing ./html/GooCanvasImageModel.html
-- Installing ./html/GooCanvasItem.html
-- Installing ./html/GooCanvasItemModel.html
-- Installing ./html/GooCanvasItemModelSimple.html
-- Installing ./html/GooCanvasItemSimple.html
-- Installing ./html/goocanvas-model-view-canvas.html
-- Installing ./html/goocanvas-overview.html
-- Installing ./html/GooCanvasPath.html
-- Installing ./html/GooCanvasPathModel.html
-- Installing ./html/GooCanvasPolyline.html
-- Installing ./html/GooCanvasPolylineModel.html
-- Installing ./html/GooCanvasRect.html
-- Installing ./html/GooCanvasRectModel.html
-- Installing ./html/goocanvas-simple-canvas.html
-- Installing ./html/GooCanvasStyle.html
-- Installing ./html/GooCanvasTable.html
-- Installing ./html/GooCanvasTableModel.html
-- Installing ./html/GooCanvasText.html
-- Installing ./html/GooCanvasTextModel.html
-- Installing ./html/GooCanvasWidget.html
-- Installing ./html/goocanvas-wysiwyg.html
-- Installing ./html/home.png
-- Installing ./html/index.html
-- Installing ./html/index.sgml
-- Installing ./html/left.png
-- Installing ./html/right.png
-- Installing ./html/style.css
-- Installing ./html/up.png
make[2]: Leaving directory '/home/andy/Downloads/goocanvas-1.0.0/docs'
make[1]: Leaving directory '/home/andy/Downloads/goocanvas-1.0.0/docs'
Making install in po
make[1]: Entering directory '/home/andy/Downloads/goocanvas-1.0.0/po'
if test -r ".././mkinstalldirs"; then \
  .././mkinstalldirs /usr/local/share; \
else \
  /bin/sh ../mkinstalldirs /usr/local/share; \
fi
installing en_GB.gmo as /usr/local/share/locale/en_GB/LC_MESSAGES/goocanvas.mo
installing es.gmo as /usr/local/share/locale/es/LC_MESSAGES/goocanvas.mo
installing ja.gmo as /usr/local/share/locale/ja/LC_MESSAGES/goocanvas.mo
if test "goocanvas" = "glib"; then \
  if test -r ".././mkinstalldirs"; then \
    .././mkinstalldirs /usr/local/share/glib-2.0/gettext/po; \
  else \
    /bin/sh ../mkinstalldirs /usr/local/share/glib-2.0/gettext/po; \
  fi; \
  /usr/bin/install -c -m 644 ./Makefile.in.in \
		  /usr/local/share/glib-2.0/gettext/po/Makefile.in.in; \
else \
  : ; \
fi
make[1]: Leaving directory '/home/andy/Downloads/goocanvas-1.0.0/po'
make[1]: Entering directory '/home/andy/Downloads/goocanvas-1.0.0'
make[2]: Entering directory '/home/andy/Downloads/goocanvas-1.0.0'
make[2]: Nothing to be done for 'install-exec-am'.
test -z "/usr/local/lib/pkgconfig" || /bin/mkdir -p "/usr/local/lib/pkgconfig"
 /usr/bin/install -c -m 644 goocanvas.pc '/usr/local/lib/pkgconfig'
make[2]: Leaving directory '/home/andy/Downloads/goocanvas-1.0.0'
make[1]: Leaving directory '/home/andy/Downloads/goocanvas-1.0.0'





sudo cpanm --mirror http://mirrors.163.com/cpan/ --mirror-only Goo::Canvas


gnome-web-photo
Goo::Canvas/libgoo-canvas-perl


libgoo-canvas-perl这玩意不能通过deb安装了，编译安装好了

wget http://deb.debian.org/debian/pool/main/libg/libgoo-canvas-perl/libgoo-canvas-perl_0.06.orig.tar.gz
perl Makefile.PL （无视Unrecognized argument in LIBS ignored: '-pthread')
make
sudo make install

"/usr/bin/perl" -MExtUtils::Command::MM -e 'cp_nonempty' -- Canvas.bs blib/arch/auto/Goo/Canvas/Canvas.bs 644
Manifying 2 pod documents
Manifying 29 pod documents
Files found in blib/arch: installing files in blib/lib into architecture dependent library tree
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/auto/Goo/Canvas/Canvas.so
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Install/goocanvas-perl.typemap
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Install/goocanvas.typemap
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Install/goocanvas-perl-version.h
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Install/goocanvas-perl-autogen.h
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Install/goocanvas-perl.h
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Install/Files.pm
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas.pm
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Cairo/Matrix.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Cairo/Pattern.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/index.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Points.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/GroupModel.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/TableModel.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/RectModel.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/LineDash.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/TextModel.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Ellipse.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/ImageModel.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Text.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Polyline.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/PolylineModel.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Image.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Path.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Group.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Bounds.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/PathModel.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Style.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/EllipseModel.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/ItemModel.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Table.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Widget.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Rect.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/ItemSimple.pod
Installing /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/Goo/Canvas/Item.pod
Installing /home/andy/perl5/man/man1/perlmine.pl.1p
Installing /home/andy/perl5/man/man1/perltetris.pl.1p
Installing /home/andy/perl5/man/man3/Goo::Canvas::Item.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::Text.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::ItemModel.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::TableModel.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::Widget.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::LineDash.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::index.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::Bounds.3pm
Installing /home/andy/perl5/man/man3/Goo::Cairo::Pattern.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::Rect.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::PathModel.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::Image.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::PolylineModel.3pm
Installing /home/andy/perl5/man/man3/Goo::Cairo::Matrix.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::EllipseModel.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::Polyline.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::RectModel.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::Table.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::ImageModel.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::TextModel.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::GroupModel.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::Ellipse.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::Points.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::ItemSimple.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::Path.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::Style.3pm
Installing /home/andy/perl5/man/man3/Goo::Canvas::Group.3pm
Installing /home/andy/perl5/bin/perltetris.pl
Installing /home/andy/perl5/bin/perlmine.pl
Appending installation info to /home/andy/perl5/lib/perl5/x86_64-linux-gnu-thread-multi/perllocal.pod





##编译goocanvas-2.0.4
sudo apt-get install gtk-doc-tools

export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH


sudo apt-get install libextutils-depends-perl libextutils-pkgconfig-perl
sudo dpkg -i libgoocanvas-common_1.0.0-1_all.deb
sudo dpkg -i libgoocanvas3_1.0.0-1_amd64.deb

最后，尝试解决gnome-web-photo is missing
sudo apt-get install libjavascriptcoregtk-4.0-dev libwebkit2gtk-4.0-dev gnome-common
编译不行
https://packages.debian.org/source/
https://download.gnome.org/sources/gnome-web-photo/0.10/gnome-web-photo-0.10.6.tar.xz
下载gnome-web-photo_0.10.6.orig.tar.gz
这玩意是要一个网页截图工具，这样用 $ gnome-web-photo -t 0 --mode=photo http://www.linuxidc.com linuxidc.png
编译依赖webkit而目前是webkit2，间接依赖TMD一大串，其实之前debian8也没有安装

测试gnome-web-photo
先从deb包提取bin和lib，放到/opt/gnome-web-photo
├── bin
│   ├── gnome-web-photo
│   ├── gnome-web-print -> gnome-web-photo
│   └── gnome-web-thumbnail -> gnome-web-photo
└── lib
    └── x86_64-linux-gnu
        ├── libicudata.so.57 -> libicudata.so.57.1
        ├── libicudata.so.57.1
        ├── libicui18n.so.57 -> libicui18n.so.57.1
        ├── libicui18n.so.57.1
        ├── libicuio.so.57 -> libicuio.so.57.1
        ├── libicuio.so.57.1
        ├── libicule.so.57 -> libicule.so.57.1
        ├── libicule.so.57.1
        ├── libiculx.so.57 -> libiculx.so.57.1
        ├── libiculx.so.57.1
        ├── libicutest.so.57 -> libicutest.so.57.1
        ├── libicutest.so.57.1
        ├── libicutu.so.57 -> libicutu.so.57.1
        ├── libicutu.so.57.1
        ├── libicuuc.so.57 -> libicuuc.so.57.1
        ├── libicuuc.so.57.1
        ├── libjavascriptcoregtk-3.0.so.0 -> libjavascriptcoregtk-3.0.so.0.16.19
        ├── libjavascriptcoregtk-3.0.so.0.16.19
        ├── libwebkitgtk-3.0.so -> libwebkitgtk-3.0.so.0.22.17
        ├── libwebkitgtk-3.0.so.0 -> libwebkitgtk-3.0.so.0.22.17
        ├── libwebkitgtk-3.0.so.0.22.17
        └── pkgconfig
            └── webkitgtk-3.0.pc

测试命令
cd /opt/gnome-web-photo/bin
export LD_LIBRARY_PATH=/opt/gnome-web-photo/lib/x86_64-linux-gnu
./gnome-web-photo --mode=photo "http://www.163.com" ~/Pictures/ttt.jpg
成功

查看shutter调用时候传的参数
gedit /usr/local/share/shutter/resources/modules/Shutter/Screenshot/Web.pm
有5个

cd /usr/local/bin
sudo gedit gnome-web-photo
---------------------------------
#!/bin/bash
export LD_LIBRARY_PATH=/opt/gnome-web-photo/lib/x86_64-linux-gnu
cd /opt/gnome-web-photo/bin
./gnome-web-photo $@
---------------------------------
sudo chmod +x gnome-web-photo

完美运行shutter，目前的tab关闭图标不正常，不影响功能的

sudo cpanm --mirror http://mirrors.163.com/cpan/ --mirror-only Encode::X11
(debian8,9的deb解开实际上还是不能运行的，只能运行git下来的shutter)


shutter好就好在编辑方便易用
简单图片编辑可以用flameshot和ksnip-1.7.3.deb






bcompare4 更新之后要执行
cd /usr/lib/beyondcompare/
sudo sed -i "s/keexjEP3t4Mue23hrnuPtY4TdcsqNiJL-5174TsUdLmJSIXKfG2NGPwBL6vnRPddT7tH29qpkneX63DO9ECSPE9rzY1zhThHERg8lHM9IBFT+rVuiY823aQJuqzxCKIE1bcDqM4wgW01FH6oCBP1G4ub01xmb4BGSUG6ZrjxWHJyNLyIlGvOhoY2HAYzEtzYGwxFZn2JZ66o4RONkXjX0DF9EzsdUef3UAS+JQ+fCYReLawdjEe6tXCv88GKaaPKWxCeaUL9PejICQgRQOLGOZtZQkLgAelrOtehxz5ANOOqCaJgy2mJLQVLM5SJ9Dli909c5ybvEhVmIC0dc9dWH+/N9KmiLVlKMU7RJqnE+WXEEPI1SgglmfmLc1yVH7dqBb9ehOoKG9UE+HAE1YvH1XX2XVGeEqYUY-Tsk7YBTz0WpSpoYyPgx6Iki5KLtQ5G-aKP9eysnkuOAkrvHU8bLbGtZteGwJarev03PhfCioJL4OSqsmQGEvDbHFEbNl1qJtdwEriR+VNZts9vNNLk7UGfeNwIiqpxjk4Mn09nmSd8FhM4ifvcaIbNCRoMPGl6KU12iseSe+w+1kFsLhX+OhQM8WXcWV10cGqBzQE9OqOLUcg9n0krrR3KrohstS9smTwEx9olyLYppvC0p5i7dAx2deWvM1ZxKNs0BvcXGukR+/g" BCompare









medusa
medusa -M ssh -h 192.168.1.8 -u andy -P wordlist1.txt -e ns -F -O ssh.log
hydra
hydra -l andy -P wordlist.txt -t 4 ssh://192.168.1.8
crunch
crunch 3 4 "1234crunch "









iconv -c -f utf-8 -t gb2312 BlogSohu_utf8.py >> BlogSohu_ansi_gb2312.py
iconv -f utf-8 -t  gb18030 file1.txt -o file2.txt






openocd invalid subcommand "newtap stm32f1x bs -irlen 5" in procedure 'script'

/opt/openocd/0.10.0-12-20190422-2015/scripts/target/stm32f1x.cfg
line 50

if {[using_jtag]} {
   jtag newtap $_CHIPNAME bs -irlen 5
}

change to 

if {[using_jtag]} {
   if {[using_hla]} {
      hla newtap $_CHIPNAME bs -irlen 5
   } else {
      jtag newtap $_CHIPNAME bs -irlen 5
   }
}




Novatek SDK/ 据说RK3399也会碰到
解决/bin/sh: lz4c: 未找到命令
LZ4是一种压缩算法，解决方法如下：

安装lz4:
sudo apt-get update
sudo apt-get install liblz4-tool
重新编译 ok

解lz4文件:
lz4 -d 文件名





sudo apt-get install build-essential libc6-dev libncurses5-dev libncurses5:i386 libgl1-mesa-dev g++-multilib mingw-w64 tofrodos lib32z1 u-boot-tools zlib1g-dev bison libbison-dev flex mtd-utils vim squashfs-tools gawk cmake cmake-data liblz4-tool  libmpc3 libstdc++6 device-tree-compiler gcc-8-locales lib32ncurses6 lib32ncursesw6 lib32tinfo6 lib32ncurses5-dev openssh-server samba


debian buster提示无libmpfr.so.4
问题描述：使用arm-linux-gcc 编译.c文件时提示错误
error while loading shared libraries:libmpfr.so.4: cannot open shared object file: No such file or directory.
通过ldd查看cc1的库调用情况

ldd /opt/arm/arm-ca53-linux-gnueabihf-4.9-2017.05/usr/bin/../libexec/gcc/arm-ca53-linux-gnueabihf/4.9.4/cc1
	linux-vdso.so.1 (0x00007fff6e29f000)
	libmpc.so.3 => /usr/lib/x86_64-linux-gnu/libmpc.so.3 (0x00007f74efa3d000)
	libmpfr.so.4 => not found
	libgmp.so.10 => /usr/lib/x86_64-linux-gnu/libgmp.so.10 (0x00007f74ef9ba000)
	libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f74ef9b5000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f74ef7f4000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f74efcd2000)
	libmpfr.so.6 => /usr/lib/x86_64-linux-gnu/libmpfr.so.6 (0x00007f74ef770000)
	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f74ef5ed000)


发现这个库找不到，
解决办法：

sudo ln -s /usr/lib/x86_64-linux-gnu/libmpfr.so.6 /usr/lib/x86_64-linux-gnu/libmpfr.so.4




sudo apt-get install chromium chromium-l10n chromium-shell chromium-driver



error: RPC failed; curl 56 GnuTLS recv error (-9): Error decoding the received TLS packet

git config --global http.sslVerify false
git config --global http.postBuffer 1048576000

export GIT_TRACE_PACKET=1; export GIT_TRACE=1; export GIT_CURL_VERBOSE=1
git pull

$ sudo apt-get purge git
[sudo] password for andy: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  elpa-async elpa-dash elpa-ghub elpa-git-commit elpa-graphql elpa-let-alist
  elpa-magit-popup elpa-treepy elpa-with-editor git-man
  libdatetime-format-iso8601-perl libjs-modernizr libmediawiki-api-perl
  libxdo3 python3-qtpy wipe xdotool xxdiff
Use 'sudo apt autoremove' to remove them.
The following packages will be REMOVED:
  elpa-magit* git* git-all* git-cola* git-cvs* git-el* git-email* git-gui*
  git-lfs* git-mediawiki* git-svn* gitg* gitk* gitweb* keyringer*
0 upgraded, 0 newly installed, 15 to remove and 1 not upgraded.
After this operation, 65.4 MB disk space will be freed.


sudo apt-get install git git-daemon-run git-el git-email git-gui gitk gitweb git-cvs git-mediawiki git-svn git-lfs git-cola git-all git-cvs git-el git-email git-gui git-mediawiki git-svn gitg gitk gitweb

git config http.sslVerify false
git config http.postBuffer 1048576000

ssh方式可以获取超级大的repo
proxychains进行代理 proxychains git clone xxx， proxychains git pull








##ubuntu 18 / debian 10 (buster)
##开机时
##a start job is running for networking ...
##等太久了，可以修改
sudo vim /etc/systemd/system/network-online.target.wants/networking.service

TimeoutStartSec=5min
修改为
TimeoutStartSec=2sec



systemd-analyze blame
systemctl list-units --state=failed



apt-get update --allow-releaseinfo-change



sudo apt install -t buster-backports kicad kicad-demos kicad-footprints kicad-symbols kicad-templates libngspice0


##ubuntu 18 / debian 10 (buster)
##compile notepadqq

git clone --recursive https://github.com/notepadqq/notepadqq.git
cd notepadqq
apt search Qt5WebChannel
sudo apt install libqt5svg5-dev libqt5websockets5-dev libqt5webchannel5-dev libuchardet-dev uchardet libqt5webenginewidgets5 libqt5webenginewidgets5 libqt5webengine5 qt5-qmake
sudo apt-get install -y libqt5webkit5-dev libqt5svg5-dev qttools5-dev-tools qtwebengine5-dev
sudo apt-get install qt5-default qttools5-dev-tools qtwebengine5-dev libqt5websockets5-dev libqt5svg5 libqt5svg5-dev libuchardet-dev pkg-config
./configure --prefix /usr









sudo apt-get purge kicad*

The following packages were automatically installed and are no longer required:
  libngspice0 python3-wxgtk4.0
Use 'sudo apt autoremove' to remove them.
The following packages will be REMOVED:
  kicad* kicad-demos* kicad-doc-en* kicad-footprints* kicad-libraries* kicad-symbols* kicad-templates*
0 upgraded, 0 newly installed, 7 to remove and 1 not upgraded



sudo apt-get install kicad
The following package was automatically installed and is no longer required:
  python3-wxgtk4.0
Use 'sudo apt autoremove' to remove it.
The following additional packages will be installed:
  kicad-demos kicad-footprints kicad-libraries kicad-symbols kicad-templates
Suggested packages:
  kicad-doc-ca | kicad-doc-de | kicad-doc-en | kicad-doc-es | kicad-doc-fr | kicad-doc-id | kicad-doc-it | kicad-doc-ja | kicad-doc-nl | kicad-doc-pl | kicad-doc-ru | kicad-doc-zh
  kicad-packages3d
The following NEW packages will be installed:
  kicad kicad-demos kicad-footprints kicad-libraries kicad-symbols kicad-templates


sudo aptitude install kicad
The following NEW packages will be installed:
  kicad kicad-demos{a} kicad-footprints{a} kicad-libraries{a} kicad-symbols{a} kicad-templates{a} 
The following packages will be REMOVED:
  python3-wxgtk4.0{u} 
0 packages upgraded, 6 newly installed, 1 to remove and 1 not upgraded.



git clone git@gitlab.com:kicad/code/kicad.git
https://docs.kicad.org/doxygen/md_Documentation_development_compiling.html#build_linux

andy@debian-dell ~/Downloads
$ git clone https://gitlab.com/kicad/code/kicad.git
Cloning into 'kicad'...
remote: Enumerating objects: 2883, done.
remote: Counting objects: 100% (2883/2883), done.
remote: Compressing objects: 100% (306/306), done.
error: RPC failed; curl 56 GnuTLS recv error (-9): Error decoding the received TLS packet.
fatal: the remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack failed
andy@debian-dell ~/Downloads
$ git clone git@gitlab.com:kicad/code/kicad.git
Cloning into 'kicad'...
remote: Enumerating objects: 2883, done.
remote: Counting objects: 100% (2883/2883), done.
remote: Compressing objects: 100% (306/306), done.
remote: Total 256899 (delta 2722), reused 2665 (delta 2576), pack-reused 254016
Receiving objects: 100% (256899/256899), 238.83 MiB | 7.95 MiB/s, done.
Resolving deltas: 100% (210957/210957), done.


sudo aptitude install cmake doxygen libboost-context-dev libboost-dev \
libboost-system-dev libboost-test-dev libcairo2-dev libcurl4-openssl-dev \
libgl1-mesa-dev libglew-dev libglm-dev libngspice0 libngspice0-dev liboce-foundation-dev \
liboce-ocaf-dev libssl-dev libwxbase3.0-dev libwxgtk3.0-dev python-dev \
python-wxgtk3.0-dev swig wx-common


cd kicad
mkdir -p build/release
cd build/release
cmake -DCMAKE_BUILD_TYPE=Release \
      ../../
make
sudo make install

By default, CMake sets the install path on Linux to /usr/local. Use the CMAKE_INSTALL_PREFIX option to specify a different install pat

cmake reports:
-- Check for installed GLEW -- found
-- Check for installed ZLIB -- found
-- Boost version: 1.67.0
-- Checking for module 'ngspice'
--   Found ngspice, version 30
-- Check for installed Python Interpreter -- found
-- Python module install path: lib/python2.7/dist-packages
-- Found wxPython 3.0.2.0/gtk3 (wxWidgets 3.0.2.0)
CMake Error at /usr/share/cmake-3.13/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
  Could NOT find wxWidgets (missing: wxWidgets_LIBRARIES
  wxWidgets_INCLUDE_DIRS) (Required is at least version "3.0.2.0")
Call Stack (most recent call first):
  /usr/share/cmake-3.13/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
  CMakeModules/FindwxWidgets.cmake:1019 (find_package_handle_standard_args)
  CMakeLists.txt:863 (find_package)


dpkg --get-selections | grep wx



换kicad-5.1.7的源码
-- Found GLM: /usr/include (found suitable version "0.9.9.3", minimum required is "0.9.5.1") 
CMake Error at CMakeLists.txt:564 (MESSAGE):
  

  GLM version 0.9.9.3 is incompatible with KiCad using GCC.

  Please downgrade to GLM version 0.9.9.2 or older or use clang instead


-- Configuring incomplete, errors occurred!










修改库运行原有的

export LD_LIBRARY_PATH=/home/andy/Documents:/home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/lib/x86_64-linux-gnu/:/home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu:/opt/gnuarmeclipse/qemu/2.8.0-201703022210-head/bin/:$LD_LIBRARY_PATH



export LD_LIBRARY_PATH=/media/andy/f5cd428a-7bcc-4026-80b7-9f570e5966cf/usr/lib/x86_64-linux-gnu/:/home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/lib/x86_64-linux-gnu/:/home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH


export LD_LIBRARY_PATH=/home/andy/Documents:$LD_LIBRARY_PATH

sudo cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu/libGLEW.so.1.10 /usr/lib/x86_64-linux-gnu/
sudo cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu/libGLEW.so.1.10.0 /usr/lib/x86_64-linux-gnu/
sudo cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/lib/x86_64-linux-gnu/libssl.so.1.0.0 /usr/lib/x86_64-linux-gnu/
sudo cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/lib/x86_64-linux-gnu/libcrypto.so.1.0.0 /usr/lib/x86_64-linux-gnu/

andy@debian-dell ~/Documents
$ cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu/libcurl.so.4 .
andy@debian-dell ~/Documents
$ cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu/libcurl.so.4.2.0 .

sudo cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu/librtmp.so.0 /usr/lib/x86_64-linux-gnu/
sudo cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu/libgnutls.so.26 /usr/lib/x86_64-linux-gnu/
sudo cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu/libgnutls.so.26.21.8 /usr/lib/x86_64-linux-gnu/
sudo cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/lib/x86_64-linux-gnu/libgcrypt.so.11 /usr/lib/x86_64-linux-gnu/
sudo cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/lib/x86_64-linux-gnu/libgcrypt.so.11.7.0 /usr/lib/x86_64-linux-gnu/
sudo cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu/libtasn1.so.3 /usr/lib/x86_64-linux-gnu/
sudo cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu/libtasn1.so.3.1.12 /usr/lib/x86_64-linux-gnu/

$ Segmentation fault

=====give it up===== :(

cd /usr/lib/x86_64-linux-gnu/
sudo rm libGLEW.so.1.10 libGLEW.so.1.10.0 libssl.so.1.0.0 libcrypto.so.1.0.0 librtmp.so.0 libgnutls.so.26 libgnutls.so.26.21.8 libgcrypt.so.11 libgcrypt.so.11.7.0 libtasn1.so.3 libtasn1.so.3.1.12
=====clean up done===== :(

后来发现
其实，这个/usr/local/bin/kicad是编译的版本
apt安装的其实在/usr/bin/kicad
怎么删除老版本OS的编译版本呢，再编译一次咯
/media/andy/M4B/software/kicad/installkicad-source-mirror-git.tar.xz解压到ext4分区的目录下

sudo aptitude install libwxgtk3.0-gtk3-0v5 libwxgtk3.0-gtk3-dev libwxgtk3.0-dev
libwxgtk-media3.0-dev libwxgtk-media3.0-0v5 libwxgtk-media3.0-gtk3-0v5 libwxgtk-media3.0-gtk3-dev libwxgtk-webview3.0-gtk3-0v5 libwxgtk-webview3.0-gtk3-dev 


see https://forum.kicad.info/t/solved-linux-mint-19-3-build-problem-with-wxwidgets/23762
$ sudo apt install libwxgtk3.0-gtk3-dev
$ sudo update-alternatives --config wx-config
There are 3 choices for the alternative wx-config (providing /usr/bin/wx-config).

  Selection    Path                                                  Priority   Status
------------------------------------------------------------
* 0            /usr/lib/x86_64-linux-gnu/wx/config/gtk2-unicode-3.0   308       auto mode
  1            /usr/lib/x86_64-linux-gnu/wx/config/base-unicode-3.0   306       manual mode
  2            /usr/lib/x86_64-linux-gnu/wx/config/gtk2-unicode-3.0   308       manual mode
  3            /usr/lib/x86_64-linux-gnu/wx/config/gtk3-unicode-3.0   307       manual mode

Press <enter> to keep the current choice[*], or type selection number: 3
update-alternatives: using /usr/lib/x86_64-linux-gnu/wx/config/gtk3-unicode-3.0 to provide /usr/bin/wx-config (wx-config) in manual mode


cd kicad-source-mirror
mkdir -p build/release
cd build/release
cmake -DCMAKE_BUILD_TYPE=Release \
      ../../
make -j8
$ sudo make install
这个时候产生了install_manifest.txt
$ sudo make uninstall

if CMake does not provide a sudo make uninstall target
see https://wiki.codelite.org/pmwiki.php/Developers/Linux
$ sudo xargs rm < install_manifest.txt



sudo apt-get install --reinstall -t buster-backports kicad kicad-demos kicad-footprints kicad-symbols kicad-templates libngspice0 kicad-packages3d kicad-doc-en





thunderbird启动

XPCOMGlueLoad error for file /usr/lib/thunderbird/libmozgtk.so:
liblzma.so.5: failed to map segment from shared object
Couldn't load XPCOM.

dpkg-query -S /usr/local/lib/liblzma.so.5
解决办法
sudo rm /usr/local/lib/liblzma.so.5 (这是个软链接，删掉也没事)









sudo apt install dconf-editor
依次点开->org->gnome->gedit->preferences->encodings
改成
['UTF-8', 'GB18030', 'GB2312', 'GBK', 'BIG5', 'CURRENT', 'ISO-8859-15', 'UTF-16']





##ubuntu 18 / debian 10 (buster)
uex 
cd /opt/uex/bin
cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/lib/x86_64-linux-gnu/libpng12.so.0 .
cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/lib/x86_64-linux-gnu/libpng12.so.0.46.0 .

cd /usr/local/bin
sudo gedit uex
---------------------------------
#!/bin/bash
cd /opt/uex/bin
./uex
---------------------------------
sudo chmod +x uex

alt+f3 启动不能
终端启动可以
修改
sudo gedit /usr/local/bin/uex
---------------------------------
#!/bin/bash
export LD_LIBRARY_PATH=/opt/uex/bin:$LD_LIBRARY_PATH
cd /opt/uex/bin
./uex
---------------------------------
这样alt+f3 启动就可以了


sudo gedit /usr/local/bin/vsim
---------------------------------
#!/bin/bash
export LD_LIBRARY_PATH=/opt/modelsim/modeltech/lib
cd /opt/modelsim/modeltech/bin
./vsim
---------------------------------
sudo chmod +x /usr/local/bin/vsim
alt+f3 启动不能
sudo rm /usr/local/bin/vsim




解决os升级后foxitreader多实例问题，我希望单实例打开多个文件
参考arch的情况，解决办法如下
/home/andy/.local/share/mime下搜索删除
ppdf.xml
pdf.xml
FoxitReader.xml
update-mime-database ~/.local/share/mime
FoxitReader.desktop复制到/home/andy/.local/share/applications，保持一份就行
这样就解决了



关于vivado的xsct, xsdb, xmd, and tclsh/xtclsh运行报错
Segmentation fault (core dumped) "$RDI_BINROOT"/unwrapped/"$RDI_PLATFORM$RDI_OPT_EXT"/rlwrap -rc -f "$RDI_APPROOT"/scripts/xsdb/xsdb/cmdlist -H "$HOME"/.xsctcmdhistory "$RDI_BINROOT"/loader -exec rdi_xsct "${RDI_ARGS[@]}"

https://wiki.archlinux.org/index.php/Xilinx_Vivado#xsct,_xsdb,_xmd,_and_tclsh_segfault

安装rlwrap后，类似于替换
#"$RDI_BINROOT"/unwrapped/"$RDI_PLATFORM$RDI_OPT_EXT"/rlwrap -rc -f "$RDI_APPROOT"/scripts/xsdb/xsdb/cmdlist -H "$HOME"/.xsctcmdhistory "$RDI_BINROOT"/loader -exec rdi_xsct "${RDI_ARGS[@]}"
为如下
/usr/bin/rlwrap -rc -f "$RDI_APPROOT"/scripts/xsdb/xsdb/cmdlist -H "$HOME"/.xsctcmdhistory "$RDI_BINROOT"/loader -exec rdi_xsct "${RDI_ARGS[@]}"








sudo pip3.6 install tifffile==2018.10.18 -i https://mirrors.163.com/pypi/simple
sudo pip3.6 install scikit-image==0.16.2 -i https://mirrors.163.com/pypi/simple

sudo pip3.6 install libscrc==0.1.5  -i https://mirrors.163.com/pypi/simple

sudo apt install zstd
tar -I zstd -xvf archive.tar.zst

Decompress from .zst: unzstd filename.tar.zst or zstd -d filename.tar.zst. filename.tar will be created.
List compressed archive: tar tf filename.tar.
Extract the compressed archive: tar xf filename.tar.

从pacman包制作成ariang-allinone的deb包





buster:
sudo apt install electronics-all
expeyes-web
systemctl reload apache2

sudo apt install pbuilder debootstrap devscripts
sudo apt install dpkg-repack


sudo apt install snap
不能用，也没有snapd




sudo apt install libpoppler-glib-dev libpoppler-qt5-dev libpopplerkit-dev libpoppler-cpp-dev libpoppler-cil-dev xpdf



sudo tar zxvf jdk-8u291-linux-x64.tar.gz -C /usr/lib/jvm
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_291/bin/java" 1
sudo update-alternatives --config java
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_291/bin/javac" 1
sudo update-alternatives --config javac
sudo update-alternatives --install "/usr/bin/javah" "javah" "/usr/lib/jvm/jdk1.8.0_291/bin/javah" 1
sudo update-alternatives --config javah



for j8:
sudo apt-get install libarchive-dev libarchive13 bsdcpio bsdtar asciidoctor jq tkgate systemc verilator

$ sudo apt-get install gnat
[sudo] password for andy: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following package was automatically installed and is no longer required:
  gdb-mingw-w64-target
Use 'apt-get autoremove' to remove it.
The following extra packages will be installed:
  ada-reference-manual-2012 gdb-minimal gnat-4.9 gnat-4.9-base gnat-gps gnat-gps-common gnat-gps-doc gprbuild-doc libgnat-4.9
  libgnatcoll-doc libgnatcoll-gtk1.6 libgnatcoll-iconv1.6 libgnatcoll-python1.6 libgnatcoll-readline1.6 libgnatcoll-sqlite-bin
  libgnatcoll-sqlite1.6 libgnatcoll1.6 libgnatprj4.9 libgnatvsn4.9 libgtkada2.24.4 libjs-prototype libjs-scriptaculous
  libtemplates-parser11.8.2014 libxmlada4.4.0
Suggested packages:
  gnat-4.9-doc gnat-4.9-sjlj gprbuild
The following packages will be REMOVED:
  gdb gdb-mingw-w64
The following NEW packages will be installed:
  ada-reference-manual-2012 gdb-minimal gnat gnat-4.9 gnat-4.9-base gnat-gps gnat-gps-common gnat-gps-doc gprbuild-doc libgnat-4.9
  libgnatcoll-doc libgnatcoll-gtk1.6 libgnatcoll-iconv1.6 libgnatcoll-python1.6 libgnatcoll-readline1.6 libgnatcoll-sqlite-bin
  libgnatcoll-sqlite1.6 libgnatcoll1.6 libgnatprj4.9 libgnatvsn4.9 libgtkada2.24.4 libjs-prototype libjs-scriptaculous
  libtemplates-parser11.8.2014 libxmlada4.4.0
0 upgraded, 25 newly installed, 2 to remove and 1 not upgraded.
Need to get 50.7 MB of archives.
After this operation, 148 MB of additional disk space will be used.
Do you want to continue? [Y/n]


$ ./configure --prefix=/usr/local
$ make
$ sudo make install
mkdir -p /usr/local
mkdir -p /usr/local/bin
mkdir -p /usr/local/lib
mkdir -p /usr/local/lib/ghdl
mkdir -p /usr/local/include
mkdir -p /usr/local/include/ghdl
VER_DESC=tarball; \
VER_REF=unknown; \
VER_HASH=unknown; \
if test -d ./.git && desc=`cd .; git describe --dirty --long`; then \
  VER_DESC=`echo $desc | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g' -e 's/^v//g'`; \
  VER_REF=`cd .; git rev-parse --abbrev-ref HEAD`; \
  VER_HASH=`cd .; git rev-parse HEAD`; \
fi; \
sed \
  -e "s#@VER@#2.0.0-dev#" \
  -e "s#@DESC@#${GHDL_VER_DESC:-$VER_DESC}#" \
  -e "s#@REF@#${GHDL_VER_REF:-$VER_REF}#" \
  -e "s#@HASH@#${GHDL_VER_HASH:-$VER_HASH}#" \
  < src/version.in > version.tmp;
if [ ! -r version.ads ] || ! cmp version.tmp version.ads > /dev/null; then cp version.tmp version.ads; fi
gnatmake -o ghdl_mcode -gnat12 -aI./src -aI./src/vhdl -aI./src/synth -aI./src/grt -aI./src/psl -aI./src/vhdl/translate -aI./src/ghdldrv -aI./src/ortho -aI./src/ortho/mcode -aI./src/synth -gnat12 -gnaty3befhkmr -g  -gnatwe -gnatwa -gnatwC -gnatf  -gnata -gnatw.A ghdl_jit.adb -bargs -E -largs memsegs_c.o chkstk.o jumps.o times.o grt-cstdio.o grt-cgnatrts.o grt-cvpi.o grt-cvhpi.o grt-cdynload.o fstapi.o lz4.o fastlz.o  -ldl -lm -Wl,--version-script=/home/andy/Documents/ghdl/./src/grt/grt.ver -Wl,--export-dynamic
gnatmake: "ghdl_mcode" up to date.
install -m 755 ghdl_mcode /usr/local/bin/ghdl
for d in ieee/v87 ieee/v93 ieee/v08 std/v87 std/v93 std/v08 src/ieee src/ieee/v87 src/ieee/v93 src/ieee2008 src/std src/std/v87 src/std/v93 src/std/v08 src/synopsys src/synopsys/v08 src/upf src/vital95 src/vital2000; do \
  mkdir -p /usr/local/lib/ghdl/$d; \
  install -m 644 -p \
    lib/ghdl/$d/* /usr/local/lib/ghdl/$d; \
done
install: omitting directory ‘lib/ghdl/src/ieee/v87’
install: omitting directory ‘lib/ghdl/src/ieee/v93’
install: omitting directory ‘lib/ghdl/src/std/v08’
install: omitting directory ‘lib/ghdl/src/std/v87’
install: omitting directory ‘lib/ghdl/src/std/v93’
install: omitting directory ‘lib/ghdl/src/synopsys/v08’
install -m 644 -p \
    ./scripts/ansi_color.sh /usr/local/lib/ghdl/;
mkdir -p /usr/local/lib/ghdl/vendors
install -m 644 -p \
    ./scripts/vendors/* /usr/local/lib/ghdl/vendors/
install -m 755 -p \
    ./scripts/vendors/*.sh /usr/local/lib/ghdl/vendors/
install -m 755 -p lib/libghdlvpi.so /usr/local/lib/
install -m 644 -p /home/andy/Documents/ghdl/./src/grt/vpi_user.h /usr/local/include/ghdl/
install -m 644 -p /home/andy/Documents/ghdl/./src/grt/vhpi_user.h /usr/local/include/ghdl/
install -m 755 -p lib/libghdl-2_0_0_dev.so /usr/local/lib/
install -m 755 -p libghdl.a /usr/local/lib/
install -m 644 -p libghdl.link /usr/local/lib/
echo "/* DO NOT MODIFY" > src/synth/include/synth_gates.h
echo "   This file is automatically generated by Makefile.  */" >> src/synth/include/synth_gates.h
echo "enum Module_Id {" >> src/synth/include/synth_gates.h
grep -h "constant Module_Id :=" src/synth/netlists.ads src/synth/netlists-gates.ads | sed -e '/constant Module_Id :=/s/:.*://' -e 's/;/,/' -e 's/ *--.*//' >> src/synth/include/synth_gates.h
echo "};" >> src/synth/include/synth_gates.h
echo "" >> src/synth/include/synth_gates.h
echo "enum Param_Type {" >> src/synth/include/synth_gates.h
grep '      Param_' ./src/synth/netlists.ads >> src/synth/include/synth_gates.h
echo "};" >> src/synth/include/synth_gates.h
install -m 644 -p ./src/synth/include/synth.h /usr/local/include/ghdl
install -m 644 -p ./src/synth/include/synth_gates.h /usr/local/include/ghdl
install -m 755 -p ghwdump /usr/local/bin/
install -m 755 -p lib/libghw.so /usr/local/lib/
install -m 644 -p ./ghw/libghw.h /usr/local/include/ghdl/
/usr/local/bin/ghdl --disp-standard --std=87 > /usr/local/lib/ghdl/src/std/v87/standard.vhdl
/usr/local/bin/ghdl --disp-standard --std=93 > /usr/local/lib/ghdl/src/std/v93/standard.vhdl
/usr/local/bin/ghdl --disp-standard --std=08 > /usr/local/lib/ghdl/src/std/v08/standard.vhdl


sudo apt-get install gdb gdb-mingw-w64


https://mirrors.aliyun.com/gnu/bash/bash-5.1.8.tar.gz
  ./configure \
    --prefix=/usr \
    --with-curses \
    --enable-readline \
    --without-bash-malloc \
    --with-installed-readline

/usr/bin/bash
安装makedeb
git@github.com:makedeb/makedeb.git
需要修改一下config文件的cflag配置

补充安装
git clone git@github.com:facebook/zstd.git
  make
  make -C contrib/pzstd
sudo make PREFIX=/usr install
sudo ln -sf /usr/bin/zstd /usr/bin/zstdmt
sudo cp contrib/pzstd/pzstd /usr/bin/


bsdtar: Option --no-fflags is not supported
sudo apt-get remove libarchive-dev bsdcpio bsdtar
git clone git@github.com:libarchive/libarchive.git
  cd libarchive/build
  ./autogen.sh
  cd ..
  ./configure \
      --prefix=/usr \
      --without-xml2 \
      --without-nettle \
      --disable-static

  make
修改makedeb-makepkg，去掉--no-fflags就可以了，最多PKGBUILD里修改一下owner咯
下面的各种错误，不要尝试了

git clone git@github.com:lz4/lz4.git
make
sudo make install
sudo mv /usr/lib/x86_64-linux-gnu/liblz4.so.1.3.0 /usr/lib/x86_64-linux-gnu/liblz4.so.1.3.0.bk
sudo mv /usr/lib/x86_64-linux-gnu/liblz4.a /usr/lib/x86_64-linux-gnu/liblz4.a.bk
sudo cp /usr/local/lib/liblz4.a /usr/lib/x86_64-linux-gnu/
sudo cp /usr/local/lib/liblz4.so.1.9.3 /usr/lib/x86_64-linux-gnu/

cd libarchive
make -j8
sudo make install


sudo apt-get install libjudy-dev
PKGBUILD gtkwave











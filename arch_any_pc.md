* * *
# 安装
## 方式1: 直接用archbang安装光盘镜像
比如grub4dos的menu.lst可以添加一个启动项
```
title Install Arch Linux
root  (hd0,0)
kernel /arch_boot/vmlinuz ro archisolabel=ARCHBANG
initrd /arch_boot/INTEL_UCODE.IMG
initrd /arch_boot/archiso.img
```
boot之后，等30秒，进入shell
```
mkdir /new
mkdir -p /dev/disk/by-label
mount -r -t ntfs /dev/sdb1 /new
modprobe loop
losetup /dev/loop6 /new/arch_boot/archbang-rc-0108-x86_64.iso.iso
exit
```
u盘在这里可能是sdb、sdc..., 这里的/dev/sdx可以`mount`之后查看知道是不是

iso镜像名称根据实际情况修改

这样就进入了live-cd

然后archbang的右键找install archbang


## 方式1: bootstrap安装

因为archlinux是每天滚动升级，所以官方iso镜像经常比repo的旧，最好就是用bootstrap进行纯净安装

```
su

# tar zxvpf archlinux-bootstrap-2020.11.01-x86_64.tar.gz -C /tmp/
# gedit /tmp/root.x86_64/etc/pacman.d/mirrorlist
去掉163那一行的注释
# gedit /tmp/root.x86_64/etc/pacman.conf
添加
------------------------------------------------------------
#[archassault]
#SigLevel = Optional TrustAll
#Include = /etc/pacman.d/archassault-mirrorlist

[archlinuxcn]
#SigLevel = Optional TrustAll
#Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
Server = http://mirrors.163.com/archlinux-cn/$arch
------------------------------------------------------------

# /tmp/root.x86_64/bin/arch-chroot /tmp/root.x86_64/



进入chroot之后
# pacman-key --init
# pacman-key --populate archlinux
# mount /dev/sdx1 /mnt
# pacstrap /mnt base linux linux-firmware
# genfstab -p /mnt >> /mnt/etc/fstab
# arch-chroot /mnt
# echo archlinux > /etc/hostname
# ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# echo LANG="en_US.UTF-8" > /etc/locale.conf
# mkinitcpio -p linux
# passwd

# pacman -S grub
# grub-install --force /dev/sdx
# grub-mkconfig -o /boot/grub/grub.cfg
# pacman -S dialog net-tools dnsutils inetutils iproute2 wpa_supplicant wireless_tools

pacman -S archlinux-keyring archlinuxcn-keyring nano vi vim

pacman -S net-tools man-db man-pages texinfo base-devel 

:: There are 24 members in group base-devel:
:: Repository core
   1) autoconf  2) automake  3) binutils  4) bison  5) fakeroot  6) file  7) findutils  8) flex  9) gawk  10) gcc  11) gettext
   12) grep  13) groff  14) gzip  15) libtool  16) m4  17) make  18) pacman  19) patch  20) pkgconf  21) sed  22) sudo  23) texinfo
   24) which
   
pacman -S gdm gnome gnome-extra gnome-shell
:: There are 66 members in group gnome:
:: Repository extra
   1) baobab  2) cheese  3) eog  4) epiphany  5) evince  6) file-roller  7) gdm  8) gedit  9) gnome-backgrounds  10) gnome-books
   11) gnome-calculator  12) gnome-calendar  13) gnome-characters  14) gnome-clocks  15) gnome-color-manager  16) gnome-contacts
   17) gnome-control-center  18) gnome-disk-utility  19) gnome-documents  20) gnome-font-viewer  21) gnome-getting-started-docs
   22) gnome-keyring  23) gnome-logs  24) gnome-maps  25) gnome-menus  26) gnome-music  27) gnome-photos  28) gnome-remote-desktop
   29) gnome-screenshot  30) gnome-session  31) gnome-settings-daemon  32) gnome-shell  33) gnome-shell-extensions  34) gnome-software
   35) gnome-system-monitor  36) gnome-terminal  37) gnome-themes-extra  38) gnome-user-docs  39) gnome-user-share
   40) gnome-video-effects  41) gnome-weather  42) grilo-plugins  43) gvfs  44) gvfs-afc  45) gvfs-goa  46) gvfs-google
   47) gvfs-gphoto2  48) gvfs-mtp  49) gvfs-nfs  50) gvfs-smb  51) mutter  52) nautilus  53) networkmanager  54) orca  55) rygel
   56) sushi  57) totem  58) tracker  59) tracker-miners  60) tracker3  61) tracker3-miners  62) vino  63) xdg-user-dirs-gtk  64) yelp
:: Repository community
   65) gnome-boxes  66) simple-scan
:: There are 35 members in group gnome-extra:
:: Repository extra
   1) accerciser  2) dconf-editor  3) devhelp  4) evolution  5) five-or-more  6) four-in-a-row  7) ghex  8) glade  9) gnome-builder
   10) gnome-chess  11) gnome-devel-docs  12) gnome-klotski  13) gnome-mahjongg  14) gnome-mines  15) gnome-nettool  16) gnome-nibbles
   17) gnome-robots  18) gnome-sound-recorder  19) gnome-sudoku  20) gnome-taquin  21) gnome-tetravex  22) gnome-todo
   23) gnome-tweaks  24) gnome-usage  25) hitori  26) iagno  27) lightsoff  28) polari  29) quadrapassel  30) swell-foop  31) sysprof
   32) tali
:: Repository community
   33) gnome-code-assistance  34) gnome-multi-writer  35) gnome-recipes
   
# systemctl enable gdm.service
# pacman -S xorg-xinit
# systemctl set-default graphical.target

pacman -S lxde-gtk3
pacman -S lxappearance-gtk3 lxappearance-obconf-gtk3
pacman -S dmenu tint2 feh scrot conky leafpad
pacman -S fcitx fcitx-googlepinyin htop bash-completion ntfs-3g



# useradd -m -G wheel -s /bin/bash andy
# passwd andy
# gedit /etc/sudoers
// add this line
andy	ALL=(ALL:ALL) ALL

# pacman -S yaourt yay network-manager-applet
# pacman -S firefox opera
# pacman -S cpanminus
# pacman -S subversion git
# pacman -S wqy-zenhei libfm
# pacman -S udiskie udisks2 proxychains
git clone git://github.com/trizen/obmenu-generator
sudo cp obmenu-generator/obmenu-generator /usr/bin

$ yaourt bcompare

# exit
# exit



ChinaNet-QxVa-5G
xzssttk5

proxychains aria2c -x16 -s16 -j16 "https://netix.dl.sourceforge.net/project/archbang/ArchBang/archbang-rc-2711-x86_64.iso?viasf=1"



Creating gzip-compressed initcpio image: /boot/initramfs-linux.img
```

* * *
# 修复

类似这样挂载已经安装的系统
```
sudo su
mount /dev/sda1 /mnt
mount /dev/sda3 /mnt/boot
mount /dev/sda4 /mnt/workspace
cd /mnt
mount -t proc proc /mnt/proc
mount -t sysfs sys /mnt/sys
mount -o bind /dev /mnt/dev
mount -t devpts pts /mnt/dev/pts/
chroot /mnt
```
或者使用`arch-chroot`挂载已经安装的系统

就可以通过pacman等修复软件，grub修复启动等

* * *
# 初步配置
```
//$ sudo leafpad /etc/locale.conf 
//$ sudo leafpad /etc/locale.gen
//$ sudo locale-gen
```

`$ sudo leafpad /etc/pacman.d/mirrorlist `
用 `mirrors.ustc.edu.cn` or `mirrors.163.com`

download .db file and put into
/var/lib/pacman/sync
``
$ sudo pacman -S archlinux-keyring && sudo pacman -Syu
or
$ sudo pacman -S archlinux-keyring && sudo pacman -Syy
``

已损坏 (无效或已损坏的软件包 (PGP 签名))
`$ sudo pacman-key --refresh-keys`

```
$ pacman-key --export > all_keys
$ sudo pacman-key --add all_keys
$ pacman-key --list-keys
```

```
$ sudo pacman -Syu
$ sudo pacman-key --init
$ sudo leafpad /etc/pacman.d/gnupg/gpg.conf
change keyserver hkp://pool.sks-keyservers.net to hkp://keyserver.ubuntu.com
$ sudo dirmngr < /dev/null
$ sudo pacman-key -r <key-no>
$ sudo pacman-key --refresh-keys
```
`$ sudo leafpad /etc/pacman.conf`
```
[archlinuxcn]
SigLevel = Optional TrustAll
#Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
Server = http://mirrors.163.com/archlinux-cn/$arch
```
```
$ sudo pacman -Sy
$ sudo pacman -S archlinuxcn-keyring
$ sudo pacman -S opencc
$ sudo sudo pacman -S yaourt 
$ yaourt -S fcitx-sogoupinyin wps-office
// 切莫安装sogoupinyin
```

`$ sudo leafpad ~/.xinitrc`
```
exec dbus-launch startxfce4
to
exec dbus-launch startxfce4 nm-applet &
or
exec dbus-launch startxfce4 nm-applet xfce4-panel &
```
```
$ sudo sudo pacman -S wqy-zenhei
```
`$ leafpad /home/andy/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml/xfce4-desktop.xml`

check the path is `/usr/share/backgrounds/xfce`
```
$ sudo sudo cp /usr/share/backgrounds/*.jpg /usr/share/backgrounds/xfce/

$ sudo pacman -Syu
```

`$ sudo leafpad ~/.xinitrc`
back to
exec dbus-launch startxfce4 
```
$ sudo pacman -S samba
$ sudo pacman -S nautilus
//only keep xfce4-panel
 
$ sudo leafpad /etc/locale.gen
$ sudo locale-gen
$ sudo pacman -S fcitx-im fcitx-configtool fcitx-cloudpinyin fcitx-sunpinyin bash-completion
$ sudo pacman -S brasero gnome-mplayer mplayer gedit conky file-roller fcitx-googlepinyin htop
$ sudo pacman -S ntfs-3g flashplugin vim bash-completion
$ sudo pacman -S firefox chromium liferea thunderbird transmission-gtk brasero gnome-mplayer evince 
$ sudo pacman -S lftp file-roller gedit ttf-arphic-uming ttf-arphic-ukai ttf-bitstream-vera

$ sudo pacman -S base-devel
```
```
//sfs extractor
//Squashfs
squashfs-tools
mksquashfs
unsquashfs

//extra .sfs file from livecd and mount .img file as ext4 format
```
```
$ pacman -Q --help

//find installed packages
$ pacman -Q -d > pacqd.txt
$ pacman -Q -e > pacqe.txt
$ pacman -Q -m > pacqm.txt
$ pacman -Q -n > pacqn.txt
```

* * *
# restore grub  |  grub修复

grub命令见
`最新Grub2全面教程.pdf`

常用的有

`grub>root (hd0,0)`
命令含义：从的硬盘第一个分区C盘启动

`grub>chainloader (hd0,0)+1`
命令含义：指示GRUB读取分区的第一个扇区的引导记录

`grub>boot`
命令含义：启动GRUB

查看挂载目录
`sudo fdisk -l`
挂载，比如载到/mnt
`sudo mount /dev/sda1 /mnt`
在livecd切换到目标根目录
```
cd /media/andy/3702fe4a-d5cc-435a-8875-1b5ac9a9a7be
su
mount -o bind /dev dev
chroot .
// or 
// chroot . /bin/bash

挂载根目录特殊节点
mount -t proc proc /proc
mount -t sysfs sysfs /sys
mount -t devpts devpts /dev/pts
mkdir -p /run/lock
mount -t tmpfs tmpfs /run/lock
mount /dev/sdx2 /home
mount /dev/sdx3 /opt

//or

mount --bind /dev /mnt/dev 
mount --bind /proc /mnt/proc
mount --bind /sys /mnt/sys 

//or

mount -t proc proc /mnt/proc
mount --rbind /sys /mnt/sys
mount --rbind /dev /mnt/dev

chroot和mount根目录特殊节点先后无关？最好在mount之前之后？
sudo chroot /path/to/mounted/
//or
sudo chroot /mnt /bin/bash
```

// use grub-install or grub2-install
`sudo grub-install /dev/sda`
// or 
`sudo grub-install --root-directory=/mnt/boot /dev/sda`
// or if sda3 is a EFI partition
```
mount /dev/sda3 /mnt/boot/efi
sudo grub-install /dev/sda --efi-directory=/mnt/boot/efi --boot-directory=/mnt/boot
```

//generate new grub.cfg
```
grub2-mkconfig -o /boot/grub2/grub.cfg
or
grub-mkconfig -o /boot/grub/grub.cfg
```

* * *
#  backup and restore system
// boot into livecd, cd to mountpoint
```
tar -jcvpf backup.tar.bz2 .
// or
tar -jxvpf backup.tar.bz2 .
```

* * *
# backup pkgs
```
$ sudo mv ~/Downloads/* /var/cache/pacman/pkg/
$ sudo cp /var/lib/pacman/sync/* /mnt/win_e/arch_boot/sync/
$ sudo cp /var/cache/pacman/pkg/* /mnt/win_e/TDDOWNLOAD/arch_repo/pkg/
or
$ sudo mv /var/cache/pacman/pkg/* /mnt/win_e/TDDOWNLOAD/arch_repo/pkg/
```

* * *
# remote desktop
```
$ rdesktop -a 16 -r sound:local -r clipboard:PRIMARYCLIPBOARD -r disk:sunray=/home/andy -f 192.168.1.99 &
```

* * *
# 安装 vbox | virtualbox
```
$ sudo pacman -S xorg-server xorg-xinit xorg-utils xorg-server-utils
$ sudo pacman -S virtualbox
===> You must load vboxdrv module before starting VirtualBox:
===> # modprobe vboxdrv
//$ sudo pacman -S virtualbox-archlinux-additions
$ sudo pacman -S linux-headers mesa qt4
$ sudo pacman -S virtualbox-guest-utils
$ sudo pacman -S virtualbox-guest-modules
$ sudo pacman -S virtualbox-guest-iso
$ sudo pacman -S virtualbox-sdk
$ sudo pacman -S virtualbox-host-dkms
$ sudo pacman -S virtualbox-guest-dkms
$ sudo modprobe vboxdrv
$ sudo modprobe vboxnetflt
$ sudo modprobe vboxnetadp
$ sudo modprobe vboxpci
$ sudo pacman -S linux-lts linux linux-lts-headers linux-headers
$ sudo dkms autoinstall
```
`$ sudo leafpad /etc/modules-load.d/virtualbox.conf`
```
vboxdrv
vboxnetadp
vboxnetflt
vboxpci
```
```
$ sudo vboxreload
```

* * *
# setup vim
```
$ sudo pacman -S ctags cscope
```
`$ leafpad .vimrc`
```
set termencoding=utf-8
```

* * *
# arm tool chain
```
$ sudo pacman -S arm arm-none-eabi-binutils arm-none-eabi-gcc arm-none-eabi-gdb arm-none-eabi-newlib
$ arm-none-eabi-gcc --target-help
```

* * *
# music player
```
$ sudo pacman -S audacious rhythmbox
//$  sudo pacman -S banshee
```

* * *
# wine
```
$ sudo pacman -S wine wine_gecko wine-mono winetricks
```

* * *
# busybox
```
$ sudo pacman -S busybox
$ sudo chmod 4555 /usr/bin/busybox
```


* * *
# openbox
```
// scrot是截图工具
$ sudo pacman -S wbar feh scrot obmenu
$ sudo pacman -S lxappearance pcmanfm
$ tint2conf
```
`$ leafpad ~/.config/openbox/autostart`
```
(sleep 2 && spacefm -d) &
to
(sleep 2 && pcmanfm -d) &
```
`$ leafpad ~/.config/obmenu-generator/schema.pl`
```
{item => ['spacefm',           'File Manager',      'file-manager']},
to
{item => ['pcmanfm',           'File Manager',      'file-manager']},
```
```
$ pcmanfm --desktop
$ pcmanfm --desktop-pref
$ pcmanfm --desktop-off
```

pcmanfm的bookmarks在
`~/.config/gtk-3.0/bookmarks`

pcmanfm右键新建清理，其实就是在模板里面
~/Templates/



* * *
# java
```
$ sudo pacman -S jdk
```

* * *
# eclipse + cdt
```
$ sudo pacman -S eclipse
$ sudo pacman -S openocd
```
<http://ftp.yzu.edu.tw/eclipse/tools/cdt/releases/8.7/cdt-8.7.0.zip>
<http://avr-eclipse.sourceforge.net/wiki/index.php/The_AVR_Eclipse_Plugin>
<http://sourceforge.net/projects/gnuarmeclipse>
<http://opensource.zylin.com/embeddedcdt.html>
<http://opensource.zylin.com/zylincdt>

* * *
# version control
```
$ sudo pacman -S subversion git
$ git config --global user.name "Andreas Zhang"
$ git config --global user.email denglitsch@gmail.com
```

* * *
# qemu
```
$ sudo pacman -S qemu qemu-arch-extra qemu-block-gluster qemu-block-iscsi qemu-block-rbd qemu-guest-agent qemu-launcher 
```

* * *
# avr tools
```
$ sudo pacman -S avr-binutils avrdude avr-gcc avr-gdb avr-libc
```
<http://sourceware.org/insight/downloads.php>
<ftp://sourceware.org/pub/insight/releases/>
<ftp://sourceware.org/pub/insight/releases/insight-6.8-1a.tar.bz2>
```
cd ~
tar jxvf insight-6.8-1a.tar.bz2
mkdir /home/andy/insight-arm
./configure --target=arm-linux --prefix=/home/andy/insight-arm --disable-werror
// add '-' before the line 1090 of bfd/Makefile

--disable-stage1-checking

$ sudo pacman -S gdb
$ gdb -tui
info win
fs SRC
fs CMD

mkdir /home/andy/insight-avr
./configure --target=avr --prefix=/home/andy/insight-avr --disable-werror
// if recile errors, add '-' before the line of makefile

./configure --target=arm-none-eabi --prefix=/home/andy/insight-arm --disable-werror
// add '-' before the line 1090 of bfd/Makefile

// expect, tclsh and wish
$ sudo pacman -S tcl tk expect
http://tcl.activestate.com/software/tcltk/
```


* * *
# backup0919
//设置文件管理器终端为 `lxterminal`

fcitx候选字改成7

导入key
`$ sudo pacman-key --add all_keys`

`$ sudo leafpad /etc/pacman.d/mirrorlist`
```
## Score: 1.3, China
Server = http://mirrors.hustunique.com/archlinux/$repo/os/$arch
## Score: 3.0, China
#Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
## Score: 3.0, China
#Server = http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
## Score: 4.3, China
#Server = http://mirror.bjtu.edu.cn/archlinux/$repo/os/$arch
## Score: 4.7, China
#Server = http://mirrors.hust.edu.cn/archlinux/$repo/os/$arch
## Score: 7.3, China
#Server = http://mirrors.163.com/archlinux/$repo/os/$arch
```
```
$ sudo pacman -Syy
```

* * *
# install rar
```
$ wget http://www.rarsoft.com/rar/rarlinux-x64-5.3.b4.tar.gz
$ tar zxvf rarlinux-x64-5.3.b4.tar.gz
$ cd rar
$ sudo make install
$ cd ..
$ rm -rf rar
$ rm rarlinux-x64-5.3.b4.tar.gz
通过samba，从window 7
复制一份rarreg.key到~
```
rarreg.key
```
RAR registration data
Andreas Zhang
Unlimited Company License
UID=95d88025e605e7f69a7d
64122122509a7d8fe151cac66f48da9a7eba775d78b0928b03d738
409ffd2cdd69047f79b560fce6cb5ffde62890079861be57638717
7131ced835ed65cc743d9777f2ea71a8e32c7e593cf66794343565
b41bcf56929486b8bcdac33d50ecf7739960cf9a562353a49af6f9
69d97d19b1c2fb9c0a37971376ad4e3d6a18705e8f9b541bdffccf
bfcd3a6fe09f73b6f6ead20f2606d79374df1160d8db0a1f603850
4e86565158c437a7ff6ea0b2a21104b968ad6ddc336e0342949312
```
```
$ sudo pacman -S ncurses
$ sudo pacman -S mono-tools
```

* * *
# 修改yaourt默认编辑器
`$ sudo leafpad /etc/yaourtrc`
```
EDITOR="vim"
```
没有用？

yaourt下载的位置在/tmp

* * *
# for crosstool-ng
```
//sudo pacman -S cvs gawk
//cd /usr/bin
//mv mawk mawk.bak
//cd /home
sudo pacman -S cvs
//sudo ln -s gawk mawk
```

* * *
# gnome tools
```
$ sudo pacman -S gnome-system-monitor
$ sudo pacman -S gnome-mines
```
* * *
# friendlyarm repos
```
git clone https://github.com/friendlyarm/sd-fuse_nanopi.git
git clone https://github.com/friendlyarm/prebuilts.git
git clone https://github.com/friendlyarm/uboot_nanopi.git
git clone https://github.com/friendlyarm/linux-4.x.y.git
```

* * *
# net tools
// ifconfig,route在net-tools中，nslookup,dig在dnsutils中，ftp,telnet等在inetutils中,ip命令在iproute2中
```
$ sudo pacman -S net-tools dnsutils inetutils iproute2
```

* * *
# ?
`# dirmngr </dev/null`


* * *
# key 操作
`$ sudo leafpad /etc/pacman.d/gnupg/gpg.conf`
```
change keyserver hkp://pool.sks-keyservers.net to hkp://keyserver.ubuntu.com:80
```
```
$ sudo pacman-key -r 0940E3F9
$ pacman-key --export > all_keys
```

* * *
# 远程桌面工具
```
$ sudo pacman -S xrdp remmina freerdp telepathy-glib nxproxy xorg-server-xephyr libvncserver
```
```
//$ vncserver -geometry 1440x900 -alwaysshared -dpi 96 :1
$ x0vncserver -display :0 -passwordfile ~/.vnc/passwd
```
需要的话添加到自启动里面

创建一下密码123456,就是第一次运行的时候vncserver，或者调用vncpasswd
`$ vncserver`

* * *
# mingw
```
$ sudo pacman -S mingw-w64-gcc mingw-w64-binutils mingw-w64-crt mingw-w64-headers mingw-w64-headers-bootstrap mingw-w64-winpthreads
$ gcc -o main main.c
$ i686-w64-mingw32-gcc -o main1 main.c
$ x86_64-w64-mingw32-gcc -o main2 main.c
$ file main*
$ wine ./main1
$ wine ./main2
```
main.c
```
#include <stdio.h>

int main(void)
{
   printf("Hello, World!\n\r");
   return 0;
}
```

* * *
# 安装pdfstudio到~
复制图标到app目录
```
$ sudo cp pdfstudio9.desktop /usr/share/applications/
$ cp pdfstudio9.desktop ~/Desktop
```

* * *
# openbox 环境配置
```
// 修改schema.pl文件,添加
{cat => ['wine',        'Wine',        'applications-wine']},

//$ sudo mv /usr/share/applications/fcitx-ui-sogou-qimpanel.desktop ~/Desktop/
//$ sudo mv /usr/bin/sogou-qimpanel ~/Desktop/


//$ sudo pacman -S kdegraphics-okular 
//$ sudo pacman -S ebook-tools
//$ sudo pacman -S pulseaudio pulseaudio-alsa

//$ sudo pacman -S xfce4 xfce4-goodies
//$ sudo pacman -S gnome
$ sudo pacman -S nautilus-terminal nautilus-open-terminal
$ sudo pacman -S qt
//$ sudo pacman -S qt5-doc

// 不要安装kde
//$ sudo pacman -S plasma kde-applications kde-l10n-zh_cn
```

* * *
# samba 设置
```
$ mkdir ~/share
$ sudo leafpad /etc/samba/smb.conf

[global]
workgroup = WORKGROUP
security = user

[Movies]
path = /home/andy/share
valid users = andy
public = yes
writable = yes
printable = no
create mask = 0644


$ sudo pdbedit -a -u andy
创建samba密码

samba-server-start.sh
————————————————————————————
#!/bin/bash
sudo systemctl start smbd.service nmbd.service winbindd.service
————————————————————————————
和
samba-server-stop.sh
————————————————————————————
#!/bin/bash
sudo systemctl stop smbd.service nmbd.service winbindd.service
————————————————————————————

$ testparm -s
$ smbclient -L hostname -U%

//危险，会破坏对smb://的解析
//$ sudo pacman -S dbus
```

* * *
# 安装 cpan
```
$ sudo cpan
$ sudo cpan install Linux::DesktopFiles Data::Dump
```

* * *
# dconf 配置 gedit encodings
```
$ sudo pacman -S dconf-editor
$ dconf-editor
依次点开->org->gnome->gedit->preferences->encodings
改成
['UTF-8', 'GB18030', 'GB2312', 'GBK', 'BIG5', 'CURRENT', 'ISO-8859-15', 'UTF-16']
```


* * *
# for winetricks
```
$ sudo pacman -S zenity
$ rm -rf ~/.wine
WINEARCH=win32 WINEPREFIX=~/.wine winecfg

or
$ leafpad ~/.bashrc
export WINEPREFIX=$HOME/.wine/
export WINEARCH=win32

记得退出一次终端


$ echo $WINEARCH
$ winecfg
$ winetricks
/home/andy/.cache/winetricks
http://sourceforge.net/projects/wine/files/Wine Mono
http://sourceforge.net/projects/wine/files/Wine%20Gecko/
/usr/share/wine/mono
/usr/share/wine/gecko
```

* * *
# 安装foxit reader，beyond compare，source insight
source insight出现打开项目错误时候，Documents/Source Insight/Settings/GLOBAL.CF3
实在不行就删掉Documents目录下的配置目录就可以恢复


* * *
# 保护根目录关键文件
```
//chmod 1777 *
$ sudo chattr +i rarreg.key
$ lsattr -a
```

* * *
# 使用ACL进行访问控制
```
$ sudo pacman -S acl
```


* * *
# backup0927
```
$ sudo pacman -S openvpn
$ sudo pacman -S pptpclient
$ sudo pacman -S networkmanager-vpnc networkmanager-openvpn networkmanager-pptp
$ sudo pacman -S networkmanager-openconnect rp-pppoe
https://www.igreenvpn.net

$ sudo pacman -S axel
$ sudo pacman -S tls
$ sudo pacman -S xscreensaver
```

* * *
# gstreamer
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

`./basic-tutorial-5` 有告警 Failed to load module "canberra-gtk-module"
```
$ pacman -Qm
$ env
$ pacman -Qo /usr/lib/gtk-2.0/modules/libcanberra-gtk-module.so
$ sudo vim /etc/ld.so.conf.d/gtk-2.0.conf
/usr/lib/gtk-2.0/modules 
$ sudo ldconfig
ok，解决
```
其他，`GTK_PATH=:/usr/lib/gtk-2.0`，不知道行不行。反正上面的办法解决了，不试了。
<http://www.cnblogs.com/day/archive/2013/08/06/3242211.html>
<https://bbs.archlinux.org/viewtopic.php?id=120761>


* * *
# 监控网速
```
$ sudo pacman -S iftop
$ sudo iftop -N -n -i wlp24s0
//下面这个网络流量监控更方便操作
$ sudo pacman -S iptraf-ng
//这个太炫了一点
$ sudo iptraf-ng 
$ sudo pacman -S nethogs
// bmon挺好
$ sudo pacman -S bmon

//这个看来好久没人去更新了
$ sudo pacman -S slurm
$ cd /lib
$ sudo ln -s libncursesw.so.6.0 libncursesw.so.5
$ slurm -s -i wlp24s0

//这个简单直观
$ yaourt -S speedometer
python2-packaging-15.3-1  python2-setuptools-1:18.3.1-1  python2-urwid-1.3.0-2
$ speedometer -rx wlp24s0 -tx wlp24s0
$ speedometer -r wlp24s0 -c -t wlp24s0
```

* * *
# pgp server
<http://pgp.mit.edu/>



* * *
# gvim
```
// gvim就包含了cli的vim的，所以替换掉吧
$ sudo pacman -S gvim
```

* * *
# wine 一个 winrar


* * *
# lua and cairo ?
```
// 没用
//$ sudo pacman -S lua
//$ sudo pacman -S lua-expat lua-filesystem
//$ sudo pacman -S cairo-perl
//$ sudo pacman -S cairomm
```


* * *
# nfs
```
$ sudo pacman -S nfs-utils
$ sudo systemctl restart rpcbind
$ sudo systemctl status rpcbind
$ sudo vim /etc/iptables/iptables.rules
$ sudo systemctl restart nfs-server iptables
$ sudo systemctl status nfs-server iptables
$ showmount -e
```

* * *
# minicom
minicom只限sudo，所以也有不同



* * *
# something

```
$ sudo pacman -S ccache
$ sudo pacman -S vala
$ sudo pacman -S btsync
	WebGUI can be accessed via following URL: http://localhost:8888
	
	* Running btsync system instance (using dedicated btsync:btsync account)

  	  System instance of btsync is preconfigured (configuration file located
	  at /etc/btsync.conf) and can be used directly after installation.

	  Execute:

	    to reload system systemd modules:     systemctl daemon-reload
	    to start btsync manually:             systemctl start btsync
	    to autostart btsync on system start:  systemctl enable btsync

	* Running btsync user instance (using current user account)

	  User instance MUST be configured before use. To perform configuration, 
	  install btsync-autoconfig package or follow manual configuration steps:

  	    1. Copy /etc/btsync/btsync.conf to ~/.config/btsync/btsync.conf for
 	    the user you wish to configure btsync:
 	
	      mkdir -p ~/.config/btsync	
	      cp /etc/btsync.conf ~/.config/btsync/btsync.conf
 
	    2. Replace user-specific references with the appropriate information,
	    including the following settings:
 
	      - storage_path
	      - pid_file
	      - webui.listen
	      - webui.login
	      - webui.password

	    3. Make sure folder you specified as storage_path and folder where pid_file will
	    be located both exist in the filesystem, since btsync will not create it for you.

	  Execute:

	    to reload user systemd modules:       systemctl --user daemon-reload
	    to start btsync manually:             systemctl --user start btsync
	    to autostart btsync on user login:    systemctl --user enable btsync


$ yaourt -S btsync-gui
Please take in to account that btsync-gui makes the btsync web UI
inaccessible (for security reasons) by default and binds the web UI
interface to 127.0.0.1 using internal random credentials at each
start. If you do not want this behaviour, please execute this command
before starting btsync-gui:

btsync-gui —webui —username <yourpreferredname> —password <yourpreferredpwd> —bindui all —savedefaults

This command persistently configures btsync-gui to enable the web UI,
binding it to all adapters and configured to use the supplied
credentials for accessing the web UI.

btsync-gui --webui --username andy --password btsync --bindui all --savedefaults
http://192.168.1.100:8888/gui/
http://127.0.0.1:8888/gui/
$ sudo gvim /etc/btsync.conf
$ sudo systemctl restart btsync
$ journalctl -xe
```

打开putty
`./btsync --webui.listen 0.0.0.0:8888`
把其中0.0.0.0 换成你MC的IP就行

arch的log目录
`AFWWVHNX5KZ4BW6HZTQXMB25ISELTE7HF`

* * *
# putty
```
$ sudo pacman -S putty
```

* * *
# something
// 后面会安装iptux
// wine ipmsg
```
$ makepkg
$ sudo pacman -U rar-5.3.b4-1-x86_64.pkg.tar.xz

$ sudo pacman -S adobe-source-code-pro-fonts
```
<http://wallpaperswide.com/arch_linux-wallpapers.html>
在aotustart里设置wallpaper

`$ git clone git://pkgbuild.com/aur-mirror.git`


```
$ sudo pacman -S gnome-control-center
$ sudo pacman -S system-config-printer rygel vino gst-plugins-ugly gst-plugins-base gst-plugins-good gst-plugins-bad gst-libav tracker
$ sudo pacman -S gnome-calculator gnome-clocks
$ sudo pacman -S gnome-shell-extensions
```

* * *
# 安装飞秋
那么ipmsg就不用了
`$ yaourt -S iptux`
注意，只能传文件夹



* * *
# 百度云
```
$ sudo pacman -S bcloud kwplayer
//python-mutagenx plyvel python3-keybinder

//$ yaourt python-cairo-git 
$ yaourt -S python-cairo-git
$ yaourt -S python-gobject-patched
```


* * *
# mathomatic
```
$ sudo pacman -S mathomatic gnuplot rlwrap
```

* * *
# stellarium
```
$ sudo pacman -S stellarium
```

* * *
# 几个数学工具
```
$ sudo pacman -S freemat octave
```
运行FreeMat

* * *
# something
```
$ sudo pacman -S filelight
$ sudo pacman -S baobab
$ sudo pacman -S colordiff hardinfo

$ yaourt -S archey3-git
$ yaourt -S i-nex


$ sudo pacman -S gnome-calendar calcurse when
//$ yaourt -S  asco 
$ sudo pacman -S qucs geda-gaf units freehdl pcb kicad gerbv iverilog gtkwave qucs gnucap ngspice 
$ yaourt gspiceui gaw wxgtk pangox
http://ports.ubuntu.com/pool/universe/g/geda-xgsch2pcb/geda-xgsch2pcb_0.1.3.orig.tar.gz
$ yaourt intltool
手动安装xgsch2pcb
```


* * *
# quartus ii
//网盘7上存有linux下的qii\matlab\modelsimse
//这个qii其实可以到网站去下载



* * *
# 修改默认浏览器
这三句works
```
$ xdg-mime default browser.desktop x-scheme-handler/http
$ xdg-mime default browser.desktop x-scheme-handler/https
$ xdg-mime default browser.desktop text/html
```
<https://wiki.archlinux.org/index.php/Xdg-open#Set_the_default_browser>

// Alternatively, run:   // it dosen't work
`//$ xdg-settings set default-web-browser browser.desktop`
```
//cat /usr/bin/xdg-open
//~/.local/share/applications/mimeapps.list says:
//x-scheme-handler/http=opera.desktop
//x-scheme-handler/https=opera.desktop
```
// 参见default app
<https://wiki.archlinux.org/index.php/Default_applications#MIME_types_and_desktop_entries>


* * *
# 用ff设置默认浏览器
`~/.config/mimeapps.list`发生变化
```
x-scheme-handler/http=firefox.desktop
x-scheme-handler/https=firefox.desktop
x-scheme-handler/ftp=firefox.desktop
x-scheme-handler/chrome=firefox.desktop
application/x-extension-htm=firefox.desktop
application/x-extension-html=firefox.desktop
application/x-extension-shtml=firefox.desktop
application/xhtml+xml=firefox.desktop
application/x-extension-xhtml=firefox.desktop
application/x-extension-xht=firefox.desktop
```

删除下列文件夹多余的
```
/home/andy/.local/share/mime/application
update-mime-database ~/.local/share/mime
```

* * *
# 删除btsync
```
$ sudo pacman -Rc btsync
$ sudo pacman -Rc btsync-gui
```

* * *
# 查看显卡
```
$ lspci | grep -e VGA -e 3D
```


* * *
# gtkwave
```
$ sudo pacman -S gtkwave
copy the /usr/share/gtkwave/examples/gtkwaverc file to
your home directory (as .gtkwaverc)
$ sudo cp /usr/share/gtkwave/examples/gtkwaverc ~/.gtkwaverc
$ sudo pacman -S freehdl
```

* * *
# 电池电量监控
// 选择两款笔记本电量监控，battery监视
```
$ pacman -Ss battery
$ sudo pacman -S acpi cbatticon
```


* * *
# 安装VLC
```
$ sudo pacman -S vlc
$ cvlc
$ vlc
```

* * *
# conky
```
$ yaourt conky
// 选择支持lua的，安装后没有效果	
//$ sudo pacman -Sconky-manager


$ sudo pacman -S tolua++
$ sudo pacman -S lua51-expat
```
* * *
# scons
$ sudo pacman -S scons
sudo ./configure --enable-lua-cairo --enable-lua-imlib2 --enable-imlib2
// 完全失败



* * *
# tolua
// 试着编译tolua-5.2.0，修改config文件
`WARN= -ansi -Wall -g -DLUA_32BITS`
可以编译完毕


* * *
# 操作mdb文件
```
$ sudo pacman -S unixodbc
$ yaourt -S mdbtools-git
$ yaourt -S gmdb
```

* * *
# bypy
```
$ yaourt bypy
$ bypygui.pyw 
c4c129458f6696f143123d8bd8fd30dd
```


* * *
# chrome
```
$ yaourt -S google-chrome
$ google-chrome-stable
```


* * *
# 安装modelsim
```
$ yaourt libxtst
$ yaourt libxp
$ yaourt libxt
```
都选32位元的，会请求把gcc等都换成multilib的
```
$ cd /opt
$ sudo mkdir modelsim
$ sudo chmod 777 modelsim
```
安装完毕之后
```
$ chmod 777 -R modelsim
$ sudo ./sfk6 rep -yes -pat -bin /5589E557565381ECD00000008B5508/31C0C357565381ECD00000008B5508/ -dir .
```
`$ yaourt libstdc++`
选择64和32位元的

`$ wine cmd`
去产生license, 似乎invalid，不管，先跑vsim
需要更新freetype到freetype2-ubuntu
参考《Altera Design Software在linux安装指南》
<http://bbs.eeworld.com.cn/thread-455341-1-1.html
https://wiki.archlinux.org/index.php/Altera_Design_Software>
`$ yaourt freetype`
选freetype2-ubuntu就可以运行vsim。再想办法破解license
```
$ cd /opt/modelsim/modeltech/linux_x86_64
$ export LANG=en_EN.UTF-8 
$ wineconsole cmd 
> patch_dll.bat
```
查看license
`$ lmutil lmdiag`
// 信息显示hostid不符，但是确实是一样的。
// 那么从网卡名称着手，修改为eth0
<https://wiki.archlinux.org/index.php/Network_configuration>
```
$ sudo leafpad /etc/udev/rules.d/10-network.rules
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="00:17:42:f4:8e:1c", NAME="eth0"
$ sudo reboot
$ vsim
// 成功，到此破解完成
// 这里没有给无线网卡改名字，算是把系统更改减少到最小，conky配置也不用动了
```

* * *
# veriwell
```
$ yaourt veriwell
```

* * *
# 安装有道词典
```
$ yaourt python-xlib
$ yaourt youdao-dict
$ pacman -Ss tesseract-data-*
// so easy!
```
* * *
# mounter
```
$ yaourt mounter
archive-mounter
automounter
//gvfs-archive
```

* * *
# something
```
yaourt gedit
yaourt gnome-terminal

// 安装matlab,so easy!
// 添加一下matlab的环境变量


yaourt xz-git
```


* * *
# 安装Quatus ii 11
```
$ sudo pacman -S tcsh
$ sudo pacman -S expat fontconfig xorg-fonts-type1 glibc gtk2 libcanberra libpng libice libsm util-linux ncurses tcl tcllib zlib libx11 libxau libxdmcp libxext libxft libxrender libxt libxtst
//yaourt freetype2
yaourt libpng12
yaourt lib32-libpng12
$ sudo pacman -S lib32-expat lib32-fontconfig lib32-freetype2 lib32-glibc lib32-gtk2 lib32-libcanberra lib32-libpng

$ sudo pacman -S lib32-libice lib32-libsm lib32-util-linux lib32-ncurses lib32-zlib lib32-libx11 lib32-libxau lib32-libxdmcp lib32-libxext
$ sudo pacman -S lib32-libxft lib32-libxrender lib32-libxt lib32-libxtst
```

`find /usr/ -name "libpng*"`

安装包所在目录名称不能有空格哦
```
$ sh 11.0_devices_linux.sh --noexec
$ sh 11.0_dsp_builder_linux.sh --noexec
$ sh 11.0_legacy_nios2_linux.sh --noexec
$ sh 11.0_modelsim_ae_linux.sh --noexec
$ sh 11.0_quartus_linux.sh --noexec
$ sh 11.0_programmer_linux.sh --noexec
```
实际是安装包自己带的一些东西太旧了，archlinux这是libz.so.1，mv出去就能进安装界面
<http://www.linuxidc.com/Linux/2011-10/46280.htm>
<http://www.linuxidc.com/Linux/2014-05/101212.htm>

运行altera的vsim有问题
`$ sudo yaourt ncurses5-compat-libs`
安装相关的包
```
$ ./lmutil lmdiag
$ ./vsim
// key就以后需要的时候再更新吧
```
```
//export LM_LICENSE_FILE=/opt/modelsim/license.dat
//export PATH=$PATH:/opt/MATLAB/R2010b/bin:/opt/modelsim/modeltech/linux_x86_64:/opt/altera/11.0/quartus/linux64:/opt/altera/11.0/nios2eds/bin:/opt/altera/11.0/quartus/dsp_builder
//export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/altera/11.0/quartus/dsp_builder/bin64:/opt/altera/11.0/quartus/dspba/Blocksets/BaseBlocks/linux64
$ leafpad ~/.bashrc
现在是这样的输出
export WINEPREFIX=$HOME/.wine/
export WINEARCH=win32
alias cd..='cd ..'
export LM_LICENSE_FILE=/opt/modelsim/license.dat:/opt/altera/license.dat
export PATH=$PATH:/opt/MATLAB/R2010b/bin:/opt/modelsim/modeltech/bin:/opt/altera/11.0/quartus/bin:/opt/altera/11.0/nios2eds/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/altera/11.0/quartus/dsp_builder/bin64:/opt/altera/11.0/quartus/dspba/Blocksets/BaseBlocks/linux64
```




/etc/udev/rules.d/51-altera-usb-blaster.rules
```
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6002", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6003", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6010", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6810", MODE="0666"
```
`sudo udevadm control --reload`


* * *
# arch_bk151007.tar.xz

备份前
删除`/home/andy/.cache/tracker/meta.db`，媒体缓存超大且没啥用
清空回收站

`$ xz --threads=0 -z arch_bk.tar `
`//$ xz -T 0 -z arch_bk.tar`


* * *
# 控制台中文显示
```
$ yaourt zhcon
然后在ttyn（Ctrl+Alt+Fn）下:
$ zhcon --utf8
```

* * *
# Something
```
$ sudo pacman -S quilt
$ yaourt perl-expect
$ yaourt perl-crypt-ssleay
$ yaourt dbus-glib lib32-dbus-glib
$ yaourt lib32-libarchive
$ yaourt lzlib
$ yaourt libsystemd-daemon
$ yaourt xterm
$ yaourt linux-headers

$ sudo pacman -Syu
```
check /var/lib/dkms/vboxhost/5.0.6/source

`$ sudo dkms install vboxhost/5.0.6`
`$ systemctl enable dkms.service`
```
==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-unit-files ===
Authentication is required to manage system service or unit files.
Authenticating as: andy
Password: 
==== AUTHENTICATION COMPLETE ===
Created symlink from /etc/systemd/system/multi-user.target.wants/dkms.service to /usr/lib/systemd/system/dkms.service.
==== AUTHENTICATING FOR org.freedesktop.systemd1.reload-daemon ===
Authentication is required to reload the systemd state.
Authenticating as: andy
Password: 
==== AUTHENTICATION COMPLETE ===
```
```
$ sudo vboxreload
$ yaourt virtualbox-ext-oracle
# modprobe -r vboxdrv
# modprobe vboxdrv
//以上=
$ sudo vboxreload
$ sudo pacman -S virtualbox-ext-oracle
# modprobe -r vboxdrv
# modprobe vboxdrv
```
virtualbox扩展包位置在
`/usr/share/virtualbox/extensions/`

```
$ yaourt ddd
$ yaourt asteroid
//freeglut cmake jsoncpp vor smpeg sdl_mixer libmikmod sdl_net
$ yaourt 0ad
$ yaourt rigsofrods
$ yaourt acroread
$ yaourt acroread-fonts
$ sudo pacman -S wesnoth wesnoth-data
$ sudo pacman -S openra
$ yaourt xeyes
```


* * *
# uboot
```
uboot
    编译:
    #make distclean
    #make ARCH=arm CROSS_COMPILE=/opt/FriendlyARM/toolschain/4.5.1/bin/arm-none-linux-gnueabi- tiny210_config
    #make ARCH=arm CROSS_COMPILE=/opt/FriendlyARM/toolschain/4.5.1/bin/arm-none-linux-gnueabi- all spl

make mini2440_config
make CROSS_COMPILE=arm-none-eabi-


    将u-boot镜像写入SD卡
    #dd iflag=dsync oflag=dsync if=spl/tiny210-spl.bin of=/dev/sdb seek=1
    #dd iflag=dsync oflag=dsync if=u-boot.bin of=/dev/sdb  seek=49
```


* * *
# 从iso镜像制作启动u盘的工具
```
$ yaourt unetbootin
```
* * *
# 硬盘加密工具
```
$ yaourt truecrypt
$ yaourt veracrypt
```

* * *
# 支持delta sync的网盘
```
$ yaourt dropbox
$ yaourt dropbox-cli
$ yaourt nautilus-dropbox
//$ yaourt dropbox-gtk2
$ yaourt dropbox-index
```

* * *
# 2/16 hex进制查看和编辑
```
xxd

hexdump

//$ yaourt biew

$ yaourt hexedit
$ yaourt dhex
$ yaourt ultraedit
uex
$ yaourt okteta
```
* * *
# something
```
$ yaourt bcompare
$ yaourt acetoneiso2
$ yaourt dmg2dir

$ yaourt isomaster
$ yaourt onboard

$ yaourt 115wangpan


$ yaourt gimagereader
$ yaourt tesseract
$ yaourt mldonkey
$ yaourt bluefish
$ yaourt pointdownload
$ yaourt magnet2torrent
$ yaourt rtorrent
$ yaourt deluge
```







* * *
# 全面采用lxterminal，设置显示菜单和控制条
快捷键
弹出菜单
文件管理器




* * *
# 解决依赖冲突一个例子
<https://www.archlinux.org/news/java-users-manual-intervention-required-before-upgrade/>
`# pacman -Sydd --asdeps java-runtime-common`
```
:: java-runtime-common and java-common are in conflict. Remove java-common? [y/N] y
```


* * *
# 安装wps缺失的字体
将整个wps_symbol_fonts目录拷贝到 `/usr/share/fonts/`  目录下
注意，wps_symbol_fonts目录要有可读可执行权限
1.权限设置,执行命令如下
```
    cd /usr/share/fonts/
    chmod 755 wps_symbol_fonts
    cd /usr/share/fonts/wps_symbol_fonts 
    chmod 644 *
```
2.生成缓存配置信息
    进入字体目录  
    `cd /usr/share/fonts/wps_symbol_fonts`
    生成
```
    mkfontdir
    mkfontscale
    fc-cache
```


* * *
# something
```
$ yaourt parcellite
$ yaourt audio-convert
$ yaourt kmplayer
$ yaourt lantern
$ yaourt tor-browser-zh-cn
$ gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 2E1AC68ED40814E0
$ gpg --verify tor-browser-linux64-6.0.5_en-US.tar.xz.asc tor-browser-linux64-6.0.5_en-US.tar.xz$ 
$ sudo pacman -U tor-browser-en-6.0.5-1-x86_64.pkg.tar.xz

$ yaourt smplayer
$ yaourt mpv
```

* * *
# 截图工具
```
$ yaourt shutter
// 再搭配gimp，也很牛逼啊
$ yaourt gnome-screenshot
设置openbox键盘截屏rc.xml
```

* * *
# eclipsetrader
```
$ yaourt eclipsetrader
$ sudo pacman -R eclipsetrader
```


* * *
# epub 等
```
$ yaourt epub
ppub lucidor
$ yaourt calibre
```

* * *
# peco 等
<http://peco.github.io/>
<https://github.com/peco/peco>
```
$ yaourt eaglemode
$ yaourt synapse

$ yaourt peco
$ yaourt agrep
$ yaourt pick
$ yaourt fasd
```

* * *
# locator 等
<https://github.com/AlexTuduran/Locator>
```
$ yaourt locator
sudo /opt/locator/locator
$ sudo updatedb
$ locate XXX | peco
$ locate XXX | pick
$ locate XXX | peco | xargs less
$ locate XXX | less
$ find . -iname '*.xx' | peco

$ yaourt catfish
sudo catfish
```



* * *
# something
```
$ yaourt wxPython


$ ssh -X 192.168.1.110



$ yaourt qt-doc
5&4

$ yaourt i2c-tools

$ yaourt qtcreator
$ yaourt qt5-examples

$ yaourt qr code
qrencode
barcode

//notepad++或者notepadqq
$ yaourt notepadqq
// tip：ctrl+alt可以进行列编辑
```

* * *
# iptux
// 处理aur-iptux安装的iptux传输（准确说是发送）文件大小为0的问题
需要预装git libgtk2.0-dev libgconf2-dev g++ make autoconf libtool automake等
```
git clone git://github.com/iptux-src/iptux.git
cd iptux
./configure
make
sudo make install
iptux
// 已经修改aur-iptux，可以直接打包成pacman安装包，便于管理
```
* * *
# 计算器
// 计算器老外观更顺眼一点
```
$ yaourt gcalctool-oldgui
```
//gcalctool-oldgui 与 gnome-calculator 有冲突。删除 gnome-calculator


* * *
# ？
```
==> If you experience sound problems try setting your SDL_AUDIODRIVER environment variable to "dma"
==> eg. export SDL_AUDIODRIVER="dma" ; wesnoth
==> If "dma" doesn't work,other options are: dsp,alsa,artsc,esd,nas try to find the right output.
```


* * *
# Something
```
$ yaourt cpu-x

$ yaourt wpa2
```


* * *
# apache server
```
$ sudo pacman -S apache
或者
$ yaourt apache-tools
```
`$ sudo gedit /etc/httpd/conf/httpd.conf `
```
#DocumentRoot "/srv/http"
#<Directory "/srv/http">
DocumentRoot "/mnt/sdd1"
AddDefaultCharset UTF-8
DefaultLanguage zh-CN
<Directory "/mnt/sdd1">
    #
    # Possible values for the Options directive are "None", "All",
    # or any combination of:
    #   Indexes Includes FollowSymLinks SymLinksifOwnerMatch ExecCGI MultiViews
    #
    # Note that "MultiViews" must be named *explicitly* --- "Options All"
    # doesn't give it to you.
    #
    # The Options directive is both complicated and important.  Please see
    # http://httpd.apache.org/docs/2.4/mod/core.html#options
    # for more information.
    #
    Options Indexes FollowSymLinks

    #
    # AllowOverride controls what directives may be placed in .htaccess files.
    # It can be "All", "None", or any combination of the keywords:
    #   AllowOverride FileInfo AuthConfig Limit
    #
    AllowOverride None
    Order allow,deny
    Allow from all
    #
    # Controls who can get stuff from this server.
    #
    Require all granted
</Directory>
```

`$ sudo systemctl restart httpd.service`


* * *
# Something
```
$ yaourt -S chromium-pepper-flash
$ yaourt -S acroread (太垃圾)
acroread 的可选依赖
    acroread-fonts: CJK and extended font packs
    lib32-libcanberra: XDG sound support
    lib32-gtk-engine-murrine: fix ugly buttons and scrollbars

$ yaourt -S foxitreader

$ yaourt iceweasel

$ yaourt genymotion
/home/andy/.Genymobile/Genymotion/ova

$ yaourt masterpdfeditor

$ yaourt amule

$ yaourt rtorrent
```

* * *
# ftp client
```
$ yaourt filezilla
```

* * *
# ssh server
```
sudo pacman -S openssh
sudo systemctl start sshd.service
ps -e | grep ssh
ps -ef | grep sshd
sudo iptables -L
```


* * *
# jwm
yaourt jwm


* * *
# 安装 openproj
```
$ makepkg
$ sudo pacman -U openproj-1.4-2-x86_64.pkg.tar.xz
```

* * *
# 百度文库下载
`idocdown_v29`


* * *
# 一个iso信息查看工具
```
$ yaourt dumpet

$ makepkg
$ sudo pacman -U dumpet-2.1-5-x86_64.pkg.tar.xz
```

* * *
# 一个iso制作工具
```
yaourt xorriso
```

* * *
# alien 包转换
用于转换安装包，比如从rpm包到deb包
```
yaourt alien
```


* * *
# Framebuffer setup utility
```
yaourt fbset
```

* * *
# 一个版本控制工具
```
yaourt bzr
```

* * *
# Something
```
//暂时不安装这个东西
yaourt lazarus

yaourt wine-git

yaourt libstdc++
选5
```


* * *
# 显示 显卡 有关
```
#yaourt glxinfo
```
<https://wiki.archlinux.org/index.php/Intel_graphics#Installation>
```
yaourt lib32-mesa-libgl mesa-libgl xf86-video-intel mesa-demos lib32-mesa-demos
```
/etc/X11/xorg.conf.d/20-intel.conf
```
Section "Device"
   Identifier  "Intel Graphics"
   Driver      "intel"
EndSection
```
<https://wiki.archlinux.org/index.php/Hardware_video_acceleration#Installing_VA-API>
```
yaourt libva-intel-driver libvdpau-va-gl
```

```
glxinfo
lspci | grep VGA
```

* * *
# Something
```
yaourt lib32-tcl

yaourt ksh ld-lsb

killall xeyes
```

```
为了update
删除iceweasel、lib32-ffmpeg-1:3.0.2-2  lib32-libvdpau-va-gl-0.3.4-1

sudo pacman -Rdd openjpeg2

编译lib32-ffmpeg lib32-libvdpau-va-gl

yaourt openjpeg2

lib32-libvpx libvpx


yaourt -Sua lib32-ffmpeg


重新编译安装iceweasel
libvpx不指定版本 



为运行quartus
安装lib32-libpng12

```



* * *
# exfat格式支持
```
$ sudo pacman -S exfat-utils
```




* * *
# mime
```
文件打开
mime
/home/andy/.local/share/applications/mimeinfo.cache等文件有关
```


* * *
# opera
```
yaourt opera
```


* * *
# 安装永中office
```
EIOffice_Personal_Lin.tar.gz
sudo ./setup.sh
指向/opt
命令是eio

wps能够满足大部分需求，如果需要急用一些ms office的功能，就用eio顶一下啦
```


* * *
# sensors + conkey配置
```
$ yaourt lm_sensors
$ sensors
```
结合sensors监测cpu温度并显示在conkey中，要清除掉摄氏度前的A字符
```
CPU0: ${exec sensors | grep "Core 0" | cut -c16-19}${exec sensors | grep "Core 0" | cut -c21-21}C$alignr${cpu cpu0}%
${cpubar cpu0}
#CPU1: ${exec sensors | grep "Core 1" | tail -n 1 | awk '{print $3}'| cut -c1,2,3,4,5,7}C$alignr${cpu cpu1}%
CPU1: ${exec sensors | grep "Core 1" | awk '{print $3}'| cut -c2,3,4,5,7}C$alignr${cpu cpu1}%
${cpubar cpu1}
```

如果.conkyrc中的
`override_utf8_locale` 修改为yes
那么可以简化
```
CPU0: ${exec sensors | grep "Core 0" | cut -c16-22}$alignr${cpu cpu0}%
${cpubar cpu0}
CPU1: ${exec sensors | grep "Core 1" | awk '{print $3}'| cut -c2-8}$alignr${cpu cpu1}%
${cpubar cpu1}
```



* * *
# Something
```
yaourt qtchooser

yaourt alsa-plugins
选lib32

ccs6
lib32-dbus-glib
lib32-libgcrypt
lib32-gconf
lib32-libgcrypt15
```

* * *
# 坚果云
```
yaourt nutstore
```

* * *
# 安装flash-plugin
<https://wiki.archlinux.org/index.php/Chromium#Default_applications>
```
yaourt pepper-flash
```
对opera、chromiun有效，查看和启用都在
`chrome://plugins/`

chrome自带

firefox和iceweasel
<https://wiki.archlinux.org/index.php/Browser_plugins#Flash_Player>
```
yaourt ttf-ms-fonts
yaourt freshplayerplugin
cp /usr/share/freshplayerplugin/freshwrapper.conf.example ~/.config/freshwrapper.conf
```
* * *
# curlftpfs
```
yaourt curlftpfs

curlftpfs -o codepage=utf8 ftp://username:password@192.168.192.168 /ftp
```

* * *
# url encode tools
```
yaourt url encode # 没有必要安装的
perl-url-encode
```
URL字符编码可以用在线工具去解码
<http://tool.chinaz.com/tools/urlencode.aspx>
<http://old.tool.chinaz.com/Tools/URLEncode.aspx>
<http://www.w3school.com.cn/tags/html_ref_urlencode.html>
<http://search.cpan.org/~chansen/URL-Encode-0.03/lib/URL/Encode.pod>

<http://tech.mclarian.com/a/557>
纯解码
url串保存到keywords.list
`$ perl -pe 's/%(..)/pack("c", hex($1))/eg' keywords.list`

！！！或者通过命令进行url encode and decode
`echo "%E9%B2%81" | perl -pe 's/%(..)/pack("c", hex($1))/eg'`
`echo "%E9%B2%81%E5%85%8B%EF%BC%9A%E4%B8%AA%E4%BD%93%E4%B8%BB%E4%B9%89%E4%BC%A6%E7%90%86(20161019)" | perl -pe 's/%(..)/pack("c", hex($1))/eg'`

那么对应的编码就是
`echo 鲁 | perl -pe 's/([^\w\-\.\@])/$1 eq "\n" ? "\n":sprintf("%%%2.2x",ord($1))/eg'`

用脚本编码
<http://www.perlhowto.com/encode_and_decode_url_strings>
保存成.pl文件并chmod
```
#!/usr/bin/perl
use URI::Escape;
 
my $string = "Hello world!";
my $encode = uri_escape($string);
 
print "Original string: $string\n";
print "URL Encoded string: $encode\n";
```
！！受此启发，写两个脚本

url-decode.pl
```
#!/usr/bin/perl
 
use URI::Escape;

print "Input original string:\n";
my $string = <STDIN>;
print "\nOriginal string:\n$string\n";

my $encode = uri_escape($string);
print "URL Encoded string:\n$encode\n\n";

```

url-encode.pl
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

都chmod 777，就可以转换了
复制到/bin去






安装steam
<https://wiki.archlinux.org/index.php/Steam>
<https://wiki.archlinux.org/index.php/Steam/Troubleshooting#Debugging_Steam>
```
$ yaourt steam-native-runtime
$ yaourt steam
$ steam-native
或者
$ LD_PRELOAD='/usr/$LIB/libstdc++.so.6 /usr/$LIB/libgcc_s.so.1 /usr/$LIB/libxcb.so.1 /usr/$LIB/libgpg-error.so' /usr/bin/steam
```

* * *
# 安装unar
```
yaourt unarchiver
yaourt unzip-iconv
```

deb转pacman安装包
`/mnt/win_e/boot/arch_doc/pacman`
一个例子是uex_4.0.0.7，在hexeditor目录
注册时候断网之后任意输入，就点出离线注册了




* * *
# 双击加载iso镜像
``
//yaourt automounter
``
！！！！！！！iso挂载最好还是用gnome-disk-image-mounter
``
yaour gnome-disk-utility
``



* * *
# 光盘烧录
```
yaourt k3b
```

* * *
# 仿 searcheverything
据说angrysearch山寨了searcheverything
```
yaourt angrysearch
```



* * *
# 提供crc32
```
yaourt perl-archive-zip
```

* * *
# 查看sqlite格式的.db文件
```
yaourt sqlitebrowser
```







* * *
# 课题
本地有xserver，如何把远程桌面在本地运行？



* * *
# 安装 modelsim/vsim
```
$ vsim
Error in startup script:
Initialization problem, exiting.
Initialization problem, exiting.
Initialization problem, exiting.
   while executing
"EnvHistory::Reset"
   (procedure "PropertiesInit" line 3)
   invoked from within
"PropertiesInit"
   invoked from within
"ncFyP12 -+"
   (file "/opt/questasim/linux_x86_64/../tcl/vsim/vsim" line 1)
** Fatal: Read failure in vlm process (0,0)
```
ref to <https://wiki.archlinux.org/index.php/Altera_Design_Software>

`gedit /opt/modelsim/modeltech/vco`

add near the top (after the #!/bin/sh)
```
export LD_LIBRARY_PATH=/opt/modelsim/modeltech/lib
```



* * *
# QR Code generator and decoder
```
yaourt qtqr kqrcode
```



* * *
# 安装 eaglemode
```
yaourt eaglemode
```



* * *
# smath等
```
yaourt smath
```
Octave、Scilab、Maxima就不安装了







* * *
# 修改 /opt 目录 owner 和 权限
```
sudo chown andy:users opt/
```

* * *
# 添加 xxnet 到 dmenu 支持的 path
`cd /usr/local/bin`
`sudo gedit xxnet`
```
#!/bin/bash

/opt/XX-Net/start
```
`sudo chmod +x xxnet`

开机启动 xxnet
`$ leafpad ~/.config/openbox/autostart`
添加
```
(sleep 2 && xxnet) &
```


* * *
# cadence快速运行

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


* * *
# 配置 btsync
```
sudo pacman -S btsync

mkdir -p ~/.config/btsync
sudo chmod +r /etc/btsync.conf
cp /etc/btsync.conf ~/.config/btsync/btsync.conf
gedit ~/.config/btsync/btsync.conf
```

`systemctl --user daemon-reload`
`systemctl --user start btsync`


* * *
# mime 整理
<https://wiki.archlinux.org/index.php/Default_applications_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>
有关path和文件
`/usr/share/applications`
`~/.local/share/applications`
`/usr/share/applications/mimeinfo.cache`
`~/.local/share/applications/mimeinfo.cache`
`$HOME/.local/share/applications/mimeapps.list`
`$HOME/.config/mimeapps.list`

修改`~/.local/share/applications/mimeinfo.cache`
```
...
application/pdf=wine-extension-pdf.desktop;
...
```

`perl-file-mimeinfo`

`mimeopen -d 1.html`

找找
`xfce4-mime-settings`



* * *
# Something
```
sudo pacman -Qdt
sudo pacman -Rc geoclue
#yaourt pdf-xchange
yaourt dolphin
yaourt stcgal sdcc
yaourt ltspice
yaourt mplab
yaourt bluefish
yaourt kompozer
yaourt minicom
yaourt asciiflow
```


* * *
# updatedb 有关
```
sudo updatedb -U /run/media/andy/BC482DD5482D8EE8/ -o ~/Downloads/mlocate_sdd.db
sudo locate -d ~/Downloads/mlocate_sdd.db  XXX
sudo locate -d ~/Downloads/mlocate_sdd.db  XXX | peco
sudo locate -d ~/Downloads/mlocate_sdd.db VPFE | grep pdf | peco
sudo locate -d ~/Downloads/mlocate_sdd.db VPFE | grep pdf
```

* * *
# 远程桌面
```
yaourt realvnc
sudo pacman -R xrdp
sudo pacman -R tigervnc
sudo pacman -U realvnc-vnc-server-6.0.2-1-x86_64.pkg.tar.xz 
sudo pacman -U realvnc-vnc-viewer-6.0.2-1-x86_64.pkg.tar.xz 
```
`sudo systemctl enable vncserver-x11-serviced`
```
Created symlink /etc/systemd/system/multi-user.target.wants/vncserver-x11-serviced.service → /usr/lib/systemd/system/vncserver-x11-serviced.service.
```
`sudo systemctl start vncserver-x11-serviced`
注册码是
`WHJRK-UXY7V-Q34M9-CZU8L-8KGFA`

`sudo systemctl enable avahi-daemon.service`
```
Created symlink /etc/systemd/system/dbus-org.freedesktop.Avahi.service → /usr/lib/systemd/system/avahi-daemon.service.
Created symlink /etc/systemd/system/multi-user.target.wants/avahi-daemon.service → /usr/lib/systemd/system/avahi-daemon.service.
Created symlink /etc/systemd/system/sockets.target.wants/avahi-daemon.socket → /usr/lib/systemd/system/avahi-daemon.socket.
```
`sudo systemctl start avahi-daemon.service`

`sudo systemctl enable teamviewerd.service`
```
Created symlink /etc/systemd/system/multi-user.target.wants/teamviewerd.service → /usr/lib/systemd/system/teamviewerd.service.
```
`sudo systemctl start teamviewerd.service`







* * *
# MySQL
<https://wiki.archlinux.org/index.php/MySQL>
`yaourt mysql`
`sudo systemctl start mysqld.service`
`mysql -u root -p `直接回车，无需输入密码就可以进入数据库了
设置密码
```
mysql> set password for root@localhost = password('a');
```
基本使用：

显示已有数据库
`mysql> show databases;`
载入名为mysql的数据库
`mysql> use mysql;`
显示该数据库包含的表
`mysql> show tables;`
查询某表
`mysql> select * from user;`
退出
`mysql> exit;`

* * *
# PhpMyAdmin
<https://wiki.archlinux.org/index.php/PhpMyAdmin>
```
yaourt phpmyadmin
sudo gedit /etc/httpd/conf/extra/phpmyadmin.conf
sudo gedit /etc/httpd/conf/httpd.conf
sudo systemctl restart httpd.service 
```

* * *
# php安装

php安装和apache的php扩展配置见wiki

To install PHP, first install the php and php-apache packages.

In `/etc/httpd/conf/httpd.conf`, comment the line:
```
#LoadModule mpm_event_module modules/mod_mpm_event.so
```
and uncomment the line:
```
LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
```
To enable PHP, add these lines to `/etc/httpd/conf/httpd.conf`:

Place this at the end of the LoadModule list:
```
LoadModule php7_module modules/libphp7.so
AddHandler php7-script php
```
Place this at the end of the Include list:
```
Include conf/extra/php7_module.conf
```
Restart httpd.service using systemd. 
`sudo systemcrl restart httpd.service`

Create the Apache configuration file:
`/etc/httpd/conf/extra/phpmyadmin.conf`
```
Alias /phpmyadmin "/usr/share/webapps/phpMyAdmin"
<Directory "/usr/share/webapps/phpMyAdmin">
    DirectoryIndex index.php
    AllowOverride All
    Options FollowSymlinks
    Require all granted
</Directory>
```
And include it in `/etc/httpd/conf/httpd.conf` at the end of the Include list:
```
# phpMyAdmin configuration
Include conf/extra/phpmyadmin.conf
```

建立一个测试文件`test.php`
```
<?php phpinfo(); ?>
```
`php -S localhost:8000 test.php`
就可以用浏览器看 `localhost:8000`


设置随系统启动服务
```
sudo systemctl enable mysqld.service
sudo systemctl enable httpd.service 
```

* * *
# 强制安装某包
```
sudo pacman -U *.xz --force
```
不要单独更新openssl（libssl等），就算如php要求也不要单独更新，否则会让pacman和yaourt挂掉


* * *
# 安装 doxygen
```
yaourt doxygen
```


* * *
# 安装 adb tools
```
yaourt android-sdk-platform-tools
```
其实在android-sdk里就有，在platform-tools目录

`sudo gedit /etc/udev/rules.d/50-android.rules`
内容是
```
SUBSYSTEM=="usb", ENV{DEVTYPE} == "usb_device", ATTR{idVendor}=="2a45", MODE="0666"
```
`sudo udevadm control --reload`

`/opt/Android/android-sdk/tools/android update adb`
`gedit ~/.android/adb_usb.ini`
添加0x2a45



* * *
# 全盘更新
```
[andy@andy ~]$ sudo pacman -Syu
:: 正在同步软件包数据库...
 core 已经是最新版本
 extra 已经是最新版本
 community 已经是最新版本
 multilib 已经是最新版本
 archlinuxcn 已经是最新版本
:: 正在进行全面系统更新...
正在解决依赖关系...
正在查找软件包冲突...
警告：正在从目标清单中删除 'gcc-libs' ，因为它和 'gcc-libs-multilib' 冲突
警告：正在从目标清单中删除 'gcc' ，因为它和 'gcc-multilib' 冲突
错误：无法准备事务处理 (无法满足依赖关系)
:: gcc-objc: 要求 gcc=7.1.1-2
[andy@andy ~]$ pacman -Sydd --asdeps  gcc-libs
错误：非 root (根用户) 无法执行指定操作。
[andy@andy ~]$ sudo pacman -Sydd --asdeps  gcc-libs
:: 正在同步软件包数据库...
 core 已经是最新版本
 extra 已经是最新版本
 community 已经是最新版本
 multilib 已经是最新版本
 archlinuxcn 已经是最新版本
正在查找软件包冲突...
:: gcc-libs 与 gcc-libs-multilib 有冲突。删除 gcc-libs-multilib 吗？ [y/N] y

软件包 (2) gcc-libs-multilib-6.3.1-2 [删除]  gcc-libs-7.1.1-2

下载大小:   17.41 MiB
全部安装大小：  91.50 MiB
净更新大小：  13.06 MiB

:: 进行安装吗？ [Y/n] y
:: 正在获取软件包......
 gcc-libs-7.1.1-2-x86_64   17.4 MiB   605K/s 00:29 [######################] 100%
(1/1) 正在检查密钥环里的密钥                       [######################] 100%
(1/1) 正在检查软件包完整性                         [######################] 100%
(1/1) 正在加载软件包文件                           [######################] 100%
(1/1) 正在检查文件冲突                             [######################] 100%
(2/2) 正在检查可用硬盘空间                         [######################] 100%
:: 正在处理软件包的变化...
(1/1) 正在删除 gcc-libs-multilib                   [######################] 100%
(1/1) 正在安装 gcc-libs                            [######################] 100%
:: 正在运行事务后钩子函数...
(1/2) Arming ConditionNeedsUpdate...
(2/2) Updating the info directory file...
[andy@andy ~]$ sudo pacman -Sydd --asdeps  gcc
:: 正在同步软件包数据库...
 core 已经是最新版本
 extra 已经是最新版本
 community 已经是最新版本
 multilib 已经是最新版本
 archlinuxcn 已经是最新版本
正在查找软件包冲突...
:: gcc 与 gcc-multilib 有冲突。删除 gcc-multilib 吗？ [y/N] y

软件包 (2) gcc-multilib-6.3.1-2 [删除]  gcc-7.1.1-2

下载大小:    28.95 MiB
全部安装大小：  115.05 MiB
净更新大小：   -4.17 MiB

:: 进行安装吗？ [Y/n] y
:: 正在获取软件包......
 gcc-7.1.1-2-x86_64        28.9 MiB   755K/s 00:39 [######################] 100%
(1/1) 正在检查密钥环里的密钥                       [######################] 100%
(1/1) 正在检查软件包完整性                         [######################] 100%
(1/1) 正在加载软件包文件                           [######################] 100%
(1/1) 正在检查文件冲突                             [######################] 100%
(2/2) 正在检查可用硬盘空间                         [######################] 100%
:: 正在处理软件包的变化...
(1/1) 正在删除 gcc-multilib                        [######################] 100%
(1/1) 正在安装 gcc                                 [######################] 100%
:: 正在运行事务后钩子函数...
(1/2) Arming ConditionNeedsUpdate...
(2/2) Updating the info directory file...
[andy@andy ~]$ 
```

* * *
# Something
```
yaourt uget
yaourt pyuv
yaourt openh264
```


* * *
# java 环境变量设置
```
[andy@andy bin]$ java TestJava2_5 
错误: 找不到或无法加载主类 TestJava2_5
```
`sudo gedit /etc/profile`
添加 
```
export JAVA_HOME=/usr/lib/jvm/java-8-jdk/
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib:$CLASSPATH
export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH
```
或者
```
export JAVA_HOME=/usr/lib/jvm/default/
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib:$CLASSPATH
export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH
```


* * *
# 确认当前 python 版本
```
[andy@andy test_3]$ python2 -V
Python 2.7.13
[andy@andy test_3]$ python -V
Python 3.6.1
[andy@andy test_3]$ 
```

* * *
# chm 查看工具
```
kchmviewer
xchm
gnochm
chmsee
```

* * *
# shutter有关
```
错误：无法准备事务处理 (无法满足依赖关系)
:: gnome-perl：安装 perl (5.26.0-1) 将破坏依赖关系 'perl<5.25'
:: gnome-vfs-perl：安装 perl (5.26.0-1) 将破坏依赖关系 'perl<5.25'
:: gnomecanvas-perl：安装 perl (5.26.0-1) 将破坏依赖关系 'perl<5.25'
:: mysql-clients：安装 libmariadbclient (10.1.24-1) 将破坏依赖关系 'libmysqlclient'
:: perl-gnome2-wnck：安装 perl (5.26.0-1) 将破坏依赖关系 'perl<5.25'
:: perl-goo-canvas：安装 perl (5.26.0-1) 将破坏依赖关系 'perl<5.25'
:: perl-gtk2-imageview：安装 perl (5.26.0-1) 将破坏依赖关系 'perl<5.25'
:: perl-gtk2-unique：安装 perl (5.26.0-1) 将破坏依赖关系 'perl<5.25'
[andy@andy ~]$ sudo pacman -R shutter
```


以下命令很危险，半天才恢复一大部分被删除的包，不如用`sudo pacman -R perl-gtk2-imageview`等命令指定删除
留下art-sharp、gnome-vfs-sharp、libgnome-sharp、webkit-sharp等包编译报错，无法还原，目前也没有什么必要性，所以先这样吧，没有安装就没有吧
```
[andy@andy ~]$ sudo pacman -Rns $(pacman -Qtdq)
正在检查依赖关系...
:: perl-libwww可选依赖perl-lwp-protocol-https: for https:// url schemes
:: syslinux可选依赖perl-digest-sha1: For sha1pass
:: wxgtk可选依赖webkitgtk2: for webview support

软件包 (151) art-sharp-2.24.2-4  diffstat-1.61-1  gnome-mime-data-2.18.0-7
             gnome-vfs-2.24.4-10  gnome-vfs-perl-1.082-4
             gnome-vfs-sharp-2.24.2-4  gnomecanvas-perl-1.002-14
             goocanvas1-1.0.0-3  gtkimageview-1.6.4-4  hdf5-1.10.0_patch1-1
             js17-17.0.0-4  lib32-at-spi2-atk-2.24.0-1
             lib32-at-spi2-core-2.24.0-1  lib32-colord-1.3.5-1
             lib32-dconf-0.26.0-1  lib32-glib-networking-2.50.0-1
             lib32-json-glib-1.2.8-1  lib32-libcroco-0.6.11-1
             lib32-libepoxy-1.4.2-1  lib32-libgusb-0.2.9-2
             lib32-libmng-2.0.3-1  lib32-libproxy-0.4.13-1
             lib32-librsvg-2.40.16-1  lib32-libsoup-2.58.0-1
             lib32-libxkbcommon-0.7.1-1  lib32-rest-0.8.0-1
             lib32-tclkit-8.6.6-1  libakonadi-qt4-1.13.0-13
             libart-lgpl-2.3.21-3  libbonobo-2.32.1-4  libbonoboui-2.24.5-3
             libgnome-2.32.1-6  libgnome-data-2.32.1-6  libgnomecanvas-2.30.3-3
             libgnomeui-2.24.5-2  libunicodenames-1.2.0-1  libunique-1.1.6-6
             libwnck-2.31.0-1  libxkbui-1.0.2-5  libxres-1.0.7-1
             orbit2-2.14.19-3  perl-bit-vector-7.4-3
             perl-canary-stability-2012-1  perl-carp-clan-6.06-1
             perl-class-accessor-0.34-4  perl-class-data-inheritable-0.08-6
             perl-common-sense-3.74-1  perl-data-random-0.12-1
             perl-date-calc-6.4-1  perl-digest-hmac-1.03-3
             perl-digest-sha1-2.13-7  perl-file-slurp-tiny-0.004-1
             perl-gd-2.66-1  perl-html-form-6.03-2
             perl-http-response-encoding-0.06-3  perl-http-server-simple-0.51-1
             perl-io-socket-ssl-2.048-1  perl-json-2.90-1
             perl-lwp-protocol-https-6.06-2  perl-mouse-2.4.9-1
             perl-net-oauth-0.28-4  perl-net-ssleay-1.81-1
             perl-sub-uplevel-0.2800-1  perl-test-warn-0.32-1
             perl-tree-dag-node-1.29-1  perl-types-serialiser-1.0-1
             perl-xml-namespacesupport-1.12-1  perl-xml-sax-0.99-4
             perl-xml-sax-base-1.09-1  perl-xml-sax-expat-0.51-4
             perl-yaml-tiny-1.70-1  python-beaker-1.8.1-2  python-mako-1.0.6-2
             python-markupsafe-1.0-1  qjson-0.9.0-1  ucl-1.03-7
             webkitgtk2-2.4.11-6  apache-ant-1.9.7-1  asar-0.13.0-1
             autoconf2.13-2.13-4  cython-0.25.2-2  dkms-2.3-2
             fakechroot-2.19-1  ffmpeg0.10-0.10.16-2  fltk-1.3.4-1
             fontforge-20161012-4  gcc-objc-7.1.1-2  gegl-0.3.14-2
             gendesk-0.6.4-1  gnome-perl-1.045-4  go-2:1.8.3-1
             gobject-introspection-1.52.1-1  gulp-3.9.1-2
             hardening-wrapper-10-1  icoutils-0.31.3-1  imake-1.0.7-1
             kdepimlibs4-4.14.10-11  kyotocabinet-1.2.76-5  l-smash-2.9.1-1
             lib32-db-5.3.28-3  lib32-fakeroot-1.21-1  lib32-gtk3-3.22.15-1
             lib32-jansson-2.10-1  lib32-js17-17.0.0-6  lib32-json-c-0.12.1-1
             lib32-pangox-compat-0.0.2-2  lib32-qt4-4.8.7-6
             libgnome-sharp-2.24.2-4  libirman-0.5.2-1
             libkactivities4-4.13.3-3  libkcddb4-16.08.3-1  libmediaart-1.9.1-1
             librpcsecgss-0.19-8  libwnck3-3.20.1-2  lua-expat-1.3.0-3
             nasm-2.13.01-1  netcdf-4.4.1-2  perl-archive-zip-1.59-1
             perl-file-copy-recursive-0.38-1  perl-file-which-1.21-1
             perl-gnome2-wnck-0.16-11  perl-goo-canvas-0.06-7
             perl-gtk2-imageview-0.05-7  perl-gtk2-unique-0.05-13
             perl-image-exiftool-10.50-1  perl-json-xs-3.03-1
             perl-mozilla-ca-20160104-1  perl-net-dropbox-api-1.9-3
             perl-path-class-0.37-1  perl-proc-processtable-0.53-2
             perl-proc-simple-1.32-1  perl-sort-naturally-1.03-1
             perl-www-mechanize-1.84-1  perl-xml-simple-2.24-1  pth-2.0.7-5
             python-pyasn1-0.2.3-1  python2-crypto-2.6.1-5
             python2-pyasn1-0.2.3-1  qca-qt4-2.1.3-4  qtwebkit-2.3.4-4
             quilt-0.65-1  sdx-20080224-4  strigi-0.7.8-9  tor-0.3.0.7-1
             upx-3.94-1  vala-0.36.3-1  webkit-sharp-0.3-5  webkitgtk-2.4.11-6
             wxgtk2.8-2.8.12.1-4  xmltoman-0.4-2  yasm-1.3.0-1

全部移去体积：  741.87 MiB

:: 打算删除这些软件包吗？ [Y/n] y
:: 正在运行事务前钩子函数...
(1/2) Uninstalling GConf schemas...
(2/2) Removing old entries from the info directory file...
:: 正在处理软件包的变化...
(  1/151) 正在删除 yasm                            [######################] 100%
(  2/151) 正在删除 xmltoman                        [######################] 100%
(  3/151) 正在删除 wxgtk2.8                        [######################] 100%
(  4/151) 正在删除 webkitgtk                       [######################] 100%
(  5/151) 正在删除 webkit-sharp                    [######################] 100%
(  6/151) 正在删除 webkitgtk2                      [######################] 100%
(  7/151) 正在删除 vala                            [######################] 100%
(  8/151) 正在删除 upx                             [######################] 100%
(  9/151) 正在删除 ucl                             [######################] 100%
( 10/151) 正在删除 tor                             [######################] 100%
( 11/151) 正在删除 strigi                          [######################] 100%
( 12/151) 正在删除 sdx                             [######################] 100%
( 13/151) 正在删除 lib32-tclkit                    [######################] 100%
( 14/151) 正在删除 quilt                           [######################] 100%
( 15/151) 正在删除 diffstat                        [######################] 100%
( 16/151) 正在删除 qtwebkit                        [######################] 100%
( 17/151) 正在删除 qca-qt4                         [######################] 100%
( 18/151) 正在删除 python2-pyasn1                  [######################] 100%
( 19/151) 正在删除 python2-crypto                  [######################] 100%
( 20/151) 正在删除 python-pyasn1                   [######################] 100%
( 21/151) 正在删除 pth                             [######################] 100%
( 22/151) 正在删除 perl-xml-simple                 [######################] 100%
( 23/151) 正在删除 perl-xml-sax-expat              [######################] 100%
( 24/151) 正在删除 perl-xml-sax                    [######################] 100%
( 25/151) 正在删除 perl-xml-sax-base               [######################] 100%
( 26/151) 正在删除 perl-xml-namespacesupport       [######################] 100%
( 27/151) 正在删除 perl-www-mechanize              [######################] 100%
( 28/151) 正在删除 perl-test-warn                  [######################] 100%
( 29/151) 正在删除 perl-tree-dag-node              [######################] 100%
( 30/151) 正在删除 perl-sub-uplevel                [######################] 100%
( 31/151) 正在删除 perl-http-server-simple         [######################] 100%
( 32/151) 正在删除 perl-http-response-encoding     [######################] 100%
( 33/151) 正在删除 perl-html-form                  [######################] 100%
( 34/151) 正在删除 perl-sort-naturally             [######################] 100%
( 35/151) 正在删除 perl-proc-simple                [######################] 100%
( 36/151) 正在删除 perl-proc-processtable          [######################] 100%
( 37/151) 正在删除 perl-path-class                 [######################] 100%
( 38/151) 正在删除 perl-net-dropbox-api            [######################] 100%
( 39/151) 正在删除 perl-net-oauth                  [######################] 100%
( 40/151) 正在删除 perl-file-slurp-tiny            [######################] 100%
( 41/151) 正在删除 perl-digest-hmac                [######################] 100%
( 42/151) 正在删除 perl-digest-sha1                [######################] 100%
( 43/151) 正在删除 perl-class-data-inheritable     [######################] 100%
( 44/151) 正在删除 perl-class-accessor             [######################] 100%
( 45/151) 正在删除 perl-mouse                      [######################] 100%
( 46/151) 正在删除 perl-lwp-protocol-https         [######################] 100%
( 47/151) 正在删除 perl-io-socket-ssl              [######################] 100%
( 48/151) 正在删除 perl-net-ssleay                 [######################] 100%
( 49/151) 正在删除 perl-json                       [######################] 100%
( 50/151) 正在删除 perl-data-random                [######################] 100%
( 51/151) 正在删除 perl-yaml-tiny                  [######################] 100%
( 52/151) 正在删除 perl-gd                         [######################] 100%
( 53/151) 正在删除 perl-date-calc                  [######################] 100%
( 54/151) 正在删除 perl-bit-vector                 [######################] 100%
( 55/151) 正在删除 perl-carp-clan                  [######################] 100%
( 56/151) 正在删除 perl-mozilla-ca                 [######################] 100%
( 57/151) 正在删除 perl-json-xs                    [######################] 100%
( 58/151) 正在删除 perl-types-serialiser           [######################] 100%
( 59/151) 正在删除 perl-common-sense               [######################] 100%
( 60/151) 正在删除 perl-canary-stability           [######################] 100%
( 61/151) 正在删除 perl-image-exiftool             [######################] 100%
( 62/151) 正在删除 perl-gtk2-unique                [######################] 100%
( 63/151) 正在删除 libunique                       [######################] 100%
( 64/151) 正在删除 perl-gtk2-imageview             [######################] 100%
( 65/151) 正在删除 gtkimageview                    [######################] 100%
( 66/151) 正在删除 perl-goo-canvas                 [######################] 100%
( 67/151) 正在删除 goocanvas1                      [######################] 100%
( 68/151) 正在删除 perl-gnome2-wnck                [######################] 100%
( 69/151) 正在删除 libwnck                         [######################] 100%
( 70/151) 正在删除 perl-file-which                 [######################] 100%
( 71/151) 正在删除 perl-file-copy-recursive        [######################] 100%
( 72/151) 正在删除 perl-archive-zip                [######################] 100%
( 73/151) 正在删除 netcdf                          [######################] 100%
( 74/151) 正在删除 hdf5                            [######################] 100%
( 75/151) 正在删除 nasm                            [######################] 100%
( 76/151) 正在删除 lua-expat                       [######################] 100%
( 77/151) 正在删除 libwnck3                        [######################] 100%
( 78/151) 正在删除 libxres                         [######################] 100%
( 79/151) 正在删除 librpcsecgss                    [######################] 100%
( 80/151) 正在删除 libmediaart                     [######################] 100%
( 81/151) 正在删除 libkcddb4                       [######################] 100%
( 82/151) 正在删除 libkactivities4                 [######################] 100%
( 83/151) 正在删除 libirman                        [######################] 100%
( 84/151) 正在删除 libgnome-sharp                  [######################] 100%
( 85/151) 正在删除 gnome-vfs-sharp                 [######################] 100%
( 86/151) 正在删除 art-sharp                       [######################] 100%
( 87/151) 正在删除 lib32-qt4                       [######################] 100%
( 88/151) 正在删除 lib32-libmng                    [######################] 100%
( 89/151) 正在删除 lib32-pangox-compat             [######################] 100%
( 90/151) 正在删除 lib32-json-c                    [######################] 100%
( 91/151) 正在删除 lib32-js17                      [######################] 100%
( 92/151) 正在删除 js17                            [######################] 100%
( 93/151) 正在删除 lib32-jansson                   [######################] 100%
( 94/151) 正在删除 lib32-gtk3                      [######################] 100%
( 95/151) 正在删除 lib32-rest                      [######################] 100%
( 96/151) 正在删除 lib32-libsoup                   [######################] 100%
( 97/151) 正在删除 lib32-glib-networking           [######################] 100%
( 98/151) 正在删除 lib32-libproxy                  [######################] 100%
( 99/151) 正在删除 lib32-libxkbcommon              [######################] 100%
(100/151) 正在删除 lib32-librsvg                   [######################] 100%
(101/151) 正在删除 lib32-libcroco                  [######################] 100%
(102/151) 正在删除 lib32-libepoxy                  [######################] 100%
(103/151) 正在删除 lib32-json-glib                 [######################] 100%
(104/151) 正在删除 lib32-colord                    [######################] 100%
(105/151) 正在删除 lib32-libgusb                   [######################] 100%
(106/151) 正在删除 lib32-dconf                     [######################] 100%
(107/151) 正在删除 lib32-at-spi2-atk               [######################] 100%
(108/151) 正在删除 lib32-at-spi2-core              [######################] 100%
(109/151) 正在删除 lib32-fakeroot                  [######################] 100%
(110/151) 正在删除 lib32-db                        [######################] 100%
(111/151) 正在删除 l-smash                         [######################] 100%
(112/151) 正在删除 kyotocabinet                    [######################] 100%
(113/151) 正在删除 kdepimlibs4                     [######################] 100%
(114/151) 正在删除 qjson                           [######################] 100%
(115/151) 正在删除 libakonadi-qt4                  [######################] 100%
(116/151) 正在删除 imake                           [######################] 100%
(117/151) 正在删除 icoutils                        [######################] 100%
(118/151) 正在删除 hardening-wrapper               [######################] 100%
(119/151) 正在删除 gulp                            [######################] 100%
(120/151) 正在删除 gobject-introspection           [######################] 100%
(121/151) 正在删除 python-mako                     [######################] 100%
(122/151) 正在删除 python-markupsafe               [######################] 100%
(123/151) 正在删除 python-beaker                   [######################] 100%
(124/151) 正在删除 go                              [######################] 100%
(125/151) 正在删除 gnome-perl                      [######################] 100%
(126/151) 正在删除 libgnomeui                      [######################] 100%
(127/151) 正在删除 libbonoboui                     [######################] 100%
(128/151) 正在删除 libgnome                        [######################] 100%
(129/151) 正在删除 libgnome-data                   [######################] 100%
(130/151) 正在删除 libbonobo                       [######################] 100%
(131/151) 正在删除 orbit2                          [######################] 100%
(132/151) 正在删除 gnomecanvas-perl                [######################] 100%
(133/151) 正在删除 libgnomecanvas                  [######################] 100%
(134/151) 正在删除 libart-lgpl                     [######################] 100%
(135/151) 正在删除 gnome-vfs-perl                  [######################] 100%
(136/151) 正在删除 gnome-vfs                       [######################] 100%
(137/151) 正在删除 gnome-mime-data                 [######################] 100%
(138/151) 正在删除 gendesk                         [######################] 100%
(139/151) 正在删除 gegl                            [######################] 100%
(140/151) 正在删除 gcc-objc                        [######################] 100%
(141/151) 正在删除 fontforge                       [######################] 100%
(142/151) 正在删除 libxkbui                        [######################] 100%
(143/151) 正在删除 libunicodenames                 [######################] 100%
(144/151) 正在删除 fltk                            [######################] 100%
(145/151) 正在删除 ffmpeg0.10                      [######################] 100%
(146/151) 正在删除 fakechroot                      [######################] 100%
(147/151) 正在删除 dkms                            [######################] 100%
(148/151) 正在删除 cython                          [######################] 100%
(149/151) 正在删除 autoconf2.13                    [######################] 100%
(150/151) 正在删除 asar                            [######################] 100%
(151/151) 正在删除 apache-ant                      [######################] 100%
:: 正在运行事务后钩子函数...
(1/6) Probing GDK-Pixbuf loader lib32 modules...
(2/6) Updating GIO module cache...
(3/6) Updating icon theme caches...
(4/6) Arming ConditionNeedsUpdate...
(5/6) Updating the desktop file MIME type cache...
(6/6) Updating the MIME type database...
Unknown media type in type 'all/all'
Unknown media type in type 'all/allfiles'
```


* * *
# mysql等 重安装
```
[andy@andy ~]$ sudo pacman -R mysql-clients mysql phpmyadmin
正在检查依赖关系...

软件包 (3) mysql-5.7.18-1  mysql-clients-5.7.18-1  phpmyadmin-4.7.1-1

全部移去体积：  199.98 MiB

:: 打算删除这些软件包吗？ [Y/n] y
:: 正在处理软件包的变化...
(1/3) 正在删除 phpmyadmin                          [######################] 100%
(2/3) 正在删除 mysql                               [######################] 100%
userdel: user mysql is currently used by process 439
groupdel：不能移除用户“mysql”的主组
错误：命令未能被正确执行
(3/3) 正在删除 mysql-clients                       [######################] 100%
:: 正在运行事务后钩子函数...
(1/1) Arming ConditionNeedsUpdate...
...
(31/31) 正在检查密钥环里的密钥                     [######################] 100%
正在下载所需的密钥......
错误：key "F9F9FA97A403F63E" could not be looked up remotely
错误：所需的密钥从密钥环中丢失
错误：无法提交处理 (未预期的错误)
发生错误，没有软件包被更新。
```

`$ sudo leafpad /etc/pacman.conf`
```
[archlinuxcn]
SigLevel = Optional TrustAll
```

`$ sudo pacman -S archlinuxcn-keyring`

```
[andy@andy ~]$ sudo pacman -S mysql mysql-clients  phpmyadmin
:: 有 2 个软件包可提供 mysql ：
:: 软件库 extra
   1) mariadb
:: 软件库 community
   2) percona-server

输入某个数字 ( 默认=1 ): 
:: 有 2 个软件包可提供 mysql-clients ：
:: 软件库 extra
   1) mariadb-clients
:: 软件库 community
   2) percona-server-clients

输入某个数字 ( 默认=1 ): 
正在解决依赖关系...
正在查找软件包冲突...

软件包 (3) mariadb-10.1.24-1  mariadb-clients-10.1.24-1  phpmyadmin-4.7.1-1

下载大小:    27.09 MiB
全部安装大小：  237.53 MiB

:: 进行安装吗？ [Y/n] 
:: 正在获取软件包......
 mariadb-clients-10....  1397.5 KiB  1152K/s 00:01 [######################] 100%
 mariadb-10.1.24-1-x...    25.7 MiB  1593K/s 00:17 [######################] 100%
(3/3) 正在检查密钥环里的密钥                       [######################] 100%
(3/3) 正在检查软件包完整性                         [######################] 100%
(3/3) 正在加载软件包文件                           [######################] 100%
(3/3) 正在检查文件冲突                             [######################] 100%
(3/3) 正在检查可用硬盘空间                         [######################] 100%
:: 正在处理软件包的变化...
(1/3) 正在安装 mariadb-clients                     [######################] 100%
(2/3) 正在安装 mariadb                             [######################] 100%
:: You need to initialize the MariaDB data directory prior to starting
   the service. This can be done with mysql_install_db command, e.g.:
   mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
mariadb 的可选依赖
    perl-dbd-mysql: for mysqlhotcopy, mysql_convert_table_format and
    mysql_setpermission
(3/3) 正在安装 phpmyadmin                          [######################] 100%
:: 正在运行事务后钩子函数...
(1/3) Updating system user accounts...
(2/3) Creating temporary files...
(3/3) Arming ConditionNeedsUpdate...
```

* * *
# 升级gcc-libs之后启动allegro报错的处理

`[andy@andy allegro_166_patch]$ pacman -Qo /lib/libstdc++.so.6`
```
/usr/lib/libstdc++.so.6 属于 gcc-libs 7.1.1-2
```
`[andy@andy ~]$ ls /usr/lib32/libstdc++.so.6 -l`
```
lrwxrwxrwx 1 root root 19 6月  11 15:03 /usr/lib32/libstdc++.so.6 -> libstdc++.so.6.0.23
```
`[andy@andy lib32]$ ls /usr/lib32/libstdc++.so.6`
```
libstdc++.so.6       libstdc++.so.6.0.23 
```

`$ sudo rm /usr/lib32/libstdc++.so.6`
`$ sudo ln -s /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu/libstdc++.so.6.0.21 /usr/lib32/libstdc++.so.6`
`$ locate libstdc++.so.6 | grep 32`
`$ ldd /opt/cadence/SPB166/tools/pcb/bin/allegro.exe | grep stdc`
```
        libstdc++.so.6 => /usr/lib32/libstdc++.so.6 (0xf717b000)
```
`[andy@andy ~]$ ls /usr/lib32/libstdc++.so.6 -l`
```
lrwxrwxrwx 1 root root 103 6月  11 15:12 libstdc++.so.6 -> /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu/libstdc++.so.6.0.21
```
恢复原始的lib链接
在配置文件`/etc/ld.so.conf`等文件的路径保持最初状态
`sudo ldconfig`
就恢复了


更好的办法,通过环境变量`LD_LIBRARY_PATH`指定动态库搜索路径
`$ LD_LIBRARY_PATH=/home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu/ ldd /opt/cadence/SPB166/tools/pcb/bin/allegro.exe | grep stdc`
```
[andy@andy ~]$ ldd /opt/cadence/SPB166/tools/pcb/bin/allegro.exe | grep stdc
	libstdc++.so.6 => /usr/lib32/libstdc++.so.6 (0xf70ce000)
```
```
[andy@andy ~]$ LD_LIBRARY_PATH=/home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu/ ldd /opt/cadence/SPB166/tools/pcb/bin/allegro.exe | grep stdc
	libstdc++.so.6 => /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu/libstdc++.so.6 (0xf71e1000)
[andy@andy ~]$ ldd /opt/cadence/SPB166/tools/pcb/bin/allegro.exe | grep stdc	libstdc++.so.6 => /usr/lib32/libstdc++.so.6 (0xf7163000)
[andy@andy ~]$ LD_LIBRARY_PATH=/home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu/
[andy@andy ~]$ ldd /opt/cadence/SPB166/tools/pcb/bin/allegro.exe | grep stdc	libstdc++.so.6 => /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu/libstdc++.so.6 (0xf7224000)
```

最终定案
`cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu/libstdc++.so.6.0.21 /opt/cadence/SPB166/tools.lnx86/lib/libstdc++.so.6`
修改spb166里的环境变量`LD_LIBRARY_PATH`
```
export LD_LIBRARY_PATH=$CDS_ROOT/tools/lib64:$CDS_ROOT/tools.lnx86/mainwin540_64/mw/lib-amd64_linux_optimized:$CDS_ROOT/tools.lnx86/lib:$CDS_ROOT/tools.lnx86/mainwin540/mw/lib-linux_optimized:/usr/lib32/:/usr/lib/:/usr/lib64:$LD_LIBRARY_PATH
```
就可以脱离系统库依赖了

反正ldd看可执行文件，缺啥库，弄进来，环境变量顺序一设置，就不依赖系统库了

```
[andy@andy ~]$ ldd /opt/cadence/SPB166/tools/pcb/bin/allegro.exe | grep stdc
	libstdc++.so.6 => /usr/lib32/libstdc++.so.6 (0xf712f000)
[andy@andy ~]$ cd /opt/cadence/allegro_166_patch/
[andy@andy allegro_166_patch]$ source spb166 
[andy@andy allegro_166_patch]$ ldd /opt/cadence/SPB166/tools/pcb/bin/allegro.exe | grep stdc
	libstdc++.so.6 => /opt/cadence/SPB166/tools.lnx86/lib/libstdc++.so.6 (0xf3ed4000)
```


* * *
# monodevelop
```
$ yaourt monodevelop
$ ilasm --version 
Mono ILasm compiler version 5.0.0.0
$ dmcs  --version
Note: dmcs is deprecated, please use mcs instead!
Mono C# compiler version 5.0.0.0
$ mcs  --version
Mono C# compiler version 5.0.0.0
$ mono --version
```



* * *
# sublime
```
$ yaourt sublime-text-imfix
```

* * *
# jlink
```
$ yaourt jlink
```

* * *
# pacman的几个常用命令
```
pacman -S package_name #安装软件包
pacman -R package_name #删除软件包
pacman -Rdd package_name #删除软件包不检查依赖关系
pacman -Rs package_name #顺便删除软件包相关依赖
pacman -Syu #升级系统中的所有包
pacman -Ss package #查询软件包
pacman -Qs package #查询已安装的包
pacman -Qi package #显示查找的包的信息
pacman -Ql package #显示你要找的包的文件都安装的位置
pacman -Sw package #下载但不安装包
pacman -U /path/package.pkg.tar.gz #安装本地包
pacman -Scc #清理包缓存，下载的包会在/var/cache 这个目录
pacman -Sf pacman #重新安装包
pacman -Qo /usr/lib/*** #查询库文件所属于的软件包
```
其实要容易记的话可以自己在bashrc里配置一下alias就好。

* * *
# pacman 下载的加速
再说说包下载的提速。。。
修改一下`/etc/pacman.conf`，把下面这句的注释去掉：
``
XferCommand = /usr/bin/wget -c --passive-ftp -c %u
``
这样就可以使用wget来下载包。当然你也可以尝试powerpill来提高下载速度，因为这个确实不错！

也可以用aria2，在配置文件中加上这句：
```
XferCommand = /usr/bin/aria2c -s 4 -m 2 -d / -o %o %u
```
-s后面是连接的服务器数量，-m是线程数。


* * *
# 开启所有tty
```
for i in {1..7};do echo -n "tty$i is ";systemctl is-enabled getty@tty$i; done
systemctl is-enabled getty@tty3

sudo systemctl enable getty@tty1
sudo systemctl enable getty@tty2
sudo systemctl enable getty@tty3
sudo systemctl enable getty@tty4
sudo systemctl enable getty@tty5
sudo systemctl enable getty@tty6 
sudo systemctl enable getty@tty7

sudo systemctl start getty@tty3
or
sudo systemctl enable --now getty@tty3


[andy@andy ~]$ whoami
andy
[andy@andy ~]$ ps $(pgrep Xorg)
  PID TTY      STAT   TIME COMMAND
  472 tty1     Ssl+   0:51 /usr/lib/xorg-server/Xorg -background none :0 vt01 -nolisten tcp -novtswitch -auth /var/run/lxdm/lxdm-:0.auth

$ tty
/dev/pts/0

It's easy to script this or to include it in the prompt, example:

$ PS1='`tty`: '
/dev/pts/0: _
```

* * *
# 查看当前登录管理器
<https://wiki.archlinux.org/index.php/Display_manager>
```
$ ls -l /etc/systemd/system/display-manager.service
lrwxrwxrwx 1 root root 36 3月  29 2015 /etc/systemd/system/display-manager.service -> /usr/lib/systemd/system/lxdm.service
```
The configuration files for LXDM are all located in 
`/etc/lxdm/`
可执行文件在
`/usr/lib/lxdm/`

查看默认的运行级别配置
```
$ ls -l /lib/systemd/system/default.target
lrwxrwxrwx 1 root root 16 1月  29 06:32 /lib/systemd/system/default.target -> graphical.target
```
这是登陆器的桌面候选
`$ ls /usr/share/xsessions/`
更换登录管理器，比如slim
`# systemctl enable slim.service`
display manager有
`kdm, gdm, lightdm, lxdm, wdm, xdm, slim, nodm, ldm`


<https://wiki.archlinux.org/index.php/Systemd#Change_default_target_to_boot_into>
初始化运行级别配置
`# systemctl set-default multi-user.target`
修改运行级别配置
`# systemctl set-default -f multi-user.target`
实际上作用就是
`$ sudo ln -s /lib/systemd/system/multi-user.target default.target`
这样可以实现xstart登录，默认不开启X界面（# 字符界面启动 #）
```
[andy@andy ~]$ sudo systemctl set-default multi-user.target
[sudo] andy 的密码：
Created symlink /etc/systemd/system/default.target → /usr/lib/systemd/system/multi-user.target.
```


* * *
# totem 播放器
```
$ sudo pacman -S totem grilo-plugins
```


* * *
# fcitx调试信息
```
$ fcitx-diagnose
```

* * *
# x自带屏保
`xset q`
十秒黑屏
`xset s 10 600`


* * *
# amule有关
```
If you plan to use external client (e.g. amuleGUI or amuleweb) then you need to
provide [ExternalConnect] configuration.
You also need to specify amuleweb password.
Please follow https://wiki.archlinux.org/index.php/AMule for more information.
amuleweb can be started as 'systemctl start amuleweb'.
```


* * *
# 亚全局 proxy

在 Unix 和 GNU/Linux 中，大多 HTTP 应用程序均支持调用环境变量 http_proxy 和 https_proxy 进行代理。此外该环境变量的大小写其实并没有统一标准，有个别程序就只支持全大写的环境变量。所以为方便起见，直接在 ~/.bash_profile 或 ~/.zshenv 添加以下即可： 
`export http_proxy=http://127.0.0.1:8087/`
`export https_proxy=$http_proxy`
`export HTTP_PROXY=$http_proxy`
`export HTTPS_PROXY=$HTTP_PROXY`

再执行以下命令，导入证书以archlinux为例：
```
sudo ln -s /opt/XX-Net/data/gae_proxy/CA.crt  /etc/ca-certificates/trust-source/anchors/GoAgent.crt
sudo trust extract-compat
```

* * *
# 发现一个衍生版
CTKArch


* * *
# 切换中文目录为英文目录
使用命令来转换中文目录为英文目录，即/home中的“桌面”、“下载”等等转换成“Desktop”、“Downloads”等等。
```
export LANG=en_US
xdg-user-dirs-update
选 update
export LANG=zh_CN.UTF-8
xdg-user-dirs-update
选“不要再提醒”和“保持原来的名称”
```
arch无效， 直接修改`～/.config/user-dirs.dirs`
```
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
$ mkdir Desktop Downloads Templates Public Documents Music Pictures Videos
$ rm -rf 公共  视频  文档  音乐 模板  图片  下载  桌面
```


* * *
# 批量配置文件
```
openbox
tint2
obmenu-generator
dmenu
conky
bin目录中的doc
xinitrc目录中的
vim
firefox
```
bookmarks现在在这，之前在`/home/andy_old/.config/gtk-3.0
.gtk-bookmarks`
```
file:///home/andy/Documents Documents
file:///home/andy/Downloads Downloads
file:/// /
file:///var/cache/pacman/pkg pkg
file:///home/andy/.wine/drive_c wine_drive_c
file:///home/andy/.config config
file:///mnt/win_e win_e
file:///mnt/win_e/boot/arch_doc doc
file:///home/andy/%E6%88%91%E7%9A%84%E5%9D%9A%E6%9E%9C%E4%BA%91 我的坚果云
```

* * *
# fcitx 重配置
`ps -elf |grep fcitx`
直接吧`~/.config/fcitx`目录删掉
对比了一下两次`fcitx-diagnose`的结果
```
pidof fcitx
pkill fcitx
```

```
$ yaourt fcitx-git
1 archlinuxcn/fcitx-lilydjwg-git 2:4.2.9.1.20170518-1
    A Flexible Input Method Framework. With Lua support
==> 输入 n° 以安装需要的软件包（例如：1 2 3 或者是 1-3）
==> ---------------------------------
==> 1

[sudo] andy 的密码：
正在解决依赖关系...
正在查找软件包冲突...
:: fcitx-lilydjwg-git 与 fcitx 有冲突。删除 fcitx 吗？ [y/N] y
:: fcitx-lilydjwg-git 与 fcitx-qt4 有冲突 (fcitx-qt)。删除 fcitx-qt4 吗？ [y/N] y
:: fcitx-lilydjwg-git 与 fcitx-gtk2 有冲突。删除 fcitx-gtk2 吗？ [y/N] y
:: fcitx-lilydjwg-git 与 fcitx-gtk3 有冲突。删除 fcitx-gtk3 吗？ [y/N] y

软件包 (5) fcitx-4.2.9.1-2 [删除]  fcitx-gtk2-4.2.9.1-2 [删除]
           fcitx-gtk3-4.2.9.1-2 [删除]  fcitx-qt4-4.2.9.1-2 [删除]
           fcitx-lilydjwg-git-2:4.2.9.1.20170518-1

下载大小:    7.10 MiB
全部安装大小：  34.71 MiB
净更新大小：  -0.40 MiB
```

`$ yaourt -S fcitx fcitx-gtk2 fcitx-gtk3 fcitx-qt4 fcitx-qt5`

`~/.xprofile`或`/etc/environment`中加入：
```
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```
//非桌面环境 里的环境变量改成如下的值：
```
 export GTK_IM_MODULE=xim
 export QT_IM_MODULE=xim
```


* * *
# 降级firefox
```
$ yaourt downgrader
$ downgrader -h firefox
```


* * *
# qtqr 排错(truetype库)
```
$ qtqr
Traceback (most recent call last):
  File "/usr/bin/qtqr", line 14, in <module>
    from PyQt4 import QtCore, QtGui, QtNetwork
ImportError: /usr/lib/libharfbuzz.so.0: undefined symbol: FT_Get_Var_Blend_Coordinates

//可以不删除的
$ sudo pacman -R harfbuzz
正在检查依赖关系...
错误：无法准备事务处理 (无法满足依赖关系)
:: freetype2：移除 harfbuzz 将破坏依赖关系 'harfbuzz'
:: harfbuzz-icu：移除 harfbuzz 将破坏依赖关系 'harfbuzz'
:: lib32-harfbuzz：移除 harfbuzz 将破坏依赖关系 'harfbuzz'
:: libx32-harfbuzz：移除 harfbuzz 将破坏依赖关系 'harfbuzz'
:: pango：移除 harfbuzz 将破坏依赖关系 'harfbuzz'


$ sudo pacman -R harfbuzz
$ sudo pacman -S harfbuzz
$ nm -D /lib64/libharfbuzz.so.0 | grep FT_Get
$ nm -D /usr/lib/libharfbuzz.so.0 | grep FT_Get
                 U FT_Get_Advance
                 U FT_Get_Char_Index
                 U FT_Get_Glyph_Name
                 U FT_Get_Kerning
                 U FT_Get_MM_Var
                 U FT_Get_Name_Index
                 U FT_Get_Var_Blend_Coordinates

```
有啊
```
$ cat /home/andy/.local/share/xorg/Xorg.0.log | grep FT_Get
```
没有错啊

不需要
```
$ yaout freetype2-git
```

/home/andy目录备份，新建andy目录改好chown，发现qtqr可以运行呢

逐步查找，定位在`～/.bashrc`的`export LD_LIBRARY_PATH`行，去掉就可以运行了，看来这个库出问题了

再看看具体是啥玩意造成的呢
`/opt/modelsim/modeltech/lib`
这里有`libfreetype.so`

去掉`LD_LIBRARY_PATH`变量中的`/opt/modelsim/modeltech/lib:`至少能用qtqr了嘛


## 终极解决办法：
`/opt/modelsim/modeltech/lib`里面的freetype库和软链接都删掉，更新为系统自带的也行
这样`～/.bashrc`还是要改

<http://bbs.eeworld.com.cn/thread-455341-1-1.html>
用`freetype2-2.5.0.1-1-x86_64.pkg.tar.xz`里面的truetype，替换`/opt/modelsim/modeltech/lib`里面的

这样由于modelsim里truetype库问题引起的故障排除，vsim终于可以用了，qtqr等也没有影响了


明白了，但是多次重启fcitx造成Xorg假死还是无解

通过类似的方法试试能不能治好fcitx的问题呢，即就没有.bashrc呢
次重启fcitx造成Xorg假死还是无解

* * *
# /home/andy备份
`backup_home_170622.tar.xz`


* * *
# 处理wine winrar启动不了的问题
新建一个/home/andy目录

发现wine winrar是可以启动的，那么配置肯定出问题了，定位哪里出问题了

winecfg的函数库第三项，comctl32被删除之后就可以了。其实选内建先于原装也可以解决这个问题。

但是，这样的话启动其他比如winecfg都会弹出一个报错窗口，但是可以继续运行，觉得很讨厌吧

于是，可以对winrar单独进行一个设置，这样就可以兼顾了。

看来处理wine问题，先配置一个函数库没有任何改造的运行配置就可以了，没有必要去动全局


* * *
# qtchooser qtcreator
`$ yaourt qtchooser`
与qt5-base、qt5-declarative、qt5-tools、qt5-xmlpatterns、冲突，
`qtchooser`无效了，用`qmake-qt4`

下面这个玩意影响qtcreator使用
```
$ sudo pacman -Rdd hardening-wrapper
```

* * *
# something
```
yaourt libbs2b projectm mpc
```

* * *
# 20171118日更新后 确认phpmyadmin不能使用
处理 phpmyadmin 运行错误

先检查apache，ok的

检查php的test页，ok的

再检查mysql，失效了，不能运行

根据提示查找到
<https://dev.mysql.com/doc/refman/5.6/en/error-creating-innodb.html>

```
sudo rm /var/lib/mysql -rf
重新安装
sudo pacman -S mysql
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mysqld

/usr/bin/mysqladmin -u root password
```

ok



* * *
# ALA 过期的软件包到这里找
<https://archive.archlinux.org/packages>
<https://archive.archlinux.org>
<https://wiki.archlinux.org/index.php/Arch_Linux_Archive>


* * *
# 备份arch_root_only_20171119还原之后

首先，发现apache服务还是没有自动启动，设置自启动
`sudo systemctl enable httpd.service`
没有效果？/usr/lib/systemd/system/下确实有啊
`systemctl status httpd`
发现有错误了，因为挂载点权限每次启动都还原掉的，
换成根目录是/run/media也不行，/run是一个内存文件系统，启动服务的时候还没有这货
所以，u盘挂载点udev设置不改，就每次手动启动httpd

修改挂载点会怎么样呢? ok
<https://wiki.archlinux.org/index.php/Udisks#Mount_to_.2Fmedia_.28udisks2.29>
```
By default, udisks2 mounts removable drives under the ACL controlled directory /run/media/$USER/. 
If you wish to mount to /media instead, use this rule:

/etc/udev/rules.d/99-udisks2.rules

# UDISKS_FILESYSTEM_SHARED
# ==1: mount filesystem to a shared directory (/media/VolumeName)
# ==0: mount filesystem to a private directory (/run/media/$USER/VolumeName)
# See udisks(8)
ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{UDISKS_FILESYSTEM_SHARED}="1"
```

修改web根目录
`sudo gedit /etc/httpd/conf/httpd.conf`
```
DocumentRoot "/media/"
AddDefaultCharset UTF-8
DefaultLanguage zh-CN
<Directory "/media/">
```
浏览器显示乱码，
`sudo gedit /etc/httpd/conf/httpd.conf`
关闭charset也不行啊
```
#AddDefaultCharset UTF-8
#AddDefaultCharset GB2312
AddDefaultCharset off
```
终极解决方式：最后面添加
```
IndexOptions Charset=UTF-8
```

~~每次启动挂载点权限还原了~~
~~`/run/media`权限设置一下，最好是644或755，确保个人使用才能是777~~


* * *
# ipv6 xxnet miredo
<https://github.com/XX-net/XX-Net/wiki/IPv6-Linux>
`$ yaourt  miredo`

测试：<http://test-ipv6.com/>
`ifconfig`
在结果中应该能看见一个叫 teredo 的虚拟网卡

重启系统之后，需要重新开启miredo
`sudo miredo`


* * *
# Linux 手动处理用户级别证书

创建文件夹
```
mkdir -p ~/.pki/nssdb

Create a new certificate database
certutil -d $HOME/.pki/nssdb -N
```
手动导入证书到数据库
```
certutil -d sql:$HOME/.pki/nssdb -A -t "C,," -n "GoAgent XX-Net - GoAgent" -i /opt/XX-Net/data/gae_proxy/CA.crt
certutil -d sql:$HOME/.pki/nssdb -A -t TC -n "goagent" -i /opt/XX-Net/data/gae_proxy/CA.crt
certutil -d sql:${HOME}/.pki/nssdb -A -t TC -n "goagent" -i /opt/XX-Net/data/gae_proxy/CA.crt
```
若失败,可尝试更改证书数据库密码,可改为空
```
modutil -changepw "NSS Certificate DB" -dbdir ~/.pki/nssdb
modutil -changepw "NSS Certificate DB" -dbdir $HOME/.pki/nssdb
```
查看证书:??
```
certutil -L -d sql:~/.pki/nssdb #用～不行，SEC_ERROR_BAD_DATABASE，必须下面这样写
certutil -L -d sql:${HOME}/.pki/nssdb
```
ref：
`certutil -L`
The certificate/key database is in an old, unsupported format
<https://stackoverflow.com/questions/27666517/certutil-function-failed-sec-error-legacy-database-the-certificate-key-databa>
The database has migrated over the years from flat files to Berkeley DB to now SQLite in 3.12. Prefix the directory name with sql and enclose in quotes to get around spaces: 
`certutil -L -d sql:${HOME}/.pki/nssdb`
For reference, here's the Mozilla NSS roadmap.
<http://wiki.mozilla.org/NSS:Roadmap#SQLite-Based_Shareable_Certificate_and_Key_Databases>


若要删除证书:
```
certutil -d sql:~/.pki/nssdb -D -n "GoAgent XX-Net - GoAgent"
实际是
certutil -d sql:${HOME}/.pki/nssdb -D -n "goagent"
```


* * *
# 安装 ise 14.7
```
$ yaourt fxload
git clone git://git.zerfleddert.de/usb-driver

$ ./setup_pcusb /opt/Xilinx/14.7/ISE_DS/ISE
```
lsusb:
```
Bus 001 Device 004: ID 03fd:0008 Xilinx, Inc.
```

ise的启动icon
```
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=ISE 14.7
Comment=ISE 14.7
Icon=/opt/Xilinx/14.7/ISE_DS/ISE/data/images/pn-ise.png
Exec=/opt/Xilinx/14.7/ISE_DS/ise
```

脚本名：`/opt/Xilinx/14.7/ISE_DS/ise`
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



* * *
# 给quartus做一个启动器
Quartusii.desktop
```
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=Quartusii 11
Comment=Quartusii 11
Icon=/opt/altera/11.0/quartus/adm/quartusii.png
Exec=/opt/altera/11.0/quartusii
```
脚本名：/opt/altera/11.0/quartusii
```
#!/bin/bash
export LM_LICENSE_FILE=/opt/modelsim/license.dat:/opt/altera/license.dat
export LANG=''
/opt/altera/11.0/quartus/bin/quartus
```



* * *
# 全盘更新
```
2018年 02月 09日 星期五 20:56:48 CST
 
:: 正在进行全面系统更新...
:: 替换 gtk3-print-backends 吗 (使用 extra/gtk3 )？ [Y/n] y
y:: 替换 mime-types 吗 (使用 extra/mailcap )？ [Y/n] 
:: 替换 spice-glib 吗 (使用 community/spice-gtk )？ [Y/n] y
:: 替换 spice-gtk3 吗 (使用 community/spice-gtk )？ [Y/n] y
正在解决依赖关系...
正在查找软件包冲突...
错误：无法准备事务处理 (无法满足依赖关系)
:: ffmpeg0.10：安装 libvpx (1.7.0-1) 将破坏依赖关系 'libvpx.so=4-64'
:: ffmpeg0.10：安装 libx264 (2:152.20171224-1) 将破坏依赖关系 'libx264.so=148-64'
:: lib32-ffmpeg：安装 lib32-libvpx (1.7.0-1) 将破坏依赖关系 'libvpx.so=4-32'

[andy@andy ~]$ sudo pacman -R ffmpeg0.10
正在检查依赖关系...

软件包 (1) ffmpeg0.10-0.10.16-3

全部移去体积：  9.81 MiB

:: 打算删除这些软件包吗？ [Y/n] y
:: 正在处理软件包的变化...
(1/1) 正在删除 ffmpeg0.10                          [######################] 100%
:: 正在运行事务后钩子函数...
(1/1) Arming ConditionNeedsUpdate...
[andy@andy ~]$ sudo pacman -R lib32-ffmpeg
正在检查依赖关系...
错误：无法准备事务处理 (无法满足依赖关系)
:: lib32-libvdpau-va-gl：移除 lib32-ffmpeg 将破坏依赖关系 'lib32-ffmpeg'



[andy@andy ~]$ sudo pacman -R lib32-ffmpeg lib32-libvdpau-va-gl
正在检查依赖关系...

软件包 (2) lib32-ffmpeg-1:3.1.2-1  lib32-libvdpau-va-gl-0.3.4-1

全部移去体积：  18.36 MiB

:: 打算删除这些软件包吗？ [Y/n] y
:: 正在处理软件包的变化...
(1/2) 正在删除 lib32-libvdpau-va-gl                [######################] 100%
(2/2) 正在删除 lib32-ffmpeg                        [######################] 100%
:: 正在运行事务后钩子函数...
(1/1) Arming ConditionNeedsUpdate...
```

```
错误：无法升级 archlinuxcn (调用外部下载程序时出错)
:: 正在进行全面系统更新...
:: 替换 gtk3-print-backends 吗 (使用 extra/gtk3 )？ [Y/n] y
:: 替换 mime-types 吗 (使用 extra/mailcap )？ [Y/n] y
:: 替换 spice-glib 吗 (使用 community/spice-gtk )？ [Y/n] y
:: 替换 spice-gtk3 吗 (使用 community/spice-gtk )？ [Y/n] y
正在解决依赖关系...
正在查找软件包冲突...
警告：检测到依赖关系环：
警告：harfbuzz 将在它 freetype2 的依赖关系之前被安装

软件包 (694) adwaita-icon-theme-3.26.1-1  alsa-plugins-1.1.5-1
             alsa-utils-1.1.5-2  amule-10990-5
             android-sdk-platform-tools-r27.0.1-1  apr-util-1.6.1-2
             arch-install-scripts-18-1  archlinux-keyring-20180108-1
             archlinuxcn-keyring-20180202-1  argon2-20171227-3
             arm-none-eabi-binutils-2.30-1  arm-none-eabi-gcc-7.3.0-1
             arm-none-eabi-gdb-8.1-1  asar-0.14.1-1  assimp-4.1.0-1
             at-3.1.20-4  attica-qt5-5.42.0-1  audacious-plugins-3.9-2
             avahi-0.7-4  avr-binutils-2.30-1  avr-gcc-7.3.0-1  avr-gdb-8.1-1
             axel-2.16.1-1  babl-0.1.38-1  baloo-5.42.0-1
             baloo-widgets-17.12.2-1  bash-4.4.018-1  bind-tools-9.12.0-1
             binutils-2.29.1-2  blas-3.8.0-1  bluefish-2.2.10-3  bluez-5.48-1
             bluez-libs-5.48-1  boost-libs-1.66.0-1  brltty-5.5-3
             btrfs-progs-4.14.1-1  ca-certificates-mozilla-3.35-1
             cairo-1.15.10-1  calibre-3.16.0-1  cantarell-fonts-1:0.100-1
             catfish-1.4.4-1  cblas-3.8.0-1  ccache-3.3.5-1  cdrtools-3.02a09-1
             ceph-12.2.2-5  ceph-libs-12.2.2-5  certbot-0.21.1-1  chmlib-0.40-5
             chromaprint-1.4.3-1  chromium-64.0.3282.140-2  clang-5.0.1-2
             cmake-3.10.2-2  colord-1.4.1+6+gf08c25d-1  conky-1.10.7-2
             coreutils-8.29-1  crypto++-6.0.0-2  cryptsetup-2.0.1-1
             cuda-9.1.85-1  curl-7.58.0-1  dbus-1.12.2-1  dbus-glib-0.110-1
             deadbeef-0.7.2-3  deluge-1.3.15+14+gb8e5ebe82-1
             device-mapper-2.02.177-1  dhclient-4.4.0-1
             dialog-1:1.3_20171209-1  diffstat-1.61-2  dkms-2.5-1  dmenu-4.7-2
             dolphin-17.12.2-1  dolphin-plugins-17.12.2-1  doxygen-1.8.14-1
             dropbox-43.4.49-3  e2fsprogs-1.43.8-1  eclipse-common-4.7.2-1
             eclipse-cpp-4.7.2-1  efivar-32-1  electron-1.7.12-1
             enchant-2.2.1-1  ethtool-1:4.15-1  exim-4.90-3  expat-2.2.5-1
             expect-5.45.3-1  f2fs-tools-1.10.0-1  fcgi-2.4.0-13
             fcitx-cloudpinyin-0.3.6-2  fcitx-configtool-0.4.10-3
             fcitx-qt5-1.2.2-1  feh-2.23.1-1  ffmpeg-1:3.4.1-4
             ffmpeg2.8-2.8.13-5  filesystem-2017.10-2  filezilla-3.30.0-1
             firefox-58.0.2-1  flashplugin-28.0.0.161-1  fltk-1.3.4.2-2
             fluidsynth-1.1.9-1  foxitreader-2.4.1.0609-10
             freerdp-1:2.0.0_rc1-1  freetype2-2.9-2  frei0r-plugins-1.6.1-5
             freshplayerplugin-0.3.9-1  fribidi-0.19.7-2  fuse-common-3.2.1-1
             fuse3-3.2.1-1  gavl-1.4.0-3  gawk-4.2.0-3  gcc-7.3.0-1
             gcc-libs-7.3.0-1  gcc-objc-7.3.0-1  gcc5-5.5.0-2.1  gcc6-6.4.1-5
             gcc6-libs-6.4.1-5  gdb-8.1-1  gdb-common-8.1-1  gdbm-1.14.1-1
             gegl-0.3.26-1  gendesk-0.7-1  geoip-database-20180206-1
             ghostscript-9.22-7  git-2.16.1-1  glib2-2.54.3+2+g94b38beff-1
             glib2-docs-2.54.3+2+g94b38beff-1  glibc-2.26-11
             glusterfs-1:3.13.1-1  gmime-2.6.23+4+g91dcee38-2  gmime3-3.2.0-1
             gmtk-1.0.9-5  gnome-calculator-3.26.0-2
             gnome-color-manager-3.26.0+16+g3b2109b-1
             gnome-control-center-3.26.2+14+g5ac6a0da6-1
             gnome-desktop-1:3.26.2-2  gnome-keyring-1:3.27.2-1
             gnome-mplayer-1.0.9-5  gnome-online-accounts-3.26.2-1
             gnome-perl-1.045-13  gnome-themes-standard-3.22.3+16+gc092fc89-1
             gnome-vfs-nosmb-2.24.4-10  gnome-vfs-perl-1.082-9
             gnomecanvas-perl-1.002-20  gnupg-2.2.4-2  gnutls-3.5.17-1
             go-2:1.9.4-1  goocanvas-2.0.4-1  goocanvas1-1.0.0-5
             google-chrome-64.0.3282.140-1  gperftools-2.6.2-1  gpgme-1.10.0-1
             graphviz-2.40.1-10  grub-2:2.02-4  gspell-1.7.1-1
             gst-libav-1.12.4-1  gst-plugins-bad-1.12.4-3
             gst-plugins-base-1.12.4-1  gst-plugins-base-libs-1.12.4-1
             gst-plugins-good-1.12.4-2  gst-plugins-ugly-1.12.4-3
             gstreamer-1.12.4-1  gthumb-3.6.0-1  gtk-doc-1.27-1
             gtk-sharp-2-2.12.45-1  gtk-sharp-3-2.99.3-1
             gtk-update-icon-cache-3.22.26+161+g60750b3ffd-1  gtk2-2.24.32-1
             gtk3-3.22.26+161+g60750b3ffd-1
             gtk3-print-backends-3.22.26-1 [删除]  gtkimageview-1.6.4-5
             gtksourceview3-3.24.6-1  guile-2.2.3-1  gulp-4.0.0-1
             gvfs-1.34.2-1  gvfs-mtp-1.34.2-1  gvfs-nfs-1.34.2-1
             gvfs-smb-1.34.2-1  gvim-8.0.1476-1  gzip-1.9-1  harfbuzz-1.7.5-1
             harfbuzz-icu-1.7.5-1  hdf5-1.10.1-2  hidapi-0.8.0rc1-3
             hspell-1.4-1  htop-2.1.0-1  hwids-20171003-1  iana-etc-20180131-1
             icu-60.2-1  imagemagick-7.0.7.22-1  iniparser-4.1-1
             intel-tbb-2018_20171205-1  intel-ucode-20180108-1
             iproute2-4.15.0-1  iptables-1.6.1-2  iw-4.14-1  jansson-2.10-3
             jbig2dec-0.14-1  jdk-9.0.4-1  jemalloc-1:5.0.1-4  json-c-0.13-1
             jsoncpp-1.8.4-2  jwm-2.3.7-1  k3b-1:17.12.2-1
             kactivities-5.42.0-1  karchive-5.42.0-1  kauth-5.42.0-1
             kbookmarks-5.42.0-1  kcmutils-5.42.0-1  kcodecs-5.42.0-1
             kcompletion-5.42.0-1  kconfig-5.42.0-1  kconfigwidgets-5.42.0-1
             kcoreaddons-5.42.0-1  kcrash-5.42.0-1  kdbusaddons-5.42.0-1
             kdebase-runtime-17.08.3-2  kdeclarative-5.42.0-1  kded-5.42.0-1
             kdelibs-4.14.38-3  kdelibs4support-5.42.0-1  kdnssd-5.42.0-1
             kemoticons-5.42.0-1  kfilemetadata-5.42.0-1  kglobalaccel-5.42.0-1
             kguiaddons-5.42.0-1  khtml-5.42.0-1  ki18n-5.42.0-1  kicad-4.0.7-4
             kiconthemes-5.42.0-1  kidletime-5.42.0-1  kinit-5.42.0-1
             kio-5.42.0-1  kio-extras-17.12.2-1  kitemmodels-5.42.0-1
             kitemviews-5.42.0-1  kjobwidgets-5.42.0-1  kjs-5.42.0-1
             knewstuff-5.42.0-1  knotifications-5.42.0-2
             knotifyconfig-5.42.0-1  kpackage-5.42.0-1  kparts-5.42.0-1
             kpty-5.42.0-1  krb5-1.16-1  kservice-5.42.0-1
             ktextwidgets-5.42.0-1  kuiserver-5.12.0-1
             kunitconversion-5.42.0-1  kwallet-5.42.0-1
             kwidgetsaddons-5.42.1-1  kwindowsystem-5.42.0-1  kxmlgui-5.42.0-1
             lapack-3.8.0-1  lcms-1.19-7  lcms2-2.9-1  ldb-1.3.0-1
             ldns-1.7.0-4  lib32-acl-2.2.52-3  lib32-alsa-lib-1.1.5-1
             lib32-alsa-plugins-1.1.5-1  lib32-at-spi2-atk-2.26.1-1
             lib32-at-spi2-core-2.26.1-1  lib32-attr-2.4.47-2
             lib32-curl-7.58.0-1  lib32-dbus-1.12.2-1
             lib32-fontconfig-2.12.6+5+g665584a-1  lib32-gcc-libs-7.3.0-1
             lib32-glibc-2.26-11  lib32-gst-plugins-base-libs-1.12.4-1
             lib32-gstreamer-1.12.4-1  lib32-harfbuzz-1.7.1-1
             lib32-harfbuzz-icu-1.7.1-1  lib32-icu-60.1-1  lib32-krb5-1.16-1
             lib32-libcurl-compat-7.58.0-1  lib32-libcurl-gnutls-7.58.0-1
             lib32-libdrm-2.4.89-1  lib32-libjpeg-turbo-1.5.3-1
             lib32-libjpeg6-turbo-1.5.3-1  lib32-libnm-glib-1.10.2-1
             lib32-libogg-1.3.3-2  lib32-libpciaccess-0.14-1
             lib32-libpsl-0.19.1-1  lib32-libtasn1-4.13-1  lib32-libvpx-1.7.0-1
             lib32-libxcursor-1.1.15-1  lib32-libxml2-2.9.4+16+g07418011-2
             lib32-llvm-libs-5.0.1-1  lib32-mesa-17.3.3-1
             lib32-ncurses-6.0+20170902-1  lib32-nss-3.34-1
             lib32-nvidia-utils-390.25-1  lib32-ocl-icd-2.2.12-1
             lib32-openssl-1.0-1.0.2.n-1  lib32-qt4-4.8.7-14
             lib32-sqlite-3.21.0-1  lib32-systemd-237.0-1  lib32-tcl-8.6.8-1
             lib32-tdb-1.3.15-1  libabw-0.1.2-1  libaec-1.0.2-1  libao-1.2.2-2
             libassuan-2.5.1-1  libatomic_ops-7.6.2-1  libblockdev-2.14-2
             libbs2b-3.1.0-6  libbsd-0.8.7-1  libbytesize-1.0-2
             libcdio-2.0.0-1  libcdio-paranoia-10.2+0.94+2-2  libcdr-0.1.4-2
             libcmis-0.5.1-8  libcups-2.2.6-4  libcurl-compat-7.58.0-1
             libcurl-gnutls-7.58.0-1  libdrm-2.4.89-1  libe-book-0.1.3-1
             libepubgen-0.1.0-1  libevdev-1.5.8-1  libfbclient-2.5.7.27050-4
             libfilezilla-0.11.2-1  libfm-1.2.5-2  libfm-extra-1.2.5-2
             libfm-gtk2-1.2.5-2  libfreehand-0.1.2-1  libftdi-1.4-1
             libftdi-compat-0.20-5  libgcrypt-1.8.2-1
             libgda-5.2.4+39+g3f70d4fce-2  libgdiplus-5.6-1  libgexiv2-0.10.7-1
             libgphoto2-2.5.16-1  libgpod-0.8.3-5  libgsf-1.14.42-1
             libgweather-3.26.1-1  libical-3.0.1-1  libice-1.0.9-2
             libidn2-2.0.4-2  libinput-1.9.4-1  libisoburn-1.4.8-2
             libixion-0.13.0-1  libjpeg-turbo-1.5.3-1  libjpeg6-turbo-1.5.3-1
             libkcddb-17.12.2-1  libmagick-7.0.7.22-1  libmagick6-6.9.9.34-1
             libmariadbclient-10.1.30-1  libmediaart-1.9.4+1+ga704d0b-1
             libmm-glib-1.6.12-1  libmpc-1.1.0-1  libmspub-0.1.3-1
             libmwaw-0.3.13-1  libnautilus-extension-3.26.2-3  libnftnl-1.0.9-1
             libnghttp2-1.29.0-1  libnm-1.10.3dev+38+g78ef57197-1
             libnm-glib-1.10.3dev+38+g78ef57197-1  libogg-1.3.3-2
             liborcus-0.13.2-1  libpagemaker-0.0.4-1
             libplist-2.0.0+11+gec9ba8b-1  libpsl-0.19.1-1  libqxp-0.0.1-1
             libraqm-0.4.0-1  libreoffice-fresh-6.0.0-1  librsvg-2:2.42.2-1
             libsasl-2.1.26-12  libseccomp-2.3.2-2  libsodium-1.0.16-1
             libsoup-2.60.3-1  libspeechd-0.8.8-1  libsrtp-1:2.1.0-1
             libstaroffice-0.0.5-1  libsystemd-237.0-2  libtasn1-4.13-1
             libtiff-4.0.9-1  libtirpc-1.0.2-3  libtool-2.4.6+40+g6ca5e224-4
             libtorrent-rasterbar-1:1.1.6-1  libunicodenames-1.2.2-1
             libunistring-0.9.8-1  libupnp-1.6.24-2  libutil-linux-2.31.1-1
             libuv-1.19.1-1  libvisio-0.1.6-2  libvpx-1.7.0-1  libwacom-0.27-1
             libwbclient-4.7.4-1  libwebp-0.6.1-1  libwps-0.4.8-1
             libx264-2:152.20171224-1  libx264-all-2:152.20171224-1
             libxau-1.0.8-3  libxcursor-1.1.15-1  libxdamage-1.1.4-3
             libxfixes-5.0.3-2  libxfont2-2.0.3-1  libxkbcommon-0.8.0-1
             libxkbcommon-x11-0.8.0-1  libxklavier-5.4-2
             libxml2-2.9.7+4+g72182550-2  libxrandr-1.5.1-2  libzip-1.3.2-1
             libzmf-0.0.2-2  liferea-1.12.1-1  linux-4.15.1-2
             linux-api-headers-4.14.8-1  linux-firmware-20180119.2a713be-1
             linux-headers-4.15.1-2  linux-lts-4.14.18-1
             linux-lts-headers-4.14.18-1  llvm-libs-5.0.1-2  logrotate-3.13.0-1
             lua52-luajson-1.3.4-1  lvm2-2.02.177-1  lxdm-0.5.3-5
             lxterminal-0.3.1-1  mailcap-2.1.48+14+g5811758-1  man-db-2.8.0-1
             man-pages-4.15-1  mariadb-10.1.30-1  mariadb-clients-10.1.30-1
             masterpdfeditor-4.3.82-1  mcpp-2.7.2-6  menu-cache-1.1.0-1
             mesa-17.3.3-2  mime-types-9-1 [删除]  mono-5.4.1.7-2
             mono-addins-1.3.3-1  mpfr-4.0.0-1  mpg123-1.25.8-1
             mplayer-38017-1  mpv-1:0.27.0-6  mutagen-1.39-1  nano-2.9.3-1
             nasm-2.13.02-1  nautilus-3.26.2-3  ncdu-1.13-1  netctl-1.15-1
             nettle-3.4-1  network-manager-applet-1.8.11dev+7+ga52ccb2f-1
             networkmanager-1.10.3dev+38+g78ef57197-1
             networkmanager-openconnect-1.2.4-3
             networkmanager-openvpn-1.8.1dev+10+ge4d8cda-2
             networkmanager-pptp-1.2.4-3  networkmanager-vpnc-1.2.4-3
             nfs-utils-2.3.1-1  nfsidmap-2.3.1-1  nilfs-utils-2.2.7-1
             nm-connection-editor-1.8.11dev+7+ga52ccb2f-1  nodejs-9.5.0-1
             npm-5.6.0-1  nspr-4.18-1  nss-3.35-1  numactl-2.0.11-2
             nvidia-utils-390.25-2  ocl-icd-2.2.12-1  opencl-nvidia-390.25-2
             opencv-3.4.0-2  openssh-7.6p1-2  openssl-1.0-1.0.2.n-1
             opera-51.0.2830.26-1  optipng-0.7.7-1  orc-0.4.28-1
             osinfo-db-20170813-1  oxygen-icons-1:5.42.0-1  p7zip-16.02-4
             pacman-mirrorlist-20180203-1  partimage-0.6.9-12  pciutils-3.5.6-1
             pcsclite-1.8.23-1  pepper-flash-28.0.0.161-1  perl-5.26.1-2
             perl-archive-zip-1.60-1  perl-file-copy-recursive-0.40-1
             perl-gtk2-unique-0.05-21  perl-http-message-6.14-1
             perl-json-2.97000-1  perl-mouse-2.5.1-1
             perl-proc-processtable-0.55-1  perl-try-tiny-0.30-1
             perl-uri-1.73-1  phodav-2.2-2  php-7.2.2-1  php-apache-7.2.2-1
             php-cgi-7.2.2-1  phpmyadmin-4.7.7-2  pigz-2.4-1  pinentry-1.1.0-1
             polkit-0.113+34+g29ba7af-1  pptpclient-1.10.0-1  prison-5.42.0-1
             procps-ng-3.3.12-2  protobuf-3.5.1.1-1  putty-0.70-2
             pygobject2-devel-2.28.7-1  pygtk-2.24.0-8  pyqt5-common-5.10-2
             python-3.6.4-2  python-acme-0.21.1-1  python-asn1crypto-0.24.0-1
             python-cffi-1.11.4-1  python-cryptography-2.1.4-1
             python-cssselect-1.0.3-1  python-dbus-1.2.6-1
             python-dbus-common-1.2.6-1  python-html2text-2018.1.9-1
             python-josepy-1.0.1-2  python-keyring-11.0.0-1
             python-lxml-4.1.1-1  python-pexpect-4.3.1-1  python-pyasn1-0.4.2-1
             python-pyopenssl-17.5.0-1  python-pyqt5-5.10-2
             python-setuptools-1:38.5.1-1  python-sip-4.19.7-1
             python-werkzeug-0.14.1-1  python2-2.7.14-2  python2-apsw-3.21.0-1
             python2-asn1crypto-0.24.0-1  python2-attrs-17.4.0-1
             python2-backports-1.0-1
             python2-backports.functools_lru_cache-1.5-1  python2-cffi-1.11.4-1
             python2-cheroot-6.0.0-1  python2-cherrypy-13.1.0-1
             python2-cryptography-2.1.4-1  python2-cssselect-1.0.3-1
             python2-dbus-1.2.6-1  python2-gobject2-2.28.7-1
             python2-html5lib-1.0.1-2  python2-ipaddress-1.0.19-1
             python2-jaraco-2017.11.25-1  python2-jinja-2.10-1
             python2-lxml-4.1.1-1  python2-mechanize-1:0.3.6-1
             python2-more-itertools-3.1.0-1  python2-msgpack-0.5.0-2
             python2-nautilus-1.2.2-1  python2-pecan-1.2.1-4
             python2-pillow-5.0.0-1  python2-prettytable-0.7.2-8
             python2-psutil-5.4.3-1  python2-pyasn1-0.4.2-1
             python2-pyopenssl-17.5.0-1  python2-pyqt5-5.10-2
             python2-regex-2018.02.08-1  python2-setuptools-1:38.5.1-1
             python2-singledispatch-3.4.0.3-2  python2-sip-4.19.7-1
             python2-webob-1.7.4-1  python2-werkzeug-0.14.1-1  qbs-1.10.0-1
             qca-qt4-2.1.3-6  qca-qt5-2.1.3-6  qemu-2.11.0-4
             qemu-arch-extra-2.11.0-4  qemu-block-gluster-2.11.0-4
             qemu-block-iscsi-2.11.0-4  qemu-block-rbd-2.11.0-4
             qemu-guest-agent-2.11.0-4  qt4-4.8.7-23  qt5-3d-5.10.0-2
             qt5-base-5.10.0-4  qt5-canvas3d-5.10.0-1
             qt5-connectivity-5.10.0-1  qt5-declarative-5.10.0-1
             qt5-doc-5.10.0-1  qt5-examples-5.10.0-1
             qt5-graphicaleffects-5.10.0-1  qt5-imageformats-5.10.0-1
             qt5-location-5.10.0-1  qt5-multimedia-5.10.0-1
             qt5-quickcontrols-5.10.0-1  qt5-quickcontrols2-5.10.0-1
             qt5-script-5.10.0-1  qt5-sensors-5.10.0-1  qt5-serialport-5.10.0-1
             qt5-speech-5.10.0-1  qt5-svg-5.10.0-1  qt5-tools-5.10.0-1
             qt5-translations-5.10.0-1  qt5-wayland-5.10.0-3
             qt5-webchannel-5.10.0-1  qt5-webengine-5.10.0-4
             qt5-webkit-5.212.0alpha2-11  qt5-websockets-5.10.0-1
             qt5-x11extras-5.10.0-1  qt5-xmlpatterns-5.10.0-1
             qtcreator-4.5.0-2  raptor-2.0.15-7  rasqal-1:0.9.33-2
             re2-20180201-1  recode-3.7-1  refind-efi-0.11.2-1
             reiserfsprogs-3.6.27-1  remmina-1:1.2.0rcgit.26-1  rpcbind-0.2.4-4
             rsync-3.1.3-1  rtkit-0.11+8+ge0a51fe-1  rubberband-1.8.1-4
             ruby-2.5.0-4  run-parts-4.8.3-1  s-nail-14.9.6-1  samba-4.7.4-1
             scons-3.0.1-1  semver-5.5.0-1  sg3_utils-1.42-1  shadow-4.5-4
             sip-4.19.7-1  slim-1.3.6-7  smbclient-4.7.4-1  smplayer-18.2.0-1
             snappy-1.1.7-1  solid-5.42.0-1  sonnet-5.42.0-1
             source-highlight-3.1.8-14  speech-dispatcher-0.8.8-1
             spice-0.14.0-2  spice-glib-0.34-1 [删除]  spice-gtk-0.34-1
             spice-gtk3-0.34-2 [删除]  sqlite-3.22.0-1  sqlitebrowser-3.10.1-1
             steam-1.0.0.54-3  steam-native-runtime-1.0.0.54-5
             subversion-1.9.7-4  sudo-1.8.22-1  syslinux-6.03-8
             systemd-237.0-2  systemd-sysvcompat-237.0-2  talloc-2.1.11-1
             tar-1.30-1  tcl-8.6.8-1  tevent-1:0.9.34-1  thunderbird-52.6.0-2
             tint2-16.2-1  tk-8.6.8-2  tmux-2.6-2  tor-0.3.2.9-1
             tracker-2.0.3-1  transmission-cli-2.93-1  transmission-gtk-2.93-1
             tslib-1.15-1  tzdata-2018c-1  udevil-0.4.4-2  udiskie-1.7.3-1
             udisks2-2.7.5-1  uget-2.2.0-1  upower-0.99.7-1
             usb_modeswitch-2.5.2-1  usbutils-009-1  util-linux-2.31.1-1
             v4l-utils-1.14.1-1  vala-0.38.7-1  valgrind-3.13.0-6
             vim-runtime-8.0.1476-1  virtualbox-5.2.6-2
             virtualbox-ext-oracle-5.2.6-3  virtualbox-ext-vnc-5.2.6-2
             virtualbox-guest-iso-5.2.7-1
             virtualbox-guest-modules-arch-5.2.6-6
             virtualbox-guest-utils-5.2.6-2
             virtualbox-host-modules-arch-5.2.6-6  virtualbox-sdk-5.2.6-2
             vlc-2.2.8-4  volume_key-0.3.9-5  vte-common-0.50.2+6+g7fe155b9-1
             vte3-0.50.2+6+g7fe155b9-1  w3m-0.5.3.git20180125-1
             wayland-protocols-1.12-1  webkit2gtk-2.18.6-1
             webkitgtk-3:2.4.11-11  webkitgtk2-3:2.4.11-11  wget-1.19.4-1
             wildmidi-0.4.2-1  wine-3.1-1  winetricks-20171222-1
             wxgtk-common-3.0.3.1-11  wxgtk2-3.0.3.1-11  wxgtk3-3.0.3.1-11
             wxpython-3.0.2.0-7  x265-2.6-1
             xf86-video-intel-1:2.99.917+805+g26f54068-1  xfce4-notifyd-0.4.1-1
             xfsprogs-4.14.0-1  xine-lib-1.2.9-3  xkeyboard-config-2.23.1-2
             xorg-server-1.19.6+13+gd0d1a694f-1
             xorg-server-common-1.19.6+13+gd0d1a694f-1
             xorg-server-xephyr-1.19.6+13+gd0d1a694f-1
             xorg-server-xvfb-1.19.6+13+gd0d1a694f-1  xscreensaver-5.38-1
             xterm-331-1  xulrunner-41.0.2-14  zbar-0.10-12  zstd-1.3.3-1

下载大小:    4427.19 MiB
全部安装大小：  14469.67 MiB
净更新大小：   1058.30 MiB
```


* * *
# 安装 libffi
```
sudo pacman -S libffi
```
如果强制删除
```
sudo pacman -Rdd libffi
```

* * *
# icecat 
icecat替代老版本的ff(比如54版本)
`yaourt icecat`
```
sudo ln -s /usr/lib/libvpx.so.5 /usr/lib/libvpx.so.4
```
依赖icu61,解压lib里的有关库文件到/usr/lib，ok
或者源码编译。。。


* * *
# firefox降级遇到的依赖性问题

icu库软链接到最新的不行

去下载需要的icu版本，解压出来lib目录里只复制库，到/usr/lib，再去建立软链接
```
libicudata.so.58.2  libicuio.so.58.2    libicutu.so.58.2
libicui18n.so.58.2  libicutest.so.58.2  libicuuc.so.58.2
```
用软链接应付一下的
```
cd /usr/lib
sudo ln -s libhunspell-1.6.so.0 libhunspell-1.5.so.0
sudo ln -s libevent-2.1.so.6 libevent-2.0.so.5
```
最好还是https://archive.archlinux.org下载对应的库包，提取库文件，再新建软链接

查询库文件所属的软件包
`pacman -Qo /usr/lib/***`





2018年 02月 10日 星期六 16:55:55 CST
恢复root分区为arch_root_only_20171119.tar.xz

删除cuda
sudo pacman -R cuda crark-cuda


树形目录
yaourt tree





* * *
# something
```
yaourt vscode
yaourt geany geany-plugins
```

* * *
# shutter 缺模块
```
[andy@andy ~]$ shutter
Can't locate Gnome2.pm in @INC (you may need to install the Gnome2 module) (@INC contains: /usr/lib/perl5/5.26/site_perl /usr/share/perl5/site_perl /usr/lib/perl5/5.26/vendor_perl /usr/share/perl5/vendor_perl /usr/lib/perl5/5.26/core_perl /usr/share/perl5/core_perl) at /usr/bin/shutter line 37.
BEGIN failed--compilation aborted at /usr/bin/shutter line 37.

[andy@andy ~]$ sudo cpan install Gnome2
```
ok


* * *
# 全盘更新
```
2018年 04月 22日 星期日 14:44:56 CST

:: 正在进行全面系统更新...
:: 替换 apache-ant 吗 (使用 extra/ant )？ [Y/n] y
:: 替换 attica-qt5 吗 (使用 extra/attica )？ [Y/n] y
:: 替换 ca-certificates-cacert 吗 (使用 core/ca-certificates )？ [Y/n] y
:: 替换 compositeproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 damageproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 dmxproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 fixesproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 fontsproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 glproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 gnome-themes-standard 吗 (使用 extra/gnome-themes-extra )？ [Y/n] y
:: 替换 gtk3-print-backends 吗 (使用 extra/gtk3 )？ [Y/n] y
:: 替换 inputproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 kbproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 kuiserver 吗 (使用 extra/plasma-workspace )？ [Y/n] y
:: 替换 libx264 吗 (使用 extra/x264 )？ [Y/n] y
:: 替换 libx264-all 吗 (使用 extra/x264 )？ [Y/n] y
:: 替换 mime-types 吗 (使用 extra/mailcap )？ [Y/n] y
:: 替换 pkg-config 吗 (使用 core/pkgconf )？ [Y/n] y
:: 替换 printproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 python-crypto 吗 (使用 community/python-pycryptodome )？ [Y/n] y
:: 替换 python2-crypto 吗 (使用 community/python2-pycryptodome )？ [Y/n] y
:: 替换 qca-qt5 吗 (使用 extra/qca )？ [Y/n] y
:: 替换 randrproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 recordproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 renderproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 scrnsaverproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 spice-glib 吗 (使用 community/spice-gtk )？ [Y/n] y
:: 替换 spice-gtk3 吗 (使用 community/spice-gtk )？ [Y/n] y
警告：unarchiver：本地 (1:1.10.1-1) 比 community 的版本更新 (1.10.1-4)
:: 替换 videoproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 wxpython 吗 (使用 community/python2-wxpython3 )？ [Y/n] y
:: 替换 xextproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 xf86dgaproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 xf86vidmodeproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 xineramaproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 xproto 吗 (使用 extra/xorgproto )？ [Y/n] y
正在解决依赖关系...
正在查找软件包冲突...
警告：正在从目标清单中删除 'unrar' ，因为它和 'rar' 冲突
:: rar 与 unrar 有冲突。删除 unrar 吗？ [y/N] y
:: attica 与 attica-qt4 有冲突。删除 attica-qt4 吗？ [y/N] y
:: qca 与 qca-qt4 有冲突。删除 qca-qt4 吗？ [y/N] y
错误：无法准备事务处理 (无法满足依赖关系)
:: ffmpeg0.10：安装 libvpx (1.7.0-1) 将破坏依赖关系 'libvpx.so=4-64'
:: ffmpeg0.10：移除 libx264 将破坏依赖关系 'libx264.so=148-64'
:: ffmpeg2.8：安装 libvpx (1.7.0-1) 将破坏依赖关系 'libvpx.so=4-64'
:: ffmpeg2.8：移除 libx264 将破坏依赖关系 'libx264.so=148-64'
:: ffmpeg2.8：安装 x265 (2.8-1) 将破坏依赖关系 'libx265.so=130-64'
:: kdelibs：移除 attica-qt4 将破坏依赖关系 'attica-qt4'
:: kqrcode：安装 zbar (0.20-3) 将破坏依赖关系 'zbar-qt'
:: lib32-ffmpeg：安装 lib32-libvpx (1.7.0-1) 将破坏依赖关系 'libvpx.so=4-32'
:: libxfont：移除 fontsproto 将破坏依赖关系 'fontsproto>=2.1.3'
[andy@andy ~]$ sudo pacman -R ffmpeg0.10
[sudo] andy 的密码：
正在检查依赖关系...

软件包 (1) ffmpeg0.10-0.10.16-3

全部移去体积：  9.81 MiB

:: 打算删除这些软件包吗？ [Y/n] y
:: 正在处理软件包的变化...
(1/1) 正在删除 ffmpeg0.10                          [######################] 100%
:: 正在运行事务后钩子函数...
(1/1) Arming ConditionNeedsUpdate...
[andy@andy ~]$ sudo pacman -R ffmpeg2.8
正在检查依赖关系...
错误：无法准备事务处理 (无法满足依赖关系)
:: vlc：移除 ffmpeg2.8 将破坏依赖关系 'ffmpeg2.8'


sudo pacman -R vlc npapi-vlc
sudo pacman -R ffmpeg2.8

sudo pacman -R kdelibs kdebase-runtime kdepimlibs4 kqrcode libkcddb4
sudo pacman -R lib32-ffmpeg lib32-libvdpau-va-gl
sudo pacman -R libxfont

2018年 10月 06日 星期六 10:09:11 CST
sudo pacman -Syu

:: 正在进行全面系统更新...
:: 替换 apache-ant 吗 (使用 extra/ant )？ [Y/n] y
:: 替换 attica-qt5 吗 (使用 extra/attica )？ [Y/n] y
:: 替换 ca-certificates-cacert 吗 (使用 core/ca-certificates )？ [Y/n] y
:: 替换 compositeproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 damageproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 dmxproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 fixesproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 fontsproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 glproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 gnome-themes-standard 吗 (使用 extra/gnome-themes-extra )？ [Y/n] y
:: 替换 gtk3-print-backends 吗 (使用 extra/gtk3 )？ [Y/n] y
:: 替换 inputproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 kbproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 kuiserver 吗 (使用 extra/plasma-workspace )？ [Y/n] y
:: 替换 libx264 吗 (使用 extra/x264 )？ [Y/n] y
:: 替换 libx264-all 吗 (使用 extra/x264 )？ [Y/n] y
:: 替换 mime-types 吗 (使用 extra/mailcap )？ [Y/n] y
:: 替换 pkg-config 吗 (使用 core/pkgconf )？ [Y/n] y
:: 替换 printproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 python-crypto 吗 (使用 community/python-pycryptodome )？ [Y/n] y
:: 替换 python2-crypto 吗 (使用 community/python2-pycryptodome )？ [Y/n] y
:: 替换 qca-qt5 吗 (使用 extra/qca )？ [Y/n] y
:: 替换 randrproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 recordproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 renderproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 scrnsaverproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 spice-glib 吗 (使用 community/spice-gtk )？ [Y/n] y
:: 替换 spice-gtk3 吗 (使用 community/spice-gtk )？ [Y/n] y
警告：unarchiver：本地 (1:1.10.1-1) 比 community 的版本更新 (1.10.1-4)
:: 替换 videoproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 wxpython 吗 (使用 community/python2-wxpython3 )？ [Y/n] y
:: 替换 xextproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 xf86dgaproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 xf86vidmodeproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 xineramaproto 吗 (使用 extra/xorgproto )？ [Y/n] y
:: 替换 xproto 吗 (使用 extra/xorgproto )？ [Y/n] y
正在解决依赖关系...
正在查找软件包冲突...
警告：正在从目标清单中删除 'unrar' ，因为它和 'rar' 冲突
:: rar 与 unrar 有冲突。删除 unrar 吗？ [y/N] y
:: attica 与 attica-qt4 有冲突。删除 attica-qt4 吗？ [y/N] y
:: qca 与 qca-qt4 有冲突。删除 qca-qt4 吗？ [y/N] y
警告：检测到依赖关系环：
警告：harfbuzz 将在它 freetype2 的依赖关系之前被安装
警告：检测到依赖关系环：
警告：mesa 将在它 libglvnd 的依赖关系之前被安装
警告：检测到依赖关系环：
警告：nvidia-utils 将在它 libglvnd 的依赖关系之前被安装
警告：检测到依赖关系环：
警告：xorg-server 将在它 libglvnd 的依赖关系之前被安装
警告：检测到依赖关系环：
警告：x264 将在它 ffmpeg 的依赖关系之前被安装
警告：检测到依赖关系环：
警告：python2-incremental 将在它 python2-twisted 的依赖关系之前被安装
警告：检测到依赖关系环：
警告：phonon-qt5-gstreamer 将在它 phonon-qt5 的依赖关系之前被安装
警告：检测到依赖关系环：
警告：lib32-harfbuzz 将在它 lib32-freetype2 的依赖关系之前被安装
警告：检测到依赖关系环：
警告：lib32-keyutils 将在它 lib32-krb5 的依赖关系之前被安装
警告：检测到依赖关系环：
警告：lib32-mesa 将在它 lib32-libglvnd 的依赖关系之前被安装
警告：检测到依赖关系环：
警告：lib32-nvidia-utils 将在它 lib32-libglvnd 的依赖关系之前被安装
警告：检测到依赖关系环：
警告：rubygems 将在它 ruby 的依赖关系之前被安装

软件包 (1515) accountsservice-0.6.54-1  acl-2.2.53-1
              adwaita-icon-theme-3.30.0-1  aircrack-ng-1.3-1
              alsa-firmware-1.0.29-2  alsa-lib-1.1.6-1  alsa-oss-1.1.6-1
              alsa-plugins-1.1.6-2  alsa-utils-1.1.6-1  amule-10998-4
              android-sdk-platform-tools-28.0.1-1  ant-1.10.5-1  aom-1.0.0-1
              apache-2.4.35-1  apache-ant-1.9.7-1 [删除]  apr-1.6.5-1
              apr-util-1.6.1-3  arch-install-scripts-19-1
              archlinux-keyring-20181003-1  archlinuxcn-keyring-20180905-1
              argon2-20171227-3  aria2-1.34.0-1  arj-3.10.22-12
              arm-none-eabi-binutils-2.31.1-1  arm-none-eabi-gcc-8.2.0-1
              arm-none-eabi-gdb-8.2-2  arm-none-eabi-newlib-3.0.0.20180831-1
              asar-0.14.3-1  assimp-4.1.0-1  at-3.1.23-1  at-spi2-atk-2.30.0-1
              at-spi2-core-2.30.0-2  atk-2.30.0-1  attica-5.50.0-1
              attica-qt4-0.4.2-3 [删除]  attica-qt5-5.40.0-1 [删除]
              attr-2.4.48-1  audacious-3.10-1  audacious-plugins-3.10-1
              audit-2.8.4-2  automake-1.16.1-1  avahi-0.7+16+g1cc2b8e-2
              avr-binutils-2.31.1-1  avr-gcc-8.2.0-1  avr-gdb-8.2-2
              axel-2.16.1-1  babl-0.1.56-1  baloo-5.50.0-1
              baloo-widgets-18.08.1-1  baobab-3.30.0-1  bash-4.4.023-1
              bash-completion-2.8-1  bind-tools-9.13.3-1  binutils-2.31.1-3
              bison-3.0.5-1  blas-3.8.0-2  bluefish-2.2.10-3  bluez-5.50-3
              bluez-libs-5.50-3  boost-libs-1.68.0-1  breeze-5.13.5-1
              breeze-icons-5.50.0-1  brltty-5.6-4  broadcom-wl-6.30.223.271-51
              brotli-1.0.6-1  btrfs-progs-4.17.1-1  bubblewrap-0.3.0-1
              busybox-1.29.3-1  bzip2-1.0.6-8  c-ares-1.14.0-1
              ca-certificates-20180821-1
              ca-certificates-cacert-20140824-4 [删除]
              ca-certificates-mozilla-3.39-1  ca-certificates-utils-20180821-1
              cabextract-1.6-3  cairo-1.15.14-1  cairo-perl-1.106-6
              calibre-3.32.0-1  cantarell-fonts-1:0.111-1  catfish-1.4.6-2
              cblas-3.8.0-2  ccache-3.4.3-1  cdparanoia-10.2-7
              cdrtools-3.02a09-1  celt0.5.1-0.5.1.3-4  ceph-13.2.1-2
              ceph-libs-13.2.1-2  certbot-0.27.1-1  cheese-3.30.0-1
              chmlib-0.40-5  chromaprint-1.4.3-2  chromium-69.0.3497.100-1
              cifs-utils-6.8-2  clang-7.0.0-1  clazy-1.4-3  clucene-2.3.3.4-10
              clutter-gst-3.0.26-1  cmake-3.12.3-1  colord-1.4.3-2
              compiler-rt-7.0.0-2  compositeproto-0.4.2-3 [删除]
              confuse-3.2.2-1  conky-1.10.8-2  convertlit-1.8-8
              coreutils-8.30-1  crypto++-7.0.0-1  cryptsetup-2.0.4-1
              cscope-15.8.a-4  ctags-5.8-6  curl-7.61.1-3  curlftpfs-0.9.2-7
              cython-0.28.5-1  damageproto-1.2.1-3 [删除]  db-5.3.28-4
              dbus-1.12.10-2  dbus-glib-0.110-1  dconf-0.30.0-1
              dconf-editor-3.30.2-1  ddrescue-1.23-1  deadbeef-0.7.2-4
              deluge-1.3.15+14+gb8e5ebe82-1
              desktop-file-utils-0.23+4+g92af410-1  device-mapper-2.02.181-1
              dhclient-4.4.1-4  dhcpcd-7.0.8-1  dialog-1:1.3_20180621-1
              diffstat-1.61-3  ding-libs-0.6.1-2  djvulibre-3.5.27-4
              dkms-2.5-3  dmenu-4.8-1  dmidecode-3.2-1  dmraid-1.0.0.rc16.3-11
              dmxproto-2.3.1-3 [删除]  docbook-xml-4.5-8  dolphin-18.08.1-2
              dolphin-plugins-18.08.1-1  dotconf-1.3-5
              double-conversion-3.1.1-1  doxygen-1.8.14-1  drbl-2.25.10-1
              dropbox-58.4.92-1  dvd+rw-tools-7.1-8  e2fsprogs-1.44.4-1
              eaglemode-0.93.2-1  eclipse-common-4.9-1  eclipse-cpp-4.9-1
              editorconfig-core-c-0.12.2-1  efibootmgr-16-1  efitools-1.8.1-1
              efivar-35-1  egl-wayland-1.1.0-1
              eglexternalplatform-1.0+3+g7c8f8e2-1  electron-2.0.9-1
              elfutils-0.174-1  enca-1.19-2  enchant-2.2.3-1  ethtool-1:4.18-1
              evince-3.30.1-1  exempi-2.4.5-1  exfat-utils-1.3.0-1  exim-4.91-2
              expat-2.2.6-1  expect-5.45.4-1  f2fs-tools-1.11.0-2
              faac-1.29.9.2-1  faad2-2.8.8-1  fakeroot-1.23-1  fbset-2.1-6
              fcgi-2.4.0-14  fcitx-4.2.9.6-1  fcitx-cloudpinyin-0.3.6-2
              fcitx-configtool-0.4.10-3  fcitx-gtk2-4.2.9.6-1
              fcitx-gtk3-4.2.9.6-1  fcitx-qt4-4.2.9.6-1  fcitx-qt5-1.2.3-3
              fcitx-ui-light-0.1.3-4  feh-2.28-1  ffmpeg-1:4.0.2-3
              ffmpegthumbnailer-2.2.0-2  fftw-3.3.8-1  file-5.34-1
              file-roller-3.30.0-1  filesystem-2018.8-1  filezilla-3.37.4-1
              firefox-62.0.3-1  fixesproto-5.0+9+g4292ec1-1 [删除]
              flashplugin-31.0.0.108-1  fltk-1.3.4.2-3  fluidsynth-1.1.11-2
              fontconfig-2:2.13.1+12+g5f5ec56-1  fontforge-20170731-2
              fontsproto-2.1.3-2 [删除]  fox-1:1.6.57-1
              foxitreader-2.4.1.0609-10  frameworkintegration-5.50.0-1
              freeimage-3.17.0-8  freerdp-1:2.0.0_rc3-1  freetype2-2.9.1-1
              frei0r-plugins-1.6.1-5  freshplayerplugin-0.3.9-2
              fribidi-1.0.5-1  fuse-common-3.2.6-1  fuse2-2.9.8-1
              fuse3-3.2.6-1  gamin-0.1.10-9  gavl-1.4.0-3  gawk-4.2.1-1
              gc-7.6.8-1  gcc-8.2.1+20180831-1  gcc-libs-8.2.1+20180831-1
              gcc-objc-8.2.1+20180831-1  gcc5-5.5.0-3
              gconf-3.2.6+11+g07808097-3  gcr-3.28.0-4  gdb-8.2-2
              gdb-common-8.2-2  gdbm-1.18-1  gdk-pixbuf2-2.38.0-1
              gedit-3.30.1-1  gegl-0.4.8-1  gendesk-0.7-2  genymotion-2.12.2-1
              geoclue2-2.4.12-1  geocode-glib-3.26.0-1  geoip-1.6.12-1
              geoip-database-20180403-1  ghostscript-9.25-3  giblib-1.2.4-7
              gimp-2.10.6-2  git-2.19.0-1  gl2ps-1.4.0-1  glade-perl-1.007-14
              glib-networking-2.58.0-1  glib-perl-1.326-2  glib2-2.58.1-1
              glib2-docs-2.58.1-1  glibc-2.28-4  glibmm-2.56.0-1  glm-0.9.9.2-1
              glproto-1.4.17-1 [删除]  glu-9.0.0-5  glusterfs-1:4.1.5-1
              gmime-2.6.23+4+g91dcee38-2  gmime3-3.2.0-3  gmtk-1.0.9-5
              gnome-autoar-0.2.3-1  gnome-bluetooth-3.28.2-1
              gnome-calculator-3.30.1-1  gnome-color-manager-3.30.0-1
              gnome-control-center-3.30.1-1  gnome-desktop-1:3.30.1-1
              gnome-disk-utility-3.30.1-1  gnome-keyring-1:3.28.2-1
              gnome-mime-data-2.18.0-8  gnome-mines-3.30.1.1-1
              gnome-mplayer-1.0.9-6  gnome-online-accounts-3.30.0-1
              gnome-perl-1.045-15  gnome-screenshot-3.30.0-1
              gnome-settings-daemon-3.30.1.2-1  gnome-system-monitor-3.30.0-1
              gnome-themes-extra-3.28-1
              gnome-themes-standard-3.22.3+13+ga993fdc0-1 [删除]
              gnome-vfs-nosmb-2.24.4-10  gnome-vfs-perl-1.082-11
              gnome-video-effects-0.4.3+13+g6867955-1
              gnomecanvas-perl-1.002-21  gnupg-2.2.10-1  gnustep-base-1.25.1-3
              gnustep-make-2.7.0-3  gnutls-3.5.19-2  go-2:1.11-1
              gobject-introspection-1.58.0+2+g1f1dd7f4-2
              gobject-introspection-runtime-1.58.0+2+g1f1dd7f4-2  gom-0.3.3-2
              goocanvas-2.0.4-2  goocanvas1-1.0.0-5
              google-chrome-69.0.3497.100-1  gparted-0.32.0-1  gperftools-2.7-1
              gpgme-1.11.1-2  gpm-1.20.7.r27.g1fd1941-1  gptfdisk-1.0.4-1
              graphene-1.8.2-1  graphite-1:1.3.12-1  graphviz-2.40.1-13
              grilo-0.3.6-1  grilo-plugins-0.3.8-1  grub-2:2.02-7
              gsettings-desktop-schemas-3.28.1-1  gsfonts-20180524-1
              gsm-1.0.18-1  gspell-1.8.1-1  gssproxy-0.8.0-1
              gst-libav-1.14.4-1  gst-plugins-bad-1.14.4-1
              gst-plugins-base-1.14.4-1  gst-plugins-base-libs-1.14.4-1
              gst-plugins-good-1.14.4-1  gst-plugins-ugly-1.14.4-1
              gstreamer-1.14.4-1  gthumb-3.6.2-1  gtk-doc-1.29-1
              gtk-sharp-2-2.12.45-1
              gtk-update-icon-cache-3.24.1+8+g220f77d8c1-1  gtk2-2.24.32-1
              gtk2-perl-1.24992-2  gtk3-3.24.1+8+g220f77d8c1-1
              gtk3-print-backends-3.22.26-1 [删除]  gtkglext-1.2.0-11
              gtkimageview-1.6.4-5  gtksourceview3-3.24.9-2  gtkwave-3.3.94-1
              gts-0.7.6-5  guile-2.2.4-1  gulp-4.0.0-1  gvfs-1.38.1-1
              gvfs-mtp-1.38.1-1  gvfs-smb-1.38.1-1  gvim-8.1.0374-1  gzip-1.9-1
              hardinfo-0.5.1-8  harfbuzz-1.9.0-1  harfbuzz-icu-1.9.0-1
              haveged-1.9.4-3  hddtemp-0.3.beta15.53-1  hdf5-1.10.3-2
              hidapi-0.8.0rc1-3  hspell-1.4-1  htop-2.2.0-2
              http-parser-2.8.1-1  hunspell-en_US-2018.04.16-5
              hwids-20180518-1  hyphen-2.8.8-2  i2c-tools-4.0-2
              iana-etc-20180221-1  icoutils-0.32.3-1  icu-62.1-1  idnkit-1.0-4
              ilmbase-2.3.0-1  imagemagick-7.0.8.12-1  imlib2-1.5.1-1
              iniparser-4.1-1  inputproto-2.3.2-1 [删除]  intel-tbb-2019-1
              intel-ucode-20180807.a-1  iproute2-4.18.0-1  iptables-1:1.6.2-3
              iputils-20180629.f6aac8d-2  iso-codes-3.79-1  iw-4.14-1
              jack-0.125.0-5  jansson-2.11-1  jbig2dec-0.15-1  jdk-11-2
              jemalloc-1:5.1.0-1  jfsutils-1.1.15-6  js52-52.9.0-1
              json-c-0.13.1-2  json-glib-1.4.4-1  jsoncpp-1.8.4-2  jwm-2.3.7-1
              jxrlib-0.2.1-3  k3b-1:18.08.1-1  kactivities-5.50.0-1
              kactivitymanagerd-5.13.5-1  karchive-5.50.0-1  kauth-5.50.0-1
              kbookmarks-5.50.0-1  kbproto-1.0.7-1 [删除]  kcmutils-5.50.0-1
              kcodecs-5.50.0-1  kcompletion-5.50.0-1  kconfig-5.50.0-1
              kconfigwidgets-5.50.0-1  kcoreaddons-5.50.0-1  kcrash-5.50.0-1
              kdbusaddons-5.50.0-1  kde-cli-tools-5.13.5-1
              kdeclarative-5.50.0-1  kdecoration-5.13.5-1  kded-5.50.0-1
              kdelibs4support-5.50.0-1  kdesu-5.50.0-1  kdnssd-5.50.0-1
              kemoticons-5.50.0-1  keyutils-1.5.11-1  kfilemetadata-5.50.0-1
              kglobalaccel-5.50.0-1  kguiaddons-5.50.0-1  kholidays-1:5.50.0-1
              khtml-5.50.0-1  ki18n-5.50.0-1  kicad-5.0.0-2
              kiconthemes-5.50.0-1  kidletime-5.50.0-1  kinit-5.50.0-1
              kio-5.50.0-1  kio-extras-18.08.1-2  kirigami2-5.50.0-1
              kitemmodels-5.50.0-1  kitemviews-5.50.0-1  kjobwidgets-5.50.0-1
              kjs-5.50.0-1  kjsembed-5.50.0-1  kmod-25-1  knewstuff-5.50.0-1
              knotifications-5.50.0-1  knotifyconfig-5.50.0-1
              kpackage-5.50.0-1  kparts-5.50.0-1  kpty-5.50.0-1  krb5-1.16.1-1
              krunner-5.50.0-1  kscreenlocker-5.13.5-1  kservice-5.50.0-1
              ktexteditor-5.50.0-1  ktextwidgets-5.50.0-1
              kuiserver-5.11.3-1 [删除]  kunitconversion-5.50.0-1
              kwallet-5.50.0-1  kwayland-5.50.0-1  kwidgetsaddons-5.50.0-1
              kwin-5.13.5-2  kwindowsystem-5.50.0-1  kwplayer-3.5.2-2.2
              kxmlgui-5.50.0-1  kyotocabinet-1.2.76-6  l-smash-2.14.5-1
              ladspa-1.13-7  lame-3.100-2  lapack-3.8.0-2  lbzip2-2.5-4
              lcms2-2.9-1  ldb-1:1.3.6-1  ldns-1.7.0-4  lensfun-0.3.2-7
              less-530-1  lftp-4.8.4-2  lib32-acl-2.2.53-1
              lib32-alsa-lib-1.1.6-1  lib32-alsa-plugins-1.1.6-1
              lib32-at-spi2-atk-2.30.0-1  lib32-at-spi2-core-2.30.0-1
              lib32-atk-2.30.0-1  lib32-attr-2.4.48-1  lib32-bzip2-1.0.6-3
              lib32-cairo-1.15.14-1  lib32-colord-1.4.3-1  lib32-curl-7.61.1-1
              lib32-db-5.3.28-4  lib32-dbus-1.12.10-1  lib32-dbus-glib-0.110-1
              lib32-dconf-0.30.0-1  lib32-e2fsprogs-1.44.4-1
              lib32-expat-2.2.6-1  lib32-fakeroot-1.23-1
              lib32-fontconfig-2:2.13.1+12+g5f5ec56-1  lib32-freetype2-2.9.1-1
              lib32-fribidi-1.0.5-1  lib32-gcc-libs-8.2.1+20180831-1
              lib32-gdk-pixbuf2-2.38.0-1  lib32-glib-networking-2.58.0-1
              lib32-glib2-2.58.1-1  lib32-glibc-2.28-4  lib32-glu-9.0.0-4
              lib32-gnutls-3.5.19-2  lib32-gst-plugins-base-libs-1.14.3-1
              lib32-gstreamer-1.14.3-1  lib32-gtk2-2.24.32-1
              lib32-gtk3-3.24.1-1  lib32-harfbuzz-1.9.0-1
              lib32-harfbuzz-icu-1.9.0-1  lib32-icu-62.1-1
              lib32-imlib2-1.5.1-1  lib32-jansson-2.11-1  lib32-json-c-0.13.1-2
              lib32-json-glib-1.4.4-1  lib32-keyutils-1.5.11-1
              lib32-krb5-1.16.1-1  lib32-lcms2-2.9-1
              lib32-libcanberra-0.30+2+gc0620e4-1  lib32-libcups-2.2.7-1
              lib32-libcurl-compat-7.61.1-1  lib32-libcurl-gnutls-7.61.1-1
              lib32-libdatrie-0.2.12-1  lib32-libdrm-2.4.94-1
              lib32-libelf-0.174-1  lib32-libepoxy-1.5.2-1
              lib32-libffi-3.2.1-2  lib32-libgcrypt-1.8.3-1
              lib32-libglvnd-1.1.0-1  lib32-libgpg-error-1.32-1
              lib32-libgusb-0.3.0-1  lib32-libice-1.0.9-3  lib32-libidn-1.35-1
              lib32-libidn2-2.0.5-1  lib32-libiec61883-1.2.0-2
              lib32-libjpeg-turbo-2.0.0-1  lib32-libjpeg6-turbo-1.5.3-1
              lib32-libldap-2.4.46-1  lib32-libltdl-2.4.6+40+g6ca5e224-4
              lib32-libnm-glib-1.14.0-1  lib32-libnsl-1.2.0-1
              lib32-libogg-1.3.3-2  lib32-libpcap-1.9.0-1
              lib32-libpciaccess-0.14-1  lib32-libpng-1.6.35-1
              lib32-libpng12-1.2.59-1  lib32-libpsl-0.20.2-1
              lib32-libpulse-12.2-1  lib32-librsvg-2.44.6-1
              lib32-libsoup-2.64.1-1  lib32-libtasn1-4.13-1
              lib32-libthai-0.1.27-1  lib32-libtheora-1.1.1-11
              lib32-libtiff-4.0.9-1  lib32-libtirpc-1.1.4-1
              lib32-libunistring-0.9.10-1  lib32-libusb-1.0.22-1
              lib32-libva-2.3.0-1  lib32-libva-intel-driver-2.2.0-1
              lib32-libva1-1.8.3-1  lib32-libvdpau-1.1.1-3
              lib32-libvorbis-1.3.6-1  lib32-libvpx-1.7.0-1
              lib32-libwebp-1.0.0-1  lib32-libwrap-7.6.24-3
              lib32-libx11-1.6.6-1  lib32-libxcb-1.13-1
              lib32-libxcomposite-0.4.4-3  lib32-libxcursor-1.1.15-1
              lib32-libxdamage-1.1.4-3  lib32-libxdmcp-1.1.2-2
              lib32-libxext-1.3.3-2  lib32-libxft-2.3.2-2
              lib32-libxinerama-1.1.4-1  lib32-libxkbcommon-0.8.2-1
              lib32-libxml2-2.9.8-4  lib32-libxmu-1.1.2-2
              lib32-libxshmfence-1.3-1  lib32-libxslt-1.1.32+3+g32c88216-1
              lib32-libxss-1.2.3-1  lib32-libxt-1.1.5-2
              lib32-libxxf86vm-1.1.4-2  lib32-llvm-libs-7.0.0-1
              lib32-mesa-18.2.1-2  lib32-mesa-demos-8.4.0-1
              lib32-mpg123-1.25.10-1  lib32-ncurses-6.1-3  lib32-nettle-3.4-1
              lib32-nspr-4.20-1  lib32-nss-3.39-1  lib32-nvidia-utils-410.57-1
              lib32-ocl-icd-2.2.12-1  lib32-openal-1.19.0-2
              lib32-openssl-1:1.1.1-1  lib32-openssl-1.0-1.0.2.p-1
              lib32-orc-0.4.28-1  lib32-p11-kit-0.23.14-1  lib32-pam-1.3.1-1
              lib32-pango-1.42.4-1  lib32-pcre-8.42-1  lib32-polkit-0.114-1
              lib32-qt4-4.8.7-14  lib32-readline-7.0.005-1  lib32-sdl2-2.0.8-9
              lib32-sdl2_image-2.0.3-1  lib32-sdl_ttf-2.0.11-4
              lib32-speexdsp-1.2rc3-2  lib32-sqlite-3.25.2-1
              lib32-systemd-239.2-1  lib32-tcl-8.6.8-2  lib32-tdb-1.3.16-1
              lib32-util-linux-2.32.1-1  lib32-v4l-utils-1.14.2-1
              lib32-wayland-1.16.0-1  lib32-xz-5.2.4-1  libabw-0.1.2-1
              libaec-1.0.2-1  libaio-0.3.111-1  libao-1.2.2-2
              libarchive-3.3.3-1  libassuan-2.5.1-1  libatasmart-0.19-4
              libatomic_ops-7.6.6-1  libblockdev-2.20-1  libbluray-1.0.2-2
              libbs2b-3.1.0-6  libbsd-0.9.1-1  libbytesize-1.4-1
              libcacard-2.6.1-1  libcap-ng-0.7.9-1  libcddb-1.3.2-5
              libcdio-2.0.0-1  libcdio-paranoia-10.2+0.94+2-2  libcdr-0.1.4-4
              libcmis-0.5.1-10  libcue-2.2.1-1  libcups-2.2.8-3
              libcurl-compat-7.61.1-1  libcurl-gnutls-7.61.1-1
              libdaemon-0.14-4  libdatrie-0.2.12-1  libdca-0.0.6-1
              libde265-1.0.3-1  libdmx-1.1.4-1  libdrm-2.4.94-1
              libdvbpsi-1:1.3.2-1  libdvdnav-6.0.0-1  libdvdread-6.0.0-1
              libe-book-0.1.3-3  libebml-1.3.6-1  libedit-20180525_3.1-1
              libelf-0.174-1  libepoxy-1.5.3-1  libepubgen-0.1.1-1
              libetonyek-0.1.8-1  libevdev-1.5.9-1  libfbclient-2.5.8.27089-2
              libfdk-aac-0.1.6-1  libfilezilla-0.14.0-1  libfm-1.3.0.2-1
              libfm-extra-1.3.0.2-1  libfm-gtk2-1.3.0.2-1  libfontenc-1.1.3-2
              libfreehand-0.1.2-1  libftdi-1.4-2  libftdi-compat-0.20-5
              libgcrypt-1.8.3-1  libgda-5.2.4+39+g3f70d4fce-2  libgdiplus-5.6-1
              libgee-0.20.1-2  libgexiv2-0.10.8-2  libgit2-1:0.27.4-1
              libglade-2.6.4-6  libglvnd-1.1.0-1  libgme-0.6.2-1
              libgnome-games-support-1.4.2-1  libgnome-keyring-3.12.0-3
              libgnomecanvas-2.30.3-4  libgnomekbd-3.26.0+5+g1c1b585-1
              libgooglepinyin-0.1.2-4  libgpg-error-1.32-1  libgphoto2-2.5.19-1
              libgpod-0.8.3-5  libgsf-1.14.44-1  libgssglue-0.4-3
              libgtop-2.38.0+13+gcab8791f-1  libguess-1.2-2  libgusb-0.3.0-1
              libgweather-3.28.2-1  libheif-1.3.2-1  libibus-1.5.19-1
              libical-3.0.4-1  libice-1.0.9-2  libid3tag-0.15.1b-9
              libidn-1.35-1  libidn2-2.0.5-1  libiec61883-1.2.0-5
              libieee1284-0.2.11-7  libimobiledevice-1.2.0+66+g5a85432-2
              libinput-1.12.0-2  libiodbc-3.52.12-2  libiptcdata-1.0.4-4
              libiscsi-1.18.0-1  libisoburn-1.4.8-2  libixion-0.13.0-4
              libjpeg-turbo-2.0.0-1  libjpeg6-turbo-1.5.3-1  libkate-0.4.1-6
              libkcddb-18.08.1-1  libksysguard-5.13.5-1  libldap-2.4.46-2
              liblqr-0.4.2-2  libmad-0.15.1b-8  libmagick-7.0.8.12-1
              libmariadbclient-10.1.36-1  libmatroska-1.4.9-1
              libmediaart-1.9.4+1+ga704d0b-1  libmm-glib-1.8.2-1
              libmng-2.0.3-2  libmp4v2-2.0.0-5  libmpc-1.1.0-1
              libmpdclient-2.15-1  libmpeg2-0.5.1-6  libmspub-0.1.4-3
              libmtp-1.1.15-1  libmusicbrainz5-5.1.0-3  libmwaw-0.3.14-1
              libmypaint-1.3.0-6  libnautilus-extension-3.30.1-1  libndp-1.7-1
              libnewt-0.52.20-2  libnfs-3.0.0-2  libnftnl-1.1.1-1
              libnghttp2-1.33.0-1  libnice-0.1.14+70+gfb2f1f7-1
              libnm-1.14.1dev+13+g0d3234478-1
              libnm-glib-1.14.1dev+13+g0d3234478-1  libnm-gtk-1.8.18-2
              libnma-1.8.18-2  libnsl-1.2.0-1  libnumbertext-1.0-1
              libodfgen-0.1.7-1  libogg-1.3.3-3  libomxil-bellagio-0.9.3-2
              liborcus-0.13.4-4  libosinfo-1.2.0-1  libpagemaker-0.0.4-1
              libpcap-1.9.0-1  libpeas-1.22.0-3  libpgm-5.2.122-3
              libplist-2.0.0+11+gec9ba8b-2  libpng-1.6.35-1  libpng12-1.2.59-1
              libproxy-0.4.15-8  libpsl-0.20.2-1  libpulse-12.2-2
              libqalculate-2.6.2-1  libquvi-0.9.4-5
              libquvi-scripts-0.9.20131130-4  libqxp-0.0.1-3  libraqm-0.5.0-1
              libraw-0.19.0-1  libreoffice-fresh-6.1.1-3  librevenge-0.0.4-2
              librsvg-2:2.44.6-1  libsasl-2.1.26-13  libseccomp-2.3.3-1
              libsecret-0.18.6-1  libsm-1.2.2-3  libsodium-1.0.16-1
              libsoup-2.64.1-1  libsoxr-0.1.3-1  libspeechd-0.8.8-2
              libspiro-1:0.5.20150702-2  libsrtp-1:2.2.0-1  libssh-0.8.3-1
              libstaroffice-0.0.6-1  libstdc++5-3.3.6-6  libstroke-0.5.1-7
              libsynctex-2018.47465-3  libsystemd-239.2-1  libtar-1.2.20-4
              libtasn1-4.13-1  libteam-1.27-2  libthai-0.1.28-1
              libtheora-1.1.1-4  libtiff-4.0.9-2  libtiger-0.3.4-5
              libtirpc-1.1.4-1  libtool-2.4.6+42+gb88cebd5-2
              libtorrent-0.13.7-1  libtorrent-rasterbar-1:1.1.9-2
              libunicodenames-1.2.2-1  libunique-1.1.6-7  libunistring-0.9.10-1
              libunrar-1:5.6.8-1  libupnp-1.6.25-1  liburcu-0.10.1-1
              libusb-1.0.22-1  libusb-compat-0.1.5-2  libutempter-1.1.6-3
              libutf8proc-2.2.0-1  libutil-linux-2.32.1-2  libuv-1.23.1-1
              libva-2.3.0-1  libva-intel-driver-2.2.0-1  libva1-1.8.3-1
              libvisio-0.1.6-4  libvisual-0.4.0-7  libvncserver-0.9.11-3
              libvoikko-4.1.1-2  libvorbis-1.3.6-1  libvpx-1.7.0-1
              libwacom-0.31-1  libwbclient-4.8.5-1  libwebp-1.0.0-1
              libwnck-2.31.0-2  libwnck3-3.30.0-1  libwps-0.4.10-1
              libwrap-7.6.24-4  libx11-1.6.6-1  libx264-2:148.20170521-1 [删除]
              libx264-all-2:148.20170521-1 [删除]  libxau-1.0.8-3
              libxaw-1.0.13-2  libxcb-1.13-1  libxcomp-3.5.99.16-1
              libxcomposite-0.4.4-3  libxcursor-1.1.15-1  libxdamage-1.1.4-3
              libxdmcp-1.1.2-2  libxext-1.3.3-2  libxfce4util-4.13.2-1
              libxfixes-5.0.3-2  libxfont2-2.0.3-1  libxft-2.3.2-2
              libxinerama-1.1.4-1  libxkbcommon-0.8.2-1
              libxkbcommon-x11-0.8.2-1  libxkbfile-1.0.9-2  libxkbui-1.0.2-6
              libxklavier-5.4-2  libxml2-2.9.8-5  libxmu-1.1.2-2  libxp-1.0.3-2
              libxrandr-1.5.1-2  libxshmfence-1.3-1  libxss-1.2.3-1
              libxt-1.1.5-2  libxxf86dga-1.1.4-2  libxxf86vm-1.1.4-2
              libyaml-0.2.1-1  libzip-1.5.1-1  libzmf-0.0.2-4  liferea-1.12.5-3
              linux-4.18.12.arch1-1  linux-api-headers-4.17.11-1
              linux-firmware-20180825.fea76a0-1  linux-headers-4.18.12.arch1-1
              linux-lts-4.14.72-1  linux-lts-headers-4.14.72-1  lirc-1:0.10.1-2
              llvm-libs-7.0.0-1  lm_sensors-3.4.0+5176+dcf23676-1
              lmdb-0.9.22-1  logrotate-3.14.0-1  lrzip-0.631-2
              lsb-release-1.4-15  lua-5.3.5-1  lua-expat-1.3.0-4  lua51-5.1.5-7
              lua52-5.2.4-3  lua52-expat-1.3.0-4  lua52-lpeg-1.0.1-2
              lua52-luajson-1.3.4-1  lvm2-2.02.181-1  lxdm-0.5.3-6
              lxterminal-0.3.1-3  lynx-2.8.9-2  lz4-1:1.8.3-1
              mailcap-2.1.48+14+g5811758-1  man-db-2.8.4-1  man-pages-4.16-2
              mariadb-10.1.36-1  mariadb-clients-10.1.36-1
              masterpdfeditor-5.1.42-1  mcpp-2.7.2-6  media-player-info-23-1
              menu-cache-1.1.0-1  mesa-18.2.1-2  mesa-demos-8.4.0-1
              metis-5.1.0.p3-1  milou-5.13.5-1  mime-types-9-1 [删除]
              minicom-2.7.1-2  miniupnpc-2.1-2  minizip-1:1.2.11-3
              mkinitcpio-busybox-1.29.3-1  mkinitcpio-nfs-utils-0.3-6
              mldonkey-3.1.6-2  mlocate-0.26.git.20170220-1  mono-5.14.0.177-1
              mono-addins-1.3.3-2  mozilla-common-1.4-5  mpc-0.30-1
              mpfr-4.0.1-1  mpg123-1.25.10-1  mplayer-38101-2  mpv-1:0.29.1-2
              mtd-utils-2.0.1-1  mtdev-1.1.5-2  mutagen-1.41.1-1
              mypaint-brushes-1.3.0-2  nano-3.1-1  nasm-2.13.03-1
              nautilus-3.30.1-1  nautilus-sendto-3.8.6+14+ge8a3604-1
              nautilus-terminal-1.1-2  nbd-3.18-1  ncdu-1.13-1  ncurses-6.1-3
              ncurses5-compat-libs-6.1-1  ndctl-62-2  neon-0.30.2-3
              net-snmp-5.7.3-9  net-tools-1.60.20180212git-1  netcdf-4.6.1-2
              netctl-1.18-1  nettle-3.4-1  network-manager-applet-1.8.18-2
              networkmanager-1.14.1dev+13+g0d3234478-1
              networkmanager-openconnect-1.2.4-3
              networkmanager-openvpn-1.8.6-1  networkmanager-pptp-1.2.6-1
              networkmanager-vpnc-1.2.6-1  nfs-utils-2.3.3-1  nfsidmap-2.3.3-1
              ngspice-28-1  nilfs-utils-2.2.7-1  nm-connection-editor-1.8.18-2
              node-gyp-3.8.0-1  nodejs-10.11.0-1  noto-fonts-20180322-1
              npm-6.4.1-1  npth-1.6-1  nrg2iso-0.4-10  nspr-4.20-1  nss-3.39-1
              ntfs-3g-2017.3.23-3  numactl-2.0.12-1  nvidia-utils-410.57-3
              nxproxy-3.5.99.16-1  oath-toolkit-2.6.2-4  obconf-2.0.4-5
              ocl-icd-2.2.12-1  openal-1.19.0-2  openbox-3.6.1-4
              openbox-themes-1.0.2-4  opencascade-7.3.0-3
              opencl-nvidia-410.57-3  opencv-3.4.3-3  openexr-2.3.0-1
              openh264-1.8.0-1  openjpeg-1.5.2-2  openjpeg2-2.3.0-3
              openssh-7.8p1-1  openssl-1.1.1-1  openssl-1.0-1.0.2.p-1
              openvpn-2.4.6-1  opera-56.0.3051.31-1  optipng-0.7.7-1
              orbit2-2.14.19-7  orc-0.4.28-1  osinfo-db-20180903-1
              oxygen-icons-1:5.50.0-1  p11-kit-0.23.14-1  p7zip-16.02-5
              package-query-1.9-3  pacman-5.1.1-1  pacman-mirrorlist-20180912-1
              pam-1.3.1-1  pango-1.42.4-1  pango-perl-1.227-9
              partclone-0.2.89-3  partimage-0.6.9-12  patch-2.7.6-3
              pbzip2-1.1.13-2  pcb-1:4.1.2-1  pciutils-3.6.1-1  pcmanfm-1.3.0-1
              pcre-8.42-1  pcre2-10.32-1  pcsclite-1.8.23-3
              pepper-flash-31.0.0.108-1  perl-5.28.0-1  perl-archive-zip-1.64-1
              perl-bit-vector-7.4-7  perl-canary-stability-2012-4
              perl-carp-clan-6.06-4  perl-common-sense-3.74-4
              perl-data-dump-1.23-4  perl-data-random-0.13-2
              perl-date-calc-6.4-4  perl-digest-hmac-1.03-6
              perl-digest-sha1-2.13-11  perl-encode-locale-1.05-4
              perl-error-0.17026-2  perl-extutils-depends-0.405-4
              perl-extutils-pkgconfig-1.16-4  perl-file-basedir-0.08-2
              perl-file-copy-recursive-0.44-2  perl-file-desktopentry-0.22-4
              perl-file-listing-6.04-5  perl-file-mimeinfo-0.29-1
              perl-file-slurp-tiny-0.004-4  perl-file-which-1.22-2
              perl-gd-2.69-1  perl-gnome2-wnck-0.16-17  perl-goo-canvas-0.06-11
              perl-gtk2-imageview-0.05-12  perl-gtk2-unique-0.05-23
              perl-html-form-6.03-5  perl-html-parser-3.72-6
              perl-html-tagset-3.20-7  perl-http-cookies-6.04-3
              perl-http-daemon-6.01-6  perl-http-date-6.02-5
              perl-http-message-6.18-2  perl-http-negotiate-6.01-5
              perl-http-server-simple-0.52-1  perl-image-exiftool-11.11-1
              perl-io-html-1.001-4  perl-io-socket-ssl-2.056-2
              perl-ipc-system-simple-1.25-4  perl-json-2.97001-1
              perl-json-xs-3.03-5  perl-libwww-6.33-2
              perl-locale-gettext-1.07-6  perl-lwp-mediatypes-6.02-5
              perl-lwp-protocol-https-6.07-2  perl-mailtools-2.20-2
              perl-mouse-2.5.6-1  perl-mozilla-ca-20180117-2
              perl-net-dbus-1.1.0-7  perl-net-dropbox-api-1.9-6
              perl-net-http-6.18-2  perl-net-oauth-0.28-8
              perl-net-ssleay-1.85-2  perl-parse-yapp-1.05-9
              perl-path-class-0.37-4  perl-proc-processtable-0.55-2
              perl-proc-simple-1.32-4  perl-sort-naturally-1.03-4
              perl-test-pod-1.52-2  perl-test-warn-0.34-1
              perl-text-iconv-1.7-15  perl-timedate-2.30-5
              perl-tree-dag-node-1.31-1  perl-try-tiny-0.30-2
              perl-types-serialiser-1.0-4  perl-uri-1.74-2
              perl-www-mechanize-1.88-1  perl-www-robotrules-6.02-5
              perl-x11-protocol-0.56-9  perl-xml-parser-2.44-7
              perl-xml-sax-1.00-1  perl-xml-simple-2.25-2  perl-xml-twig-3.52-4
              perl-yaml-tiny-1.73-2  phodav-2.2-2  phonon-qt5-4.10.1-2
              phonon-qt5-gstreamer-4.9.0-5  php-7.2.10-1  php-apache-7.2.10-1
              php-cgi-7.2.10-1  phpmyadmin-4.8.3-1  pigz-2.4-1
              pinentry-1.1.0-4  pixz-1.0.6-2  pkcs11-helper-1.23-1
              pkg-config-0.29.2-1 [删除]  pkgconf-1.5.3-1  pkgfile-18-2
              plasma-framework-5.50.0-1  plasma-integration-5.13.5-1
              plasma-workspace-5.13.5-2  podofo-0.9.6-2
              polkit-0.115+3+g8638ec5-1  polkit-qt5-0.112.0+git20180107-2
              poppler-0.67.0-1  poppler-data-0.4.9-1  poppler-glib-0.67.0-1
              poppler-qt5-0.67.0-1  pptpclient-1.10.0-1
              printproto-1.0.5-3 [删除]  prison-5.50.0-1  procps-ng-3.3.15-1
              progsreiserfs-0.3.0.5-9  protobuf-3.6.1-1  pth-2.0.7-6
              pulseaudio-12.2-2  pulseaudio-alsa-2-4
              pulseaudio-bluetooth-12.2-2  putty-0.70-2
              pygobject-devel-3.30.1-3  pygobject2-devel-2.28.7-2
              pygtk-2.24.0-8  pyqt5-common-5.11.3-1  python-3.7.0-4
              python-acme-0.27.1-1  python-anytree-2.4.3-2
              python-appdirs-1.4.3-2  python-asn1crypto-0.24.0-2
              python-beaker-1.10.0-2  python-cairo-1.17.0-2
              python-cffi-1.11.5-2  python-chardet-3.0.4-2
              python-configargparse-0.13.0-2  python-configobj-5.0.6-4
              python-crypto-2.6.1-5 [删除]  python-cryptography-2.3.1-1
              python-cssselect-1.0.3-2  python-dbus-1.2.8-2
              python-dbus-common-1.2.8-2  python-docopt-0.6.2-5
              python-entrypoints-0.2.3-3  python-future-0.16.0-3
              python-gobject-3.30.1-3  python-html2text-2018.1.9-2
              python-idna-2.7-3  python-jeepney-0.4-1  python-josepy-1.1.0-2
              python-keyring-15.1.0-1  python-keyutils-0.5-3
              python-lxml-4.2.5-1  python-mako-1.0.7-2  python-markupsafe-1.0-2
              python-mock-2.0.0-4  python-packaging-18.0-1
              python-parsedatetime-2.4-2  python-pbr-4.3.0-1
              python-pexpect-4.6.0-2  python-ply-3.11-2
              python-ptyprocess-0.6.0-2  python-pyasn1-0.4.4-1
              python-pycparser-2.19-1  python-pycryptodome-3.6.6-2
              python-pygments-2.2.0-2  python-pyinotify-0.9.6-4
              python-pyopenssl-18.0.0-2  python-pyparsing-2.2.2-1
              python-pyqt5-5.11.3-1  python-pyrfc3339-1.1-2
              python-pyserial-3.4-2  python-pytz-2018.5-2
              python-requests-2.19.1-2  python-requests-toolbelt-0.8.0-3
              python-secretstorage-3.1.0-1  python-setuptools-1:40.4.3-1
              python-sip-4.19.13-1  python-sip-pyqt5-4.19.13-1
              python-six-1.11.0-3  python-unidecode-1.0.22-2
              python-urllib3-1.23-2  python-werkzeug-0.14.1-3
              python-xdg-0.26-2  python-yaml-3.13-2
              python-zope-component-4.4.1-2  python-zope-event-4.3.0-2
              python-zope-interface-4.5.0-2  python2-2.7.15-2
              python2-appdirs-1.4.3-2  python2-apsw-3.24.0-2
              python2-asn1crypto-0.24.0-2  python2-attrs-18.2.0-1
              python2-automat-0.7.0-2  python2-backports-1.0-1
              python2-backports.functools_lru_cache-1.5-1
              python2-backports.unittest_mock-1.2.1-1  python2-bcrypt-3.1.4-2
              python2-beaker-1.10.0-2  python2-beautifulsoup4-4.6.3-1
              python2-cairo-1.17.0-2  python2-cffi-1.11.5-2
              python2-chardet-3.0.4-2  python2-cheroot-6.5.2-1
              python2-cherrypy-17.4.0-1  python2-click-7.0-1
              python2-constantly-15.1.0-3  python2-contextlib2-0.5.5-1
              python2-crypto-2.6.1-5 [删除]  python2-cryptography-2.3.1-1
              python2-cssselect-1.0.3-2  python2-cssutils-1.0.2-2
              python2-dateutil-2.7.3-2  python2-dbus-1.2.8-2
              python2-dnspython-1.15.0-3  python2-dukpy-0.3-3
              python2-funcsigs-1.0.2-1  python2-gobject-3.30.1-3
              python2-gobject2-2.28.7-2  python2-html5-parser-0.4.5-3
              python2-html5lib-1.0.1-3  python2-hyperlink-18.0.0-2
              python2-idna-2.7-3  python2-incremental-17.5.0-2
              python2-ipaddress-1.0.22-1  python2-jaraco-2018.09.08-1
              python2-jinja-2.10-2  python2-logutils-0.3.5-3
              python2-lxml-4.2.5-1  python2-mako-1.0.7-2
              python2-markupsafe-1.0-2  python2-mechanize-1:0.3.7-1
              python2-mock-2.0.0-4  python2-more-itertools-4.3.0-1
              python2-msgpack-0.5.6-2  python2-nautilus-1.2.2-2
              python2-netifaces-0.10.7-2  python2-notify-0.1.1-14
              python2-olefile-0.46-1  python2-packaging-18.0-1
              python2-pbr-4.3.0-1  python2-pecan-1.3.2-3
              python2-pillow-5.2.0-3  python2-ply-3.11-2  python2-portend-2.3-2
              python2-prettytable-0.7.2-9  python2-psutil-5.4.7-1
              python2-pyasn1-0.4.4-1  python2-pycparser-2.19-1
              python2-pycryptodome-3.6.6-2  python2-pygments-2.2.0-2
              python2-pyhamcrest-1.9.0-3  python2-pyopenssl-18.0.0-2
              python2-pyparsing-2.2.2-1  python2-pyqt5-5.11.3-1
              python2-pytz-2018.5-2  python2-regex-2018.08.29-1
              python2-repoze.lru-0.7-2  python2-requests-2.19.1-2
              python2-routes-2.4.1-2  python2-setuptools-1:40.4.3-1
              python2-singledispatch-3.4.0.3-3  python2-sip-4.19.13-1
              python2-sip-pyqt5-4.19.13-1  python2-six-1.11.0-3
              python2-tempora-1.13-2  python2-twisted-18.7.0-2
              python2-unrardll-0.1.3-4  python2-urllib3-1.23-2
              python2-urwid-2.0.1-2  python2-waitress-1.1.0-2
              python2-webencodings-0.5.1-2  python2-webob-1.8.2-2
              python2-webtest-2.0.32-1  python2-werkzeug-0.14.1-3
              python2-wxpython3-3.0.2.0-1  python2-xdg-0.26-2
              python2-zc.lockfile-1.3.0-1  python2-zope-interface-4.5.0-2
              qbs-1.12.1-1  qca-2.1.3-1  qca-qt4-2.1.3-4 [删除]
              qca-qt5-2.1.3-4 [删除]  qemu-3.0.0-2  qemu-arch-extra-3.0.0-2
              qemu-block-gluster-3.0.0-2  qemu-block-iscsi-3.0.0-2
              qemu-block-rbd-3.0.0-2  qemu-guest-agent-3.0.0-2
              qqc2-desktop-style-5.50.0-1  qrencode-4.0.2-1  qt4-4.8.7-25
              qt5-3d-5.11.2-1  qt5-base-5.11.2-1  qt5-canvas3d-5.11.2-1
              qt5-connectivity-5.11.2-1  qt5-declarative-5.11.2-1
              qt5-doc-5.11.2-1  qt5-examples-5.11.2-1
              qt5-graphicaleffects-5.11.2-1  qt5-imageformats-5.11.2-1
              qt5-location-5.11.2-1  qt5-multimedia-5.11.2-1
              qt5-quickcontrols-5.11.2-1  qt5-quickcontrols2-5.11.2-1
              qt5-script-5.11.2-1  qt5-sensors-5.11.2-1
              qt5-serialport-5.11.2-1  qt5-speech-5.11.2-1  qt5-svg-5.11.2-1
              qt5-tools-5.11.2-2  qt5-translations-5.11.2-1
              qt5-wayland-5.11.2-1  qt5-webchannel-5.11.2-1
              qt5-webengine-5.11.2-1  qt5-webkit-5.212.0alpha2-20
              qt5-websockets-5.11.2-1  qt5-x11extras-5.11.2-1
              qt5-xmlpatterns-5.11.2-1  qtcreator-4.7.1-3  qtwebkit-2.3.4-7
              randrproto-1.5.0-1 [删除]  raptor-2.0.15-9  rar-5.6.1-2
              rasqal-1:0.9.33-2  re2-20180901-1  readline-7.0.005-1
              recode-3.7-1  recordproto-1.14.2-2 [删除]  refind-efi-0.11.3-1
              reiserfsprogs-3.6.27-1  remmina-1:1.2.31.4-2
              renderproto-0.11.1-3 [删除]  rhash-1.3.6-1
              rhythmbox-3.4.2+4+ge123ad533-2  rp-pppoe-3.12-3  rpcbind-1.2.5-1
              rsync-3.1.3-1  rtkit-0.11+8+ge0a51fe-1  rtorrent-0.9.7-1
              rubberband-1.8.2-1  ruby-2.5.1-2  rubygems-2.7.7-1
              run-parts-4.8.6-1  s-nail-14.9.11-1  samba-4.8.5-1  sbc-1.3-2
              schroedinger-1.0.11-5  scons-3.0.1-1
              scrnsaverproto-1.2.2-2 [删除]  scrot-0.8.18-1  sdcc-3.7.0-5
              sdl2-2.0.8-9  sdl2_image-2.0.3-1  sed-4.5-1  semver-5.5.1-1
              sg3_utils-1.43-1  shadow-4.6-1  shared-mime-info-1.10-1
              sip-4.19.13-1  slang-2.3.2-1  slim-1.3.6-7  smbclient-4.8.5-1
              smplayer-18.9.0-1  smplayer-themes-1:18.6.0-1  snappy-1.1.7-1
              solid-5.50.0-1  sonnet-5.50.0-1  sound-theme-freedesktop-0.8-3
              soundtouch-2.1.0-1  source-highlight-3.1.8-17  spandsp-0.0.6-2
              speech-dispatcher-0.8.8-2  speexdsp-1.2rc3-3  spice-0.14.0-2
              spice-glib-0.34-1 [删除]  spice-gtk-0.35-1
              spice-gtk3-0.34-2 [删除]  sqlite-3.25.2-1  sqlitebrowser-3.10.1-1
              squashfs-tools-4.3-5  srt-1.3.1-1  sshfs-3.5.0-1
              steam-1.0.0.56-1  steam-native-runtime-1.0.0.56-2
              subversion-1.10.2-2  sudo-1.8.25.p1-1  suitesparse-5.3.0-1
              sunpinyin-data-1:2.0.3.20140820-2  syntax-highlighting-5.50.0-1
              sysfsutils-2.1.0-10  syslinux-6.03-11  systemd-239.2-1
              systemd-sysvcompat-239.2-1  talloc-2.1.14-1  tar-1.30-1
              tcl-8.6.8-3  tdb-1.3.16-1  teamviewer-13.2.13582-9
              telepathy-glib-0.24.1-2  tevent-1:0.9.37-1
              thin-provisioning-tools-0.7.6-1  threadweaver-5.50.0-1
              thunderbird-60.0-4  tint2-16.6.1-1  tk-8.6.8-3  tmux-2.7-1
              tor-0.3.4.8-1  totem-3.26.2-1  totem-plparser-3.26.1+2+gb7f36dd-1
              tracker-2.1.5-2  transmission-cli-2.94-1  transmission-gtk-2.94-1
              tslib-1.17-1  ttf-arphic-ukai-0.2.20080216.1-6
              ttf-arphic-uming-0.2.20080216.1-6  ttf-dejavu-2.37-2
              ttf-hack-3.003-1  twolame-0.3.13-8  tzdata-2018e-2  ucl-1.03-8
              udevil-0.4.4-3  udiskie-1.7.5-2  udisks2-2.8.1-1  uget-2.2.1-1
              units-2.17-1  unixodbc-2.3.7-1  unrar-1:5.5.8-1 [删除]
              upower-0.99.8-2  upx-3.95-1  usb_modeswitch-2.5.2-1
              usbutils-010-1  util-linux-2.32.1-2  v4l-utils-1.14.2-1
              vala-0.42.2-1  valgrind-3.13.0+290+2b0aa0a5-1
              vamp-plugin-sdk-2.7.1-2  vde2-2.3.2-11  vi-1:070224-3
              vid.stab-1.1-2  videoproto-2.3.3-1 [删除]  vim-runtime-8.1.0374-1
              virglrenderer-0.7.0-1  virtualbox-5.2.18-1
              virtualbox-ext-oracle-5.2.18-3  virtualbox-ext-vnc-5.2.18-1
              virtualbox-guest-iso-5.2.18-1
              virtualbox-guest-modules-arch-5.2.18-14
              virtualbox-guest-utils-5.2.18-1
              virtualbox-host-modules-arch-5.2.18-14  virtualbox-sdk-5.2.18-1
              visual-studio-code-bin-1.27.2-1  volume_key-0.3.11-2
              volumeicon-0.5.1-3  vte-common-0.54.1-1  vte3-0.54.1-1
              vtk-8.1.1-2  vulkan-icd-loader-1.1.82+2958+1f9a54573-1
              w3m-0.5.3.git20180125-1  wavpack-5.1.0-2  wayland-1.16.0-1
              wayland-protocols-1.16-1  webkit2gtk-2.22.2-1
              webkitgtk-3:2.4.11-13  webkitgtk2-3:2.4.11-13
              webrtc-audio-processing-0.3.1-1  wget-1.19.5-1  wildmidi-0.4.2-1
              wine-3.17-1  wine-mono-4.7.3-1  winetricks-20180815-1
              wireless_tools-30.pre9-2  woff2-1.0.2-1  wpa_supplicant-1:2.6-12
              wps-office-10.1.0.6757-1  wvdial-1.61-7  wxgtk-common-3.0.4-2
              wxgtk2-3.0.4-2  wxgtk3-3.0.4-2  wxpython-3.0.2.0-3 [删除]
              x264-2:155.r0a84d986-2  x265-2.8-1  xarchiver-0.5.4.13-1
              xbitmaps-1.1.2-1  xcb-proto-1.13-2  xcb-util-0.4.0-2
              xcb-util-cursor-0.1.3-1  xcb-util-image-0.4.0-2
              xcb-util-keysyms-0.4.0-2  xcb-util-renderutil-0.3.9-2
              xcb-util-wm-0.4.1-2  xdg-user-dirs-0.17-1  xdg-utils-1.1.3-3
              xextproto-7.3.0-1 [删除]  xf86-input-evdev-2.10.6-1
              xf86-input-libinput-0.28.0-1  xf86-input-mouse-1.9.3-1
              xf86-input-synaptics-1.9.1-1  xf86-video-ati-1:18.1.0-1
              xf86-video-dummy-0.3.8-3  xf86-video-fbdev-0.5.0-1
              xf86-video-intel-1:2.99.917+847+g25c9a2fc-1
              xf86-video-nouveau-1.0.15-3  xf86-video-openchrome-0.6.0-3
              xf86-video-vesa-2.4.0-2  xf86-video-voodoo-1.2.5-10
              xf86dgaproto-2.1-3 [删除]  xf86vidmodeproto-2.3.1-3 [删除]
              xfce4-notifyd-0.4.2-1  xfconf-4.12.1-5  xfsprogs-4.17.0-1
              xine-lib-1.2.9-7  xineramaproto-1.2.1-3 [删除]
              xkeyboard-config-2.24-1  xmlsec-1.2.26-1  xmltoman-0.4-3
              xorg-appres-1.0.5-1  xorg-font-util-1.3.1-2
              xorg-font-utils-7.6-5  xorg-fonts-alias-1.0.3-2
              xorg-fonts-encodings-1.0.4-5  xorg-iceauth-1.0.8-1
              xorg-luit-1.1.1-3  xorg-mkfontdir-1.0.7-9
              xorg-mkfontscale-1.1.3-1  xorg-server-1.20.1-1
              xorg-server-common-1.20.1-1  xorg-server-xephyr-1.20.1-1
              xorg-server-xvfb-1.20.1-1  xorg-setxkbmap-1.3.1-2
              xorg-xbacklight-1.2.2-1  xorg-xcmsdb-1.0.5-2
              xorg-xdpyinfo-1.3.2-2  xorg-xdriinfo-1.0.6-1  xorg-xev-1.2.2-2
              xorg-xeyes-1.1.2-1  xorg-xgamma-1.0.6-2  xorg-xhost-1.0.7-2
              xorg-xinit-1.4.0-3  xorg-xinput-1.6.2-2  xorg-xkbcomp-1.4.2-1
              xorg-xkill-1.0.5-1  xorg-xlsatoms-1.1.2-2
              xorg-xlsclients-1.1.4-1  xorg-xmessage-1.0.5-1
              xorg-xmodmap-1.0.9-2  xorg-xprop-1.2.3-1  xorg-xrdb-1.1.1-1
              xorg-xrefresh-1.0.6-1  xorg-xset-1.2.4-1  xorg-xsetroot-1.1.2-1
              xorg-xvinfo-1.1.3-2  xorg-xwininfo-1.1.4-1  xorgproto-2018.4-1
              xproto-7.0.31-1 [删除]  xscreensaver-5.40-1  xterm-337-1
              xvidcore-1.3.5-1  yajl-2.1.0-2  zbar-0.20-3  zenity-3.30.0-1
              zeromq-4.2.5-1  zip-3.0-8  zita-alsa-pcmi-0.3.2-1
              zita-resampler-1.6.2-1  zlib-1:1.2.11-3  zstd-1.3.5-1
              zvbi-0.2.35-3

下载大小:    3973.75 MiB
全部安装大小：  15207.09 MiB
净更新大小：   2074.88 MiB
...

错误：无法提交处理 (有冲突的文件)
android-sdk-platform-tools: 文件系统中已存在 /opt/android-sdk/platform-tools/e2fsdroid 

sudo pacman -S android-sdk-platform-tools --force
sudo pacman -S google-chrome --force
```


***
# 开源的diff比较工具（bcompare like）
```
yaourt meld
```

***
# pacman 解决依赖关系 和 强制覆盖已存在文件
```
In the process of Xorg cleanup the update requires manual intervention when you hit this message:

:: installing xorgproto (2019.2-2) breaks dependency 'inputproto' required by lib32-libxi
:: installing xorgproto (2019.2-2) breaks dependency 'dmxproto' required by libdmx
:: installing xorgproto (2019.2-2) breaks dependency 'xf86dgaproto' required by libxxf86dga
:: installing xorgproto (2019.2-2) breaks dependency 'xf86miscproto' required by libxxf86misc
when updating, use: pacman -Rdd libdmx libxxf86dga libxxf86misc && pacman -Syu to perform the upgrade.

primus_vk>=1.3-1 update requires manual intervention
2019-11-25
The primus_vk package prior to version 1.3-1 was missing some soname links. This has been fixed in 1.3-1 so the upgrade will need to overwrite the untracked soname links. If you get an error like:

primus_vk: /usr/lib/libnv_vulkan_wrapper.so.1 exists in filesystem
primus_vk: /usr/lib/libprimus_vk.so.1 exists in filesystem
when updating, use:

pacman -Syu --overwrite=/usr/lib/libnv_vulkan_wrapper.so.1,/usr/lib/libprimus_vk.so.1

to perform the upgrade.
```

***
# 更新 keyring
```
sudo pacman-key --refresh-keys
sudo gedit /etc/pacman.d/gnupg/gpg.conf
#keyserver hkp://pool.sks-keyservers.net 
keyserver hkp://keyserver.ubuntu.com
国内可用key server列表：
keyserver.ubuntu.com
pgp.mit.edu
subkeys.pgp.net
www.gpg-keyserver.de

sudo pacman -S archlinuxcn-keyring
sudo pacman -S archlinux-keyring
sudo pacman -Syudd --asdeps
```
***
# 更新 locale
`sudo gedit /etc/locale.conf`
```
#LANG="zh_CN.UTF-8"
LANG=en_US.UTF-8
```

***
# 网络名称 网卡 网口 wlp4s0 名字 换成 wlan0
`$ sudo leafpad /etc/udev/rules.d/10-network.rules`
```
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="00:17:42:f4:8e:1c", NAME="eth0"
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="24:ec:99:60:29:57", NAME="wlan0"
```
`sudo systemctl restart systemd-networkd.service`


网络接口重命名
作为更改设备名称的替代方案，systemd 使用.link文件用于接口重命名。常见的例子是基于 MAC 地址给一个 USB 接口以太网适配器设置一个可预见的接口名称。这类设备依其连接到不同 USB 接口而具有不同的接口名称。

`/etc/systemd/network/10-ethusb0.link`
```
[Match]
MACAddress=12:34:56:78:90:ab

[Link]
Description=USB to Ethernet Adapter
Name=ethusb0
```
注意： 任何由用户提供的.link文件名必须是依字典顺序先于默认配置文件名99-default.link才能生效。例如，必须是10-ethusb0.link而不能是 ethusb0.link


***
# 修复cadence
```
mv /opt/cadence/SPB166/tools.lnx86/lib/libgcc_s.so.1 /opt/cadence/SPB166/tools.lnx86/lib/libgcc_s.so.1.bk
cp /usr/lib32/libgcc_s.so.1 /opt/cadence/SPB166/tools.lnx86/lib/libgcc_s.so.1
```


***
# snap 修复
```
$ ldd snap-exec 
/usr/bin/ldd: line 160: /usr/libx32/ld-linux-x32.so.2: cannot execute binary file: Exec format error
ldd: exited with unknown exit code (126)
$ ldd /usr/libx32/ld-2.23.so
ld-linux-x32.so.2: cannot execute binary file: Exec format error
$ pacman -Qo /usr/libx32/ld-2.23.so
/usr/libx32/ld-2.23.so is owned by libx32-glibc 2.23-1.1
:: There are 2 providers available for gcc-multilib-x32>=5.2:
:: Repository AUR
    1) gcc-multilib-x32 2) gcc-x32-seed
    
    选1 失败
    
    选2？
```


* * *
# 全盘更新
```
qemu-launcher：移除 glade-perl 将破坏依赖关系 'glade-perl'
[andy@andy ~]$ sudo pacman -R glade-perl qemu-launcher
```


* * *
# 利用 ubuntu live cd 修复 archlinux
```
sudo bash
find root of arch
./bin/arch-chroot .
```

## 编辑DNS配置文件(实际上用 NetworkManager 产生的就好了)
`$ sudo vim /etc/resolv.conf`
```
nameserver 8.8.8.8
nameserver 114.114.114.114
```
保存退出，必要时清NDS缓存

## 更换源，本次更换清华源
编辑 `/etc/pacman.d/mirrorlist`， 在文件的最顶端添加： 
```
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
```
更新软件包缓存： 
`sudo pacman -Syy`

## 更新 keyring
```
pacman-key --init
pacman -S archlinux-keyring
pacman -S archlinuxcn-keyring
pacman-key --populate archlinux
pacman -Syu
```

## 引入 pkg 公钥

`sudo pacman -Syu`
```
...
error: key "5F702428F70E0903" could not be looked up remotely
error: required key missing from keyring
error: failed to commit transaction (unexpected error)
Errors occurred, no packages were upgraded.
...
```
```
//sudo pacman -S archlinux-keyring  && pacman -S archlinuxcn-keyring && sudo pacman -Syu

$ sudo leafpad /etc/pacman.d/gnupg/gpg.conf
keyserver hkp://keyserver.ubuntu.com:80
$ sudo pacman-key -r 5F702428F70E0903
```

`$ sudo pacman-key --keyserver hkp://keyserver.ubuntu.com:80 -r 5F702428F70E0903`
就可以搞定


***
# locale 设置为英文
`sudo gedit /etc/locale.conf`
```
LANG=en_US.UTF-8
```
`sudo gedit /etc/locale.gen`
```
en_US.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8
```
`sudo locale-gen`


***
# 修复 obmenu-generator
```
sudo cpan install Linux::DesktopFiles Data::Dump
sudo pacman -S cpanminus 
sudo cpanm --reinstall Linux::DesktopFiles
sudo cpanm --reinstall Data::Dump
git clone git://github.com/trizen/obmenu-generator
sudo cp obmenu-generator/obmenu-generator /usr/bin
```


sudo pacman -S cpython-pyqt5-sip
sudo pacman -S cpython-pyqt5
sudo pacman -S md4c
sudo pacman -S qtqr

***
# 修复 u盘 移动硬盘 普通用户打开权限
Create the file `/etc/polkit-1/rules.d/50-udiskie.rules` with permissions 644, and with the following contents:
```
polkit.addRule(function(action, subject) {
  var YES = polkit.Result.YES;
  // NOTE: there must be a comma at the end of each line except for the last:
  var permission = {
    // required for udisks1:
    "org.freedesktop.udisks.filesystem-mount": YES,
    "org.freedesktop.udisks.luks-unlock": YES,
    "org.freedesktop.udisks.drive-eject": YES,
    "org.freedesktop.udisks.drive-detach": YES,
    // required for udisks2:
    "org.freedesktop.udisks2.filesystem-mount": YES,
    "org.freedesktop.udisks2.encrypted-unlock": YES,
    "org.freedesktop.udisks2.eject-media": YES,
    "org.freedesktop.udisks2.power-off-drive": YES,
    // required for udisks2 if using udiskie from another seat (e.g. systemd):
    "org.freedesktop.udisks2.filesystem-mount-other-seat": YES,
    "org.freedesktop.udisks2.filesystem-unmount-others": YES,
    "org.freedesktop.udisks2.encrypted-unlock-other-seat": YES,
    "org.freedesktop.udisks2.eject-media-other-seat": YES,
    "org.freedesktop.udisks2.power-off-drive-other-seat": YES
  };
  if (subject.isInGroup("storage")) {
    return permission[action.id];
  }
});
```


***
# 修复时间栏
```
sudo pacman -S orage zenity libwpe wpebackend-fdo
sudo pacman -Fy
```

## 修复时间显示
```
sudo timedatectl set-local-rtc false
sudo hwclock -u
sudo timedatectl set-ntp true
timedatectl timesync-status
timedatectl show-timesync --all
timedatectl status
//sudo timedatectl set-local-rtc true
//timedatectl set-local-rtc 0
//timedatectl status
```


***
# conky修复
新的配置文件
```
yaout conky-git
rm ~/.conkyrc
cat ~/.config/conky/conky.conf
```
```
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
```



***
# 修复opera
```
sudo pacman -S opera opera-ffmpeg-codecs
```
<https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt>



***
# 修复jdk
```
sudo pacman -S jdk jdk-openjdk jre-openjdk java-environment-common jdk8-openjdk
```


***
# 修复v2ray
```
sudo systemctl enable v2ray.service
sudo systemctl restart v2ray.service
```

***
# 修复 gedit
`$ sudo pacman -S dconf-editor`
`$ dconf-editor`
依次点开->org->gnome->gedit->preferences->encodings, 改成
```
['UTF-8', 'GB18030', 'GB2312', 'GBK', 'BIG5', 'CURRENT', 'ISO-8859-15', 'UTF-16']
```

***
# 安装 lightdm / gdm
```
sudo pacman -S lightdm-gtk-greeter lightdm
sudo systemctl disable lxdm.service
sudo systemctl enable lightdm.service
sudo systemctl start lightdm.service
sudo systemctl disable lightdm.service
sudo systemctl enable lxdm.service
```
`/etc/systemd/system/...`
```
sudo pacman -S lightdm gdm
sudo systemctl disable lightdm.service
sudo systemctl enable gdm.service
sudo systemctl start gdm.service
```

***
# something
```
sudo pacman -S hwloc aircrack-ng gdm alsa-topology-conf alsa-lib hwloc aircrack-ng alsa-topology-conf alsa-ucm-conf alsa-lib libsidplayfp libmaxminddb bind audacious-plugins python-patiencediff breezy brltty liblouis ceph python-bcrypt python-cmd2 deluge-gtk deluge=2.0.4.dev38+g23a48dd01-2 libmicrohttpd elfutils libspf2 exim openmpi fftw fluidsynth gimp libinstpatch-1.0.so=2-64 mypaint-brushes1 gst-plugins-bad-libs=1.16.2 gst-plugins-bad lilv gst-plugins-bad gst-plugin-gtk gthumb netpbm gts kactivities-stats kio-extras kdsoap-ws-discovery-client kio-extras lib32-brotli lib32-libsoup java-openjfx mujs mpv perl-clone perl-http-message perl-cgi perl-http-server-simple python2-importlib_resources python2-jaraco python2-ordered-set python2-setuptools libslirp qemu liburing qemu yaml-cpp qtcreator ruby-irb ruby lsof steam lib32-vulkan-icd-loader steam lib32-vulkan-icd-loader steam-native-runtime xf86-video-vmware virtualbox-guest-utils xdg-dbus-proxy webkit2gtk 


??
xorg-fonts-misc xorg-fonts-alias-misc dmxproto libdmx xf86dgaproto libxxf86dga microchip-mplabx-bin 
```


***
# gnome lxde xfce
```
sudo pacman -S gnome gnome-extra gnome-shell
sudo pacman -S lxde lxde-common lxsession
sudo pacman -S xfce4 xfce4-goodies mousepad
```


***
# chroot替代arch-chroot的可能
```
mount --bind /dev dev 
mount --bind /proc proc
mount --bind /sys sys 
chroot ./ bin/sh
```
是否可行？


***
# 设置 `opera` 为默认浏览器
$ xdg-settings set default-web-browser opera.desktop
$ xdg-mime default opera.desktop x-scheme-handler/http
$ xdg-mime default opera.desktop x-scheme-handler/https
$ xdg-mime default opera.desktop text/html



***
# sunloginclient
```
[andy@andy ~]$ xhost +
access control disabled, clients can connect from any host
[andy@andy ~]$ which xhost 
/usr/bin/xhost
[andy@andy ~]$ sudo xhost +
[sudo] password for andy: 
access control disabled, clients can connect from any host
```
`/etc/gdm/Init/Default`
头部添加一行
```
xhost +
```


***
# 解决更新冲突
```
looking for conflicting packages...
error: failed to prepare transaction (could not satisfy dependencies)
:: installing xorgproto (2019.2-2) breaks dependency 'dmxproto' required by libdmx
:: installing xorgproto (2019.2-2) breaks dependency 'xf86dgaproto' required by libxxf86dga
==> upgrading SVN/CVS/HG/GIT package
```
```
pacman -Rns $(pacman -Qqtd)
checking dependencies...
:: angrysearch optionally requires xdotool: Thunar & PCmanFM to select file on path open
:: apr-util optionally requires mariadb-libs: enable mysql/mariadb support
:: chromium optionally requires pepper-flash: support for Flash content
:: dhcpcd optionally requires openresolv: resolvconf support
:: ffmpeg optionally requires ladspa: LADSPA filters
:: file-roller optionally requires lrzip: lrzip archive support
:: git optionally requires perl-lwp-protocol-https: git mediawiki https support
:: gnome-nettool optionally requires net-tools: Network statistics
:: gnupg optionally requires libusb-compat: scdaemon
:: imagemagick optionally requires libheif: HEIF support
:: imagemagick optionally requires libwmf: WMF support
:: kio optionally requires kio-extras: extra protocols support (sftp, fish and more)
:: lib32-alsa-plugins optionally requires lib32-speexdsp: for pcm_speex and rate_speexrate plugins
:: libproxy optionally requires networkmanager: NetworkManager configuration module
:: libreoffice-fresh optionally requires mariadb-libs: for mysql-connector
:: libvirt optionally requires dmidecode: DMI system info support
:: mkinitcpio optionally requires lzop: Use lzo compression for the initramfs image
:: perl-libwww optionally requires perl-lwp-protocol-https: for https:// url schemes
:: poppler optionally requires poppler-data: encoding data to display PDF documents containing CJK characters
:: python-pyqt5 optionally requires qt5-tools: QtHelp, QtDesigner
:: qt4 optionally requires mariadb-libs: MariaDB driver
:: qt5-base optionally requires qt5-translations: for some native UI translations
:: qt5-base optionally requires mariadb-libs: MariaDB driver
:: shutter optionally requires perl-lwp-protocol-https: Imgur and Dropbox upload support
:: shutter optionally requires perl-net-oauth: Imgur and Dropbox upload support
:: shutter optionally requires bc: 3D Rotate and 3D Reflection plugins support
:: smplayer optionally requires mplayer: alternative multimedia engine
:: syslinux optionally requires perl-digest-sha1: For sha1pass
:: syslinux optionally requires efibootmgr: For EFI support
:: udevil optionally requires sshfs: mount sftp shares
:: udisks2 optionally requires ntfs-3g: NTFS filesystem management support
:: xarchiver optionally requires lrzip: lrzip support
:: xarchiver optionally requires lzop: LZOP support
warning: dependency cycle detected:
warning: phonon-qt5-gstreamer will be removed after its phonon-qt5 dependency

Packages (565) arm-none-eabi-binutils-2.34-1  assimp-5.0.1-1  atkmm-2.28.0-2
               audacious-plugins-4.0.5-1  baloo-5.73.0-1
               baloo-widgets-20.04.3-1  bc-1.07.1-4  cabextract-1.9.1-2
               cairomm-1.12.2-4  calibre-common-4.22.0-1  cblas-3.9.0-3
               chmlib-0.40-6  clazy-1.7-1  confuse-3.3-1  convertlit-1.8-10
               crypto++-8.2.0-3  diffstat-1.63-1  dmidecode-3.2-2
               dolphin-20.04.3-1  drbl-2.30.5-1  ebook-tools-0.2.2-7
               ecryptfs-utils-111-4  efibootmgr-17-1  efivar-37-4  enca-1.19-4
               ethtool-1:5.7-1  fakeroot-1.24-2  freeimage-3.18.0-7
               ftgl-2.4.0-2  gcc6-libs-6.4.1-4  gcc8-libs-8.4.0-1
               gl2ps-1.4.2-2  glew-2.2.0-2  glibmm-2.64.2-1  glm-0.9.9.8-1
               gmtk-1.0.9-6  goocanvas-2.0.4-5  gperftools-2.7-2
               groff-1.22.4-3  gtkglext-1.2.0-12  gtkmm3-3.24.2-2  iw-5.4-1
               jemalloc-1:5.2.1-3  jxrlib-0.2.1-3  kdnssd-5.73.0-1
               kemoticons-5.73.0-1  kfilemetadata-5.73.0-1  kidletime-5.73.0-1
               kinit-5.73.0-1  kio-extras-20.04.3-1  kjs-5.73.0-1
               knotifyconfig-5.73.0-1  kparts-5.73.0-1  kpty-5.73.0-1
               kunitconversion-5.73.0-1  ladspa-1.15-2  lbzip2-2.5-5
               leveldb-1.22-2  lib32-at-spi2-atk-2.34.2-1
               lib32-at-spi2-core-2.36.0-1  lib32-glew-2.2.0-1
               lib32-glib-networking-2.64.3-1  lib32-libepoxy-1.5.4-1
               lib32-libraw1394-2.1.2-2  lib32-librsvg-2.48.8-1
               lib32-libsoup-2.70.0-1  lib32-libxkbcommon-0.10.0-1
               lib32-rest-0.8.1-2  lib32-speexdsp-1.2.0-1  libebml-1.4.0-1
               libfilezilla-0.19.3-2  libftdi-1.4-4  libftdi-compat-0.20-8
               libgda-5.2.9-4  libgooglepinyin-0.1.2-5  libgpod-0.8.3-11
               libguess-1.2-3  libheif-1.7.0-2  libkcddb-20.04.3-1
               libmpdclient-2.19-1  libnatpmp-20150609-3  libndp-1.7-2
               libnewt-0.52.21-3  libpgm-5.2.122-5  libpipeline-1.5.2-1
               libsigc++-2.10.3-1  libsodium-1.0.18-2  libteam-1.31-1
               libtorrent-0.13.8-2  libuninameslist-20200413-1
               libunrar-1:5.9.4-1  libupnp-1.6.25-2  libusb-compat-0.1.7-1
               libva1-1.8.3-3  libwmf-0.2.12-2  libxvmc-1.0.12-3
               libzip-1.6.1-2  lirc-1:0.10.1-6  lrzip-0.631-3  lzop-1.04-3
               mariadb-clients-10.4.14-1  mariadb-libs-10.4.14-1
               mathjax-3.0.5-1  mesa-demos-8.4.0-4  mingw-w64-binutils-2.35-1
               mingw-w64-crt-7.0.0-1  mingw-w64-headers-7.0.0-1
               mingw-w64-winpthreads-7.0.0-1  miniupnpc-2.1.20191224-1
               mplayer-38157-3  net-tools-1.60.20181103git-2
               networkmanager-1.26.0-1  nilfs-utils-2.2.8-2
               ntfs-3g-2017.3.23-4  oniguruma-6.9.5_rev1-1
               opencascade-7.4.0.1-1  openconnect-1:8.10-1  openjade-1.3.2-6
               openjpeg-1.5.2-2  openresolv-3.10.0-1  opensp-1.5.2-9
               openvpn-2.4.9-2  optipng-0.7.7-2  pangomm-2.42.1-2
               partclone-0.3.12-1  partimage-0.6.9-13  pbzip2-1.1.13-3
               pepper-flash-32.0.0.403-1  perl-bit-vector-7.4-11
               perl-carp-clan-6.08-3  perl-class-accessor-0.51-2
               perl-class-data-inheritable-0.08-9  perl-common-sense-3.75-2
               perl-data-random-0.13-4  perl-digest-hmac-1.03-9
               perl-digest-sha1-2.13-15  perl-gd-2.72-1
               perl-io-socket-ssl-2.067-2  perl-lwp-protocol-https-6.09-1
               perl-mouse-2.5.10-2  perl-net-oauth-0.28-10
               perl-net-ssleay-1.88-2  perl-sgmls-1:1.1-7
               perl-types-serialiser-1.0-6  perl-yaml-tiny-1.73-4
               phonon-qt5-4.11.1-2  phonon-qt5-gstreamer-4.10.0-2  php-7.4.9-1
               pigz-2.4-2  pixz-1.0.6-3  pkcs11-helper-1.26.0-1  podofo-0.9.6-3
               poppler-data-0.4.9-2  poppler-qt5-0.90.1-1  potrace-1.16-2
               ppp-2.4.7-7  pptpclient-1.10.0-2  progsreiserfs-0.3.0.5-10
               pyqt4-common-4.12.3-5  python-acme-1.7.0-1
               python-configargparse-1.2.3-1  python-docopt-0.6.2-7
               python-future-0.18.2-3  python-josepy-1.3.0-1
               python-keyutils-0.6-4  python-markdown-3.2.2-1
               python-mock-3.0.5-3  python-parsedatetime-2.6-1
               python-pbr-5.4.5-1  python-psutil-5.7.2-1
               python-pyrfc3339-1.1-5  python-requests-toolbelt-0.9.1-3
               python-wxpython-4.0.7.2-1  python-yaml-5.3.1-2
               python-zope-component-4.6.2-1
               python-zope-deferredimport-4.3.1-4
               python-zope-deprecation-4.4.0-3  python-zope-event-4.4-3
               python-zope-hookable-5.0.1-1  python-zope-proxy-4.3.5-1
               python2-apsw-3.32.2-1  python2-backports-1.0-3
               python2-backports.functools_lru_cache-1.6.1-2
               python2-backports.unittest_mock-1.2.1-3  python2-beaker-1.10.1-1
               python2-beautifulsoup4-4.9.1-1  python2-chardet-3.0.4-5
               python2-cheroot-8.4.2-1  python2-contextlib2-0.6.0.post1-1
               python2-css-parser-1.0.4-3  python2-cssselect-1.1.0-4
               python2-dateutil-2.8.1-3  python2-dbus-1.2.16-1
               python2-dnspython-1.16.0-3  python2-feedparser-5.2.1-6
               python2-funcsigs-1.0.2-3  python2-gobject-3.36.1-1
               python2-html2text-2019.8.11-4  python2-html5-parser-0.4.9-2
               python2-html5lib-1.1-1  python2-jaraco-2019.10.22-3
               python2-logutils-0.3.5-3  python2-lxml-4.5.2-1
               python2-mako-1.0.14-1  python2-markdown-3.1.1-5
               python2-markupsafe-1.1.1-4  python2-mechanize-1:0.4.5-1
               python2-mock-3.0.5-3  python2-more-itertools-5.0.0-2
               python2-msgpack-0.6.2-3  python2-nautilus-1.1-4
               python2-netifaces-0.10.9-3  python2-pbr-5.4.5-1
               python2-pillow-6.1.0-1  python2-portend-2.6-2
               python2-psutil-5.7.2-1  python2-pychm-0.8.6-1
               python2-pygments-2.5.2-2  python2-pyqt5-5.15.0-3
               python2-pyqtwebengine-5.15.0-2  python2-pytz-2020.1-1
               python2-regex-2020.7.14-1  python2-repoze.lru-0.7-2
               python2-sip-pyqt4-4.19.22-1  python2-sip-pyqt5-4.19.23-1
               python2-soupsieve-1.9.6-2  python2-tempora-1.14.1-5
               python2-unrardll-0.1.4-2  python2-urllib3-1.25.10-1
               python2-waitress-1.3.0-1  python2-webencodings-0.5.1-4
               python2-webob-1.8.6-1  python2-webtest-2.0.33-1
               python2-zc.lockfile-2.0-3  qbs-1.16.0-1  qca-2.3.1-2
               qt5-tools-5.15.0-3  qt5-translations-5.15.0-1  recode-3.7.7-1
               schroedinger-1.0.11-6  screen-4.8.0-1  sed-4.8-1
               sg3_utils-1.45-1  sgml-common-0.6.3-7  sip-4.19.23-1
               slang-2.3.2-2  smpeg2-1:2.0.0-2  sshfs-3.7.0-1  stoken-0.92-4
               sunpinyin-3.0.0rc1-3  sunpinyin-data-1:2.0.3.20140820-3
               tepl-4.4.0-1  ucl-1.03-9  vim-runtime-8.2.0814-3
               vpnc-1:0.5.3.r468.r81-1  vtk-8.2.0-14  wpa_supplicant-2:2.9-7
               wvstreams-4.6.1-16  wxgtk3-3.0.5.1-1  xdotool-3.20160805.1-3
               xine-lib-1.2.10-4  xmlrpc-c-1:1.51.06-1  xorg-xmessage-1.0.5-2
               xplc-0.3.13-8  zeromq-4.3.2-2  acpi-1.7-3  acpid-2.0.32-2
               aircrack-ng-1.6-2  alsa-firmware-1.2.1-2  alsa-oss-1.1.8-3
               alsa-utils-1.2.3-2  amule-11047-1
               android-sdk-platform-tools-30.0.4-1  ant-1.10.8-1
               arch-install-scripts-23-2  arm-none-eabi-gcc-10.2.0-1
               arm-none-eabi-gdb-9.2-1  asar-3.0.3-1  at-3.2.1-2
               audacious-4.0.5-1  autoconf2.13-2.13-6  automoc4-0.9.88-8
               avr-gdb-9.2-1  avrdude-1:6.3-7  axel-2.17.9-1  baobab-3.34.1-1
               bind-9.16.5-2  bison-3.6.4-1  bluefish-2.2.11-1  bmon-4.0-4
               broadcom-wl-6.30.223.271-216  busybox-1.31.1-3  calibre-4.22.0-1
               catfish-1.4.13-2  ccache-3.7.11-1  celt0.5.1-0.5.1.3-5
               ceph-14.2.8-1  certbot-1.7.0-1  clonezilla-3.35.2-2
               colordiff-1.0.18-3  cowpatty-4.8-2  cscope-15.9-2
               cvs-1.11.23-13  dcadec-0.2.0-1  dconf-editor-3.36.4-1
               ddrescue-1.25-1  deadbeef-1.8.4-1
               deluge-gtk-2.0.4.dev38+g23a48dd01-2  dkms-2.8.3-1  dmenu-4.9-2
               docbook2x-0.8.8-17  dolphin-plugins-20.04.3-1  doxygen-1.8.18-2
               eaglemode-0.94.2-1  efitools-1.9.2-3  expect-5.45.4-2
               fakechroot-2.20.1-2  fbset-2.1-7  fcgi-2.4.2-2
               fcitx-cloudpinyin-0.3.7-1  fcitx-googlepinyin-0.1.6-7
               fcitx-sunpinyin-0.4.2-2  fcitx-ui-light-0.1.3-5  feh-3.4.1-1
               filezilla-3.46.3-1  firefox-79.0-1  fontforge-20200314-2
               freshplayerplugin-0.3.11-3  gcc-objc-10.1.0-2  gcc5-5.5.0-2
               gcc6-6.4.1-4  gcc8-8.4.0-1  gedit-3.36.2-1  gegl02-0.2.0-7
               gendesk-1.0.6-1  genymotion-3.1.0-1  gerbv-2.7.0-2
               gimp-2.10.20-1  gmime-2.6.23+4+g91dcee38-3
               gnome-calculator-3.36.0-1  gnome-icon-theme-3.12.0-6
               gnome-mines-3.36.0-1  gnome-mplayer-1.0.9-8
               gnome-screenshot-3.36.0-1  gnome-system-monitor-3.36.1-1
               gnustep-make-2.8.0-1  gobject-introspection-1.64.1-2
               gparted-1.1.0-1  gpicview-0.2.5-5  grub-2:2.04-8
               gstreamer0.10-base-plugins-0.10.36-13  gthumb-3.10.0-2
               gtkmm-1:2.24.5-4  gulp-4.0.2-3  gvim-8.2.0814-3
               hardinfo-0.5.1.816.g877ea2b-2  haveged-1.9.13-1  htop-2.2.0-3
               i2c-tools-4.1-4  idnkit-1.0-3  imake-1.0.8-2
               intel-ucode-20200616-1  intltool-0.51.0-6  iptraf-ng-1.1.4-5
               iverilog-10.3-2  js-24.2.0-4  js60-60.9.0-2  jwm-2.3.7-2
               k3b-1:20.04.3-1  kchmviewer-7.7-5  kdelibs4support-5.73.0-1
               khtml-5.73.0-1  kicad-5.1.6-1  ksh-2020.0.0-2
               kuiserver-5.11.3-1  kyotocabinet-1.2.78-1  laptop-detect-0.16-1
               lcms-1.19-5  leafpad-0.8.18.1-9  lftp-4.9.1-1
               lib32-fakeroot-1.24-1  lib32-gsm-1.0.14-1  lib32-gtk3-3.24.21-1
               lib32-harfbuzz-icu-2.7.0-1  lib32-jansson-2.13.1-1
               lib32-json-c-0.15-1  lib32-ladspa-1.15-1  lib32-lame-3.99.5-2
               lib32-libass-0.13.2-1  lib32-libavc1394-0.5.4-2
               lib32-libbluray-0.9.2-1  lib32-libcroco-0.6.13-1
               lib32-libiec61883-1.2.0-2  lib32-libtxc_dxtn-1.0.1-5
               lib32-libva1-1.8.3-3  lib32-libvpx-1.9.0-1
               lib32-libx264-148.20160103-4  lib32-mesa-demos-8.4.0-2
               lib32-opencore-amr-0.1.3-2  lib32-openjpeg-1.5.2-1
               lib32-opus-1.3.1-1  lib32-schroedinger-1.0.11-2
               lib32-smpeg2-2.0.0-2  lib32-speex-1.2.0-2
               lib32-xvidcore-1.3.4-1  libappindicator-gtk2-12.10.0.r296-1
               libdbusmenu-qt4-0.9.3+16.04.20160218-1  libdmx-1.1.4-1
               libdvbpsi-1:1.3.3-2  libiodbc-3.52.13-2  libirman-0.5.2-3
               libmatroska-1.6.2-1  libmp4v2-4.1.3-1  libqzeitgeist-0.8.0-6
               libstdc++5-3.3.6-7  libtar-1.2.20-5  libtiger-0.3.4-6
               libtracker-sparql-1.12.3-1  libtxc_dxtn-1.0.1-6
               libvdpau-va-gl-0.4.2-3  libxp-1.0.3-4  libxxf86dga-1.1.5-1
               licenses-20200427-1  liferea-1.12.8-1  linux-lts-5.4.55-1
               logrotate-3.17.0-1  lua-socket-20200329-1  lua51-5.1.5-9
               lxdm-0.5.3-7  lxinput-0.3.5-3  lxrandr-0.3.2-2
               lxterminal-0.3.2-2  man-db-2.9.3-1  man-pages-5.07-1
               mariadb-10.4.14-1  masterpdfeditor-5.6.20-2  mbedtls-2.16.7-1
               memtest86+-5.01-4  mingw-w64-gcc-10.2.0-1  minicom-2.7.1-4
               mldonkey-3.1.7-1  mpc-0.33-2  mtd-utils-2.1.2-1
               mypaint-brushes-2.0.2-1  nano-5.0-1  nasm-2.15.02-1
               nautilus-terminal-3.3.0-1  nbd-3.20-2  ncdu-1.15.1-1
               ncurses5-compat-libs-6.2-1  netctl-1.23-1
               network-manager-applet-1.18.0-1
               networkmanager-openconnect-1.2.6-2
               networkmanager-openvpn-1.8.12-1
               networkmanager-pptp-1.2.9dev+10+gb41b0d0-2
               networkmanager-vpnc-1.2.7dev+20+gdca3aea-2  nrg2iso-0.4-11
               nuget-5.6.0-1  obconf-2.0.4-7  opencv-4.4.0-1  openh264-2.1.1-1
               openocd-1:0.10.0-3  openslp-2.0.0-2  opera-70.0.3728.106-1
               oxygen-icons-1:5.73.0-1  parcellite-1.2.1-4  pcb-1:4.2.2-1
               perl-canary-stability-2013-3  perl-date-calc-6.4-7
               perl-extutils-depends-0.8000-4  perl-extutils-pkgconfig-1.16-7
               perl-json-xs-4.0-4  perl-mozilla-ca-20200520-3
               perl-net-dropbox-api-1.9-9  perl-test-pod-1.52-5
               php-apache-7.4.9-1  php-cgi-7.4.9-1  phpmyadmin-5.0.2-1
               pkgfile-21-2  polkit-qt4-0.112.0+git20160226-1  projectm-3.1.3-1
               pth-2.0.7-7  putty-0.74-1  python-sip-4.19.23-1
               python-sip-pyqt5-4.19.18-1  python-werkzeug-1.0.1-2
               python2-cherrypy-17.4.2-1  python2-cssutils-1.0.2-1
               python2-dukpy-0.3-3  python2-jinja-2.11.2-1
               python2-mutagen-1.42.0-3  python2-notify-0.1.1-14
               python2-pecan-1.3.3-1  python2-prettytable-0.7.2-9
               python2-pyqt4-4.12.3-5  python2-qrtools-1.4-1
               python2-requests-2.24.0-1  python2-routes-2.4.1-2
               python2-singledispatch-3.4.0.3-4  python2-sip-4.19.18-1
               python2-werkzeug-0.15.2-1  python2-wxpython3-3.0.2.0-3
               qemu-guest-agent-5.0.0-8  qt5-3d-5.15.0-1  qtcreator-4.12.4-2
               qtqr-2.0-2  quilt-0.66-2  ragel-6.10-3  refind-0.12.0-6
               remmina-1:1.4.7-1  rhythmbox-3.4.4-1  rp-pppoe-3.14-1
               rtorrent-0.9.8-2  scons-3.1.2-2  screenfetch-3.9.1-1
               slim-1.3.6-9  slurm-0.4.3-2  sqlitebrowser-3.11.2-2
               tcsh-6.22.02-1  teamviewer-15.8.3-1  thunderbird-68.11.0-1
               tint2-16.7-2  tmux-3.1_b-1  tor-0.4.3.6-1  totem-3.34.1-2
               transmission-gtk-3.00-2  ttf-arphic-ukai-0.2.20080216.1-8
               ttf-arphic-uming-0.2.20080216.1-8  udiskie-2.2.0-2  uget-2.2.3-1
               units-2.19-2  upx-3.96-2  usb_modeswitch-2.6.1-1  vi-1:070224-4
               virtualbox-ext-oracle-6.1.12-1  virtualbox-guest-utils-6.1.12-3
               volumeicon-0.5.1-5  vte-0.28.2-8  w3m-0.5.3.git20200507-1
               webkitgtk-3:2.4.11-19  wine-gecko-2.47.1-1  wine-mono-5.1.0-1
               winetricks-20200412-1  wps-office-11.1.0.9615-1
               wqy-zenhei-0.9.45-8  wvdial-1.61-8  xf86-input-evdev-2.10.6-2
               xf86-input-synaptics-1.9.1-2  xf86-input-void-1.4.1-5
               xf86-video-ati-1:19.1.0-2  xf86-video-dummy-0.3.8-4
               xf86-video-fbdev-0.5.0-2
               xf86-video-intel-1:2.99.917+908+g7181c5a4-1
               xf86-video-nouveau-1.0.16-2  xf86-video-openchrome-0.6.0-4
               xf86-video-vesa-2.4.0-3  xf86-video-voodoo-1.2.5-11
               xfce4-notifyd-0.6.1-1  xmltoman-0.4-4  xorg-fonts-misc-1.0.3-9
               xorg-fonts-type1-7.7-6  xorg-server-xvfb-1.20.8-3
               xorg-xeyes-1.1.2-2  xorg-xkill-1.0.5-2  yasm-1.3.0-4

Total Removed Size:  7477.17 MiB
```

看起来很不安全

`sudo pacman -Runsc xorgproto`
也不安全

不如这样
`pacman -Rdd libdmx libxxf86dga && pacman -Syu`



***
# 修复 modelsim / vsim
`sudo grep -r FT_Done_MM_Var *`
注释掉`/opt/modelsim/modeltech/bin/vsim`里的
`#export LD_LIBRARY_PATH=/opt/modelsim/modeltech/lib`
报错啥libncurses.so太短
并且先清除`/usr/lib32/libtinfo.so.5`和`/usr/lib32/libncurses.so.5`
再安装
`lib32-ncurses5-compat-libs`

又报错
```
Error in startup script: 
Initialization problem, exiting.

Initialization problem, exiting.

Initialization problem, exiting.

    while executing
"EnvHistory::Reset"
    (procedure "PropertiesInit" line 3)
    invoked from within
"PropertiesInit"
    invoked from within
"ncFyP12 -+"
    (file "/mtitcl/vsim/vsim" line 1)
** Fatal: Read failure in vlm process (0,0)
```
复制libfreetype.so.6.11.1和libfontconfig.so.1.6.2到`/opt/modelsim/modeltech/lib`
建立软链接
`/opt/modelsim/modeltech/bin/vsim`里加入
`export LD_LIBRARY_PATH=/opt/modelsim/modeltech/lib`
就可以用了



***
# vbox配置修复
```
sudo /sbin/rcvboxdrv setup
sudo /usr/lib/virtualbox/vboxdrv.sh setup
sudo pacman -S linux-headers virtualbox-host-dkms linux-lts
sudo pacman -S virtualbox-guest-dkms
sudo fsck /dev/sdd3 -y
```


***
# 安装yay，用于替代yaourt
```
sudo pacman -S yay
```
修改`/etc/pacman.conf`
启用color
```
...
#UseSyslog
Color
...
```
yay的缓存在`～/.cache`

## 安装aurman
```
yay aurman
```


***
# gpg server 配置
```
gpg: keyserver receive failed: General error
```
<https://wiki.archlinux.org/index.php/GnuPG#Use_a_keyserver>
`gedit ~/.gnupg/gpg.conf`
内容为
```
keyserver hkp://pool.sks-keyservers.net
```
而不是修改`/etc/pacman.d/gnupg/gpg.conf`，太容易被覆盖了


***
# 安装配置 privoxy
```
$ yay -S privoxy
$ sudo gedit /etc/privoxy/config
```
```
...
listen-address  localhost:8118
forward-socks5t / 127.0.0.1:10808 .
...
```

`$ curl --proxy 'socks5://127.0.0.1:10808' https://netix.dl.sourceforge.net/project/archbang/ArchBang/archbang-rc-2211-x86_64.iso?viasf=1 --output archbang-rc-2211-x86_64.iso`



***
# 安装配置 proxychains
`$ yay -S proxychains`
`$ sudo gedit /etc/proxychains.conf`
```
[ProxyList]
# add proxy here ...
# meanwile
# set to "v2ray"
#socks5  127.0.0.1 10808
# set to "SS"
#socks5  127.0.0.1 1081
```
使用方法
```
proxychains [cmd]
sudo proxychains [cmd]
```
`proxychains aria2c -x16 -s16 -j16 "https://netix.dl.sourceforge.net/project/archbang/ArchBang/archbang-rc-2211-x86_64.iso?viasf=1"`

测试
```
export PROXY_DNS_SERVER=8.8.8.8
PROXYCHAINS_SOCKS5=1081 proxychains4 -f /etc/proxychains.conf curl www.google.com
proxychains curl www.google.com
```


***
# pcmanfm修复配置
```
yay -S pcmanfm-gtk3 lxpanel-gtk3
```



***
# 更新 `/etc/fstab`

```
# 
# /etc/fstab: static file system information
#
# <file system>	<dir>	<type>	<options>	<dump>	<pass>
# UUID=bcb49d8e-f32c-4c86-b893-ad3e54789ee6
/dev/sda2           	/         	ext4      	rw,relatime,data=ordered	0 1

# UUID=53342a56-b0b9-4c2f-b4aa-2774be57737c
#/dev/sda4           	none      	swap      	defaults  	0 0


#/dev/sda1 /mnt/windows	 	ntfs 	defaults,iocharset=utf8,umask=000,nls=utf8 0 0
UUID=BE7654077653BEB9 /mnt/windows	 	ntfs-3g	users,auto,rw,dev,exec,uid=1000,locale=zh_CN.UTF-8      0      0

#/dev/sda5 /media/win_d 	ntfs-3g	users,auto,rw,dev,exec,locale=zh_CN.UTF-8      0      0
#/dev/sdb1 /media/win_e 	ntfs-3g	users,auto,rw,dev,exec,locale=zh_CN.UTF-8      0      0 
#/dev/sdb5 /mnt/win_d 		ntfs 	defaults,iocharset=utf8,umask=000,nls=utf8 0 0
UUID=0009A4AB000F7A32 /mnt/win_d 		ntfs-3g	users,auto,rw,dev,exec,uid=1000,locale=zh_CN.UTF-8      0      0

#/dev/sdb6 /mnt/win_e 		ntfs 	defaults,iocharset=utf8,umask=000,nls=utf8 0 0
UUID=000712A300065507 /mnt/win_e 		ntfs-3g	users,auto,rw,dev,exec,uid=1000,locale=zh_CN.UTF-8      0      0

#/dev/sdb7		/home		ext4		rw,relatime,data=ordered	0 1
UUID=530b728d-490e-4970-91df-8a2cb1f9bd69		/home		ext4		rw,relatime,data=ordered	0 1

#/dev/sdb8		/opt		ext4		rw,relatime,data=ordered	0 1
UUID=85d8469d-ecb3-41d3-86f7-bd8c4f0600a5		/opt		ext4		rw,relatime,data=ordered	0 1
```

***
# something
```
sudo dirmngr < /dev/null
sudo touch /root/.gnupg/dirmngr_ldapservers.conf
sudo killall dirmngr
```


***
# 修复 keyring
```
rm -R /etc/pacman.d/gnupg/
rm -R /root/.gnupg/
gpg --refresh-keys
gpg --refresh-keys --keyserver hkp://keyserver.ubuntu.com
pacman-key --init && pacman-key --populate archlinux
pacman-key --refresh-keys --keyserver hkp://keyserver.ubuntu.com
pacman-key --refresh-keys
sudo pacman-key --keyserver hkp://keyserver.ubuntu.com:80 -r 962DDE58`
sudo pacman-key --keyserver keyserver.ubuntu.com -r 962DDE58
```

***
# lxde lxappearance
```
pacman -S lxde-gtk3
pacman -S lxappearance-gtk3 lxappearance-obconf-gtk3
```


***
# 修复 shutter

`$ yay gnomecanvas-perl`
`$ yay gnome-vfs-perl`
```
perl
perl-error
cpanminus
perl-canary-stability
perl-parse-yapp
perl-x11-protocol
perl-cpanel-json-xs
perl-json-maybexs
perl-cpanel-json-xs
perl-json-maybexs
perl-module-cpanfile
perl-authen-oath
perl-module-cpants-analyse
perl-text-bidi
perl-text-multimarkdown-xs
perl-lockfile-simple
perl-io-termios
```
```
$ pacman -Qqo '/usr/lib/perl5/5.32/vendor_perl/' | xargs yaourt -S --noconfirm
$ pacman -Qqo '/usr/lib/perl5/5.30/vendor_perl/' | xargs yaourt -S --noconfirm
```


没有cpan？见后面append_path问题才是最好的解决办法，这里只是暂时解决
```
cd /usr/bin/
ln -s /usr/bin/core_perl/cpan cpan
ln -s /usr/bin/vendor_perl/cpanm cpanm
sudo cpanm Gnome2::Wnck
sudo cpanm Gtk2::ImageView
sudo cpanm Gnome2
sudo cpanm Goo::Canvas/libgoo-canvas-perl
sudo cpanm Gtk2::AppIndicator
```
shutter ok



***
# "Not authorized to perform operation." 问题
`sudo gedit /usr/share/polkit-1/actions/org.freedesktop.UDisks2.policy`
搜索字段
```
<!-- Mount
```
字段最后都改成
```
      <allow_any>yes</allow_any>
      <allow_inactive>yes</allow_inactive>
      <allow_active>yes</allow_active>
```




***
# 修改/固化 mac 地址（mac addr）
`//sudo pacman -S macchanger`
<https://wiki.archlinux.org/index.php/MAC_address_spoofing>
没啥意思，用下面的办法

```
###sudo gedit /etc/conf.d/net
sudo gedit /etc/rc.local
#####或者/etc/rc.d/rc.local
```
```
#!/bin/sh
#ifconfig eth0 hw ether e0:d5:5e:f8:a6:7a
ifconfig eth0 hw ether 00:d8:61:a6:62:b7
exit 0
```
`sudo chmod +x /etc/rc.local`

`sudo gedit /etc/systemd/system/rc-local.service`
```
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.

[Unit]
Description=/etc/rc.local Compatibility
ConditionPathExists=/etc/rc.local

[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99

[Install]
WantedBy=multi-user.target
```
`sudo systemctl enable rc-local.service`
`sudo systemctl start rc-local.service`


***
# 配置默认网卡名为eth0
`sudo vim /etc/default/grub`
查找
```
GRUB_CMDLINE_LINUX=""
```
修改为
```
GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"
```
重新生成grub引导配置文件
`grub-mkconfig -o /boot/grub/grub.cfg`

最后重启即可恢复默认网卡为eth0，操作结束。

***
#  修改grub

`set default="3" `的索引号可以这样查
`sudo awk -F\' '/menuentry / { print i++, $2}' /boot/grub/grub.cfg`
```
0 Arch Linux
1 Arch Linux, with Linux linux-lts
2 Arch Linux, with Linux linux-lts (fallback initramfs)
3 Arch Linux, with Linux linux
4 Arch Linux, with Linux linux (fallback initramfs)
5 Debian GNU/Linux 8 (jessie) (on /dev/sda1)
6 Debian GNU/Linux (on /dev/sda1)
```

tips：另外一个引导程序 syslinux 的配置文件为
`/boot/syslinux/syslinux.cfg`


***
# some editors
```
sudo pacman -S retext pycharm-community-edition vscode codeblocks geany-plugins geany
yay haroopad
```


***
# 登录tty显示
```
append_path command not found
```
是因为`/etc/profile`需要更新，简单点是
```
/etc/profile => /etc/profile.old
/etc/profile.pacnew => /etc/profile
```
实际上需要合并，如下
/etc/profile.pacnew有append_path命令的定义
```
# /etc/profile

#Set our umask
umask 022

# Append "$1" to $PATH when not already in.
# This function API is accessible to scripts in /etc/profile.d
append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

# Set our default path
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin"

# Append our default paths
append_path '/usr/local/sbin'
append_path '/usr/local/bin'
append_path '/usr/bin'

# Force PATH to be environment
export PATH

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Source global bash config
#if test "$PS1" && test "$BASH" && test -r /etc/bash.bashrc; then
#	. /etc/bash.bashrc
#fi

# Unload our profile API functions
unset -f append_path

# Source global bash config, when interactive but not posix or sh mode
if test "$BASH" &&\
   test "$PS1" &&\
   test -z "$POSIXLY_CORRECT" &&\
   test "${0#-}" != sh &&\
   test -r /etc/bash.bashrc
then
	. /etc/bash.bashrc
fi

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH

export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim
#fcitx&
alias cd..='cd ..'
export PATH=$PATH:/opt/MATLAB/R2010b/bin

#export JAVA_HOME=/usr/lib/jvm/java-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib:$CLASSPATH
export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH

```
这样就不用链接cpan什么的了
```
cd /usr/bin/
sudo rm cpan
sudo rm cpanm
```


***
# 安装配置 shadowsocks
```
sudo pacman -S shadowsocks libqtshadowsocks shadowsocks-libev shadowsocks-qt5 shadowsocks-v2ray-plugin
```
可以命令运行
`nohup sslocal -c /etc/shadowsocks.json /dev/null 2>&1 &`
也可以设置服务
`sudo gedit /usr/lib/systemd/system/shadowsocks@.service`
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

`sudo gedit /etc/shadowsocks/config.json`
```
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
```
```
sudo systemctl enable shadowsocks@config.service
sudo systemctl start shadowsocks@config.service
sudo netstat -ntlp | grep 1081
```


***
# 修改右键打开文件的待选择程序
```
gedit /home/andy/.config/mimeapps.list
gedit /home/andy/.local/share/applications/mimeinfo.cache
```

***
# 删除 acroread，垃圾
`sudo pacman -R acroread`



***
# cpu压力测试
```
sudo pacman -S stress s-tui sysstat
cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq
watch -n 2 "cat /proc/cpuinfo |grep MHz|uniq"
stress --cpu 16 --timeout 600
mpstat -P ALL 5
watch -n 2 uptime
htop
```


***
# teamviewer
```
sudo pacman -S teamviewer
sudo systemctl disable teamviewerd
```

***
# 删除 archon
```
pacman -Ql archon
sudo pacman -R archon-exec
sudo pacman -R archon
```


***
# 还是用xz替换xz-git
```
sudo pacman -S xz cpio file-roller unzip-iconv
sudo pacman -S ark
//sudo pacman -S engrampa caja p7zip unace unrar brotli
sudo pacman -S engrampa caja p7zip unace brotli
sudo pacman -S strace
```



***
# 查看pacman安装历史
`sudo cat /var/log/pacman.log`



***
# 关于deb包的file-roller解压无效问题
暂时的解决办法是修改为`.zip`后缀再用`file-roller`解压



***
# draw.io的命令启动
`cd /usr/local/bin`
`sudo gedit drawio`
```
#!/bin/bash
#export LD_LIBRARY_PATH=
cd /opt/draw.io
#./drawio $@
./drawio
```
`sudo chmod +x drawio`



***
# fromdos等命令
```
yay tofrodos
```



***
# key出错有关处理
## key "could not be locally signed"
<https://www.archlinux.org/news/gnupg-21-and-the-pacman-keyring/>
```
sudo pacman -Syu haveged
sudo systemctl start haveged
sudo systemctl enable haveged
sudo pacman -S xfce4-goodies

sudo rm -fr /etc/pacman.d/gnupg
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate archlinuxcn
```
## remove the SigLevel 处理报错
```
==> ERROR: Please remove the SigLevel= line of [archlinuxcn] from "/etc/pacman.conf" to use the default setting
==> ERROR: 请删除 /etc/pacman.conf 中 [archlinuxcn] 下的 SigLevel= 行，以使用默认设
```
`sudo gedit /etc/pacman.conf`
删掉pacman.conf中[archlinuxcn]的siglevel一行


***
# xfce4
```
sudo pacman -Qg xfce4
sudo pacman -S xfce4
sudo pacman -S xfce4-goodies
cat /usr/share/xsessions/xfce.desktop
```


***
# 指定加载库文件，而不是库路径的方法
LD_PRELOAD=*.so ./runexe


***
# 彻底删除wine配置
```
rm -rf ~/.wine
rm -rf ~/.local/share/applications/wine*
rm ~/.local/share/mime/application/x-wine-extension*
rm ~/.local/share/mime/packages/x-wine-extension*
```


***
# 这样安装mono
`wget https://dl.winehq.org/wine/wine-mono/5.1.1/wine-mono-5.1.1-x86.msi`
`/home/andy/.cache/wine/wine-mono-5.1.1-x86.msi`

把存档的winetricks放到`～/.cache/winetricks`
`WINEARCH=win32 WINEPREFIX=~/.wine winecfg`
选XP



***
# 用winetricks配置wine
`winetricks --gui`
```
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks vb6run vcrun6 vcrun6sp6 secur32 msvcirt mfc40 mfc42 riched20 riched30 gdiplus msxml3
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks cmd gdiplus mfc42 vcrun2003 vcrun2005 riched20 riched30
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks msxml4 msxml6 riched20 riched30 tahoma urlmon vb6run allfonts msls31 sandbox isolate_home
//env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks cmd comctl32 gdiplus mfc42 vcrun2003 vcrun2005 riched20 riched30
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks colorprofile corefonts d3dx9 fontfix gdiplus
//env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks fontsmooth-gray
//env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks fontsmooth-rgb

//env WINEARCH=win32 WINEPREFIX=/home/andy/.wine proxychains winetricks mfc40 colorprofile corefonts d3dx9 fontfix fontsmooth-gray fontsmooth-rgb fontsmooth-bgr gdiplus  msxml4 msxml6 riched20 riched30 tahoma urlmon vb6run allfonts msls31
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks ie8
这个会fail的
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks flash
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks vcrun2008 
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks vcrun2010
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks dotnet11 
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks dotnet20 
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks vjrun20
```
会导致程序挂掉的，不要安装
`comctl32`

显示会异常，不要安装
`fontsmooth-bgr`

如果出现
`winetricks sha256sum mismatch!`
`grep EUupdate.EXE /usr/bin/winetricks`
修改winetricks，这玩意是个脚本。。。
`sudo gedit /usr/bin/winetricks`

`9e0a3d8d6e449146dfb71272e30d3d21f2a756bf5a96ecf9957c96310d8ed2fd`

***
# wine运行exe
```
env LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine XXXXXXXX.exe
```
```
export WINEPREFIX=$HOME/.wine/
export WINEARCH=win32
export LANG=zh_CN.UTF-8
wine xxx.exe
```
==
```
env LC_ALL=zh_CN.UTF-8 LANG=zh_CN.UTF-8 WINEARCH=win32 WINEPREFIX=/home/andy/.wine wine xxx.exe
```
添加~/.bashrc
```
alias wine='env LC_ALL=zh_CN.UTF-8 LANG=zh_CN.UTF-8 WINEARCH=win32 WINEPREFIX=/home/andy/.wine wine'
```
快捷方式在
`～/.local/share/applications`
桌面整合在
`～/.config/menus/applications-merged`
快捷启动图标在
`～/.local/share/applications/wine/Programs/`
`~/Desktop`
wine几个工具 winrar，sourceinsight

mime
```
/home/andy/.local/share/mime/packages
/home/andy/.local/share/mime/application
update-desktop-database ~/.local/share/applications
update-mime-database ~/.local/share/mime
```


***
# wine-wechat （删）
```
sudo pacman -S wine-wechat
sudo pacman -R wine-wechat
rm -rf /home/andy/.local/lib/wine-wechat/default
sudo rm /usr/bin/wechat
```


***
# rar文件关联
`perl-file-mimeinfo` 调用 mimeopen 类似这样:
`mimeopen -d /path/to/file`
会提示用哪个程序来打开 `/path/to/file`:
```
Please choose a default application for files of type text/plain
       1) notepad  (wine-extension-txt)
       2) Leafpad  (leafpad)
       3) OpenOffice.org Writer  (writer)
       4) gVim  (gvim)
       5) Other...
```
添加rar类型的
`～/.local/share/mime/application/x-wine-extension-rar.xml
/home/andy/.local/share/mime/packages/x-wine-extension-rar.xml`
有关位置
```
～/.local/share/mime/application/
～/.local/share/mime/packages/
～/.local/share/applications
/usr/share/mime/packages
/usr/share/mime/application
```
其他有关mime的文件
`~/.config/mimeapps.list`
！！ 如果通过选择默认程选了wine里面的rar,会在这里体现,可以删掉pcmanfm多的openwith

一个好的mime图形化工具
`xfce4-mime-settings`


***
# wine安装ORCAD Capture 16.3精简版，只是为了看或者画16.2以上格式的原理图
~~首先，修改安装文件exe的名字，不要有中文~~
~~export LANG=zh_CN.utf8~~
~~wine capture.exe~~
~~这个屌货强制安装到d:盘哇~~
~~先到虚拟机里安装一个复制出来好了~~


以前wine过orcad10
`~/.local/share/applications/wine-extension-dsn.desktop`
查到
```
Exec=env LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine start /ProgIDOpen OrCADDesign-FileType %f
```
OrCADDesign-FileType是在`~/.wine/system.reg`中定义的
```
Z:\\home\\andy\\DOWN~NTG\\ORCA~RWC\\Capture\\Capture.exe
Z:\\home\\andy\\Downloads\\OrCAD_Demo\\Capture\\Capture.exe
```
替换成
```
C:\\Program Files\\ORCAD16.3\\Capture.exe
```
看上去是`C:\\Program Files\\ORCAD16.3\\Capture.exe`
实际上gedit用`C:\\\\Program Files\\\\ORCAD16.3\\\\Capture.exe`注意区别

## 重启wine
`wineboot`

试一下
```
env LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine start /ProgIDOpen OrCADDesign-FileType  machxo3-9400_dev_board_schematic_source.DSN
```
缺少 MFC80.DLL
```
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks --gui
```
```
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks win2k vcrun2005
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks vcrun2005sp1
env WINEARCH=win32 WINEPREFIX=/home/andy/.wine winetricks win2k vcrun2005sp1
```
安装vcrun2005不能
那么直接给mfc80.dll文件吧，可以运行了
```
export CDS_LIC_FILE=/home/andy/.wine/drive_c/Program\ Files/ORCAD16.3/license.txt
env LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine start /ProgIDOpen OrCADDesign-FileType  machxo3-9400_dev_board_schematic_source.DSN
```

修改一下`~/.local/share/applications/wine-extension-dsn.desktop`
```
Exec=env CDS_LIC_FILE=/home/andy/.wine/drive_c/Program\ Files/ORCAD16.3/license.txt LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine start /ProgIDOpen OrCADDesign-FileType %f
```
另外修改`gedit ~/.local/share/applications/wine-extension-opj.desktop`
```
Exec=env CDS_LIC_FILE=/home/andy/.wine/drive_c/Program\ Files/ORCAD16.3/license.txt LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine start /ProgIDOpen OrCADProject-FileType %f
```




***
# wine运行pads9.3精简版
假设放到
`~/.wine/drive_c/Program Files/MentorGraphics/`

license文件在`~/.wine/drive_c/Program Files/MentorGraphics/flexlm`
需要修改mac地址

需要修改比如`~/.wine/drive_c/Program Files/MentorGraphics/9.3PADS/SDD_HOME/Programs/powerpcb.ini`文件
否则会出现: "The directory pointed by the FileDir INI file entry cannot be found.Aborting."

然后按set.txt来设置linux环境变量和执行pads
```
env MGLS_LICENSE_FILE=/home/andy/.wine/drive_c/Program\ Files/MentorGraphics/flexlm/LICENSE.dat LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine powerpcb.exe
```
修改
`gedit ~/.local/share/applications/wine-extension-pcb.desktop`
```
Exec=env MGLS_LICENSE_FILE=/home/andy/.wine/drive_c/Program\ Files/MentorGraphics/flexlm/LICENSE.dat LANG=zh_CN.UTF-8 WINEPREFIX="/home/andy/.wine" wine start /ProgIDOpen PowerPCB.Design %f
```
右键wine可执行的windows的exe程序
```
cd .wine/drive_c/windows/
wine regedit.exe
cp /usr/share/doc/wine-development/examples/wine.desktop /home/andy/.local/share/applications
xfce4-mime-settings
```


***
# ext4分区删除文件不能建立trash can
ext4分区删除文件不能建立trash can，这个问题没有解决。参照debian的挂载参数尝试修改fstab也没有搞定。
```
sudo chown -R $USER .Trash-1000
```


***
# 主动锁屏
在`~/.config/openbox/rc.xml`合适位置添加如下内容
```
    <!-- Take a screenshot of the current window with gnome-screenshot when Alt+Print are pressed -->
    <keybind key="A-Print">
      <action name="Execute">
        <command>gnome-screenshot -w</command>
      </action>
    </keybind>
    <!-- Launch gnome-screenshot when Print is pressed -->
    <keybind key="Print">
      <action name="Execute">
        <command>gnome-screenshot</command>
      </action>
    </keybind>
    
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


***
# lts内核 对于滚挂的情况很有用(不要删)
```
//sudo pacman -R linux-lts
//sudo pacman -R linux-lts-headers
```


***
# something
`sudo usermod -aG brlapi andy`
```
sudo mv /etc/pipewire/pipewire.conf /etc/pipewire/pipewire.conf.bk
sudo mv /etc/pipewire/pipewire.conf.pacnew /etc/pipewire/pipewire.conf
```
`sudo pacman -S dos2unix`


***
# DSView 段错误有关处理
`yay DSView`
```
dsview 1.12-2 Segmentation fault： libusb downgrading to 1.0.24 makes it work just fine. [1.0.25-3 seems ok]
```


***
# 发现挂载的移动硬盘上的ext4分区，trash can又是正常的
```
/usr/share/polkit-1/actions/org.freedesktop.policykit.policy
/usr/share/polkit-1/actions/org.gtk.vfs.file-operations.policy
```
看起来木有问题

关于ntfs，设置对了uid是可以用trash can的
```
sudo mount -t ntfs -o uid=1000,gid=10 /dev/sdc1 test/
mkdir .Trash-1000
chown 1000:10 .Trash-1000
sudo mount -t ntfs -o uid=1000,gid=100 /dev/sdc1 test/
mkdir .Trash-1000
chown 1000:100 .Trash-1000
```
用id命令查看当前用户的uid什么的

## gvfs-trash is deprecated:
```
/////sudo vim /usr/bin/gvfs-trash
#!/bin/bash
# GVFS updated and dropped gvfs-trash to gio, but Atom didn't update.
/usr/bin/gio trash "$@"
sudo chmod +x /usr/bin/gvfs-trash
```
直接用`gio trash`删除就好了，如果Trashing on system internal mounts is not supported

根据
<https://bugzilla.xfce.org/show_bug.cgi?id=15922
https://gitlab.gnome.org/GNOME/glib/blob/master/gio/gunixmounts.c#L223>

g_unix_is_mount_path_system_internal(), they call to see if it's "system internal":

看来仓库的二进制文件是不再支持在/opt或者/dev/shm这样的位置创建trash can了


***
# git difftool 配置
```
See 'git difftool --tool-help' or 'git help config' for more details.
'git difftool' will now attempt to use one of the following tools:
opendiff kdiff3 tkdiff xxdiff meld kompare gvimdiff diffuse diffmerge ecmerge p4merge araxis bc codecompare emerge vimdiff
```

xxdiff/meld工具看起来还不错gitk直接可以设置为比较工具

gitk实际上可以比较任何两个commit之间的diff：先选old再在new上右键，再比较每一个文件的diff

meld用来merge还行，只用来比较有点太花哨了。还是默认xxdiff好了

```
yay xxdiff
sudo pacman -S meld
```


***
# pcb 文件 wine powerpcb 关联修复
```
xdg-mime query filetype 4L4.pcb
mimetype 4L4.pcb
file --mime-type 4L4.pcb
```
不一致
```
update-mime-database ~/.local/share/mime
gtk-update-icon-cache
update-desktop-database ~/.local/share/applications/
```
mime type 确实是正确的，但是，文件不显示icon，右键菜单的备选程序有icon。
```
sudo update-mime-database /usr/share/mime
```

根据
<https://wiki.archlinux.org/index.php/XDG_MIME_Applications>
`~/.local/share/mime/packages/application-x-foobar.xml`
```
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
    <mime-type type="application/x-foobar">
        <comment>foo file</comment>
        <icon name="application-x-foobar"/>
        <glob-deleteall/>
        <glob pattern="*.foo"/>
    </mime-type>
</mime-info>
```
## 类似的办法 opj 关联 orcad 弄了
`gedit ~/.local/share/mime/packages/x-wine-extension-dsn.xml`
```
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-wine-extension-dsn">
    <generic-icon name="application-x-wine-extension-dsn"/>
    <glob pattern="*.dsn"/>
    <comment>OrCAD Capture Design File Type</comment>
  </mime-type>
</mime-info>
```
```
update-mime-database ~/.local/share/mime
locate application-x-wine-extension-dsn.png
```
确实可以

## pcb格式呢
`sudo gedit /usr/share/mime/packages/pcb.xml`
加
```
<generic-icon name="application-x-pcb-layout"/>
```
```
sudo update-mime-database /usr/share/mime
update-mime-database ~/.local/share/mime
```
无效。。。。实际上在nautilus和thunar等都显示正常的，那么应该是pcmanfm的问题咯

因为`/usr/share/mime/packages/pcb.xml`会在update过程被更新所以
```
cp /usr/share/mime/packages/pcb.xml ~/.local/share/mime/packages/
update-mime-database ~/.local/share/mime
```

尝试
`sudo gedit /usr/share/mime/packages/pcb.xml`
添加  
```
<generic-icon name="application-x-pcb-layout"/>
<glob pattern="*.pcb"/>
```
```
sudo update-mime-database /usr/share/mime
sudo update-desktop-database /usr/share/applications
sudo gtk-update-icon-cache /usr/share/icons/hicolor
cat /usr/share/mime/application/x-pcb-layout.xml
```
pcmanfm下pcb文件还是没有图标，放弃了


***
# pcmanfm 替换研究
```
sudo pacman -S lxpanel libfm pcmanfm
sudo pacman -S lxpanel-gtk3 libfm-gtk3 pcmanfm-gtk3
sudo pacman -S libfm-qt pcmanfm-qt lxqt-archiver
```
openbox的文件浏览，无非pcmanfm，pcmanfm-qt，thunar什么的

非要替换的话，thunar目前看是最好的选择了


***
# totem 播放器
```
$ yay -S totem
```


***
# 安装ranger
```
$ yay -S ranger
Optional dependencies for ranger
    atool: for previews of archives
    elinks: for previews of html pages
    ffmpegthumbnailer: for video previews [installed]
    highlight: for syntax highlighting of code
    libcaca: for ASCII-art image previews [installed]
    lynx: for previews of html pages [installed]
    mediainfo: for viewing information about media files
    odt2txt: for OpenDocument texts
    perl-image-exiftool: for viewing information about media files [installed]
    poppler: for pdf previews [installed]
    python-chardet: in case of encoding detection problems [installed]
    sudo: to use the "run as root"-feature [installed]
    transmission-cli: for viewing bittorrent information [installed]
    ueberzug: for previews of images
    w3m: for previews of images and html pages [installed]
```
补充安装
```
$ yay -S atool lha elinks highlight mediainfo odt2txt ueberzug
```


***
# 安装i3-gaps
```
$ yay -S i3-gaps
Optional dependencies for i3-gaps
    rxvt-unicode: The terminal emulator used in the default config.
    dmenu: As menu. [installed]
    i3lock: For locking your screen.
    i3status: To display system information with a bar.
    perl-json-xs: For i3-save-tree [installed]
    perl-anyevent-i3: For i3-save-tree
$ yay -S i3status dunst
```


***
# libjaylink
安装aur/libjaylink-git
`$ yay -S libjaylink-git`
或者安装编译好的二进制包
`yay -S libjaylink`


***
# 安装stlink
pacman安装stlink
`//`//sudo cp -a /usr/lib/udev/rules.d/* /etc/udev/rules.d/`
安装pandoc
`yay -S pandoc`
```
git clone https://github.com/stlink-org/stlink.git
cd stlink
make release
sudo make install
$ sudo cp -a config/udev/rules.d/* /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```
```
sudo st-info --probe
sudo st-util -1
sudo st-info --chipid
sudo st-flash --reset erase
sudo st-flash write file.bin 0x08000000
sudo st-flash --debug write file.bin 0x08000000 > debug.log 2>&1
sudo st-flash reset
```
```
st-info --probe
st-util -1
st-info --chipid
st-flash --reset erase
st-flash write file.bin 0x08000000
st-flash --debug write file.bin 0x08000000 > debug.log 2>&1
st-flash reset
st-flash read out.bin 0x8000000 1048576
```
```
sudo modprobe -r usb-storage && sudo modprobe usb-storage
```
```
git clone https://github.com/stlink-org/stlink --branch v1.6.0
```
确认stlink v1已经不能在最新的环境使用了， stlink v2完全正常

安装`aur-stlink-git`

其他
`git clone git@github.com:EmBitz/EBlink.git`


***
# 安装 cutecom
```
$ yay -S cutecom
```

***
# libpgf
```
sudo pacman -S libpgf
```


***
# 20201216 全盘更新
`sudo pacman -Syu`
```
sudo systemctl disable qemu-ga.service
sudo systemctl enable qemu-guest-agent.service
sudo pacman -S qt5-charts vcdimager
sudo pacman -S boost ogre mygui
sudo pacman -S apparmor go-tools sdl_net
sudo pacman -S wireshark-qt
sudo pacman -S python2-pip python-pip
```


***
# 编译安装 snap
## 查看备选安装
`yay snapd`

## 编译失败
`makepkg -si`  编译失败

添加 `--nocheck` 选项
```
[在aur-pkg目录]
makepkg --nocheck
sudo pacman -S apparmor python-notify2 go-tools squashfuse
makepkg --nocheck
sudo pacman -U snapd-2.48.2-1-x86_64.pkg.tar.zst
```
`sudo systemctl enable --now snapd.socket`
`sudo systemctl restart snapd.service`
`sudo systemctl restart apparmor.service`
`sudo systemctl enable --now snapd.apparmor.service`
`sudo systemctl daemon-reload && sudo systemctl restart snapd`
`systemctl status snapd`
测试snap
```
snap version
snap --version
sudo snap install hello-world
sudo proxychains snap install hello-world
/var/lib/snapd/snap/bin/hello-world
sudo journalctl -u snapd
snap list
//sudo snap remove hello-world
snap find
```


***
# 优先用pacman安装python module！！
```
//sudo pip3.9 install --upgrade pip -i https://mirrors.163.com/pypi/simple
//sudo pip3.9 install tensorflow==1.5 -i https://mirrors.163.com/pypi/simple
//sudo pip3.9 install mxnet==1.1 -i https://mirrors.163.com/pypi/simple
sudo pacman -S python-numpy cython
//sudo pip3.9 install Cython -i https://mirrors.163.com/pypi/simple
//sudo pip3.9 install numpy -i https://mirrors.163.com/pypi/simple
//sudo pip3.9 install mkl -i https://mirrors.163.com/pypi/simple
//sudo pip3.9 install scipy -i https://mirrors.163.com/pypi/simple
//sudo pip3.9 uninstall scipy
/sudo pip3.9 install pilutil -i https://mirrors.163.com/pypi/simple
//sudo pip3.9 install scipy==1.1.0 -i https://mirrors.163.com/pypi/simple
```

<https://github.com/scipy/scipy/issues/6212>
`python3.9`
```
from scipy.misc import imread
cannot import ！
imread is deprecated in SciPy 1.0.0, and will be removed in 1.2.0. Use imageio.imread instead
```
`python3.9`
```
from imageio import imread
from matplotlib.pyplot import imread
```
优先用pacman安装python module
```
sudo pacman -S cfitsio gcc-fortran
sudo pacman -S python-scipy python-scipy-doc
//sudo pip3.9 install matplotlib -i https://mirrors.163.com/pypi/simple
sudo pacman -S python-matplotlib
sudo pacman -S python-notify2
sudo pacman -S python-pilkit cython python-qtpy
sudo pacman -S python-skorch python-scikit-image python-scikit-learn python-scikit-build python-pillow python-pillowfight python-pilkit
//sudo pip3.9 install scikit-image -i https://mirrors.163.com/pypi/simple
//sudo pip3.9 uninstall scikit-image
//sudo pip3.9 uninstall tifffile pywavelets networkx imageio
sudo pacman -S python-tensorflow python-opt_einsum python-tensorflow-estimator python-tensorflow-opt tensorflow tensorboard tensorflow-opt python-tensorboardx mxnet-git python-mxboard 
//sudo pacman -S python-horovod 
//sudo pacman -S python-pytorch-opt 
sudo pacman -S python-pytorch
```

***
# telegram
```
sudo pacman -S telegram-desktop ttf-opensans
```

***
# xilinx usb cable / xilinx下载线
安装fxload
`yay fxload`
安装hotplug的hex
`/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/install_script/install_drivers/`
安装rules
`/opt/Xilinx/Vivado/2017.4/data/xicom/cable_drivers/lin64/install_script/install_drivers`
修改rules
`sudo gedit /etc/udev/rules.d/52-xilinx-pcusb.rules`
```
# version 0002
#ATTR{idVendor}=="03fd", ATTR{idProduct}=="0008", MODE="666"
#ATTR{idVendor}=="03fd", ATTR{idProduct}=="0007", MODE="666"
#ATTR{idVendor}=="03fd", ATTR{idProduct}=="0009", MODE="666"
#ATTR{idVendor}=="03fd", ATTR{idProduct}=="000d", MODE="666"
#ATTR{idVendor}=="03fd", ATTR{idProduct}=="000f", MODE="666"
#ATTR{idVendor}=="03fd", ATTR{idProduct}=="0013", MODE="666"
#ATTR{idVendor}=="03fd", ATTR{idProduct}=="0015", MODE="666"

# version 0003
ATTRS{idVendor}=="03fd", ATTRS{idProduct}=="0008", MODE="666"
SUBSYSTEMS=="usb", ACTION=="add", ATTRS{idVendor}=="03fd", ATTRS{idProduct}=="0007", RUN+="/sbin/fxload -v -t fx2 -I /etc/hotplug/usb/xusbdfwu.fw/xusbdfwu.hex -D $tempnode"
SUBSYSTEMS=="usb", ACTION=="add", ATTRS{idVendor}=="03fd", ATTRS{idProduct}=="0009", RUN+="/sbin/fxload -v -t fx2 -I /etc/hotplug/usb/xusbdfwu.fw/xusb_xup.hex -D $tempnode"
SUBSYSTEMS=="usb", ACTION=="add", ATTRS{idVendor}=="03fd", ATTRS{idProduct}=="000d", RUN+="/sbin/fxload -v -t fx2 -I /etc/hotplug/usb/xusbdfwu.fw/xusb_emb.hex -D $tempnode"
SUBSYSTEMS=="usb", ACTION=="add", ATTRS{idVendor}=="03fd", ATTRS{idProduct}=="000f", RUN+="/sbin/fxload -v -t fx2 -I /etc/hotplug/usb/xusbdfwu.fw/xusb_xlp.hex -D $tempnode"
SUBSYSTEMS=="usb", ACTION=="add", ATTRS{idVendor}=="03fd", ATTRS{idProduct}=="0013", RUN+="/sbin/fxload -v -t fx2 -I /etc/hotplug/usb/xusbdfwu.fw/xusb_xp2.hex -D $tempnode"
SUBSYSTEMS=="usb", ACTION=="add", ATTRS{idVendor}=="03fd", ATTRS{idProduct}=="0015", RUN+="/sbin/fxload -v -t fx2 -I /etc/hotplug/usb/xusbdfwu.fw/xusb_xse.hex -D $tempnode"
```
如果要更新hex文件
```
//$ sudo cp /opt/Xilinx/Vivado/2017.4/data/xicom/xusb*.hex /etc/hotplug/usb/xusbdfwu.fw/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```

***
# deb包转pacman包
## 方法1：PKGBUILD脚本
可以像st-stlink-server那样编写PKGBUILD脚本
```
pkgname=st-stlink-server
pkgver=1.0.12
pkgrel=1
pkgdesc="st-link-server"
arch=('x86_64')
license=('custom')
depends=('libusb')
source=("${pkgname}-${pkgver}-${pkgrel}-linux-amd64.deb")
sha1sums=('434ec9bf507122fbd995a134bc6a94d1fa70a1ae')

build() {
	cd "${srcdir}"
	tar -Jxf data.tar.xz
}

package() {
	cd "${srcdir}"
	cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
```
然后
`makepkg`

##还可以用转换工具debtap
```
yay debtap
sudo debtap -u
debtap xxx.deb
```
```
#已经安装过了 /opt/Ac6/SystemWorkbench/install_stlink_udev.sh
/opt/Ac6/SystemWorkbench/stlinkserver/st-stlink-server-1.0.12-1-linux-amd64.deb经过debtap转换后
安装st-stlink-server-1.0.12-1-x86_64.pkg.tar.zst
```
***
# 从PKGBUILD产生deb包
`makedeb` <https://github.com/makedeb/makedeb>
`unipkg`
都可以实现

从makedeb修改得到convert_arch_to_deb，配合写个简单的PKGBUILD文件提供一下信息就好了，转换是可以的。。。。。

***
# 安装 docker
```
sudo pacman -S docker
```


***
# aria2 后台服务配置

## 1，安装前端
sudo pacman -S ariang-allinone

## 2. 配置服务
### 方法1，作为系统服务
`sudo mkdir -p /etc/aria2`
`sudo touch /etc/aria2/aria2.session`
`sudo gedit /etc/aria2/aria2.conf`
```
## '#'开头为注释内容, 选项都有相应的注释说明, 根据需要修改 ##
## 被注释的选项填写的是默认值, 建议在需要修改时再取消注释  ##
 
## 文件保存相关 ##
 
# 文件的保存路径(可使用绝对路径或相对路径), 默认: 当前启动位置
# dir=~/Downloads 不行啊，直接在/下创建了“～”目录呢
dir=/home/andy/Downloads
# 启用磁盘缓存, 0为禁用缓存, 需1.16以上版本, 默认:16M
disk-cache=32M
# 文件预分配方式, 能有效降低磁盘碎片, 默认:prealloc
# 预分配所需时间: none < falloc ? trunc < prealloc
# falloc和trunc则需要文件系统和内核支持
# NTFS建议使用falloc, EXT3/4建议trunc, MAC 下需要注释此项
# file-allocation=none
file-allocation=trunc
# 断点续传
continue=true

## 下载连接相关 ##
 
# 最大同时下载任务数, 运行时可修改, 默认:5
max-concurrent-downloads=20
# 同一服务器连接数, 添加时可指定, 默认:1
max-connection-per-server=10
# 最小文件分片大小, 添加时可指定, 取值范围1M -1024M, 默认:20M
# 假定size=10M, 文件为20MiB 则使用两个来源下载; 文件为15MiB 则使用一个来源下载
min-split-size=10M
# 单个任务最大线程数, 添加时可指定, 默认:5
#split=5
# 整体下载速度限制, 运行时可修改, 默认:0
#max-overall-download-limit=0
# 单个任务下载速度限制, 默认:0
#max-download-limit=0
# 整体上传速度限制, 运行时可修改, 默认:0
#max-overall-upload-limit=0
# 单个任务上传速度限制, 默认:0
#max-upload-limit=0
# 禁用IPv6, 默认:false
#disable-ipv6=true
# 连接超时时间, 默认:60
#timeout=60
# 最大重试次数, 设置为0表示不限制重试次数, 默认:5
#max-tries=5
# 设置重试等待的秒数, 默认:0
#retry-wait=0
 
## 进度保存相关 ##
 
# 从会话文件中读取下载任务
input-file=/etc/aria2/aria2.session
# 在Aria2退出时保存`错误/未完成`的下载任务到会话文件
save-session=/etc/aria2/aria2.session
# 定时保存会话, 0为退出时才保存, 需1.16.1以上版本, 默认:0
#save-session-interval=60
 
## RPC相关设置 ##
 
# 启用RPC, 默认:false
enable-rpc=true
# 允许所有来源, 默认:false
rpc-allow-origin-all=true
# 允许非外部访问, 默认:false
rpc-listen-all=true
# 事件轮询方式, 取值:[epoll, kqueue, port, poll, select], 不同系统默认值不同
#event-poll=select
# RPC监听端口, 端口被占用时可以修改, 默认:6800
#rpc-listen-port=6800
# 设置的RPC授权令牌, v1.18.4新增功能, 取代 --rpc-user 和 --rpc-passwd 选项
rpc-secret=mytoken
# 设置的RPC访问用户名, 此选项新版已废弃, 建议改用 --rpc-secret 选项
#rpc-user=<USER>
# 设置的RPC访问密码, 此选项新版已废弃, 建议改用 --rpc-secret 选项
#rpc-passwd=<PASSWD>
# 是否启用 RPC 服务的 SSL/TLS 加密,
# 启用加密后 RPC 服务需要使用 https 或者 wss 协议连接
#rpc-secure=true
# 在 RPC 服务中启用 SSL/TLS 加密时的证书文件,
# 使用 PEM 格式时，您必须通过 --rpc-private-key 指定私钥
#rpc-certificate=/path/to/certificate.pem
# 在 RPC 服务中启用 SSL/TLS 加密时的私钥文件
#rpc-private-key=/path/to/certificate.key
 
## BT/PT下载相关 ##
 
# 当下载的是一个种子(以.torrent结尾)时, 自动开始BT任务, 默认:true
#follow-torrent=true
# BT监听端口, 当端口被屏蔽时使用, 默认:6881-6999
listen-port=51413
# 单个种子最大连接数, 默认:55
#bt-max-peers=55
# 打开DHT功能, PT需要禁用, 默认:true
enable-dht=false
# 打开IPv6 DHT功能, PT需要禁用
#enable-dht6=false
# DHT网络监听端口, 默认:6881-6999
#dht-listen-port=6881-6999
# 本地节点查找, PT需要禁用, 默认:false
#bt-enable-lpd=false
# 种子交换, PT需要禁用, 默认:true
enable-peer-exchange=false
# 每个种子限速, 对少种的PT很有用, 默认:50K
#bt-request-peer-speed-limit=50K
# 客户端伪装, PT需要
peer-id-prefix=-TR2770-
user-agent=Transmission/2.77
# 当种子的分享率达到这个数时, 自动停止做种, 0为一直做种, 默认:1.0
seed-ratio=0
# 强制保存会话, 即使任务已经完成, 默认:false
# 较新的版本开启后会在任务完成后依然保留.aria2文件
#force-save=false
# BT校验相关, 默认:true
#bt-hash-check-seed=true
# 继续之前的BT任务时, 无需再次校验, 默认:false
bt-seed-unverified=true
# 保存磁力链接元数据为种子文件(.torrent文件), 默认:false
bt-save-metadata=true

```
ref:
<https://wiki.archlinux.org/index.php/Aria2>
```
continue
daemon=true
dir=/home/aria2/Downloads
file-allocation=falloc
log-level=warn
max-connection-per-server=4
max-concurrent-downloads=3
max-overall-download-limit=0
min-split-size=5M
enable-http-pipelining=true

enable-rpc=true
rpc-listen-all=true
rpc-user=rpcuser
rpc-passwd=rpcpass
```

`sudo gedit /etc/systemd/system/aria2cd.service`
```
[Unit]
Description=Aria2 Daemon

[Service]
Type=simple
ExecStart=/usr/bin/aria2c --conf-path=/etc/aria2/aria2.conf
TimeoutSec=0
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target

```
`sudo systemctl enable aria2cd.service`
`sudo systemctl start aria2cd.service`

上面那样设置，aria2c的运行是以root身份。不想这样
```
sudo systemctl stop aria2cd.service
sudo systemctl disable aria2cd.service
sudo rm /etc/systemd/system/aria2cd.service
sudo rm -rf /etc/aria2
```

### 方法2， 作为用户服务
```
mkdir ~/.config/aria2
touch ~/.config/aria2/aria2.session #用于保存日志
touch ~/.config/aria2/aria2.conf #创建配置文件
```
`gedit ~/.config/aria2/aria2.conf`
```
## '#'开头为注释内容, 选项都有相应的注释说明, 根据需要修改 ##
## 被注释的选项填写的是默认值, 建议在需要修改时再取消注释  ##
 
## 文件保存相关 ##
 
# 文件的保存路径(可使用绝对路径或相对路径), 默认: 当前启动位置
# dir=~/Downloads
dir=/home/andy/Downloads
# 启用磁盘缓存, 0为禁用缓存, 需1.16以上版本, 默认:16M
disk-cache=32M
# 文件预分配方式, 能有效降低磁盘碎片, 默认:prealloc
# 预分配所需时间: none < falloc ? trunc < prealloc
# falloc和trunc则需要文件系统和内核支持
# NTFS建议使用falloc, EXT3/4建议trunc, MAC 下需要注释此项
# file-allocation=none
file-allocation=trunc
# 断点续传
continue=true

## 下载连接相关 ##
 
# 最大同时下载任务数, 运行时可修改, 默认:5
max-concurrent-downloads=20
# 同一服务器连接数, 添加时可指定, 默认:1
max-connection-per-server=10
# 最小文件分片大小, 添加时可指定, 取值范围1M -1024M, 默认:20M
# 假定size=10M, 文件为20MiB 则使用两个来源下载; 文件为15MiB 则使用一个来源下载
min-split-size=10M
# 单个任务最大线程数, 添加时可指定, 默认:5
#split=5
# 整体下载速度限制, 运行时可修改, 默认:0
#max-overall-download-limit=0
# 单个任务下载速度限制, 默认:0
#max-download-limit=0
# 整体上传速度限制, 运行时可修改, 默认:0
#max-overall-upload-limit=0
# 单个任务上传速度限制, 默认:0
#max-upload-limit=0
# 禁用IPv6, 默认:false
#disable-ipv6=true
# 连接超时时间, 默认:60
#timeout=60
# 最大重试次数, 设置为0表示不限制重试次数, 默认:5
#max-tries=5
# 设置重试等待的秒数, 默认:0
#retry-wait=0
 
## 进度保存相关 ##
 
# 从会话文件中读取下载任务
input-file=/home/andy/.config/aria2/aria2.session
# 在Aria2退出时保存`错误/未完成`的下载任务到会话文件
save-session=/home/andy/.config/aria2/aria2.session
# 定时保存会话, 0为退出时才保存, 需1.16.1以上版本, 默认:0
#save-session-interval=60
 
## RPC相关设置 ##
 
# 启用RPC, 默认:false
enable-rpc=true
# 允许所有来源, 默认:false
rpc-allow-origin-all=true
# 允许非外部访问, 默认:false
rpc-listen-all=true
# 事件轮询方式, 取值:[epoll, kqueue, port, poll, select], 不同系统默认值不同
#event-poll=select
# RPC监听端口, 端口被占用时可以修改, 默认:6800
#rpc-listen-port=6800
# 设置的RPC授权令牌, v1.18.4新增功能, 取代 --rpc-user 和 --rpc-passwd 选项
rpc-secret=mytoken
# 设置的RPC访问用户名, 此选项新版已废弃, 建议改用 --rpc-secret 选项
#rpc-user=<USER>
# 设置的RPC访问密码, 此选项新版已废弃, 建议改用 --rpc-secret 选项
#rpc-passwd=<PASSWD>
# 是否启用 RPC 服务的 SSL/TLS 加密,
# 启用加密后 RPC 服务需要使用 https 或者 wss 协议连接
#rpc-secure=true
# 在 RPC 服务中启用 SSL/TLS 加密时的证书文件,
# 使用 PEM 格式时，您必须通过 --rpc-private-key 指定私钥
#rpc-certificate=/path/to/certificate.pem
# 在 RPC 服务中启用 SSL/TLS 加密时的私钥文件
#rpc-private-key=/path/to/certificate.key
 
## BT/PT下载相关 ##
 
# 当下载的是一个种子(以.torrent结尾)时, 自动开始BT任务, 默认:true
#follow-torrent=true
# BT监听端口, 当端口被屏蔽时使用, 默认:6881-6999
listen-port=51413
# 单个种子最大连接数, 默认:55
#bt-max-peers=55
# 打开DHT功能, PT需要禁用, 默认:true
enable-dht=false
# 打开IPv6 DHT功能, PT需要禁用
#enable-dht6=false
# DHT网络监听端口, 默认:6881-6999
#dht-listen-port=6881-6999
# 本地节点查找, PT需要禁用, 默认:false
#bt-enable-lpd=false
# 种子交换, PT需要禁用, 默认:true
enable-peer-exchange=false
# 每个种子限速, 对少种的PT很有用, 默认:50K
#bt-request-peer-speed-limit=50K
# 客户端伪装, PT需要
peer-id-prefix=-TR2770-
user-agent=Transmission/2.77
# 当种子的分享率达到这个数时, 自动停止做种, 0为一直做种, 默认:1.0
seed-ratio=0
# 强制保存会话, 即使任务已经完成, 默认:false
# 较新的版本开启后会在任务完成后依然保留.aria2文件
#force-save=false
# BT校验相关, 默认:true
#bt-hash-check-seed=true
# 继续之前的BT任务时, 无需再次校验, 默认:false
bt-seed-unverified=true
# 保存磁力链接元数据为种子文件(.torrent文件), 默认:false
bt-save-metadata=true

daemon=true
```

`mkdir -p ~/.config/systemd/user`
`gedit ~/.config/systemd/user/aria2cd.service`
```
[Unit]
Description=Aria2 Daemon

[Service]
Type=forking
ExecStart=/usr/bin/aria2c --conf-path=/home/andy/.config/aria2/aria2.conf
TimeoutSec=0
RemainAfterExit=yes

[Install]
WantedBy=default.target
```
Type=forking情况下，要么配置文件设置成daemon=true，要么ExecStart加-D选项

或者Type=simple，不过这样不太好

```
systemctl --user enable aria2cd.service
systemctl --user daemon-reload
systemctl --user start aria2cd.service
```
ok了

## aria2，也可添加-D选项，后台启动
`aria2c --conf-path=$HOME/.config/aria2/aria2.conf -D`

和前面的启动用户服务的方法是等效的, 可以添加到自动启动脚本

## aria2c前端uget-gtk

uget old settings
```
curl
http://localhost:6800/jsonrpc
path:aria2c
arguments:--enable-rpc=true -D --disable-ipv6 --check-certificate=false
```
uget new settings
```
aria2+curl
http://localhost:6800/jsonrpc
token:mytoken
path:aria2c
arguments:--conf-path=/home/andy/.config/aria2/aria2.conf
```

## aria2c前端ariang-allinone配置
ariang settings -> RPC(localhost:6800) -> Token填入 RPC授权令牌 前面设置的是“mytoken”


***
# 监控网口流量
```
sudo pacman -S nethogs
sudo nethogs wlan0
```

***
# 安装 ddd
```
yaourt ddd
gpg --keyserver keyserver.ubuntu.com --recv-keys 6656C593E5158D1A
```


***
# Xilin vivado sdk rlwrap使用native版本
`sudo pacman -S rlwrap`
修改tclsh，xmd，xstc，xsdb，xtclsh(不同版本稍有不同)
替换
```
"$RDI_BINROOT"/unwrapped/"$RDI_PLATFORM$RDI_OPT_EXT"/rlwrap
```
为
```
/usr/bin/rlwrap
```

***
# gtk-icon-theme
选一个
```
~/.gtkrc-2.0
/etc/gtk-2.0/gtkrc
```
add the following line:
```
gtk-icon-theme-name = "gnome"
```

***
# something
`sudo usermod -aG storage andy`

***
# gtk3版本的lxappearance运行不起来..
```
sudo pacman -S lxappearance lxappearance-obconf 
sudo pacman -S gnome-icon-theme gnome-icon-theme-extras mate-icon-theme mate-icon-theme-faenza xcursor-themes
sudo pacman -S tango-icon-theme-extras tango-icon-theme
```


***
# 创建百度网盘的命令启动
`cd /usr/local/bin`
`sudo gedit baidunetdisk`
```
#!/bin/bash
cd /opt/baidunetdisk
./baidunetdisk
```
`sudo chmod +x baidunetdisk`

***
# 邮件和快捷键的编辑器都设置成notepadqq
苦于gedit什么的没有掉电保存功能
更新notepadqq
邮件和快捷键的编辑器都设置成notepadqq


***
# pycharm
sudo pacman -S pycharm-professional
sudo pacman -S libopenraw



***
# //安装kde[目前千万不要安装]

```
sudo pacman -S plasma-meta
sudo pacman -Rns plasma-meta
noto-fonts-cjk 
noto-fonts-extra
gnuplot
plasma-workspace
packagekit-qt5
breeze-gtk
qt5-virtualkeyboard
plasma-workspace-wallpapers
networkmanager-qt
gpsd
kdepim-addons
appmenu-gtk-module
baloo
discover
kross
purpose
quota-tools
plasma-nm
powerdevil
ibus
scim
encfs
cryfs
gocryptfs
packagekit-qt5
fwupd
breeze-grub


sudo pacman -S plasma
sudo pacman -S plasma-desktop
sudo pacman -S plasma-wayland-session
sudo pacman -Rns plasma-wayland-session
opus-tools
maxima
octave
r
sagemath
julia
libdvdcss
gnu-free-fonts
live-media
libgoom2
aribb24
aribb25
libva-vdpau-driver
kimageformats
kipi-plugins
kamera
postgresql
libetebase
vorbis-tools
python-language-server
texlab
rust
sox
movit
rtaudio
dvdauthor
recordmydesktop
xine-ui
grammalecte
libmediawiki
libkvkontakte
gnuchess
libgadu
mediastreamer
python-random2
python-pysol_cards
languagetool
libwlocate
shapelib
calligra
udftools
system-config-printer
telepathy-gabble
telepathy-haze
telepathy-morse
telepathy-salut
lldb
okteta
cppcheck
astyle
heaptrack

sudo pacman -S kde-applications
sudo pacman -S kde-applications-meta 
sudo pacman -Rns kde-applications-meta

sudo pacman -Rns kdevelop kdevelop-php libksysguard umbrello plasma-workspace kget telepathy-kde-desktop-applets
sudo pacman -Rns plasma

sudo pacman -Rns baloo baloo-widgets dolphin konqueror elisa gwenview





balooctl disable

~/.config/kwalletrc
[Wallet]
Enabled=false
Open=false




opera
inode/directory=pcmanfm.desktop
sudo pacman -S gnome gnome-extra gnome-shell


locate org.kde.kgpg.desktop
sudo rm /etc/xdg/autostart/org.kde.kgpg.desktop
sudo gedit /usr/share/dbus-1/services/org.gnome.OnlineAccounts.service
注释掉goa-daemon



dpms is the Display Power Management Signalling. For the xfce4-power-manager to disable it is a simple command mainly just to quit it.

xfce4-power-manager -q
To re-enable xfce4-power-manager it is:

nohup xfce4-power-manager & 2>&1 >/dev/null
To disable the dpms run the following command:

xset -dpms
To enable dpms it is just the opposite:

xset dpms


sudo gedit /usr/share/dbus-1/services/org.kde.kglobalaccel.service
sudo gedit /usr/share/dbus-1/services/org.kde.activitymanager.service 
cat /etc/xdg/autostart/xfce4-screensaver.desktop
cat /etc/xdg/autostart/xfce4-power-manager.desktop
都改成不执行或者添加Hidden=true

sudo gedit /usr/share/kservices5/kglobalaccel5.desktop
添加Hidden=true


安装kde带来的配置冲突简直是个灾难
从备份盘里恢复吧，需要恢复的有 /分区， /home的配置文件需要把目前的一些多余设置删除， 安装缺失的部分补上。很简单的。
```


***
# online-accounts
```
systemctl list-units | grep service
systemctl list-unit-files
systemctl is-enabled dbus.service
systemd-analyze blame
```
```
systemctl mask seems to be an effective way to disable services and is reversible with unmask eg. -
Code: [Select]
systemctl mask lvm2-activation.service

creating an empty 'foo.service' file in ~/.local/share/dbus-1/services effectively disables the foo service by taking precedence over the (working) foo.service file in /usr/share
```
`/usr/share/dbus-1/system.conf and /usr/share/dbus-1/session.conf`
```
<policy group="lp">
    <allow send_destination="org.bluez"/>
    <allow send_destination="org.bluez.obex"/>
  </policy>

  <policy context="default">
    <deny send_destination="org.bluez"/>
    <deny send_destination="org.bluez.obex"/>
  </policy>
```
`ls /usr/share/dbus-1/services/`
```
goa-daemon
/usr/share/dbus-1/services/org.gnome.OnlineAccounts.service
goa-identity-service
/usr/share/dbus-1/services/org.gnome.Identity.service
gvfs-goa-volume-monitor
/usr/share/dbus-1/services/org.gtk.vfs.GoaVolumeMonitor.service
```
`sudo gedit /usr/share/dbus-1/session.conf`
添加
```
  <policy context="default">
    <deny send_destination="org.gnome.OnlineAccounts"/>
    <deny send_destination="org.gtk.vfs.GoaVolumeMonitor"/>
    <deny send_destination="org.gnome.Identity"/>
  </policy>
```
放到最后的</busconfig> 之前
无效

下面的有效
```
mkdir -p ~/.local/share/dbus-1/services

cp /usr/share/dbus-1/services/org.gnome.Identity.service ~/.local/share/dbus-1/services/org.gnome.Identity.service

cp /usr/share/dbus-1/services/org.gnome.OnlineAccounts.service ~/.local/share/dbus-1/services/org.gnome.OnlineAccounts.service

cp /usr/share/dbus-1/services/org.gtk.vfs.GPhoto2VolumeMonitor.service ~/.local/share/dbus-1/services/org.gtk.vfs.GPhoto2VolumeMonitor.service
```
replace the Exec=/usr/lib/gnome-online-accounts/..... line with Exec=exit
```
xed ~/.local/share/dbus-1/services/org.gnome.Identity.service
xed ~/.local/share/dbus-1/services/org.gnome.OnlineAccounts.service
xed ~/.local/share/dbus-1/services/org.gtk.vfs.GPhoto2VolumeMonitor.service
```
```
mkdir -p ~/.local/share/systemd/user/
cp /usr/lib/systemd/user/gvfs-goa-volume-monitor.service ~/.local/share/systemd/user/gvfs-goa-volume-monitor.service
gedit ~/.local/share/systemd/user/gvfs-goa-volume-monitor.service
```
```
ExecStart=exit
```
这个之后gedit，thunar等启动会变慢哦
```
rm ~/.local/share/systemd/user/gvfs-goa-volume-monitor.service
```
就好了

To revert
CODE: SELECT ALL
```
rm -r ~/.local/share/dbus-1/services
```

***
# xfce4一些配置
```
sudo gedit /etc/xdg/autostart/xfce4-screensaver.desktop
sudo gedit /etc/xdg/autostart/xfce4-power-manager.desktop
```
添加Hidden=true木有用
都改成不执行，比如
Exec=xfce4-power-manager
改成
#Exec=xfce4-power-manager


***
# gvfs 有关
```
busctl --user
loginctl session-status
echo $DBUS_SESSION_BUS_ADDRESS
hostnamectl
journalctl -xf
pacman -Qikk gvfs
pgrep -u andy -l
systemctl --user list-unit-files |grep gvfs
```


***
# 键盘有关
查看系统默认已有的keycode
```
xmodmap -pke
```
查看keycode
`xev | grep keycode`

```
localectl list-x11-keymap-layouts

//登陆打开NumLock键
//$ gsettings set org.gnome.settings-daemon.peripherals.keyboard numlock-state on
```

```
localectl status

localectl list-keymaps
localectl list-keymaps | grep -i search_term

setxkbmap -print -verbose 10
```

loadkeys 工具临时修改键盘布局

```
sudo localectl set-keymap --no-convert us
同时修改了/etc/vconsole.conf 和当前会话中的 KEYMAP
us
jp106
```
```
yaourt xkb-switch 
yaourt xkblayout-state

xkblayout-state print "%s"
xkb-switch -s jp106
xkblayout-state print "%s"
xkb-switch -l
怎么就一个？
```


***
# evtest
```
sudo pacman -S evtest
sudo evtest
```

***
# 一些字体
```
sudo pacman -S wqy-microhei wqy-zenhei wqy-microhei-lite wqy-bitmapfont
```

***
# eclipse-ecj
```
sudo pacman -S eclipse-ecj
```
安装包默认不覆盖已经存在的文件，比如python就比较常见这样的现象
```
python-setuptools: /usr/lib/python3.9/site-packages/setuptools/tests/textwrap.py exists in filesystem
Errors occurred, no packages were upgraded.
error installing repo packages
```
办法，强制覆盖
`pacman -S <package> --overwrite=*`
这里具体就是
```
sudo pacman -Syu --overwrite=*
```


***
# 替换wine的版本
```
sudo pacman -S wine-staging
sudo pacman -S dosbox cups lib32-vkd3d vkd3d
sudo pacman -S foomatic-db antiword docx2txt
sudo pacman -S playonlinux
```


***
# miredo修复
检查`/lib/systemd/system/miredo.service`
```
[Unit]
Description=Teredo IPv6 tunneling
After=network-online.target

[Service]
ExecStartPre=/usr/bin/miredo-checkconf -f /etc/miredo/miredo.conf
ExecStart=/usr/bin/miredo -f
ExecReload=/bin/kill -HUP $MAINPID

[Install]
WantedBy=multi-user.target
```
`sudo systemctl enable systemd-networkd-wait-online.service`
`sudo systemctl enable miredo.service`


***
# 在si4输入中文
`env LC_ALL="zh_CN.UTF-8" LANG="zh_CN.UTF-8" XMODIFIERS=@im=fcitx GTK_IM_MODULE=fcitx QT4_IM_MODULE=fcitx QT_IM_MODULE=fcitx WINEARCH=win32 WINEPREFIX="/home/andy/.wine" wine C:\\\\Program\\ Files\\\\Source\\ Insight\\ 4.0\\\\sourceinsight4.exe`
还是不能在si4输入中文


***
# v2ray 修复
```
failed to read config files: [/etc/v2ray/config.json] > v2ray.com/core/infra/conf: unknown cipher method: aes-256-cfb
v2ray-desktop
git-lfs
qwt
botan1.10
```


***
# 20210114 全盘更新
```
sudo pacman -Syu
error: failed to prepare transaction (could not satisfy dependencies)
:: installing wxgtk2 (3.0.5.1-2) breaks dependency 'wxgtk' required by gspiceui
:: installing wxgtk2 (3.0.5.1-2) breaks dependency 'wxgtk' required by pyuv
sudo pacman -R gspiceui
sudo pacman -R pyuv
yay gspiceui
yay pyuv
:: There are 3 providers available for wxgtk:
:: Repository AUR
    1) wxgtk-git 2) wxgtk2-dev 3) wxgtk2-light 
选2

更新了
wxgtk-common --> wxgtk-common-dev
wxgtk2 --> wxgtk2-dev
```
实际上，不需要替换的，修改编译配置为依赖wxgtk-common就可以了


***
# 图片有(1).jpg之类的重复，删除
`rm *\)\.jpg`


***
# 一些 missing firmware
WARNING: Possibly missing firmware for module: aic94xx
WARNING: Possibly missing firmware for module: wd719x
modinfo wd719x

git clone https://aur.archlinux.org/aic94xx-firmware.git
cd aic94xx-firmware
makepkg -sri
git clone https://aur.archlinux.org/wd719x-firmware.git
cd wd719x-firmware
makepkg -sri
yay upd72020x-fw



***
# ltspice
```
yay ltspice
```


***
# zoom
`cd /usr/local/bin`
`sudo gedit zoom`
```
#!/bin/bash
cd /opt/zoom
export LD_LIBRARY_PATH=.
./zoom
```
`sudo chmod +x zoom`

`sudo rm zoom`
God damn zoom!

<https://cdn.zoom.us/prod/5.4.57862.0110/zoom_x86_64.pkg.tar.xz>
```
sudo pacman -U zoom_x86_64.pkg.tar.xz --overwrite=*
sudo pacman -S xcompmgr
```


***
# allegro display err
```
ldd /opt/cadence/SPB166/tools.lnx86/pcb/bin/allegro.exe
export LD_LIBRARY_PATH=/usr/lib32:/usr/lib:/usr/lib64:$CDS_ROOT/tools/lib64:$CDS_ROOT/tools.lnx86/mainwin540_64/mw/lib-amd64_linux_optimized:$CDS_ROOT/tools.lnx86/lib:$CDS_ROOT/tools.lnx86/mainwin540/mw/lib-linux_optimized:$LD_LIBRARY_PATH
ldd /opt/cadence/SPB166/tools.lnx86/pcb/bin/allegro.exe
```
附加的库路径有和系统库路径冲突的库，懒得一个个补成系统库，去掉冲突的就好了哇
`/opt/cadence/SPB166/tools.lnx86/lib`目录下的
```
libgcc_s.so.1 -> libgcc_s.so.1.bk
libstdc++.so.6 -> libstdc++.so.6.bk
```
到这里可以运行

命令行运行会看到缺drirc

以前从fedora哪个包存档的，懒得找arch的包了。那么建立：

`～/.drirc和/etc/drirc`，内容一样如下
```
<!--

============================================
Application bugs worked around in this file:
============================================

* Various Unigine products don't use the #version and #extension GLSL
  directives, meaning they only get GLSL 1.10 and no extensions for their
  shaders.
  Enabling all extensions for Unigine fixes most issues, but the GLSL version
  is still 1.10.

* Unigine Heaven 3.0 with ARB_texture_multisample uses a "ivec4 * vec4"
  expression, which fails to compile with GLSL 1.10.
  Adding "#version 130" fixes this.

* Unigine Heaven 3.0 with ARB_shader_bit_encoding uses the uint keyword, which
  fails to compile with GLSL 1.10.
  Adding "#version 130" fixes this.

* Unigine Heaven 3.0 with ARB_shader_bit_encoding uses a "uint & int"
  expression, which fails (and should fail) to compile with any GLSL version.
  Disabling ARB_shader_bit_encoding fixes this.

TODO: document the other workarounds.

-->

<driconf>
    <!-- Please always enable app-specific workarounds for all drivers and
         screens. -->
    <device>
        <application name="Unigine Sanctuary" executable="Sanctuary">
            <option name="force_glsl_extensions_warn" value="true" />
            <option name="disable_blend_func_extended" value="true" />
	</application>

        <application name="Unigine Tropics" executable="Tropics">
            <option name="force_glsl_extensions_warn" value="true" />
            <option name="disable_blend_func_extended" value="true" />
	</application>

        <application name="Unigine Heaven (32-bit)" executable="heaven_x86">
            <option name="force_glsl_extensions_warn" value="true" />
            <option name="disable_blend_func_extended" value="true" />
            <option name="force_glsl_version" value="130" />
            <option name="disable_shader_bit_encoding" value="true" />
	</application>

        <application name="Unigine Heaven (64-bit)" executable="heaven_x64">
            <option name="force_glsl_extensions_warn" value="true" />
            <option name="disable_blend_func_extended" value="true" />
            <option name="force_glsl_version" value="130" />
            <option name="disable_shader_bit_encoding" value="true" />
	</application>

        <application name="Unigine OilRush (32-bit)" executable="OilRush_x86">
            <option name="disable_blend_func_extended" value="true" />
	</application>

        <application name="Unigine OilRush (64-bit)" executable="OilRush_x64">
            <option name="disable_blend_func_extended" value="true" />
	</application>

        <application name="Savage 2" executable="savage2.bin">
            <option name="disable_glsl_line_continuations" value="true" />
        </application>

        <application name="Topogun (32-bit)" executable="topogun32">
            <option name="always_have_depth_buffer" value="true" />
        </application>

        <application name="Topogun (64-bit)" executable="topogun64">
            <option name="always_have_depth_buffer" value="true" />
        </application>
    </device>
</driconf>
```
ok， 是不是该考虑升级成spp170？


***
# DraftSight 等出错处理
DraftSight因为库依赖问题不能用
`yay DraftSight`
<http://dl-ak.solidworks.com/nonsecure/draftsight/2019SP3/draftSight.rpm>
404了。
直接解决库问题吧
`/opt/dassault-systemes/DraftSight/Linux/DraftSight`
```
ymbol lookup error: /usr/lib/libfontconfig.so.1: undefined symbol: FT_Done_MM_Var
```
`ldd /opt/dassault-systemes/DraftSight/Linux/DraftSight`
`locate libfontconfig.so.1`
```
cp /home/andy/.local/share/Steam/ubuntu12_32/steam-runtime/usr/lib/x86_64-linux-gnu/libfontconfig.so.1.4.4 /opt/dassault-systemes/DraftSight/Libraries
cd /opt/dassault-systemes/DraftSight/Libraries
ln -s libfontconfig.so.1.4.4 libfontconfig.so.1
```
用户配置文件在
`~/.config/dassault-systemes`

active不了啊，狗日的达索

还是查aur吧，
<https://aur.archlinux.org/packages/draftsight/?O=10&PP=10>
有人post出来存档的链接。。。。。。

那么就用makepkg编译一个呗，也纳入pacman的管理
draftSight.rpm名字修改成draftsight-2019SP3

这样就剩下产品过期问题，参考
```
cd /opt/dassault-systemes/DraftSight/Linux/
env LD_PRELOAD=/usr/lib/libfreetype.so --unset=XDG_CURRENT_DESKTOP --unset=DESKTOP_SESSION --unset=GNOME_DESKTOP_SESSION_ID vblank_mode=0 faketime '2020-02-29 08:15:42' ./DraftSight
（export LIBGL_DEBUG=verbose 据说 will have probably errors with DRI）
```
desktop文件修改一下，加一个 faketime 变量
```
[Desktop Entry]
Name=DraftSight
Comment=Freeware CAD software for your DWG/DXF files.
GenericName=DraftSight
Exec=env LD_PRELOAD=/usr/lib/libfreetype.so --unset=XDG_CURRENT_DESKTOP --unset=DESKTOP_SESSION --unset=GNOME_DESKTOP_SESSION_ID vblank_mode=0 faketime '2020-02-29 08:15:42' /opt/dassault-systemes/DraftSight/Linux/DraftSight %U
Path=/opt/dassault-systemes/DraftSight/Linux
Type=Application
Terminal=false
Icon=draftsight
MimeType=image/vnd.dwg;image/vnd.dwt;image/vnd.dxf;application-vnd.dassault-systemes.draftsight-dwg;application-vnd.dassault-systemes.draftsight-dwt;application-vnd.dassault-systemes.draftsight-dxf
Categories=Application;Graphics;2DGraphics;RasterGraphics;
```
就大功告成. 注意，达索已经不更新linux版本了。




类似的 graebert-gmbh
rpm包已经准备好，参照上面的aur配置可以自己生成一个pacman包... 有时间再弄了


qcad是pacman仓库就已经有的，暂时不安装
```
//sudo pacman -S qcad
```
不过这玩意的命令用起来不方便，还是上面法国佬和德国佬的两个好。


***
# openproj 问题处理
openproj已经安装了运行有点问题
解决：
确保`/usr/lib/jvm/java-8-openjdk`已经有java8
修改`$HOME/.openproj/run.conf`，
将
```
JAVA_OPTS="-Xms128m -Xmx768m"
```
改为
```
JAVA_OPTS="-Djava.vendor=Sun -Xms128m -Xmx768m"
```
重启openproj


***
# pyqt4 有关

`sudo pip3.6 uninstall sip`
`cd sip-4.19.12/`
`python3 configure.py`	## 这次是配置 编译PyQt 要用的SIP v4 (i.e. the sip.sipconfig module)
`make`
`sudo make install`

PyQt4_gpl_x11-4.12.3编译
```
compiling this package failed because of $[QT_INSTALL_LIBS] = 0 PLease replace '$[QT_INSTALL_LIBS]' with ‘/usr/lib’.
```
`gedit configure.py`
修改
```
        pyqt_modules.append("QtCore")
```
为
```
        pyqt_modules.append("QtCore")
        pyqt_modules.append("QtGui")
        pyqt_modules.append("QtHelp")
        pyqt_modules.append("QtMultimedia")
        pyqt_modules.append("QtNetwork")
        pyqt_modules.append("QtDBus")
        pyqt_modules.append("QtDeclarative")
        pyqt_modules.append("QtScript")
        pyqt_modules.append("QtScriptTools")
        pyqt_modules.append("QtOpenGL")
        pyqt_modules.append("QtSql")
        pyqt_modules.append("QtSvg")
        pyqt_modules.append("QtTest")
        pyqt_modules.append("QtWebKit")
        pyqt_modules.append("QtXml")
        pyqt_modules.append("QtXmlPatterns")
        pyqt_modules.append("phonon")
        pyqt_modules.append("QtDesigner")
```
```
for files in `find . -type f -name "Makefile"`
do
sed -i 's/$$\[QT_INSTALL_LIBS\]/\/usr\/lib/' $files
done
```
```
python3 configure.py
make -j $(nproc)
sudo make install
```
```
cd ../sip-4.19.12/
make clean
## python3 configure.py --sip-module PyQt4.sip --no-dist-info --no-tools ## 可能造成报错PyCapsule_GetPointer called with incorrect name
python3 configure.py --sip-module PyQt4.sip
make	## 这次是配置运行 import PyQt4 所需要的 PyQt4.sip
sudo make install
```

安装时出现报错：
```
Error: This version of PyQt4 and the commercial version of Qt have incompatible licenses.
```
解决方法：注释掉configure-ng.py下面语句即可：
```
if introspecting and target_config.qt_licensee not in OPEN_SOURCE_LICENSEES and ltype == 'GPL':
        error(
                "This version of PyQt4 and the commercial version of Qt have "
                "incompatible licenses.")
```

`error: ‘waitForEvents’ is not a member of ‘QTest’`
`gedit PyQt4_gpl_x11-4.12.3/sip/QtTest/qtestmouse.sip`
去掉waitForEvents那一段

`fatal error: abstractaudiooutput.h: No such file or directory`
`PyQt4_gpl_x11-4.12.3/phonon/Makefile`
引入`/usr/include/phonon4qt5/phonon`

`/usr/bin/ld: cannot find -lQt5onon`
我实在找不着这个鸡巴库
`PyQt4_gpl_x11-4.12.3/phonon/Makefile`
删掉-lQt5onon

`fatal error: qassistantclient.h: No such file or directory`
这个没辙，不要编译QtAssistant模块就好了嘛

`/usr/bin/ld: cannot find -lQt5xContainer`
我也实在找不着这个鸡巴库
去掉QAxContainer的编译

这样总算把Pyqt4安装得差不多了。


***
# 删除多余的snap包
```
su
snap list --all | while read snapname ver rev trk pub notes; do if [[ $notes = *disabled* ]]; then snap remove "$snapname" --revision="$rev"; fi; done
```
安装几个游戏
```
sudo snap install 0ad
sudo snap install openra
sudo snap install warzone2100
```
维护参考
<https://snapcraft.io/docs/getting-started>


***
# 安装一些多媒体编辑工具
```
yay shotcut
yay rtaudio
yay vidcutter
yay mkvtoolnix-gui
yay mkvtoolnix-cli
yay audacity
```


***
# 矢量图制作
```
yay inkscape
yay scour
```


***
# 记账工具
```
yay gnucash-docs
yay gnucash
```


***
# 更新
wxgtk-common和wxgtk2

取代

wxgtk-common-dev和wxgtk2-dev

测试用 gspiceui，audacity和pyuv

`pacman -Qs wxgtk`

既然都删了wxgtk2-dev和以此库依赖编译的pyuv，那么按pyuv的要求选`wxgtk-git`依赖

but，wxgtk-git编译失败

解决办法

修改pyuv的依赖为`wxgtk-common`

重新编译，这样pyuv也是可以用的。


***
# 安装 cppunit，libmspack等
```
$ yay -S cppunit libmspack cunit bcunit splint cmocka gtest python-pylint
```


***
# 安装vlc
```
$ yay -S vlc libdvdcss gnu-free-fonts live-media libgoom2 aribb24 aribb25
```

***
# picom
```
yay picom
mkdir ~/.config/picom/
cp /etc/xdg/picom.conf ~/.config/picom/picom.conf
gedit ~/.config/picom/picom.conf
```
```
opacity-rule = [
  "100:class_g = 'Lxterminal' && focused",
  "100:class_g = 'Lxterminal' && !focused"
];
```
```
picom --config ~/.config/picom/picom.conf
```
效果不是我想要的，不启用
`rm ~/.config/picom/picom.conf`



***
# 更新wps
```
yay wps-office
yay wps-office-mime
```

***
# 更新exfat工具集
`exfat-utils -> exfatprogs`


***
# php配置更系
```
sudo mv /etc/php/php.ini /etc/php/php.ini.bk
sudo mv /etc/php/php.ini.pacnew /etc/php/php.ini
```

***
# privoxy配置更新
```
sudo mv /etc/privoxy/config /etc/privoxy/config.bk
sudo mv /etc/privoxy/config.pacnew /etc/privoxy/config
sudo gedit /etc/privoxy/config
```
```
...
listen-address  localhost:8118
forward-socks5 / 127.0.0.1:1081 .
...
```

`privoxy /etc/privoxy/config`启动
```
systemctl status privoxy.service
sudo systemctl start privoxy.service
sudo systemctl enable privoxy.service
```
```
Created symlink /etc/systemd/system/multi-user.target.wants/privoxy.service → /usr/lib/systemd/system/privoxy.service.
```
类似于这样用
`aria2c --all-proxy='http://127.0.0.1:8118' -D`
```
export https_proxy="127.0.0.1:8118"
export http_proxy="127.0.0.1:8118"
(可以添加到类似/etc/profile的地方去)
```
测试
`curl www.google.com`

yay加速
```
export https_proxy="127.0.0.1:8118"
export http_proxy="127.0.0.1:8118"
yay
```


***
# 默认java版本选择
Default Java environment is already set to 'java-15-jdk'
See 'archlinux-java help' to change it


***
# 更新后处理
```
yay python-certifi
libtool
libtool --finish /usr/lib
更新gnucap为gnucap-git版本
更新miredo
更新peco，参考https://goproxy.cn和https://github.com/ethereum/go-ethereum/issues/21129
$ go env -w GO111MODULE=on
$ go env -w GOPROXY=https://goproxy.cn,direct
makepkg
更新gaw为gaw3
更新foxitreader
更新obmenu
更新obmenu-generator
The schema file has been installed as: /etc/xdg/obmenu-generator/schema.pl
yay perl-gtk3
更新spacefm
New optional dependencies for spacefm
    curlftpfs: mount FTP shares [installed]
    dbus: dbus integration [installed]
    fuseiso: mount ISO files
    gphotofs: mount cameras
    ifuse: mount your iPhone/iPod Touch
    jmtpfs: mount MTP devices
    pmount: mount as non-root user
    util-linux: disk eject support [installed]
yay pv
看到opt目录下有个mygui文件夹，里面的玩意运行又缺乏库，aur的git版本cmake报错，编译不了，啥鸡巴玩意，删！
sudo pacman -Rs mygui
更新提示了
>>> It's now located under /usr/lib/rp-pppoe/rp-pppoe.so
>>> Change LINUX_PLUGIN to the new path in your /etc/ppp/pppoe.conf
就是
LINUX_PLUGIN=/usr/lib/rp-pppoe/rp-pppoe.so
```
今日系统无法启动
fsck修复，后能启动，发现/etc/ppp/pppoe.conf已经被莫名二进制文件替代，其他配置文件可能也会有类似问题

解决方法有二

一。幸好老子的laptop有个备份系统，直接更新到最新然后把前面的update都搞好，复制到移动系统盘，包括home分区都以laptop为准。

二。深度更新，<https://wiki.archlinux.org/index.php/pacman#Skip_package_from_being_upgraded>， `pacman -S $(pacman -Qnq)`，之后一个个查/etc下的文件的Qo(属于哪个软件包)，全部对比重置。

本来的laptop是否也存在配置文件无效问题，需要有时间按方法二也检查。

目前移动系统盘起码还能凑合用，先拖到春节放假。


***
# something
```
yay -S asco gperf obmenu2-git
```


***
# qucs
<http://downloads.sourceforge.net/project/qucs/qucs/0.0.20/qucs-0.0.20-rc2.tar.gz>


***
# AUR 镜像使用帮助
<https://mirror.tuna.tsinghua.edu.cn/help/AUR/>


***
# yaourt / yay 更换aururl国内源

yaourt 用户
修改 /etc/yaourtrc，去掉 # AURURL 的注释，修改为
```
AURURL="https://aur.tuna.tsinghua.edu.cn"
```
yay 用户
执行以下命令修改 aururl :
```
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save
```
修改的配置文件位于 `~/.config/yay/config.json` ，还可通过以下命令查看修改过的配置：
`yay -P -g`


***
# shutter-git
```
Optional dependencies for shutter-git
    gnome-web-photo: web screenshot support
    perl-image-exiftool: read and write EXIF data [installed]
    nautilus-sendto: send screenshots via mail [installed]
    perl-goo-canvas: editing screenshots [installed]
    perl-gtk2-appindicator: AppIndicators support
    perl-path-class: Imgur and Dropbox upload support [installed]
    perl-lwp-protocol-https: Imgur and Dropbox upload support [installed]
    perl-net-oauth: Imgur and Dropbox upload support [installed]
    bc: 3D Rotate and 3D Reflection plugins support [installed]
    perl-webservice-gyazo-b: Gyazo upload support
```
`yay gnome-web-photo`
需要更新webkitgtk和webkitgtk2
`yay perl-gtk2-appindicator`
`yay perl-webservice-gyazo-b`


***
# something
```
yay ozone
yay lucidor
yay libcurl-openssl-1.0
yay lib32-unixodbc
yay jlink-systemview
yay jlink-systemview-target-src
yay jlink-software-and-documentation
yay idnkit
yay gcc6
yay smath
yay asco
yay lib32-fakechroot 失败
yay microchip-mplabx-bin 依赖失败
yay stcgal
dropbox

rarcrack
tcllib
autofs
R rpmextract
python2-qrtools失败
python2-werkzeug失败
sssd
R qt5-enginio
qt5-enginio-git失败

sudo debtap -u

dumpet-2.1.tar.bz2 ... FAILED (unknown public key 8C004C2F93481F6B)

gpg --keyserver keyserver.ubuntu.com --recv 8C004C2F93481F6B
```

***
# uex升级后无限试用
```
rm -rf ~/.idm/*.spl
rm -rf /tmp/*.spl
rm -rf ~/.idm/uex/*.spl
```
参考
```
alias ue='rm -rf ~/.idm/uex/*.spl | rm -rf ~/.idm/uex/*.spl |rm -rf /tmp/*.spl | /usr/bin/uex &'
```
启动desktop文件加入
```
Exec=env faketime '2020-02-29 08:15:42' uex %U
```
***
# bcompare升级后无限试用
```
NOTE: It is necessary to enable 'File Manager Integration' under 'Tools' -> 'Options' from Beyond Compare interface.

/home/andy/.config/bcompare
```
参考：
bcompare Linux版 无限试用
需要root权限。
```
# mv /usr/bin/bcompare /usr/bin/bcompare.real
# cat /usr/bin/bcompare
#!/bin/sh
rm "${HOME}/.config/bcompare/registry.dat"
/usr/bin/bcompare.real $@
# chmod a+x /usr/bin/bcompare
```
就知道删掉`${HOME}/.config/bcompare/registry.dat`这个文件就可以继续试用呗

懒得用
```
cd /usr/lib/beyondcompare/
sudo sed -i "s/keexjEP3t4Mue23hrnuPtY4TdcsqNiJL-5174TsUdLmJSIXKfG2NGPwBL6vnRPddT7tH29qpkneX63DO9ECSPE9rzY1zhThHERg8lHM9IBFT+rVuiY823aQJuqzxCKIE1bcDqM4wgW01FH6oCBP1G4ub01xmb4BGSUG6ZrjxWHJyNLyIlGvOhoY2HAYzEtzYGwxFZn2JZ66o4RONkXjX0DF9EzsdUef3UAS+JQ+fCYReLawdjEe6tXCv88GKaaPKWxCeaUL9PejICQgRQOLGOZtZQkLgAelrOtehxz5ANOOqCaJgy2mJLQVLM5SJ9Dli909c5ybvEhVmIC0dc9dWH+/N9KmiLVlKMU7RJqnE+WXEEPI1SgglmfmLc1yVH7dqBb9ehOoKG9UE+HAE1YvH1XX2XVGeEqYUY-Tsk7YBTz0WpSpoYyPgx6Iki5KLtQ5G-aKP9eysnkuOAkrvHU8bLbGtZteGwJarev03PhfCioJL4OSqsmQGEvDbHFEbNl1qJtdwEriR+VNZts9vNNLk7UGfeNwIiqpxjk4Mn09nmSd8FhM4ifvcaIbNCRoMPGl6KU12iseSe+w+1kFsLhX+OhQM8WXcWV10cGqBzQE9OqOLUcg9n0krrR3KrohstS9smTwEx9olyLYppvC0p5i7dAx2deWvM1ZxKNs0BvcXGukR+/g" BCompare
```

***
# bcompare uex 无限试用脚本
一个好主意是每次开机就执行，或者放到一个脚本里，一起删掉
`reset_trialtime_uex_bcompare.sh`
```
#!/bin/bash
rm "${HOME}/.config/bcompare/registry.dat"
rm ${HOME}/.idm/*.spl
rm /tmp/*.spl
rm ${HOME}/.idm/uex/*.spl
```



***
# 网页编辑器
```
$ yay -S bluefish komodo gtksourceview libgtkhtml libgnomeprintui enchant1.6 gnome-menus2 rarian addinclude screem
```
kompozer不能用了，可以snap重新安装一个
`sudo snap install kompozer`
也可以使用/opt目录下那个
删掉pacman安装的那个就好了
`sudo pacman -R kompozer`


***
# microchip mplab
```
This package provides a file: /etc/profile.d/microchip-mplabxc16-bin.sh
It will add the toolchain binaries to the PATH variable for every user.
It also defines XC16_TOOLCHAIN_ROOT pointing to the toolchain install dir.
Log out and log back in to update your environment varibles.

Before using MPLAB_XC16 you have to agree with the LICENSE at:
/usr/share/licenses/microchip-mplabxc16-bin/LICENSE

For using MPLAB_XC16 with MPLAB_X (microchip-mplabx-bin), in MPLAB_X go to:
Tools->Options->Embedded->Add

and enter:
$XC16_TOOLCHAIN_ROOT/bin


This package provides a file: /etc/profile.d/microchip-mplabxc32-bin.sh
It will add the toolchain binaries to the PATH variable for every user.
It also defines XC32_TOOLCHAIN_ROOT pointing to the toolchain install dir.
Log out and log back in to update your environment varibles.

Before using MPLAB_XC32 you have to agree with the LICENSE at:
/usr/share/licenses/microchip-mplabxc32-bin/LICENSE

For using MPLAB_XC32 with MPLAB_X (microchip-mplabx-bin), in MPLAB_X go to:
Tools->Options->Embedded->Add

and enter:
$XC32_TOOLCHAIN_ROOT/bin


This package provides a file: /etc/profile.d/microchip-mplabxc8-bin.sh
It will add the toolchain binaries to the PATH variable for every user.
It also defines XC8_TOOLCHAIN_ROOT pointing to the toolchain install dir.
Log out and log back in to update your environment varibles.

Before using MPLAB_XC8 you have to agree with the LICENSE at:
/usr/share/licenses/microchip-mplabxc8-bin/LICENSE

For using MPLAB_XC8 with MPLAB_X (microchip-mplabx-bin), in MPLAB_X go to:
Tools->Options->Embedded->Add

and enter:
$XC8_TOOLCHAIN_ROOT/bin
```


***
# 更新后修改配置
```
xulrunner需要先删旧版本再编译
xulrunner修改一下，依赖libpng，原来这玩意被lucidor依赖
lucidor修改一下，到最新版本，AUR里的包链接失效，找不到了。

yay icu57

Missing AUR Packages: 查看信息，一般不用删掉的
pacman -Qi automake1.11



https://wiki.archlinux.org/index.php/Apache_HTTP_Server

[andy@archlinux ~]$ sudo systemctl status httpd.service
● httpd.service - Apache Web Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
     Active: failed (Result: exit-code) since Thu 2021-02-18 15:42:19 CST; 7s ago
    Process: 354727 ExecStart=/usr/bin/httpd -k start -DFOREGROUND (code=exited, status=1/FAILURE)
   Main PID: 354727 (code=exited, status=1/FAILURE)

Feb 18 15:42:19 archlinux systemd[1]: Started Apache Web Server.
Feb 18 15:42:19 archlinux httpd[354727]: httpd: Syntax error on line 184 of /etc/httpd/conf/httpd.conf: Cannot load modules/libphp7.so into server: /etc/httpd/modules/libphp7.so: cannot ope>
Feb 18 15:42:19 archlinux systemd[1]: httpd.service: Main process exited, code=exited, status=1/FAILURE
Feb 18 15:42:19 archlinux systemd[1]: httpd.service: Failed with result 'exit-code'.

修改
sudo gedit /etc/httpd/conf/httpd.conf
主要是php7修改为php什么的


sudo pip2 install service_identity  -i https://mirrors.163.com/pypi/simple
python2-mechanize在test地方出错，test你妹啊，去掉check()就好了，我只是要成功产生安装包而已。

```


***
# 一个基于firefox改进的web浏览器
`palemoon`


***
# 日语输入法
```
gxkb
fcitx-mozc
ttf-kochi-substitute
```

***
# epub编辑器
`sigil pageedit hyphen-en hunspell-en_US`


***
# something
```
bibletime
geogebra
google-earth-pro 好像无法登录服务器
celestia
chemtool
sagemath
```

***
# maple2020
##Activate Maple
When prompted, activate Maple using your activation code/purchase code:
`NZ3DP9ZX6L4GPNUH`
Your evaluation will expire in 15 days (March 06, 2021).

##无限期试用maple可以像这样，确认可用
```
faketime '2021-02-25 08:15:42' xmaple
```


***
# something
```
maxima 之前引入有 maxima-ecl
dosbox
ekho
foliate     ekho -f '-'
festival
espeak-ng
dictd
xclip
error: ekho: key "83F817213361BF5F02E7E124F9F9FA97A403F63E" is unknown
gpg --keyserver keyserver.ubuntu.com --recv 83F817213361BF5F02E7E124F9F9FA97A403F63E
ekho "hello 123"
archlinuxcn-keyring python-keyring libgnome-keyring gnome-keyring archlinux-keyring

warning: /etc/sane.d/canon_lide70.conf installed as /etc/sane.d/canon_lide70.conf.pacnew
warning: /etc/sane.d/escl.conf installed as /etc/sane.d/escl.conf.pacnew

sudo mv /etc/sane.d/canon_lide70.conf.pacnew /etc/sane.d/canon_lide70.conf
sudo mv /etc/sane.d/escl.conf.pacnew /etc/sane.d/escl.conf

sudo pacman -Rns tor-browser-en
rm -rf ~/.tor-browser-en
gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org   这个公钥是 EF6E286DDA85EA2A4BA7DE684E2C6E8793298290
gpg --keyserver keyserver.ubuntu.com --recv  4E2C6E8793298290
yay tor-browser

systemctl list-timers
sudo pacman -S pkgstats

konsole (dolphin需要)

manjaro? 可能有一些有趣的附加工具，but 老子用不着，至少目前用不着
```

***
# lattice diamond 下载线驱动识别
`sudo gedit /etc/udev/rules.d/10-local.rules`
```
#Lattice
SUBSYSTEM=="usb",ACTION=="add",ATTRS{idVendor}=="1134",ATTRS{idProduct}=="8001",MODE=="0660",GROUP=="andy",SYMLINK+="lattice-%n"
#FTDI
SUBSYSTEM=="usb",ACTION=="add",ATTRS{idVendor}=="0403",ATTRS{idProduct}=="6010",MODE=="0666",GROUP=="andy",SYMLINK+="ftdi-%n"
SUBSYSTEM=="usb",ATTRS{idVendor}=="0403",ATTRS{idProduct}=="6010",RUN+="/bin/sh -c 'basename %p > /sys/bus/usb/drivers/ftdi_sio/unbind'
```
```
sudo chmod 755 /etc/udev/rules.d/10-local.rules
sudo udevadm control --reload-rules
```

***
# archlinuxcn-keyring 报错处理
```
error: key "F9F9FA97A403F63E" could not be looked up remotely
sudo pacman -S archlinuxcn-keyring
有报错
ERROR: 90403E12F4CE5E0E950E4AD2C96492E347202001 could not be locally signed
之类， 参考https://www.archlinuxcn.org/gnupg-2-1-and-the-pacman-keyring/
```
```
su
pacman -Syu haveged
systemctl start haveged
systemctl enable haveged
rm -fr /etc/pacman.d/gnupg
pacman-key --init
pacman-key --populate archlinux
pacman-key --populate archlinuxcn
```
这样就 `sudo pacman -S archlinuxcn-keyring` 无报错


***
# 重新打包pkg，提取已经安装的pkg
```
yay repacman2
repacman -h
```

***
# 以后pcmanfm不好使了就可以用caja取代
```
yay caja-open-terminal
```
change `mate-terminal` to `lxterminal`：
<https://github.com/mate-desktop/caja-extensions/issues/31>

可以配置F4快捷键打开terminal
`~/.config/caja/scripts/open-terminal-here`
```
#!/bin/sh
#
# This script opens a gnome-terminal in the current directory.
#
# Distributed under the terms of GNU GPL version 2 or later
#
# Original author: Keith Conger <acid@twcny.rr.com>
#
# Sourced from
# https://forums.linuxmint.com/viewtopic.php?p=773382&sid=9939ce160bd97313f849367231eb721a#p773382
# http://g-scripts.sourceforge.net/nautilus-scripts/Execute/Open%20terminal/terminal-here
#
# Put this file in your ~/.config/caja/scripts/ directory.
# You need to have caja-actions installed to use scripts.

cd $CAJA_SCRIPT_CURRENT_URI
exec lxterminal
```
`chmod +x ~/.config/caja/scripts/open-terminal-here`

`gedit ~/.config/caja/accels`
添加
```
"<Actions>/ScriptsGroup/script_file:\\s\\s\\shome\\sandy\\s.config\\scaja\\sscripts\\sopen-terminal-here" "F4")
```
有效



***
# dconf-editor
Then navigate to org > gnome > nautilus > preferences and check always-use-location-entry.

Then navigate to org > mate > caja > preferences and check always-use-location-entry.


***
# something
```
sudo pacman -S handbrake-cli handbrake intel-media-sdk intel-compute-runtime

sudo pacman -S asciinema peek gifski lib32-simplescreenrecorder simplescreenrecorder vokoscreen

yay green-recorder
yay kazam
cinelerra-cv toolame
需要修改cinelerra/transportque.inc的#define CHANGE_ALL 0xffffffffu为#define CHANGE_ALL 0xff

sudo pacman -S log4cxx
davinci-resolve-studio
davinci-resolve
这两个需要从这里收动下载原始包
http://www.blackmagicdesign.com/hk/products/davinciresolve/

[andy@archlinux ~]$ /opt/resolve/bin/resolve 
ActCCMessage Already in Table: Code= c005, Mode= 13, Level=  1, CmdKey= -1, Option= 0
ActCCMessage Already in Table: Code= c006, Mode= 13, Level=  1, CmdKey= -1, Option= 0
ActCCMessage Already in Table: Code= c007, Mode= 13, Level=  1, CmdKey= -1, Option= 0
ActCCMessage Already in Table: Code= 2282, Mode=  0, Level=  0, CmdKey= 8, Option= 0
PnlMsgActionStringAdapter Already in Table: Code= 615e, Mode=  0, Level=  0, CmdKey= -1, Option= 0
log4cxx: No appender could be found for logger (BtCommon).
log4cxx: Please initialize the log4cxx system properly.

启动失败了
https://forum.manjaro.org/t/davinci-resolve-doesnt-open/30065
https://wiki.archlinux.org/index.php/DaVinci_Resolve
哦，驱动是个大问题。intel显卡看来用不了这个软件， 删掉这个/home/andy/.local/share/DaVinciResolve

PKGEXT='.pkg.tar' yay -S davinci-resolve 可以不压缩makepkg生成的包

opencl-clhpp opencl-mesa lib32-opencl-nvidia lib32-opencl-mesa


/sbin/lspci | grep -e VGA
pactl info
inxi bluez-utils-compat tree wmctrl ell
yay perl-xml-dumper
inxi -Fxz
opencl-amd
clinfo


flowblade
vidcutter
yay xmind-pro
```


***
# texlive
```
yay -S xdot xdotool
http://wiki.archlinux.org/index.php/TeX_Live
texlive-core texlive-bin texlive-bibtexextra texlive-fontsextra texlive-formatsextra
qtikz tikzit ed biber perl-tk psutils t1utils dot2tex gnuplot yasm
texlive-latexextra latex2html git-latexdiff texlive-langchinese texlive-langextra texlive-langjapanese texlive-langkorean 
texlive-pictures texlive-publishers texlive-science texlive-latexextra texstudio texlive-humanities lyx
texworks texmaker texlive-langcyrillic texlive-langgreek texlive-pstricks dblatex
okular rcs kdegraphics-mobipocket calligra pstoedit doxygen-docs

su
ln -s /etc/fonts/conf.avail/09-texlive-fonts.conf /etc/fonts/conf.d/09-texlive-fonts.conf
fc-cache && mkfontscale && mkfontdir
fc-list :lang=zh-cn
fc-list | grep sim

cd /usr/share/texmf-dist/fonts/truetype
mkfontdir
mkfontscale
fc-cache -f -s -v
fc-cache -fv
fc-cache
fc-list :lang=zh-cn
fc-list | grep sim
```

***
# libvirt 
```
virt-manager virt-viewer x11-ssh-askpass dnsmasq ebtables
systemctl status libvirtd.service
sudo systemctl start libvirtd.service
sudo systemctl enable libvirtd.service
sudo usermod -a -G libvirt andy
不能连接，

查org.libvirt.unix.manage
https://wiki.archlinux.org/index.php/libvirt

/usr/share/polkit-1/actions/org.libvirt.unix.policy  
已经确认修改字段
        <allow_any>yes</allow_any>
        <allow_inactive>yes</allow_inactive>
        <allow_active>yes</allow_active>
就可以有效允许普通用户连接
/usr/share/polkit-1/rules.d/50-default.rules
/etc/polkit-1/rules.d/50-libvirt.rules
```
```
/* Allow users in kvm group to manage the libvirt
daemon without authentication */
polkit.addRule(function(action, subject) {
    if (action.id == "org.libvirt.unix.manage" &&
        subject.isInGroup("kvm")) {
            return polkit.Result.YES;
    }
});
```
```
sudo usermod -a -G kvm andy

virt-manager
```

增加权限启动配置未验证(没有效果)，还是用上面的办法
`vi /etc/polkit-1/localauthority/50-local.d/50-org.libvirtd-group-access.pkla`
```
[libvirtd group Management Access]
Identity=unix-group:libvirtd
Action=org.libvirt.unix.manage
ResultAny=yes
ResultInactive=yes
ResultActive=yes
```
```
sudo systemctl restart libvirtd.service
```
```
# systemctl disable qemu-ga.service
# systemctl enable qemu-guest-agent.service
```


***
# dvsdk
```
心血来潮，在滚动更新的当前系统编译一下dvsdk玩
/home/andy/ti-dvsdk_dm368-evm_4_02_00_06
make clean 

错误1
valid arguments to ‘-mabi=’ are: ms sysv

修改 Makefile 
linux_clean:
	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) mrproper
	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CSTOOL_PREFIX) clean

-->

linux_clean:
	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CSTOOL_PREFIX) mrproper
	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=arm CROSS_COMPILE=$(CSTOOL_PREFIX) clean

错误2
Can't use 'defined(@array)' (Maybe you should just omit the defined()?) at kernel/timeconst.pl line 373
修改
if (!defined(@val)) {
-->
if (!@val) {

到这里kernel是编译成功了。未在板验证

错误3
error: redefinition of ‘struct fdt_header’
看来即include了系统的又include了uboot源码的
未解决

错误4
errno: TLS definition in /lib64/libc.so.6 section .tbss mismatches non-TLS reference
extern int errno;
I replaced this line with #include <errno.h>
未成功，如果不inlcude系统的，那么就include了uboot源码的，又不能改errno.h，否则循环引入;如果引入系统的，那么由于错误3又编译不过。

结论：
u-boot的老代码在新版本glibc下还真有问题。包括海思的u-boot版本比较新了吧，还是有问题。

可能的办法，暂时删掉fdt之类的dev包，先编译通过了再说。未验证。不如用虚拟机呢。

```


***
# 降级pkg
`$ yaourt downgrader`
降级firefox
```
downgrader -h firefox
```
可以编译最新的`downgrader-git`




***
# something
```
yay -S cdate downgrade
dcmtk   (dicom)
pari-elldata
pari-galdata
pari-seadata

不安装catalyst-utils
不安装pipewire-pulse
不安装openblas
不安装espeak-ng-espeak
yay -S pari-galpol texlive-bin python-symengine swi-prolog pipewire-alsa
yay -S clinfo gap-packages gap-doc dsdp polymake python-pkgconfig jmol sagemath-doc
yay -S python-igraph sage-numerical-backends-coin coin-or-csdp buckygen plantri benzene coxeter rubiks lrs python-pynormaliz
yay -S latte-integrale python-jupymake shared_meataxe sirocco primecount dot2tex cryptominisat5 python-pycosat sagemath-jupyter
yay -S kdialog keditbookmarks perl-xml-dumper c-xsc libsemigroups python-pycurl jsmol sage-notebook-exporter
yay perl-xml-dumper


sudo gedit /etc/default/grub.pacnew
GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"
sudo mv /etc/default/grub.pacnew /etc/default/grub
```



***
# repacman utorrent
```
sudo pacman -Rn utorrent
yay rutorrent
yay mod_scgi
cp /usr/share/doc/rtorrent/rtorrent.rc ~/.rtorrent.rc
gedit ~/.rtorrent.rc
yay qrtorrent-git
```
暂时不启动服务。现在懒得配置了，以后需要再按这些资料配置好了
<https://wiki.archlinux.org/index.php/RTorrent>
<https://github.com/Novik/ruTorrent>



***
# 查询已经安装的pkg
```
pacman -Qeq > pacqeq.txt   <一般来说关心这个>
pacman -Qdq > pacqdq.txt
pacman -Qmq > pacqmq.txt   <一般n和m的就是全部了>
pacman -Qnq > pacqnq.txt
pacman -Qtd 可以保留这些
pacman -Qmq
```

***
# memtester
```
yay -S memtester
memtester 1900M 10
```

***
# balena-etcher
```
yay balena-etcher
```

***
# orage为例， AUR弃用包的编译使用
有些小工具挺好的，因为一些依赖关系被弃用，甚至从AUR移除， 已经安装的表现为无法升级，直到有一天什么库不见了，就不能再用了，未安装的AUR里都搜不到

以orage为例子进行弃用包的 编译使用（orage已经被xfce-4.16弃用）
<https://archive.xfce.org/src/apps/orage/4.12/>
<https://github.com/balena/orage>
可以下载源码
<https://archive.archlinux.org/packages/>
可以获取被移除出官方repo的旧安装包
<https://github.com/aur-archive>
可以找到在aur中出现过的包的存档

稍加修改，依然可以编译通过，正常运行，不需要配合xfce4

还是能延续相当长时代的



***
# 7z的命令行操作
```
7z a -p'fuckya' 'DLI 课程目录202004.7z' 'DLI 课程目录202004.pdf'
7z x -p'fuckya' 'DLI 课程目录202004.7z'
```


***
# something
```
python-sip-pyqt4 python-pyqt4 暂时不一致
yay -S addinclude bitrock-unpacker chrpath cksfv debhelper dejagnu electron6 enchant1.6 extra-cmake-modules festival gnome-common gnu-netcat gperf gtksourceview guvcview-common ibus itstool jlink-systemview-target-src jq libgnomeprint libgnomeprintui libgtkhtml libmspack libpng lrs mallard-ducktype mkvtoolnix-cli ois opencl-nvidia perl-cpan-perl-releases perl-devel-patchperl perl-file-path-tiny perl-file-pushd perl-io-socket-socks perl-local-lib perl-lwp-protocol-socks perl-module-pluggable perl-uri-simple po-debconf po4a polymake postgresql python-apipkg python-certifi python-filelock python-iniconfig python-pluggy python-py python-tox python-virtualenv python2-nose python2-pillow python2-pyqt4 python2-pytest-timeout python2-werkzeug rarian setconf sip4 termcap wine wxgtk-common wxgtk2 xorg-util-macros xulrunner yelp-tools tclkit
baidunetdisk是否替换为AUR的版本？ wine-wechat是否替换？
base caja-image-converter geogebra perlbrew 
yay -S antiword balena-etcher cdate downgrade dsdp foomatic-db gap-doc gap-packages gcc8-fortran gnu-netcat gstreamer0.10-good-plugins gstreamer-docs gtksourceview2 guvcview guvcview-common jmol jq lib32-vkd3d memtester playonlinux python2-pillow python2-werkzeug python-pkgconfig sagemath-doc scour ttf-kochi-substitute vkd3d xcompmgr
foomatic-db-ppds



```
***
# thunderbird最小化
`yay -S birdtray`
目前版本无效
`yay -Rn birdtray`
先用addon最小化替代关闭吧，等MinimizeToTray支持再说


***
# 几个下载器测试
`yay freedownloadmanager`
运行命令是`fdm`
也不能导入cookie
`yay -S jdownloader2`
也不行
`yay -Rn freedownloadmanager jdownloader2`


***
# 滚动升级过程因为vbox原因突然死机，内核没有重建完毕

在其他系统引导进来，尽量完成升级

但是内核失效，boot目录没有镜像

那么安装lts吧，进native系统

```
yay -S linux linux-headers --force
error: could not open file /var/lib/pacman/local/linux-5.11.2.arch1-1/desc
```
等报错
```
sudo touch /var/lib/pacman/local/linux-5.11.2.arch1-1/desc
sudo touch /var/lib/pacman/local/linux-5.11.2.arch1-1/files
yay -S linux linux-headers --force
```
所以，lts作为备用还是很有必要的
`yay -S linux-lts linux-lts-headers`

<https://www.pixelstalk.net/download-free-arch-linux-background/>


***
# 编译gcc
编译gcc时候直接把 make check 删了 再编译！！否则漫长的过程哦


***
# pycharm
为了用pycharm远程连接目标板，应使用pycharm-professional
`yay -S ipython2 python2-coverage python-coverage docker-machine docker-compose cython2 vagrant python-pytest python2-tox`
下面无限期试用方法待验证
`faketime '2021-03-03 08:15:42' pycharm`
```
Y005GUAO33-eyJsaWNlbnNlSWQiOiJZMDA1R1VBTzMzIiwibGljZW5zZWVOYW1lIjoiSmF2YeWkp+WSliBKYXZh5aSn5ZKWIiwiYXNzaWduZWVOYW1lIjoiIiwiYXNzaWduZWVFbWFpbCI6IiIsImxpY2Vuc2VSZXN0cmljdGlvbiI6IiIsImNoZWNrQ29uY3VycmVudFVzZSI6ZmFsc2UsInByb2R1Y3RzIjpbeyJjb2RlIjoiREMiLCJwYWlkVXBUbyI6IjIwMjEtMDQtMDEiLCJleHRlbmRlZCI6ZmFsc2V9LHsiY29kZSI6IklJIiwicGFpZFVwVG8iOiIyMDIxLTA0LTAxIiwiZXh0ZW5kZWQiOmZhbHNlfSx7ImNvZGUiOiJEQiIsInBhaWRVcFRvIjoiMjAyMS0wNC0wMSIsImV4dGVuZGVkIjpmYWxzZX0seyJjb2RlIjoiUk0iLCJwYWlkVXBUbyI6IjIwMjEtMDQtMDEiLCJleHRlbmRlZCI6ZmFsc2V9LHsiY29kZSI6IldTIiwicGFpZFVwVG8iOiIyMDIxLTA0LTAxIiwiZXh0ZW5kZWQiOmZhbHNlfSx7ImNvZGUiOiJSU1YiLCJwYWlkVXBUbyI6IjIwMjEtMDQtMDEiLCJleHRlbmRlZCI6dHJ1ZX0seyJjb2RlIjoiUlNVIiwicGFpZFVwVG8iOiIyMDIxLTA0LTAxIiwiZXh0ZW5kZWQiOmZhbHNlfSx7ImNvZGUiOiJQQyIsInBhaWRVcFRvIjoiMjAyMS0wNC0wMSIsImV4dGVuZGVkIjpmYWxzZX0seyJjb2RlIjoiUkMiLCJwYWlkVXBUbyI6IjIwMjEtMDQtMDEiLCJleHRlbmRlZCI6ZmFsc2V9LHsiY29kZSI6IlJEIiwicGFpZFVwVG8iOiIyMDIxLTA0LTAxIiwiZXh0ZW5kZWQiOmZhbHNlfSx7ImNvZGUiOiJETSIsInBhaWRVcFRvIjoiMjAyMS0wNC0wMSIsImV4dGVuZGVkIjpmYWxzZX0seyJjb2RlIjoiQ0wiLCJwYWlkVXBUbyI6IjIwMjEtMDQtMDEiLCJleHRlbmRlZCI6ZmFsc2V9LHsiY29kZSI6IlJTMCIsInBhaWRVcFRvIjoiMjAyMS0wNC0wMSIsImV4dGVuZGVkIjpmYWxzZX0seyJjb2RlIjoiUlNDIiwicGFpZFVwVG8iOiIyMDIxLTA0LTAxIiwiZXh0ZW5kZWQiOnRydWV9LHsiY29kZSI6IkdPIiwicGFpZFVwVG8iOiIyMDIxLTA0LTAxIiwiZXh0ZW5kZWQiOmZhbHNlfSx7ImNvZGUiOiJSU0YiLCJwYWlkVXBUbyI6IjIwMjEtMDQtMDEiLCJleHRlbmRlZCI6dHJ1ZX0seyJjb2RlIjoiUFMiLCJwYWlkVXBUbyI6IjIwMjEtMDQtMDEiLCJleHRlbmRlZCI6ZmFsc2V9LHsiY29kZSI6IkRQTiIsInBhaWRVcFRvIjoiMjAyMS0wNC0wMSIsImV4dGVuZGVkIjpmYWxzZX0seyJjb2RlIjoiQUMiLCJwYWlkVXBUbyI6IjIwMjEtMDQtMDEiLCJleHRlbmRlZCI6ZmFsc2V9LHsiY29kZSI6IlBEQiIsInBhaWRVcFRvIjoiMjAyMS0wNC0wMSIsImV4dGVuZGVkIjp0cnVlfSx7ImNvZGUiOiJQV1MiLCJwYWlkVXBUbyI6IjIwMjEtMDQtMDEiLCJleHRlbmRlZCI6dHJ1ZX0seyJjb2RlIjoiUEdPIiwicGFpZFVwVG8iOiIyMDIxLTA0LTAxIiwiZXh0ZW5kZWQiOnRydWV9LHsiY29kZSI6IlBQUyIsInBhaWRVcFRvIjoiMjAyMS0wNC0wMSIsImV4dGVuZGVkIjp0cnVlfSx7ImNvZGUiOiJQUEMiLCJwYWlkVXBUbyI6IjIwMjEtMDQtMDEiLCJleHRlbmRlZCI6dHJ1ZX0seyJjb2RlIjoiUFJCIiwicGFpZFVwVG8iOiIyMDIxLTA0LTAxIiwiZXh0ZW5kZWQiOnRydWV9LHsiY29kZSI6IlBTVyIsInBhaWRVcFRvIjoiMjAyMS0wNC0wMSIsImV4dGVuZGVkIjp0cnVlfSx7ImNvZGUiOiJQU0kiLCJwYWlkVXBUbyI6IjIwMjEtMDQtMDEiLCJleHRlbmRlZCI6dHJ1ZX0seyJjb2RlIjoiRFAiLCJwYWlkVXBUbyI6IjIwMjEtMDQtMDEiLCJleHRlbmRlZCI6dHJ1ZX0seyJjb2RlIjoiUlMiLCJwYWlkVXBUbyI6IjIwMjEtMDQtMDEiLCJleHRlbmRlZCI6dHJ1ZX1dLCJtZXRhZGF0YSI6IjAxMjAyMTAzMDRQUEFNMDAyMDA1IiwiaGFzaCI6IjIyOTc1OTE3LzA6LTE2MDcwNDgxODAiLCJncmFjZVBlcmlvZERheXMiOjcsImF1dG9Qcm9sb25nYXRlZCI6ZmFsc2UsImlzQXV0b1Byb2xvbmdhdGVkIjpmYWxzZX0=-QL1hirx6cWN58aNWeJrDB8k+pWNX43LRPQ54/VLVYq9dwsuzphmd3ZxQoQt3RVG+P4+yGlPDzBJVas6SXl7wO1Lm8igHXgeG8bEGub5EN4P/JY/gkC0XlXQSnNS93VI4qBTts1gbXA4JgD2Qfz0V32VR32vek9fHY2vqlKpfjIrmUJYan5XFrTDK+N68zckgyZzdMXapRHd0PbpK3/7m/JpmJgkBsWRzAY/USfGuiC6TZ1Grf2lqYeaoJz2wngpwwgTVvYeguWSYlarrFM68QCSKqt/qCHb7nXE2e4XHrvlbwQRMZHWTuktFZtvR18SOKV+s8ujPhz48gm3UQwRQlA==-MIIETDCCAjSgAwIBAgIBDTANBgkqhkiG9w0BAQsFADAYMRYwFAYDVQQDDA1KZXRQcm9maWxlIENBMB4XDTIwMTAxOTA5MDU1M1oXDTIyMTAyMTA5MDU1M1owHzEdMBsGA1UEAwwUcHJvZDJ5LWZyb20tMjAyMDEwMTkwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDCP4uk4SlVdA5nuA3DQC+NsEnZS9npFnO0zrmMWcz1++q2UWJNuGTh0rwi+3fUJIArfvVh7gNtIp93rxjtrQAuf4/Fa6sySp4c32MeFACfC0q+oUoWebhOIaYTYUxm4LAZ355vzt8YeDPmvWKxA81udqEk4gU9NNAOz1Um5/8LyR8SGsSc4EDBRSjcMWMwMkYSauGqGcEUK8WhfplsyF61lKSOFA6VmfUmeDK15rUWWLbOMKgn2cxFA98A+s74T9Oo96CU7rp/umDXvhnyhAXSukw/qCGOVhwKR8B6aeDtoBWQgjnvMtPgOUPRTPkPGbwPwwDkvAHYiuKJ7Bd2wH7rAgMBAAGjgZkwgZYwCQYDVR0TBAIwADAdBgNVHQ4EFgQUJNoRIpb1hUHAk0foMSNM9MCEAv8wSAYDVR0jBEEwP4AUo562SGdCEjZBvW3gubSgUouX8bOhHKQaMBgxFjAUBgNVBAMMDUpldFByb2ZpbGUgQ0GCCQDSbLGDsoN54TATBgNVHSUEDDAKBggrBgEFBQcDATALBgNVHQ8EBAMCBaAwDQYJKoZIhvcNAQELBQADggIBAB2J1ysRudbkqmkUFK8xqhiZaYPd30TlmCmSAaGJ0eBpvkVeqA2jGYhAQRqFiAlFC63JKvWvRZO1iRuWCEfUMkdqQ9VQPXziE/BlsOIgrL6RlJfuFcEZ8TK3syIfIGQZNCxYhLLUuet2HE6LJYPQ5c0jH4kDooRpcVZ4rBxNwddpctUO2te9UU5/FjhioZQsPvd92qOTsV+8Cyl2fvNhNKD1Uu9ff5AkVIQn4JU23ozdB/R5oUlebwaTE6WZNBs+TA/qPj+5/wi9NH71WRB0hqUoLI2AKKyiPw++FtN4Su1vsdDlrAzDj9ILjpjJKA1ImuVcG329/WTYIKysZ1CWK3zATg9BeCUPAV1pQy8ToXOq+RSYen6winZ2OO93eyHv2Iw5kbn1dqfBw1BuTE29V2FJKicJSu8iEOpfoafwJISXmz1wnnWL3V/0NxTulfWsXugOoLfv0ZIBP1xH9kmf22jjQ2JiHhQZP7ZDsreRrOeIQ/c4yR8IQvMLfC0WKQqrHu5ZzXTH4NO3CwGWSlTY74kE91zXB5mwWAx1jig+UXYc2w4RkVhy0//lOmVya/PEepuuTTI4+UJwC7qbVlh5zfhj8oTNUXgN0AOc+Q0/WFPl1aw5VV/VrO8FCoB15lFVlpKaQ1Yh+DVU8ke+rt9Th0BCHXe0uZOEmH0nOnH/0onD
```

***
# nvidia sdkmanager 
arch上面不能用
`yay -Rn sdkmanager`

***
# 临时修改系统版本描述（伪装ubuntu）
`cat /etc/lsb-release`
```
LSB_VERSION=1.4
DISTRIB_ID=Arch
DISTRIB_RELEASE=rolling
DISTRIB_DESCRIPTION="Arch Linux"
```
```
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04.5 LTS"
```


***
# docker
```
$ sudo systemctl enable docker
$ sudo systemctl start docker
```
添加当前用户到docker组
```
$ sudo usermod -aG docker $USER
$ newgrp docker
$ groups
$ docker run hello-world
$ docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: yxgi5
Password: 
WARNING! Your password will be stored unencrypted in /home/andy/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store
```
`$ docker pull nvidia-sdk`
失败

***
# bash配置
~/.bashrc添加一句
```
PS1="\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;33m\]\w\[\033[00m\]\n\$ "
```

***
# 各种分辨率的wallpapers
<http://wallpaperswide.com/ubuntu_metal_style_logo-wallpapers.html>
<http://wallpaperswide.com/arch_linux-wallpapers.html>
<http://wallpaperswide.com/debian_2-wallpapers.html>

***
# CUDA
If you run into trouble with CUDA not being available, run nvidia-modprobe first.
```
yay cuda
yay cuda-tools
```


***
# something
```
yay -S rust lldb

yay -S android-sdk android-studio genymotion android-emulator
make sure to have this modules loaded: 
	vboxdrv
	vboxnetflt
	vboxnetadp
	vboxpci
you can simply add them to /etc/modules-load.d/virtualbox.conf with this command:
# echo -e "vboxdrv\nvboxnetflt\nvboxnetadp\nvboxpci" > /etc/modules-load.d/virtualbox.conf

sudo chown -R andy:users /opt/android-studio
sudo chown -R andy:users /opt/android-sdk
sudo chown -R andy:users /opt/genymotion

=====
$ yay
:: Synchronizing package databases...
 core is up to date
 extra is up to date
 community is up to date
 multilib is up to date
 archlinuxcn is up to date
:: Starting full system upgrade...
:: Replace libcanberra-pulse with extra/libcanberra? [Y/n] y
:: Replace libgiac with community/giac? [Y/n] y
:: Replace qca with extra/qca-qt5? [Y/n] y
:: Replace sagemath-jupyter with community/sagemath? [Y/n] y
:: Replace virtualbox-guest-dkms with community/virtualbox-guest-utils? [Y/n] y
:: Replace virtualbox-guest-dkms with community/virtualbox-guest-utils-nox? [Y/n] y
resolving dependencies...
looking for conflicting packages...
warning: removing 'libblocksruntime' from target list because it conflicts with 'libdispatch'
error: unresolvable package conflicts detected
error: failed to prepare transaction (conflicting dependencies)
:: virtualbox-guest-utils and virtualbox-guest-utils-nox are in conflict
error installing repo packages

sudo pacman -S giac --overwrite=*
sudo pacman -S lxmusic --overwrite=*
sudo pacman -S qca-qt5 --overwrite=*
sudo pacman -S sagemath --overwrite=*
yay -S jupyter-jsmol
yay -S virtualbox-guest-utils
yay -S virtualbox-guest-utils-nox
sudo pacman -Rdd libcanberra-pulse
sudo pacman -Rdd libgiac
sudo pacman -Rdd perl-gtk2-unique
sudo pacman -S archlinuxcn-keyring
yay -S libdispatch

/etc/pacman.d/mirrorlist installed as /etc/pacman.d/mirrorlist.pacnew
/etc/pacman.conf installed as /etc/pacman.conf.pacnew



archlinux-java status
sudo archlinux-java set java-11-openjdk
archlinux-java status

yay -S android-tools

xterm 背景色现在默认是白色，volumeicon看起来很难看，修改背景色
gedit ~/.config/volumeicon/volumeicon

onclick=xterm -e 'alsamixer'
修改为
onclick=xterm -bg black -e 'alsamixer'

也可以在volumeicon的右键 reference修改

全局修改~/.Xdefaults似乎没有用

yay hwinfo
yay nmap
nmap -sP 192.168.1.0/24
yay alsamixergui 编译失败
$ yay -S pamixer
yay -S aarch64-linux-gnu-binutils binutils
lscpu
```

***
# zst文件怎么解压缩
win下面 下载一个`peazip`
linux下面 `tar -I zstd -xvf file.zst`



***
# replace electron9 with electron9-bin
```
$ yay -S electron9-bin
$ yay -S kde-cli-tools xdg-utils
```


***
# 笔记本背光
<https://wiki.archlinux.org/index.php/Backlight>
`journalctl -xf`
实际上BRTUP/BRTDN按键是可以的
```
xbacklight -set 50
cat /sys/class/backlight/intel_backlight/brightness
sudo tee /sys/class/backlight/intel_backlight/brightness <<< 2000
```

***
# snap
```
make[1]: Leaving directory '/home/andy/.cache/yay/snapd/src/snapd-2.49.1/cmd'
==> Starting check()...
snap-exec is not a static binary
error making: snapd

/etc/ld.so.conf
/etc/ld.so.conf.d/*
/usr/bin/ldd
strace -f ldd src/go/bin/snap-exec

ldd src/go/bin/snap-exec
/usr/bin/ldd: line 160: /usr/libx32/ld-linux-x32.so.2: cannot execute binary file: Exec format error
ldd: exited with unknown exit code (126)

ldd /usr/libx32/ld-linux-x32.so.2
/usr/bin/ldd: line 160: /usr/libx32/ld-linux-x32.so.2: cannot execute binary file: Exec format error
ldd: exited with unknown exit code (126)

file /usr/libx32/ld-linux-x32.so.2
/usr/libx32/ld-linux-x32.so.2: symbolic link to ld-2.23.so


yay libx32-glibc
:: There are 2 providers available for gcc-multilib-x32>=5.2:
:: Repository AUR
    1) gcc-multilib-x32 2) gcc-x32-seed
选1失败，就选2了
```

***
# 编译内核模块及生成内存盘镜像
`sudo mkinitcpio -p linux`
<https://wiki.archlinux.org/title/Mkinitcpio_(简体中文)>


***
# something
```
yay -R python2-incremental python2-twisted
yay -S python-twisted 
yay -S python-incremental
yay -S mesa #确保安装了这个基础显卡驱动
yay -S nvidia #安装N卡驱动
yay -S bumblebee #提供守护进程以及程序的主要安装包
yay -S nvidia-settings	#配置工具
yay -S xorg-server-devel	#nvidia-xconfig
yay -S opencl-nvidia	#提供opencl支持
yay -S bbswitch	#开启或者关闭显卡驱动
https://wiki.archlinux.org/index.php/Xilinx_Vivado
yay -S pod2man libselinux debianutils multilib-devel
yay -S mlocate
yay -S gradle gradle-doc gradle-src
gpg --keyserver keyserver.ubuntu.com --recv-keys  7C0135FB088AAF6C66C650B9BB5869F064EA74AB
yay -S mingw-w64-gdb
yay -S stopwatch
/sbin/rcvboxadd quicksetup all
echo "void main(){printf(\"hello world\n\");}" |gcc -x c - -o /tmp/hello;/tmp/hello
yay -S python-pydot python-olefile
yay -S android-emulator --overwrite=*
yay -Rdd signon-kwallet-extension kwallet
```


***
# java切换成oracle版本
```
$ archlinux-java status
Available Java environments:
  java-11-openjdk
  java-15-openjdk
  java-16-jdk
  java-8-openjdk (default)
$ sudo archlinux-java set java-16-jdk
$ archlinux-java status
Available Java environments:
  java-11-openjdk
  java-15-openjdk
  java-16-jdk (default)
  java-8-openjdk

Default Java environment is already set to 'java-16-jdk'
See 'archlinux-java help' to change it.
When you use a non-reparenting window manager,
set _JAVA_AWT_WM_NONREPARENTING=1 in /etc/profile.d/jre.sh

yay -S jre11 jdk11
$ sudo archlinux-java set java-11-jdk

yay -S jdk8 jre8
sudo archlinux-java set java-8-jdk
//sudo archlinux-java set java-8-jre/jre

sudo archlinux-java set java-16-jdk
```

***
# tftp
`yay -S tftp-hpa xinetd`
<https://wiki.archlinux.org/title/TFTP>
`sudo gedit /etc/conf.d/tftpd`
```
TFTPD_ARGS="--secure /srv/tftp/"
```
change to
```
TFTPD_ARGS="--user=nobody --secure /tftpboot/ -c"
```
为啥是TFTPD_ARGS？看看
`cat /usr/lib/systemd/system/tftpd.service`

怪不得16.04上能用的
```
TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/tftpboot"
TFTP_ADDRESS="0.0.0.0:69"
TFTP_OPTIONS="-l -c -s"
```
也不行了

配置tftp目录
```
sudo mkdir -p /tftpboot
sudo chmod 777 /tftpboot
sudo chown nobody:nobody /tftpboot
sudo systemctl enable tftpd.service
sudo systemctl start tftpd.service
sudo systemctl status tftpd.service
sudo systemctl enable tftpd.socket
sudo systemctl restart tftpd.service
```
确认tftp服务是否已经开启
```
netstat -an | more | grep udp | grep 69
```
显示
```
udp        0      0 0.0.0.0:69              0.0.0.0:*
```
`netstat -au | grep tftp`

显示
```
udp        0      0 *:tftp                  *:*
```
`sudo gedit /etc/xinetd.d/tftp`
```
service tftp
{
	socket_type	= dgram
	protocol	= udp
	wait		= yes
	user		= nobody
	server		= /usr/bin/tftpd
	server_args	= /usr/var/tftpboot
	disable		= yes
}
```
```
service tftp
{
	socket_type	= dgram
	protocol	= udp
	port        = 69
	wait		= yes
	user		= nobody
	server		= /usr/bin/in.tftpd
	server_args	= /tftpboot
	disable		= no
}
```
`server_args	= -s /tftpboot -c -l`
`server_args	= /tftpboot -c`
怎么都不能下载上传
`server_args	= /tftpboot`
可以下载不能上传
```
sudo systemctl disable tftpd.service
sudo systemctl disable tftpd.socket
sudo systemctl stop tftpd.service
sudo systemctl status tftpd.service
sudo systemctl start xinetd.service
sudo systemctl status xinetd.service
sudo systemctl enable xinetd.service
sudo systemctl restart xinetd.service
```
`cat /usr/lib/systemd/system/xinetd.service`
其实用tftpd比用xinetd好。
```
sudo systemctl stop xinetd.service
sudo systemctl status xinetd.service
sudo systemctl disable xinetd.service
sudo systemctl enable tftpd.service
sudo systemctl start tftpd.service
sudo systemctl status tftpd.service
sudo systemctl enable tftpd.socket
```
本机测试,需要tftp客户端
```
tftp <ip>
put <testfile>
get <testfile>
quit
```
`tftp 127.0.0.1`
`tftp localhost`
```
curl -T E6-AOK7VkAA7cy6.jpeg tftp://localhost
curl -o cmd.txt tftp://localhost/cmd.txt
```
目标板上
```
tftp -c put -l <testfile> <ip>
tftp -c get -r <testfile> <ip>
```
```
tftp –p –r 目标文件名  -l 源文件名 服务器地址
tftp –g –l/-r 源文件名(不更名)   服务器地址  
（此时参数-l与-r等效，使用时只使用其中一个）
tftp –p –l/-r 源文件名(不更名)   服务器地址   

-l  是local的缩写，后跟存在于Client的源文件名，或下载Client后  重命名的文件名。
-r   是remote的缩写，后跟Server即PC机tftp服务器根目录中的源文 件名，或上传Server后重命名后的文件名。
-g  是get的缩写，下载文件时用，
-p  是put的缩写，上传文件时用，
tftp 默认占用的是69端口。
```

***
# 设置git默认编辑器
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
# 全盘更新
```
$ yay
:: Synchronizing package databases...
 core is up to date
 extra is up to date
 community is up to date
 multilib              149.9 KiB  2.57 MiB/s 00:00 [######################] 100%
 archlinuxcn is up to date
:: Starting full system upgrade...
:: Replace gpicview-gtk3 with community/gpicview? [Y/n] y
:: Replace jack with extra/jack2? [Y/n] y
:: Replace libcanberra-pulse with extra/libcanberra? [Y/n] y
:: Replace libgiac with community/giac? [Y/n] y
:: Replace lxmusic-gtk3 with community/lxmusic? [Y/n] y
:: Replace qca with extra/qca-qt5? [Y/n] y
:: Replace sagemath-jupyter with community/sagemath? [Y/n] y
:: Replace virtualbox-guest-dkms with community/virtualbox-guest-utils? [Y/n] y
:: Replace virtualbox-guest-dkms with community/virtualbox-guest-utils-nox? [Y/n] y
resolving dependencies...
looking for conflicting packages...
warning: removing 'libblocksruntime' from target list because it conflicts with 'libdispatch'
error: unresolvable package conflicts detected
error: failed to prepare transaction (conflicting dependencies)
:: virtualbox-guest-utils and virtualbox-guest-utils-nox are in conflict
error installing repo packages


强制安装冲突的包
sudo pacman -S gpicview --overwrite=*
gpicview-gtk3-0.2.5-5 [removal]  gpicview-0.2.5-6

sudo pacman -S jack2 --overwrite=*
jack-0.125.0-9 [removal]  jack2-1.9.19-2
Optional dependencies for jack2
    a2jmidid: for ALSA MIDI to JACK MIDI bridging
    libffado: for firewire support using FFADO
    jack2-dbus: for dbus integration
    realtime-privileges: for realtime privileges
    zita-ajbridge: for using multiple ALSA devices


sudo pacman -S libcanberra --overwrite=*
looking for conflicting packages...
error: failed to prepare transaction (could not satisfy dependencies)
:: installing libcanberra (0.30+2+gc0620e4-5) breaks dependency 'libcanberra=0.30+2+gc0620e4-3' required by libcanberra-pulse

sudo pacman -Rdd libcanberra-pulse

sudo pacman -S giac --overwrite=*
giac-1.7.0.21-1

sudo pacman -S lxmusic --overwrite=*
lxmusic-gtk3-0.4.7-3 [removal]  lxmusic-0.4.7-5

sudo pacman -S qca-qt5 --overwrite=*
qca-2.3.2-2 [removal]  qca-qt5-2.3.3-1

sudo pacman -S sagemath --overwrite=*
sagemath-jupyter-9.2-16 [removal]  sagemath-9.3-11
New optional dependencies for sagemath
    jupyter-jsmol: alternative 3D plot engine in the Jupyter notebook
    sage-notebook-exporter: convert flask notebooks to Jupyter [installed]

yay -S jupyter-jsmol

yay -S virtualbox-guest-utils
virtualbox-guest-dkms-6.1.20-1 [removal]  virtualbox-guest-utils-6.1.24-1

yay -S virtualbox-guest-utils-nox
virtualbox-guest-utils-6.1.24-1 [removal]  virtualbox-guest-utils-nox-6.1.24-1


sudo pacman -S archlinuxcn-keyring
yay -S libdispatch

error: failed to prepare transaction (could not satisfy dependencies)
:: installing alsa-lib (1.2.5.1-3) breaks dependency 'alsa-lib=1.2.4' required by lib32-alsa-lib
:: installing expat (2.4.1-1) breaks dependency 'expat=2.3.0' required by lib32-expat
:: installing libcap (2.51-1) breaks dependency 'libcap=2.49' required by lib32-libcap
:: installing libelf (0.185-1) breaks dependency 'libelf=0.183' required by lib32-libelf
:: installing libpcap (1.10.1-1) breaks dependency 'libpcap=1.10.0' required by lib32-libpcap
:: installing perl (5.34.0-2) breaks dependency 'perl<5.33' required by perl-gtk2-unique
error installing repo packages

sudo pacman -Rdd perl-gtk2-unique
sudo pacman -Rdd libgiac
sudo pacman -Rdd lib32-alsa-lib
sudo pacman -Rdd lib32-expat
sudo pacman -Rdd lib32-libcap
sudo pacman -Rdd lib32-libelf
sudo pacman -Rdd lib32-libpcap

error: failed to commit transaction (conflicting files)
gcc10-libs: /usr/lib/gcc/x86_64-pc-linux-gnu/lib/libgcc_s.so exists in filesystem (owned by gcc6-gcj)
gcc10-libs: /usr/lib/gcc/x86_64-pc-linux-gnu/lib/libgcc_s.so.1 exists in filesystem (owned by gcc6-gcj)
texlive-core: /usr/bin/git-latexdiff exists in filesystem (owned by git-latexdiff)

yay -Syu --overwrite=*

/etc/pacman.d/mirrorlist installed as /etc/pacman.d/mirrorlist.pacnew
/etc/pacman.conf installed as /etc/pacman.conf.pacnew

MariaDB was updated to a new feature release. To update the data run:
   systemctl restart mariadb.service && mariadb-upgrade -u root -p

warning: /etc/pipewire/media-session.d/media-session.conf saved as /etc/pipewire/media-session.d/media-session.conf.pacsave
warning: /etc/pipewire/media-session.d/alsa-monitor.conf saved as /etc/pipewire/media-session.d/alsa-monitor.conf.pacsave

New optional dependencies for python-dulwich
    python-fastimport: for fast-import support
    python-gpgme: for PGP signature support
    python-idna: for HTTPS support via urllib3 [installed]
    python-pyinotify: to watch for changes to refs [installed]
    python-pyopenssl: for HTTPS support via urllib3 [installed]
    python-lxml: for GraphML XML format [installed]
    python-pydot: for graph drawing and graph layout algorithms via GraphViz
    python-yaml: for YAML format reading and writing [installed]
    zeitgeist: Zeitgeist logging plugin
    mlocate: locator filter [installed]
    qt6-declarative: for QtGraphicalEffects [installed]
    python-pyqt5-webengine: recommended for plugins [installed]
    python-pygments: for pygmentex [installed]

    
qemu-ga.service was renamed to qemu-guest-agent.service
You might want to switch to the new service name:
# systemctl disable qemu-ga.service
# systemctl enable qemu-guest-agent.service

warning: /etc/ppp/pppoe.conf installed as /etc/ppp/pppoe.conf.pacnew
>>> The kernel-mode plugin has a new place.
>>> It's now located under /usr/lib/rp-pppoe/rp-pppoe.so
>>> Change LINUX_PLUGIN to the new path in your /etc/ppp/pppoe.conf

:: PGP keys need importing:
 -> 3FEF9748469ADBE15DA7CA80AC2D62742012EA22, required by: 1password
 -> 3059E09144F56804F0FBF4E126B40624BDBFD9F3, required by: palemoon
 -> 3DAD8CD107197488D2A2A0BD40481E7B8FCF9CEC, required by: palemoon
==> Import? [Y/n] y
:: Importing keys with gpg...
gpg: keyserver receive failed: No name
problem importing keys

gpg --keyserver keyserver.ubuntu.com --recv-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
gpg --keyserver keyserver.ubuntu.com --recv-keys 3059E09144F56804F0FBF4E126B40624BDBFD9F3
gpg --keyserver keyserver.ubuntu.com --recv-keys 3DAD8CD107197488D2A2A0BD40481E7B8FCF9CEC

yay -S python-fastimport python-gpgme python-pydot
sudo systemctl disable qemu-ga.service
sudo systemctl enable qemu-guest-agent.service
sudo gedit /etc/ppp/pppoe.conf

sudo pacman -S lib32-alsa-lib
sudo pacman -S lib32-expat
sudo pacman -S lib32-libcap
sudo pacman -S lib32-libelf
sudo pacman -S lib32-libpcap

yay -S python-zstandard gambas3-gb-compress

yay -S stlink-git
You may have to reload the usb-storage module.
To do this use
    modprobe -r usb-storage && modprobe usb-storage
```

***
# makepkg 配置修改
`sudo gedit /etc/makepkg.conf`
```
#MAKEFLAGS="-j2"
MAKEFLAGS="-j$(nproc)"
```

***
# 清理yay缓存
`gedit ~/.cache/yay/clean.sh`
```
#!/bin/bash

# BASH Shell: For Loop File Names With Spaces
# Set $IFS variable
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for folders in `find . -maxdepth 2 -type d -name "src"`
#FILES=*
#for folders in $FILES
do 
echo $folders
sudo rm -rf $folders
done


for folders in `find . -maxdepth 2 -type d -name "pkg"`
#FILES=*
#for folders in $FILES
do 
echo $folders
sudo rm -rf $folders
done

# restore $IFS
IFS=$SAVEIFS
```
`chmod +x ~/.cache/yay/clean.sh`


***
# something
```
yay -U gcc7-7.5.0-3-x86_64.pkg.tar.zst gcc7-fortran-7.5.0-3-x86_64.pkg.tar.zst gcc7-libs-7.5.0-3-x86_64.pkg.tar.zst 
gcc6
makepkg --nocheck
//eclipse-java
```

***
# xsct[不要native运行，用docker安装一个ubuntu来运行]
```
xsct在运行一些命令时候
# Problematic frame:
# C  [libstdc++.so.6+0x8e907]  std::_Hash_bytes(void const*, unsigned long, unsigned long)+0x37
...


yay -S jre

把16的伪装成9
/opt/Xilinx/Vitis/2020.1/tps/lnx64/jre9.0.4

修改/opt/Xilinx/Vitis/2020.1/bin/unwrapped/lnx64.o/rdi_vitis
--add-modules jdk.incubator.httpclient    OR      --add-modules java.net.http
https://docs.oracle.com/en/java/javase/16/docs/api/jdk.incubator.foreign/module-summary.html
https://docs.oracle.com/en/java/javase/16/docs/api/jdk.incubator.vector/module-summary.html
jdk.incubator.vector     jdk.base
jdk.incubator.foreign    jdk.base
还是不行
没办法

大概结论是一些系统基础库依赖在arch上过于新的库会导致错误，没有分析出导致错误的关键。各种尝试失败
不过也要说xilinx几个版本还在用java9这样的过渡版本，有点操蛋。
arch神教反正是激进的环境，只能在使用上注意
可以在目标workspace用vitis中的xsct来运行脚本，开其他的workspace没有用(xsct会莫名挂掉，pwd都不输出)
```

***
# xsct

为了解决 xsct 在 archlinux 中管理 vitis/sdk 工程过程的 fail，各种办法都没有解决问题，那么就用 docker run a ubuntu container
```
docker pull ubuntu:16.04
docker run -d --name ubuntu_container --restart always -v /opt/:/opt/ -v /home/andy/:/home/andy/ -i -t ubuntu:16.04 bash

docker exec -it ubuntu_container /bin/bash
```
```
apt update
--apt install lsb-release xvfb x11-utils dbus-x11 rlwrap locales libtinfo5 aptitude
apt install lsb-release xvfb x11-utils dbus-x11 rlwrap locales libtinfo5 aptitude git make net-tools libncurses5-dev tftpd zlib1g-dev libssl-dev flex bison libselinux1 gnupg wget diffstat chrpath socat xterm autoconf libtool tar unzip texinfo zlib1g-dev gcc-multilib build-essential libsdl1.2-dev libglib2.0-dev screen pax gzip libboost-dev libboost-tools-dev libboost-timer-dev libcoinutils-dev libboost-all-dev libgtk-3-dev 
dpkg-reconfigure locales
>149 and 3
dpkg-reconfigure dash
>choose no
adduser andy
```
```
docker exec -it ubuntu_container /bin/bash
```
```
cd /opt/Xilinx/Vitis/2020.1
source ./settings64.sh
xsct
```
```
$ docker pull ubuntu
-- or "docker pull ubuntu:16.04"
$ docker run -d --name ubuntu_container --restart always -v /opt/:/opt/ -v /home/andy/:/home/andy/ -i -t ubuntu bash
$ docker exec -it ubuntu_container /bin/bash
```
```
# apt update
# apt install lsb-release xvfb x11-utils dbus-x11 rlwrap locales libtinfo5 aptitude git make net-tools libncurses5-dev tftpd zlib1g-dev libssl-dev flex bison libselinux1 gnupg wget diffstat chrpath socat xterm autoconf libtool tar unzip texinfo zlib1g-dev gcc-multilib build-essential libsdl1.2-dev libglib2.0-dev screen pax gzip libboost-dev libboost-tools-dev libboost-timer-dev libcoinutils-dev libboost-all-dev libgtk-3-dev gtk3-nocsd libgtk2.0
# dpkg-reconfigure locales
> choose en_US.UTF-8 UTF-8, at about number 149 ... 159
> and choose num 3, en_US.UTF-8
# dpkg-reconfigure dash
> choose no
# adduser andy
> ...
# su andy
$ cd /opt/Xilinx/Vitis/2020.1
$ source ./settings64.sh
$ xsct
```

几个常用操作
```
docker stop ubuntu_container
docker start ubuntu_container

sudo docker stop $(docker ps -a | awk '{ print $1}' | tail -n +2)
sudo systemctl stop docker.service 

sudo systemctl start docker.service 
sudo docker start $(docker ps -a | awk '{ print $1}' | tail -n +2)
```
2017 sdk 报错 GTK+ Version Check
```
root@1f7e6c346eca:/# apt install libgtk2.0
```
就可以了

这下，可以间接使用vitis/xsct有关tcl了！！
```
$ docker exec -it ubuntu_container /bin/bash
# su andy
$ cd ~
```

***
# 恢复删除文件
```
extundelete
df -lh
umount /dev/partition 
mount -o remount,ro /dev/partition
extundelete /dev/sdxx --inode 2
```
开始
```
extundelete /dev/sdxx --inode xxx
extundelete --restore-file pic.jpg /dev/sdxx
extundelete /dev/sdxx --restore-inode 13,14
```
文件位于当前目录下的`RECOVERED_FILES/$filename`



***
# dkms
``
yay -S qt4-serialport
yay -S tty0tty
sudo dkms install --no-depmod -m tty0tty -v git -k 5.13.9-arch1-1
``
移除dkms模块想这样 
`sudo dkms remove -m tty0tty -v 1.2.r25.g5f8d18d --all`
```
sudo dkms autoinstall -k
Error! Could not locate dkms.conf file.
File: /var/lib/dkms/vboxguest/5.0.14/source/dkms.conf does not exist.

$ for i in /var/lib/dkms/*/[^k]*/source; do [ -e "$i" ] || echo "$i";done
/var/lib/dkms/vboxguest/5.0.14/source
/var/lib/dkms/vboxhost/5.0.14/source
```
其实已经用不着这个版本的东西，
`yay -Qo  /var/lib/dkms/vboxhost/5.0.14/source`
都查询不到所属的包了，删掉
```
sudo rm -rf /var/lib/dkms/vboxhost/5.0.14/
sudo rm /var/lib/dkms/vboxguest/ -rf
```
再次运行
`sudo dkms autoinstall -k` （当前运行内核和更新后的不一致的，比如刚更新了内核，需要明确指定内核版本）

或者明确指定内核版本
```
sudo dkms autoinstall -k 5.13.9-arch1-1
sudo udevadm control --reload-rules
sudo modprobe -r tty0tty
sudo modprobe tty0tty
sudo chmod 666 /dev/tnt*
```
`sudo gedit /etc/modules-load.d/tty0tty.conf`
```
tty0tty
```
```
#sudo gedit /etc/udev/rules.d/95-tty0tty.rules
sudo gedit /usr/lib/udev/rules.d/95-tty0tty.rules
```
```
KERNEL=="tnt[0-7]", SUBSYSTEM=="tty", GROUP="uucp", MODE="0660"
```
`sudo udevadm control --reload-rules`


***
# jetbrains 全家桶
```
yay -S intellij-idea-ultimate-edition clion datagrip goland rubymine rider webstorm phpstorm
yay -S intellij-idea-ultimate-edition-jre clion-cmake clion-jre clion-gdb clion-lldb biicode swift-language goland-jre webstorm-jre
yay -S mysql-workbench
```
rubymine是jetbrains-rubymine运行



***
# xulrunner
xulrunner编译依赖引入了已安装版本的库引用，会造成错误，先删已经安装的包
```
ldconfig -p | grep libicui18n.so
yay -Rdd xulrunner
makepkg
```


***
# swift-language
```
/home/andy/.cache/yay/swift-language/src/llvm-project/llvm/utils/benchmark/src/benchmark_register.h:17:30: error: no member named 'numeric_limits' in namespace 'std'
  static const T kmax = std::numeric_limits<T>::max();
                        ~~~~~^
/home/andy/.cache/yay/swift-language/src/llvm-project/llvm/utils/benchmark/src/benchmark_register.h:17:45: error: 'T' does not refer to a value
  static const T kmax = std::numeric_limits<T>::max();
                                            ^
/home/andy/.cache/yay/swift-language/src/llvm-project/llvm/utils/benchmark/src/benchmark_register.h:8:20: note: declared here
template <typename T>
                   ^
/home/andy/.cache/yay/swift-language/src/llvm-project/llvm/utils/benchmark/src/benchmark_register.h:17:47: error: no member named 'max' in the global namespace; did you mean 'kmax'?
  static const T kmax = std::numeric_limits<T>::max();
                                              ^~~~~
                                              kmax
/home/andy/.cache/yay/swift-language/src/llvm-project/llvm/utils/benchmark/src/benchmark_register.h:17:18: note: 'kmax' declared here
  static const T kmax = std::numeric_limits<T>::max();
                 ^
/home/andy/.cache/yay/swift-language/src/llvm-project/llvm/utils/benchmark/src/benchmark_register.h:17:18: error: default initialization of an object of const type 'const long'
  static const T kmax = std::numeric_limits<T>::max();
                 ^
                      = 0
/home/andy/.cache/yay/swift-language/src/llvm-project/llvm/utils/benchmark/src/benchmark_register.cc:270:3: note: in instantiation of function template specialization 'AddRange<long>' requested here
  AddRange(&arglist, start, limit, range_multiplier_);
  ^
In file included from /home/andy/.cache/yay/swift-language/src/llvm-project/llvm/utils/benchmark/src/benchmark_register.cc:15:
/home/andy/.cache/yay/swift-language/src/llvm-project/llvm/utils/benchmark/src/benchmark_register.h:17:18: error: default initialization of an object of const type 'const int'
  static const T kmax = std::numeric_limits<T>::max();
                 ^
                      = 0
/home/andy/.cache/yay/swift-language/src/llvm-project/llvm/utils/benchmark/src/benchmark_register.cc:417:3: note: in instantiation of function template specialization 'AddRange<int>' requested here
  AddRange(&thread_counts_, min_threads, max_threads, 2);
  ^
5 errors generated.
```

add CXXFLAGS option to `/etc/makepkg.conf`
`-include /usr/include/c++/11*/limits`
好像解决不了

`～/.cache/yay/swift-language/src/llvm-project/llvm/utils/benchmark/src/benchmark_register.h`
添加
```
#include <limits>
```
其实下载编译好的就可以
<https://github.com/soloturn/swift-aur/releases/download/latest/swift-language-git-swift.DEVELOPMENT.SNAPSHOT.2021.03.25.a.r463.g54a0e1901d4-1-x86_64.pkg.tar.zst>
<https://github.com/soloturn/swift-aur/releases/download/latest/swift-language-5.4-1-x86_64.pkg.tar.zst>
<https://github.com/ProfFan/swift-aur/releases>
<https://github.com/ProfFan/swift-aur/releases/download/swift.DEVELOPMENT.SNAPSHOT.2021.06.01.a.r274/swift-language-git-swift.DEVELOPMENT.SNAPSHOT.2021.06.01.a.r274.g038af80a880-1-x86_64.pkg.tar.zst>

也可以打包这个
```
yay -S swift-bin
yay -S patchelf
```
修改PKGBUILD，python36修改成python
<https://swift.org/builds/swift-5.4.2-release/centos8/swift-5.4.2-RELEASE/swift-5.4.2-RELEASE-centos8.tar.gz>


clion安装swift plugin，然后设置swift path，
<https://youtrack.jetbrains.com/issue/CPP-19371>
<https://caelis.medium.com/install-and-configure-swift-on-arch-linux-for-clion-ee72908bc105>
应该这样
```
mkdir ~/Swift
cd ~/Swift
ln -s /usr/lib/swift-git usr
```
clion的settings->swift path: ~/Swift
```
ldd /home/andy/Swift/usr/bin/swift-package
	libicuuc.so.68 => not found
	libicuuc.so.68 => not found
	libicui18n.so.68 => not found
```
一个主意是把69的改名成68放到`/home/andy/Swift/usr/lib`之类的地方

干脆这样，更新为
`swift-language-git-swift.DEVELOPMENT.SNAPSHOT.2021.06.01.a.r274.g038af80a880-1-x86_64.pkg.tar.zst`
就ok了

编译
`～/.cache/yay/swift-language-git`
`makepkg --nocheck`
然后在install阶段之前把pkg目录的权限修改为777，否则报错，无法生成安装包


***
# 修复wine打开路径乱码问题

检查LC_ALL="zh_CN.UTF-8"
```
sudo gedit /etc/locale.conf
sudo gedit /etc/locale.gen
```
这里如果升级可能覆盖掉zh_CN.UTF-8，重新打开
`sudo locale-gen`
随便找一个中文路径或者中文名的pdf来实验
```
LC_ALL="zh_CN.UTF-8" LANG="zh_CN.UTF-8" wine start /ProgIDOpen FoxitReader.Document "$PWD/疯狂Android讲义(第4版)_ISBN9787121360091.pdf"
```


***
# virtualbox
```
yay -S virtualbox virtualbox-ext-vnc virtualbox-guest-iso virtualbox-ext-oracle virtualbox-host-dkms
// virtualbox-host-modules-arch
dkms install --no-depmod -m vboxhost -v 6.1.26_OSE -k
```

***
# something
```
yay -S python-latexcodec
```

***
# gcc makepkg有关key缺失问题
```
gpg --keyserver keyserver.ubuntu.com --recv-keys 3AB00996FC26A641
gpg --keyserver keyserver.ubuntu.com --recv-keys F3691687D867B81B51CE07D9BBE43771487328A9
gpg --keyserver keyserver.ubuntu.com --recv-keys 86CFFCA918CF3AF47147588051E8B148A9999C34
yay -U gcc6 gcc6-fortran gcc6-gcj gcc6-libs gcc8 gcc8-fortran gcc8-libs gcc9 gcc9-fortran gcc9-libs
```


***
# DSView在滚升系统经常因为库依赖挂掉
```
	libboost_filesystem.so.1.76.0 => not found
	libboost_system.so.1.76.0 => not found
	libboost_thread.so.1.76.0 => not found
```


***
# qt6
```
yay -S qt6-doc qt6-examples qt6-translations
```


***
# vivado / vitis 启动命令
`cd /usr/local/bin`
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


***
# yosys 等
```
yay -S vhd2vl-git
yay -S abc v2x-git python-pytest-runner yosys python-vtr-xml-utils-git
yay -S covered
yay -S sv2v alex ghc happy haskell-githash 
yay -S verilator
yay -S jedi-language-server
yay -S systemc

	Reenable any per-user enabled pipewire-media-session.service
       	manually to establish a new service alias for
       	pipewire-session-manager.service added with 0.3.38.
Removed /etc/systemd/user/pipewire.service.wants/pipewire-media-session.service.


"/var/lib/postgres/data" is missing or empty. Use a command like
  su - postgres -c "initdb --locale en_US.UTF-8 -D '/var/lib/postgres/data'"
with relevant options, to initialize the database cluster.
```
<https://archlinux.org/packages/community/x86_64/haskell-githash/>
`haskell-hpack haskell-hspec haskell-unliftio`
```
sv2v $ makepkg --skipchecksums 

sv2v
sv2v.cabal(patch)
```
```
@@ -105,7 +105,7 @@
 
     build-depends:
         array >=0.5.4.0 && <0.6,
-        base >=4.14.1.0 && <4.15,
+        base >=4,
         cmdargs >=0.10.21 && <0.11,
         containers >=0.6.2.1 && <0.7,
         directory >=1.3.6.0 && <1.4,
#@@ -113,1 +113,0 @@
#-        githash >=0.1.6.1 && <0.2,
```

***
# 全盘更新
```
:: Synchronizing package databases...
 core                  137.5 KiB  1785 KiB/s 00:00 [######################] 100%
 extra                1567.3 KiB  6.86 MiB/s 00:00 [######################] 100%
 community               5.8 MiB  7.40 MiB/s 00:01 [######################] 100%
 multilib              150.3 KiB  4.32 MiB/s 00:00 [######################] 100%
 archlinuxcn          1921.0 KiB  4.77 MiB/s 00:00 [######################] 100%
:: Starting full system upgrade...
:: Replace python-sgmllib with extra/python-sgmllib3k? [Y/n] y
:: Replace wine-wechat with archlinuxcn/wine-wechat-setup? [Y/n] y
:: Replace xdg-desktop-portal-gtk with extra/xdg-desktop-portal-gnome? [Y/n] y
:: Replace xmlrpc-c with community/libxmlrpc? [Y/n] y
resolving dependencies...
looking for conflicting packages...
warning: removing 'python-mistune' from target list because it conflicts with 'python-mistune1'
:: python-mistune1 and python-mistune are in conflict. Remove python-mistune? [y/N] y
warning: dependency cycle detected:
warning: freetype2 will be installed before its harfbuzz dependency
warning: dependency cycle detected:
warning: libglvnd will be installed before its mesa dependency
warning: dependency cycle detected:
warning: nvidia-utils will be installed before its libglvnd dependency
warning: dependency cycle detected:
warning: xorg-server will be installed before its libglvnd dependency
warning: dependency cycle detected:
warning: egl-wayland will be installed before its libglvnd dependency
warning: dependency cycle detected:
warning: smbclient will be installed before its cifs-utils dependency
warning: dependency cycle detected:
warning: rubygems will be installed before its ruby dependency
warning: dependency cycle detected:
warning: jupyter-nbconvert will be installed before its jupyter dependency
warning: dependency cycle detected:
warning: lib32-mesa will be installed before its lib32-libglvnd dependency
warning: dependency cycle detected:
warning: lib32-nvidia-utils will be installed before its lib32-libglvnd dependency
warning: dependency cycle detected:
warning: lib32-harfbuzz will be installed before its lib32-freetype2 dependency
warning: dependency cycle detected:
warning: tensorboard will be installed before its python-tensorboard_plugin_wit dependency
warning: dependency cycle detected:
warning: python-keras will be installed before its python-tensorflow-opt dependency
The Teamviewer daemon must be running for Teamviewer to work.
Execute 'sudo systemctl enable teamviewerd' in a terminal.
==> WeChat data will be put into ~/.local/lib/wine-wechat when needed.
==> You need to download WeChat setup program yourself.
==> run 'wechat -i path/to/WeChatSetup.exe' to install / update.
==> run 'wechat --config' if you want to adjust DPI settings.

"/var/lib/postgres/data" is missing or empty. Use a command like
  su - postgres -c "initdb --locale en_US.UTF-8 -D '/var/lib/postgres/data'"
If you run into trouble with CUDA not being available, run nvidia-modprobe first.
```

```
$ yay -S libdecor lesspipe libjxl python-curio python-sniffio python-trio criu pipewire-v4l2 pipewire-session-manager jedi-language-server python-pyppeteer lib32-pipewire-v4l2 yt-dlp adios2 cgns libharu liblas openimagedenoise openvdb openvr ospray gvfs pyside2 edk2-armvirt python-database-knotinfo yt-dlp libotr libotr wine-for-wechat python-plyvel
```

```
error: failed to prepare transaction (could not satisfy dependencies)
:: installing x264 (3:0.163.r3060.5db6aa6-1) breaks dependency 'x264=3:0.161.r3039.544c61f' required by lib32-x264

yay -Rdd lib32-x264
yay -S pyside2 edk2-armvirt qt5-scxml qt5-remoteobjects qt5-datavis3d
yay -S pipewire-session-manager pipewire-v4l2 pipewire-media-session-docs lib32-pipewire-v4l2 

removing 'python-mistune' from target list because it conflicts with 'python-mistune1'

yay -S python-mistune1 adios2 libharu liblas openimagedenoise openvr ospray level-zero-loader benchmark
yay -S yt-dlp atomicparsley
```

***
# anydesk
```
yay -S anydesk
sudo systemctl start anydesk.service
sudo teamviewer --daemon start
```

***
# pip3 modules
```
sudo -H pip3 install selenium -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install webdriver-manager -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install pywebcopy -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install pyautogui -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install bencoder -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install requests docopt requests beautifulsoup4 lxml future pysocks -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install PySide6 loguru Pillow html5lib qrcode incremental -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install ndg-httpsclient pyopenssl pyasn1 -i https://mirrors.163.com/pypi/simple
```


***
# genymotion command line research
```
VBoxManage list vms
"win7" {a476458e-c12a-4541-8453-5d0120b14e89}
"XP" {4e009271-4819-4487-82dd-92f96ed822cb}
"ubuntu1604" {1fa17739-4ddc-40b6-909c-d79368dd2cbe}
"Google Nexus 7" {e48922a5-f560-4cbe-aceb-8f6f9356f0b5}
"Google Nexus 10" {5b406e20-9e6a-4e5d-b9d6-4d9ac239b4f8}
"Amazon Fire HD 10" {6a2d46d1-ac4f-4752-ab51-11fa0fb56703}
"manjaro" {52e3916f-9117-4afd-99d5-93205a5144a6}


/opt/genymotion/genymotion-shell
genymotion-shell
genymotion>player --vm-name "6a2d46d1-ac4f-4752-ab51-11fa0fb56703"

/opt/genymotion/player --vm-name "6a2d46d1-ac4f-4752-ab51-11fa0fb56703"

Genymotion Shell > help                                                                   

List of available commands:
---------------------------
android             information related to the Android system included in Genymotion distribution
battery             actions and information related to the battery widget
devices             generic actions related to virtual devices (listing, selection, ...)
diskio              actions and information related to the disk throughput
exit                quit this application
genymotion          information related to the Genymotion system
gps                 actions and information related to the Global Positioning System widget
help                display this help and display help for each verb
network             actions and information related to the network quality of service
pause               perform a pause (useful for automatic tests)
phone               actions related to the phone widget
quit                quit this application
rotation            actions related to the rotation of virtual devices
version             version number of the running Genymotion Shell application

Genymotion Shell > devices list
Available devices:

 Id | Select |    Status     |   Type   |   IP Address    |      Name
----+--------+---------------+----------+-----------------+---------------
  0 |    *   |            On |  virtual |  192.168.56.104 | Amazon Fire HD 10
  1 |        |           Off |  virtual |         0.0.0.0 | Google Nexus 10
  2 |        |           Off |  virtual |         0.0.0.0 | Google Nexus 7

Genymotion Shell > devices select 0    
Selecting device id 0
Genymotion device selected: Amazon Fire HD 10




genyshell -c "devices list"

gmtool admin create "Google Nexus 5 - 4.4.4 - API 19 - 1080x1920" myNexus
gmtool admin start myNexus
```

***
# something
```
yay -S socat libsepol libselinux 
org.eclipse.tcf.core_1.5.0.202005280226.jar
//yay xrt

yay -S python-rdflib python-brotli python-fs python-lz4 python-reportlab python-unicodedata2 python-zopfli pyside6 python-pyqt6 rtaudio-docs qt6-connectivity qt6-multimedia qt6-location qt6-remoteobjects qt6-sensors qt6-serialport qt6-webchannel qt6-websockets --overwrite=*
sudo systemctl enable teamviewerd.service
yay -S python-pycups x11docker gst-python kwin nxagent weston xorg-server-xwayland
yay -S appstream-qt breeze-gtk maliit-keyboard  packagekit-qt5 anthy libpinyin libchewing chewing-editor
yay -S python-rdflib python-brotli python-fs python-lz4 python-reportlab python-unicodedata2 python-zopfli pyside6 python-pyqt6 rtaudio-docs qt6-svg qt6-3d qt6-scxml qt6-datavis3d qt6-charts qt6-multimedia qt6-serialport qt6-webengine qt6-remoteobjects qt6-sensors qt6-websockets qt6-networkauth qt6-webchannel qt6-location qt6-connectivity qt6-declarative qt6-shadertools
```


***
# 屏幕录像工具
```
yay -S simplescreenrecorder peek deepin-screen-recorder
```


***
# LabVIEW

aur里有个LabVIEW-2020，正好我这也有个LabVIEW2020pro-linux-mac.iso, 修改一下PKGBUILD来makepkg一个安装包

安装完毕的后续处理

原始rpm包的libniPythonInterface.so和libNILVRuntimeManager.so预装位置在
```
/usr/local/natinst/niPythonInterface/lib64/
/usr/local/lib64/LabVIEW-2020-64/
```
生成arch包之后
`libniPythonInterface.so.3.0.0`在
`/opt/natinst/niPythonInterface/lib64/`
建立一个软链接
```
cd /opt/natinst/niPythonInterface/lib64/
sudo ln -s libniPythonInterface.so.3.0.0 libniPythonInterface.so
```
`libNILVRuntimeManager.so`在
`/opt/natinst/LabVIEW-2020-64/AppLibs/`
```
su
echo "/opt/natinst/niPythonInterface/lib64/" > /etc/ld.so.conf.d/ni-python-interface.conf
echo "/opt/natinst/LabVIEW-2020-64/AppLibs/" > /etc/ld.so.conf.d/labview.conf
ldconfig
exit
```
好像没起作用，那么这样
```
sudo rm /etc/ld.so.conf.d/ni-python-interface.conf
sudo rm /etc/ld.so.conf.d/labview.conf
sudo /sbin/ldconfig
```
添加到~/.bashrc
```
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/natinst/LabVIEW-2020-64/AppLibs:/opt/natinst/niPythonInterface/lib64
```

启动器 natinst-labview-2020.desktop
```
[Desktop Entry]
Name=LabVIEW 2020 64-bit
Comment=LabVIEW Graphical Dataflow Programming Environment
Exec=/opt/natinst/LabVIEW-2020-64/labview -launch %F
StartupWMClass=LabVIEW64-2020
Icon=natinst-labview
Terminal=false
Type=Application
Categories=Application;Development;natinst;
MimeType=application/x-labview-vi;application/x-labview-llb;application/x-labview-ctl;application/x-labview-vit;application/x-labview-ctt;application/x-labview-lvclass;application/x-labview-lvproj;application/x-labview-lvlib;application/x-labview-xnode;application/x-labview-xctl;application/x-labview-lvrbt;application/x-labview-vim
```
运行正常. 后面有空再弄 driver 和 add-on 之类的

```
sudo dkms install --no-depmod nikal/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nimxik/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nipalk/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nipxicidk/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nicntdrk/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nicmmk/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nicpciek/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod ni1045tr/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nibds/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod niorbk/20.0.0f1 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nismbus/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nistreamk/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nimdbgk/20.0.0f2 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nidimk/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nicartenumk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nifresnelmbdc/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nifslk/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nimxdfk/20.0.0f1 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nidmxfk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod niesrk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nipxiethernet/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nipxim2/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nistc2k/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod niusrpriok/20.1 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nipxirmk/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nipxifpk/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nipxigpk/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nimru2k/20.0.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nimsdrk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nilmsk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nicdcck/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nicdrk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nichenumk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nistc3rk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nicmrk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nisdigk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nistcrk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nitiork/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nidsark/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod niraptrk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod niwfrk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nixsrk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nicsrk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nicondrk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nifdrk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nihorbrk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod nissrk/20.1.0f0 -k 5.15.5-arch1-1
sudo dkms install --no-depmod NiRioSrv/20.0.1f0 -k 5.15.5-arch1-1

sudo dkms install --no-depmod NiViPciK/20.0.0f0 -k 5.15.5-arch1-1

$ find ni* -name "Makefile" | xargs grep "MODDEPS="
#ni1045tr-20.0.0f0/Makefile:MODDEPS=nikal 
#nibds-20.0.0f0/Makefile:MODDEPS=nikal 
#nicartenumk-20.1.0f0/Makefile:MODDEPS=nibds nikal nimdbgk nipalk 
#nicdcck-20.1.0f0/Makefile:MODDEPS=nikal nimdbgk nimxdfk niorbk nipalk 
#nicdrk-20.1.0f0/Makefile:MODDEPS=nidmxfk nikal nimdbgk nimxdfk niorbk nipalk 
#nichenumk-20.1.0f0/Makefile:MODDEPS=nibds nifslk nikal nimdbgk nipalk 
#nicmmk-20.0.0f0/Makefile:MODDEPS=nikal 
#nicmrk-20.1.0f0/Makefile:MODDEPS=nidmxfk nikal nimdbgk nimru2k nimxdfk niorbk nipalk nistc3rk 
#nicntdrk-20.0.0f0/Makefile:MODDEPS=nikal 
nicondrk-20.1.0f0/Makefile:MODDEPS=nicdrk nidimk nidmxfk nikal nilmsk nimdbgk nimru2k nimxdfk niorbk nipalk nisdigk nistc3rk 
#nicpciek-20.0.0f0/Makefile:MODDEPS=nikal 
#nicsrk-20.1.0f0/Makefile:MODDEPS=nicdcck nicdrk nichenumk nidimk nidmxfk nifresnelmbdc nifslk nikal nilmsk nimdbgk nimru2k nimxdfk niorbk nipalk nistc3rk 
#nidimk-20.0.0f0/Makefile:MODDEPS=nikal niorbk nipalk 
#nidmxfk-20.1.0f0/Makefile:MODDEPS=nikal nimdbgk nimxdfk niorbk nipalk 
#nidsark-20.1.0f0/Makefile:MODDEPS=nidimk nikal nilmsk nimdbgk nimru2k nimxdfk niorbk nipalk nistc2k nistcrk 
#niesrk-20.1.0f0/Makefile:MODDEPS=nikal nimdbgk nimxdfk niorbk nipalk 
#nifdrk-20.1.0f0/Makefile:MODDEPS=nicdcck nicdrk nichenumk nidimk nidmxfk nifresnelmbdc nifslk nikal nilmsk nimdbgk nimru2k nimxdfk niorbk nipalk nistc3rk 
#nifresnelmbdc-20.1.0f0/Makefile:MODDEPS=nikal nimdbgk nipalk 
#nifslk-20.0.0f0/Makefile:MODDEPS=nikal nimdbgk nipalk 
#nihorbrk-20.1.0f0/Makefile:MODDEPS=nicdrk nidimk nidmxfk nikal nimdbgk nimru2k nimxdfk niorbk nipalk nisdigk nistc3rk 
#nilmsk-20.1.0f0/Makefile:MODDEPS=nidmxfk nikal nimdbgk nimxdfk niorbk nipalk 
#nimdbgk-20.0.0f2/Makefile:MODDEPS=nikal niorbk nipalk 
#nimru2k-20.0.0f0/Makefile:MODDEPS=nidimk nikal nimdbgk nimxdfk niorbk nipalk 
#nimsdrk-20.1.0f0/Makefile:MODDEPS=nidmxfk nikal nimdbgk nimxdfk niorbk nipalk 
#nimxdfk-20.0.0f1/Makefile:MODDEPS=nikal nimdbgk niorbk nipalk 
#nimxik-20.0.0f0/Makefile:MODDEPS=nikal 
#niorbk-20.0.0f1/Makefile:MODDEPS=nikal nipalk 
#nipalk-20.0.0f0/Makefile:MODDEPS=nikal 
#nipxicidk-20.0.0f0/Makefile:MODDEPS=nikal 
#nipxiethernet-20.0.0f0/Makefile:MODDEPS=nikal 
#nipxifpk-20.0.0f0/Makefile:MODDEPS=nikal nimdbgk nimxdfk niorbk nipalk nipxirmk 
#nipxigpk-20.0.0f0/Makefile:MODDEPS=nikal nimdbgk nimxdfk niorbk nipalk nipxirmk 
#nipxim2-20.0.0f0/Makefile:MODDEPS=nikal 
#nipxirmk-20.0.0f0/Makefile:MODDEPS=nidimk nikal nimdbgk niorbk nipalk 
#niraptrk-20.1.0f0/Makefile:MODDEPS=nicdrk nidimk nidmxfk nikal nimdbgk nimru2k nimxdfk niorbk nipalk nisdigk nistc3rk 
#nisdigk-20.1.0f0/Makefile:MODDEPS=nicdrk nidimk nidmxfk nikal nimdbgk nimru2k nimxdfk niorbk nipalk 
#nismbus-20.0.0f0/Makefile:MODDEPS=nikal 
#nissrk-20.1.0f0/Makefile:MODDEPS=nicdrk nidimk nidmxfk nikal nilmsk nimdbgk nimru2k nimxdfk niorbk nipalk nisdigk nistc2k nistcrk nitiork 
#nistc2k-20.1.0f0/Makefile:MODDEPS=nikal nimdbgk nipalk 
#nistc3rk-20.1.0f0/Makefile:MODDEPS=nicdcck nidimk nidmxfk nifslk nikal nilmsk nimdbgk nimru2k nimxdfk niorbk nipalk 
#nistcrk-20.1.0f0/Makefile:MODDEPS=nidmxfk nikal nilmsk nimdbgk nimru2k nimxdfk niorbk nipalk nistc2k 
#nistreamk-20.0.0f0/Makefile:MODDEPS=nikal 
#nitiork-20.1.0f0/Makefile:MODDEPS=nicdrk nidimk nidmxfk nikal nilmsk nimdbgk nimru2k nimxdfk niorbk nipalk 
#niusrpriok-20.1/Makefile:MODDEPS=nibds nikal nistreamk 
#niwfrk-20.1.0f0/Makefile:MODDEPS=nicdrk nidimk nidmxfk nikal nilmsk nimdbgk nimru2k nimxdfk niorbk nipalk nistc2k nistcrk 
#nixsrk-20.1.0f0/Makefile:MODDEPS=nicdrk nidimk nidmxfk nifslk nikal nilmsk nimdbgk nimru2k nimxdfk niorbk nipalk nisdigk nitiork 





----------------------------------------------------------------------------------
===> NOTES FOR USAGE
===>
===> 1) Please logout & login to renew environment variable before first use.
===>
===> 2) If Usb-raw devices do not work, try following (as root) and restart your PC:
===>    # AddUsbRawPermissions.sh
===>    # gpasswd -a <user> usbraw
===>
===> 3) If USB-TMC devices do not work, try following (as root) and restart your PC:
===>    # gpasswd -a <user> usbtmc
===>    # rmmod usbtmc
===>    # echo 'blacklist usbtmc' > /etc/modprobe.d/nousbtmc.conf
===> refs: http://digital.ni.com/public.nsf/allkb/A10090850FF0887A86257926007A7E96
===>       https://github.com/python-ivi/python-usbtmc#configuring-udev
===>
----------------------------------------------------------------------------------


Optional dependencies for ni-visa
    python2-pyvisa: python 2 frontend
    python-pyvisa: python 3 frontend

yay -S python2-pyvisa python-pyvisa linux-gpib python2-linux-gpib python-gpib-ctypes python-linux-gpib linux-gpib-dkms


mv libnipalu.so.20.0.0 libnipalu.so.20.0.0.bk
visaconf
cd /usr/lib/x86_64-linux-gnu
$ su
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/natinst/LabVIEW-2020-64/AppLibs:/opt/natinst/niPythonInterface/lib64:/opt/natinst/share/NI-VISA:/opt/natinst/LabVIEW-2020-64/resource
# visaconf



sudo dkms install --no-depmod nikal/20.0.0f0
sudo dkms install --no-depmod nimxik/20.0.0f0
sudo dkms install --no-depmod nipalk/20.0.0f0
sudo dkms install --no-depmod nipxicidk/20.0.0f0
sudo dkms install --no-depmod nicntdrk/20.0.0f0
sudo dkms install --no-depmod nicmmk/20.0.0f0
sudo dkms install --no-depmod nicpciek/20.0.0f0
sudo dkms install --no-depmod ni1045tr/20.0.0f0
sudo dkms install --no-depmod nibds/20.0.0f0
sudo dkms install --no-depmod niorbk/20.0.0f1
sudo dkms install --no-depmod nismbus/20.0.0f0
sudo dkms install --no-depmod nistreamk/20.0.0f0
sudo dkms install --no-depmod nimdbgk/20.0.0f2
sudo dkms install --no-depmod nidimk/20.0.0f0
sudo dkms install --no-depmod nicartenumk/20.1.0f0
sudo dkms install --no-depmod nifresnelmbdc/20.1.0f0
sudo dkms install --no-depmod nifslk/20.0.0f0
sudo dkms install --no-depmod nimxdfk/20.0.0f1
sudo dkms install --no-depmod nidmxfk/20.1.0f0
sudo dkms install --no-depmod niesrk/20.1.0f0
sudo dkms install --no-depmod nipxiethernet/20.0.0f0
sudo dkms install --no-depmod nipxim2/20.0.0f0
sudo dkms install --no-depmod nistc2k/20.1.0f0
sudo dkms install --no-depmod niusrpriok/20.1
sudo dkms install --no-depmod nipxirmk/20.0.0f0
sudo dkms install --no-depmod nipxifpk/20.0.0f0
sudo dkms install --no-depmod nipxigpk/20.0.0f0
sudo dkms install --no-depmod nimru2k/20.0.0f0
sudo dkms install --no-depmod nimsdrk/20.1.0f0
sudo dkms install --no-depmod nilmsk/20.1.0f0
sudo dkms install --no-depmod nicdcck/20.1.0f0
sudo dkms install --no-depmod nicdrk/20.1.0f0
sudo dkms install --no-depmod nichenumk/20.1.0f0
sudo dkms install --no-depmod nistc3rk/20.1.0f0
sudo dkms install --no-depmod nicmrk/20.1.0f0
sudo dkms install --no-depmod nisdigk/20.1.0f0
sudo dkms install --no-depmod nistcrk/20.1.0f0
sudo dkms install --no-depmod nitiork/20.1.0f0
sudo dkms install --no-depmod nidsark/20.1.0f0
sudo dkms install --no-depmod niraptrk/20.1.0f0
sudo dkms install --no-depmod niwfrk/20.1.0f0
sudo dkms install --no-depmod nixsrk/20.1.0f0
sudo dkms install --no-depmod nicsrk/20.1.0f0
sudo dkms install --no-depmod nicondrk/20.1.0f0
sudo dkms install --no-depmod nifdrk/20.1.0f0
sudo dkms install --no-depmod nihorbrk/20.1.0f0
sudo dkms install --no-depmod nissrk/20.1.0f0
sudo dkms install --no-depmod NiRioSrv/20.0.1f0

sudo dkms install --no-depmod NiViPciK/20.0.0f0


cat /usr/share/libalpm/hooks/70-dkms-install.hook
```


***
# AC6 临时笔记
```
- startup_stm32f10x_ld_vl.s: for STM32 Low density Value line devices
- startup_stm32f10x_ld.s: for STM32 Low density devices
- startup_stm32f10x_md_vl.s: for STM32 Medium density Value line devices
- startup_stm32f10x_md.s: for STM32 Medium density devices
- startup_stm32f10x_hd.s: for STM32 High density devices
- startup_stm32f10x_xl.s: for STM32 XL density devices
- startup_stm32f10x_cl.s: for STM32 Connectivity line devices
cl：互联型产品，stm32f105/107系列
vl：超值型产品，stm32f100系列
xl：超高密度产品，stm32f101/103系列
ld：低密度产品，FLASH小于64K
md：中等密度产品，FLASH=64 or 128
hd：高密度产品，FLASH大于128
```

***
# 修复 idle
```
pacman -Qo /usr/bin/idle
/usr/bin/idle is owned by python 3.9.9-1
yay -S idle3-tools
```


***
# pip加速，设置国内镜像
长期的话可以这样
`~/.pip/` 下创建文件 `pip.conf`
```
[global]
timeout = 600
index-url = http://pypi.v2ex.com/simple
[install]
use-mirrors = true
mirrors = https://pypi.tuna.tsinghua.edu.cn/simple/
```
临时的就加上参数
`-i https://pypi.tuna.tsinghua.edu.cn/simple/`
例如
`pip install --upgrade tensorflow -i http://pypi.douban.com/simple --trusted-host pypi.douban.com`
其他国内镜像还有
```
http://pypi.hustunique.com/
http://pypi.sdutlinux.org/
https://pypi.mirrors.ustc.edu.cn/simple/
http://mirrors.aliyun.com/pypi/simple/
http://pypi.douban.com/simple/
```


***
# something
```
yay -S python-pygame docker-scan
```
<https://www.oracle.com/java/technologies/downloads/#java8>
<https://www.oracle.com/java/technologies/downloads/#java11>



***
# python安装第三方库报错
```
Cannot uninstall '***'. It is a distutils installed project and thus we cannot accurately determine which files belong to it which would lead to only a partial uninstall
```
```
sudo -H pip3 install ${PACKAGE_NAME} -i https://mirrors.163.com/pypi/simple --ignore-installed
sudo -H pip3 install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.1.0-cp27-none-linux_x86_64.whl
sudo python3 -m pip install --upgrade https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-0.12.0-py3-none-any.whl
sudo -H pip3 install shadowsocks -i https://mirrors.163.com/pypi/simple --ignore-installed --upgrade
sudo python3 -m pip install -U setuptools -i https://mirrors.163.com/pypi/simple --ignore-installed
```


***
# python 3.10 修复 shadowsocks

修改1：

解决
`/usr/bin/sslocal -c /etc/shadowsocks/config.json`
```
AttributeError: module 'collections' has no attribute 'MutableMapping'
```
根据
<https://stackoverflow.com/questions/69512672/getting-attributeerror-module-collections-has-no-attribute-mutablemapping-w>

`sudo gedit /usr/lib/python3.10/site-packages/shadowsocks/lru_cache.py`
line 34， change from
```
class LRUCache(collections.MutableMapping):
```
to
```
class LRUCache(collections.abc.MutableMapping):
```

修改2：

解决
`/usr/bin/sslocal -c /etc/shadowsocks/config.json`
```
AttributeError: /usr/lib/libcrypto.so.1.1: undefined symbol: EVP_CIPHER_CTX_cleanup. Did you mean: 'EVP_CIPHER_CTX_new'?
```
`sudo gedit /usr/lib/python3.10/site-packages/shadowsocks/crypto/openssl.py`
将所有
```
EVP_CIPHER_CTX_cleanup
```
替换成为
```
EVP_CIPHER_CTX_reset
```

`sudo systemctl start shadowsocks@config.service`
`sudo systemctl status shadowsocks@config.service`


***
# virtualenv
```
$ pacman -S python2-virtualenv
$ virtualenv -p /usr/bin/python2 --system-site-packages ~/env # (Or wherever you want your environment to live)
```
如果只想使用本地安装的软件包(例如，使用pip安装的软件包，而不是使用pacman安装的软件包)，则在创建环境时请删除--system-site-packages选项
`~/.bash_profile`或`~/.profile`(或任何您喜欢的shell配置文件)中，进行如下设置：
`source ~/env/bin/activate`
关闭虚拟环境：
`deactivate`


***
# pyenv

```
sudo pacman -S openssl
sudo pacman -S openssl-1.0
sudo pacman -S python-pyopenssl
sudo pacman -S python2-pyopenssl
LDFLAGS="-L/usr/lib/openssl-1.0" \
CFLAGS="-I/usr/include/openssl-1.0" \
pyenv install -v 3.4.3
echo alias pyenv='LDFLAGS="-L/usr/lib/openssl-1.0" \
    CFLAGS="-I/usr/include/openssl-1.0" \
    pyenv' >> ~/.bashrc
```
ubuntu的pyenv依赖, 仅作为参考记录
```
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev libedit-dev
```
pyenv可以这样安装, 仅作为参考记录
```
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
```
安装脚本有可能会提示你手动把几行命令添加到shell的配置文件中,如果你用的是zsh的话，别忘了替换命令中的bash。

将来如果要删除的话，需要在.zshrc文件中删除。如果你用oh-my-zsh的话，不需要在.zshrc中添加那几行（加了也没用），而是在.zshrc中启用pyenv插件


确定你想把 pyenv 安装在哪。推荐安装在 `$HOME/.pyenv`，但你也可以安装在任意位置。
`$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv`
定义你 PYENV_ROOT 的环境变量来指定你把 pyenv 仓库克隆到了哪，并把 $PYENV_ROOT/bin 添加到你的 $PATH 中，这样就能在命令行使用 pyenv 命令。
`$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc`
`$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc`
设置启动 shell 时自动加载 pyenv 脚本。在 shell 配置文件的最后面加上 `eval "$(pyenv init -)"`
`$ echo 'eval "$(pyenv init -)"' >> ~/.bashrc`
OR
`$ echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc`
重启 shell，使脚本生效。
`$ exec $SHELL`
安装不同的 python 版本到 `$(pyenv root)/versions` 文件夹。
在 pyenv 安装之前的所有 python 版本都归为 system 版本。 （可以用 `pyenv versions` 查看当前安装的 python 版本）
在安装 python 之前，可以使用 `pyenv install -l` 查看当前可以安装哪些 python 版本。
然后使用 `pyenv install` 选择的版本 来安装你所选择的 python 版本。比如 `pyenv install 3.6.1` 安装 python 官网的版本
使用 git 更新 pyenv
如果你是按照上面的方法安装的 pyenv，那你可以使用 git 来更新
更新为最新的开发版
```
$ cd $(pyenv root)
$ git pull
```
更新为指定的版本
```
$ cd $(pyenv root)
$ git fetch
$ git tag
v0.1.0
$ git checkout v0.1.0
```
进行更新：
```
$ pyenv update
```
要卸载pyenv，直接删除目录即可:
```
$ rm -fr ~/.pyenv
```
别忘了把.bashrc中的这几行也一并删掉：
```
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```
完整卸载 pyenv:
pyenv 的根目录删除即可全部删除 pyenv（通过 pyenv install ... 安装的 python 版本都会删除）。
```
rm -rf $(pyenv root)
```

只是禁用 pyenv:
那么把 `pyenv init` 从 shell 的配置文件中移除，然后重启 shell 就行了（移除后 pyenv 命令仍然能使用，但是版本切换命令不会生效）


当执行命令的时候，系统会在环境变量中从左到右依次寻找匹配的命令并执行。环境变量中是一组以冒号:分隔的路径,pyenv的工作原理其实很简单，将它自己管理的Python目录插到环境变量的最前面，这样一来系统在搜索Python的时候第一个找到的就是pyenv管理的Python环境。这个插到最前面的路径就叫做垫片（shims）

选择Python版本
1.使用PYENV_VERSION环境变量(如果存在). 你可以使用`pyenv shell`命令来在当前shell环境中设置该环境变量.
2.当前目录中应用程序指定的.python-version文件(如果存在). 你可以用`pyenv local`命令来修改当前目录的.python-version文件.
3.自底向上搜索各层上级目录，找到的第一个.python-version, 直到到达文件系统根目录.
4.全局的`$(pyenv root)/version`文件. 可以使用 `pyenv global `命令来修改. 如果全局版本文件不存在, pyenv假设你使用系统安装的Python. (换句话说就是未安装pyenv时环境变量中找到的Python.)

pyenv常用命令

1.列出所有可安装的Python版本：
```
pyenv install --list
pyenv install -l
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
当不再需要本地Python的时候，用--unset来清除：
```
$ pyenv local --unset
```
7.指定当前shell使用的Python：
```
$ pyenv shell pypy-2.2.1
```
当不再需要的时候，用--unset来清除：
```
$ pyenv local --unset
```
更多见
<https://github.com/pyenv/pyenv/blob/master/COMMANDS.md>

安装 `pyenv-virtualenv`
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
创建 pyenv-virtualenv 虚拟环境
```
pyenv virtualenv [指定python版本] 虚拟环境名字
```
如果不指定 python 版本，则默认使用当前 pyenv version 的 python 版本。
创建的虚拟环境位于 $(pyenv root)/versions/ 下的指定 python 版本的文件夹中 envs/ 文件夹下

激活虚拟环境
自动激活环境：
在 .bashrc 文件的最后添加 `eval "$(pyenv virtualenv-init -)"`，然后在 shell 中输入 `exec "$SHELL"` 重启 shell
在想要激活虚拟环境的文件夹中新建 .python-version 文件，并写入虚拟环境的名字（pyenv local python版本 该命令也是通过创建该文件来达到进入该文件夹后自动使用指定 python 版本的目的）
以后进入该的文件夹就会自动激活虚拟环境，离开该文件夹就会退出虚拟环境

手动激活环境：
```
pyenv activate 虚拟环境名字
```
手动退出虚拟环境：
```
pyenv deactivate
```

删除虚拟环境 有 2 种方法：

1.删除 $(pyenv root)/versions 和 $(pyenv root)/versions/{version}/envs 的相关文件夹即可。

2.命令行运行 pyenv uninstall 虚拟环境的名字



***
# something
```
error: android-emulator: key "83F817213361BF5F02E7E124F9F9FA97A403F63E" is unknown
gpg --keyserver keyserver.ubuntu.com --recv  F9F9FA97A403F63E
```
`yay -S ghdl-gcc python-pyghdl python-objgraph`
```
ldconfig: /usr/lib/libtbbbind.so.3 is not a symbolic link
ldconfig: /usr/lib/libtbbbind_2_0.so.3 is not a symbolic link
```
被aur包覆盖了？

```
freehdl
Qucs
```


***
# gtkwave
```
GTKWAVE | Tcl support not compiled into gtkwave, exiting.
```
`yay -S gtkwave-tcl`
更新参考版本
<https://github.com/archlinux/svntogit-community/tree/packages/gtkwave/trunk>
<https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=gtkwave-tcl>
修改后的
PKGBUILD
```
# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Thanks: Jared Casper <jaredcasper@gmail.com>
# Thanks: Kyle Keen <keenerd@gmail.com>
# Thanks: Markus Koch <CClassicVideos@aol.com>
# Thanks: Thomas Dziedzic < gostrc at gmail >

_pkgname=gtkwave
pkgname=gtkwave-tcl
pkgver=3.3.111
pkgrel=1
pkgdesc='A wave viewer which reads LXT, LXT2, VZT, GHW, FST and VCD/EVCD files (with Tcl/Tk support)'
arch=('x86_64')
url='http://gtkwave.sourceforge.net'
license=('GPL' 'custom:MIT' 'custom')
depends=(
  'bzip2'
  'dconf' # gsettings
  'desktop-file-utils'
  # 'gcc' # -lgnu-intl
  # 'gconf'
  # 'gcr' # -lgck
  # 'gimp'
  'glib2' # -lgobject -lgthread gsettings
  'gnutls' # 
  'gtk2'
  'judy' # --enable-judy
  'libjpeg-turbo' # -ljpeg
  'libpng' # -lpng
  'libtiff' # -ltiff
  'tcl'
  'tk'
  'xz' # liblzma
)
makedepends=('gperf')
provides=('gtkwave')
conflicts=('gtkwave')
install='gtkwave.install'
source=("http://gtkwave.sourceforge.net/gtkwave-${pkgver}.tar.gz"
        "http://gtkwave.sourceforge.net/${_pkgname}.pdf"
        "gtkwave.install")

md5sums=('ec9978cc21582ccb89b844e0abfc9b94'
         'SKIP'
         '5c404e6a86f1c209344a5d7d2fa07753')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    \
    --disable-mime-update \
    --enable-struct-pack \
    --enable-fatlines \
    --enable-manymarkers \
    --disable-dependency-tracking \
    --disable-local-libz \
    --disable-local-libbz2 \
    --enable-xz \
    --enable-fasttree \
    --enable-judy \
    --enable-schemas-compile \
    --enable-largefile \
    --enable-tcl \
    --enable-tk \
    \
    --with-gsettings \
    --with-tcl=/usr/lib \
    --with-tk=/usr/lib \

    # --with-gconf \
    # --with-tcl=/usr/lib/tcl8.6  \
    # --with-tk=/usr/lib/tk8.6 \
    # --with-xdgdatadir=path \

  make CFLAGS="-D_LARGEFILE64_SOURCE -O"
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-strip
  
  mkdir -p "$pkgdir/usr/share/licenses/gtkwave"
  install -D -m644 LICENSE.TXT \
    "$pkgdir/usr/share/licenses/gtkwave/LICENSE.TXT"

  mkdir -p "$pkgdir/usr/share/doc/gtkwave"
  install -D -m644 "$srcdir/gtkwave.pdf" \
    "$pkgdir/usr/share/doc/gtkwave/gtkwave.pdf"
}
```
gtkwave.install
```
# https://git.archlinux.org/svntogit/community.git/tree/trunk/gtkwave.install?h=packages/gtkwave

post_install() {
  echo 'Make sure you copy the /usr/share/gtkwave/examples/gtkwaverc file to'
  echo 'your home directory (as .gtkwaverc) or to your VCD project directory.'
  echo 'It contains the prefs for a good configuration that most people find'
  echo 'ergonomic.  It is not strictly necessary however.'
}
```
这样就支持tcl了


***
# 编译 libgnomecups 报错
`format not a string literal and no format arguments format-security`

获得合适的cflags和cxxflags
```
python3-config --cflags
```
修改cflags和cxxflags到
```
/etc/makepkg.conf
```

***
# 锁屏有关
`lightdm  time has expired`
`cat /usr/bin/xflock4`
```
...
for lock_cmd in \
    "$LOCK_CMD" \
    "xfce4-screensaver-command --lock" \
    "xscreensaver-command -lock" \
    "gnome-screensaver-command --lock"
...
```
```
cat /usr/share/xscreensaver/config/abstractile.xml
ls /usr/share/applications/screensavers
fgrep -r screensaver /etc/xdg/ | fgrep Exec
/etc/xdg/autostart/org.gnome.SettingsDaemon.ScreensaverProxy.desktop:Exec=/usr/lib/gsd-screensaver-proxy
/etc/xdg/autostart/xscreensaver.desktop:Exec=xscreensaver -no-splash
/etc/xdg/autostart/xscreensaver.desktop:TryExec=xscreensaver
/etc/xdg/autostart/xfce4-screensaver.desktop:Exec=xfce4-screensaver

ps awux|grep screen
```
<https://bugzilla.redhat.com/show_bug.cgi?id=1957658>
<https://bugzilla.redhat.com/show_bug.cgi?id=1944011>
<https://dev.to/nabbisen/keyboard-is-freezed-by-xfce4-screensaver-and-light-locker-f3n>
```
sudo mv /etc/xdg/autostart/xfce4-screensaver.desktop ~/Desktop/
xfce4-settings-manager
xscreensaver-demo

disable xfce4-screensaver:
xfce4-screensaver-preferences

sudo mv ~/Desktop/xfce4-screensaver.desktop /etc/xdg/autostart/
```
先按上面修改

作为参考：
```
This might happen if someone enters the wrong password more than three times. The log-in manager locks the user from logging-in for 10 minutes. But the remaining time is shown only for a few milliseconds. So user hardly can realize the issue.

CTR+ALT+F5

Then login with username: root then type root password…

Then:
vim /etc/security/faillock.conf
set from
#deny =3
to
deny=0
```
Yes, remove the hashtag ahhaha

Done !!



***
# GPGME error
`error: GPGME error: No data`
```
$ sudo rm -R /var/lib/pacman/sync
$ sudo pacman -Syu
```

***
# docker
`/etc/docker/daemon.json`，加上如下的键值:
```
{
  "registry-mirrors": ["https://registry.docker-cn.com"]
}
```
`sudo systemctl daemon-reload`
`sudo systemctl restart docker`
```
docker pull phyzli/ubuntu18.04_xfce4_vnc4server_synopsys2016
docker run -it -p 5902:5902 -p 1234:22 --hostname lizhen --mac-address 02:42:ac:11:00:02 -v /home/andy/mydata:/mnt/mydata phyzli/ubuntu18.04_xfce4_vnc4server_synopsys2016
vncserver -geometry 1920x1080 :2
```
vncviewer，配置连接，地址是127.0.0.1:5902, 连接密码为 zhenchen
`passwd` 创建root密码
```
ssh -p 1234 root@127.0.0.1
scp -P 1234 root@127.0.0.1:/usr/synopsys2016.tar.gz .
```
退出容器
`exit` 
启动容器
`docker start [容器id]`
启动容器后进入容器
`docker exec -it [容器id] bash`

```
docker pull phyzli/centos8_xfce4_tigervnc_virtuosoic617_mmsim15_calibre2015
docker pull phyzli/centos8_xfce4_tigervnc_hspice2016
docker pull phyzli/centos8_xfce4_tigervnc_hspice2010
docker pull phyzli/ubuntu18.04_xfce4_vnc4server_synopsys
docker pull phyzli/ubuntu20.04_xfce4_tigervnc_alsrac
```


***
# something
```
yay -S python-pygame docker-scan mesa-utils qt6-quick3d qt6-positioning bliss
su - postgres -c "initdb --locale en_US.UTF-8 -D '/var/lib/postgres/data'"
sudo systemctl enable teamviewerd
```
```
/etc/pacman.d/mirrorlist.pacnew
/etc/privoxy/config.pacnew
/etc/speech-dispatcher/modules/espeak-ng.conf.pacnew
/etc/default/grub.pacnew
```
It is necessary to enable 'File Manager Integration' under 'Tools' -> 'Options' from Beyond Compare interface.
```
# archlinux-java set java-8-jre/jre
$ archlinux-java status
# archlinux-java set java-8-jdk
```
```
yay -S pyenv gcc-ada libiconv python-funcy python-stevedore syslog-ng librabbitmq-c libesmtp mongo-c-driver 
yay -S gprbuild-bootstrap libgpr xmlada ada_language_server libadalang libadalang-tools (fail)
yay -S gnat-gps (fail)
yay -S tkgate (fail)
yay -S tkgate-beta tclreadline gprbuild-bootstrap-git xmlada-git autopep8 yapf gnatcoll-gmp-git gnatcoll-core-git gnatcoll-iconv-git libgpr-git gprbuild-git
yay -S ada_language_server libvss ada-libfswatch fswatch (fail)
yay -S gnat-gps (fail)
yay -S qucs iverilog freehdl ngspice yosys mpdecimal python39
##yay -S ghdl-yosys-plugin-git ghdl-gcc-git
yay -Rdd ghdl-yosys-plugin-git ghdl-gcc-git
yay -S ghdl-gcc
```
```
create the file /etc/doas.conf with the following content:
	permit :wheel
```


***
# tkcon
```
pkgname=tkcon
pkgver=2.7.10
pkgrel=1
pkgdesc='Enhanced Tk Console for all Tk platforms'
arch=('x86_64')
arch+=('i686')
license=('GPL3')
depends=('tcl' 'tk')
makedepends=('git')
provides=("tkcon=${pkgver%%.r*}")
conflicts=('tkcon')
#install="${pkgname#-git}.install"
_srcdir="${pkgname%-git}"
source=(
  'git://github.com/KarlCHansen/tkcon.git'
)
md5sums=('SKIP')

prepare() {
  mkdir -p "$pkgdir/usr/local/bin/"
  mkdir -p "$pkgdir/usr/share/applications/"
}

build() {
  cd "${_srcdir}"
  #./configure --prefix=/usr
}

package() {
  #cd "${_srcdir}"
  #make INSTALL_ROOT="$pkgdir" install
  #cp -r ${_pkgbase}/module/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  install -Dm755 "${srcdir}/tkcon/tkcon.tcl" "$pkgdir/usr/local/bin/tkcon"
  install -Dm644 "${srcdir}/tkcon/tkcon-console.desktop" -t "$pkgdir/usr/share/applications/"
}
```
`makepkg -si`

***
# conky 自动显示cpu核心数目对应的bar条

查看是否支持lua
`conky -v`

`gedit ~/cpu.lua`
```
function conky_mycpus()
        local file = io.popen("grep -c processor /proc/cpuinfo")
        local numcpus = file:read("*n")
        file:close()
        listcpus = ""
        for i = 1,numcpus
        do listcpus = listcpus.."${cpubar cpu"..tostring(i).."}\n"
         -- do listcpus = listcpus.."${offset 0}Core "..tostring(i).." ${color ff8300}${cpubar cpu"..tostring(i).." 6}${color FFFDE2}\n"
         -- do  listcpus = listcpus.."${cpu cpu"..tostring(i).."} "
        end

        return listcpus
end
```
ref to <https://unix.stackexchange.com/questions/313630/is-it-possible-to-loop-in-conky>

1. in your `~/.conkyrc` you can add in the conky.config={ part the line
```
lua_load = '~/cpu.lua',
```
2. at the place where you want to have the cpu values, the line
```
${lua_parse conky_mycpus}
```

`gedit ~/config/conky/conky.conf`
```
-- Conky config for ArchBang
-- by Mr Green

conky.config = {
lua_load = '~/cpu.lua',
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
##${exec nproc}
${color2}${font sans:normal:size=9}CPU ${cpu cpu0}%${color1}
${lua_parse conky_mycpus}
#${cpu cpu0} is the total usage
#${cpubar cpu1}
#${cpubar cpu2}
#${cpubar cpu3}
#${cpubar cpu4}
#${cpubar cpu5}
#${cpubar cpu6}
#${cpubar cpu7}
#${cpubar cpu8}
${color2}${font sans:normal:size=9}RAM ${color1} $alignr$mem/$memmax
${membar}
#${memgraph 30,555 AAF5D0 00B35B}
${if_existing /proc/net/route wlan0}
NET1: wireless 
${upspeed wlan0}/s$alignr${totalup wlan0}
${upspeedgraph wlan0 25,150 0000ff ff0000}
${downspeed wlan0}/s$alignr${totaldown wlan0}
${downspeedgraph wlan0 25,150 00ff00 d000d0}
${endif}
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
```

***
# feeluown
```
yay -S feeluown feeluown-kuwo feeluown-local feeluown-netease feeluown-qqmusic feeluown-ytmusic feeluown-bilibili
yay -S yapf
mkdir feeluown-download && cd feeluown-download
```
```
# Maintainer: Andreas Zhang <denglitsch@gmail.com>

_pkgbase=feeluown-download
pkgname=feeluown-download
pkgver=0.3
pkgrel=1
pkgdesc="FeelUOwn mp3 download plugin"
arch=('any')
license=('GPL3')
depends=('feeluown' 'python-aiohttp' 'python-bilibili-api')
makedepends=('python-setuptools' 'python-pip')
source=("git+https://github.com/feeluown/feeluown-download")
sha512sums=('SKIP')

build() {
  cd ${_pkgbase}
  python setup.py build
}

package() {
  cd ${_pkgbase}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
```
`makepkg -si`
`yay -S gunicorn python-aiodns python-eventlet python-gevent python-httplib2 python-psycopg2`


***
# Bluetooth
```
yay Bluetooth 
blueman-applet
pacman -Qo /usr/lib/systemd/system/pulseaudio.service
yay pulseaudio
yay pulsemixer
yay pulseaudio-alsa
yay pulseaudio
blueman-applet --loglevel debug
pair
yay bluetoothctl
head -1 $(which blueman-applet)
sudo dmesg -w
yay rtl8761
bluetoothctl list
sudo bluetoothctl list
sudo bluetoothctl show
sudo bluetoothctl devices
find /lib/firmware | grep rtl8761b | xargs ls -ln
modinfo btusb
sudo systemctl status bluetooth
sudo systemctl enable bluetooth
sudo systemctl restart bluetooth
sudo systemctl status bluetooth
sudo pacman -S pulseaudio-bluetooth
blueman-manager
sudo dmesg | grep Bluetooth
sudo dmesg | grep hci
sudo dmesg | grep hci0
ls /usr/lib/firmware/rtl_bt/
sudo systemctl status bluetooth
ls /lib/modules/`uname -r`/kernel/drivers/bluetooth/

hwinfo --bluetooth
hciconfig -a
bluetoothctl
rfkill list
yay pulseaudio-modules-bt
yay pulseaudio-modules
yay pulseaudio
yay bluez
yay pipewire

sudo systemctl restart bluetooth
sudo reboot

/lib/firmware/rtl_bt
sudo lsusb -v -d 2550:8761

sudo dmesg | egrep -i bluetooth
```

***
# rtl8761b蓝牙适配器
<https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1955916>
```
sudo lsusb
Bus 003 Device 005: ID 2550:8761 Realtek Bluetooth Radio
sudo dmesg
[ 6281.078926] usb 3-3: new full-speed USB device number 3 using xhci_hcd
[ 6281.223202] usb 3-3: New USB device found, idVendor=2550, idProduct=8761, bcdDevice= 2.00
[ 6281.223214] usb 3-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 6281.223219] usb 3-3: Product: Bluetooth Radio
[ 6281.223222] usb 3-3: Manufacturer: Realtek
[ 6281.223224] usb 3-3: SerialNumber: 00E04C239987
[ 6281.283830] Bluetooth: Core ver 2.22
[ 6281.283865] NET: Registered PF_BLUETOOTH protocol family
[ 6281.283866] Bluetooth: HCI device and connection manager initialized
[ 6281.283870] Bluetooth: HCI socket layer initialized
[ 6281.283871] Bluetooth: L2CAP socket layer initialized
[ 6281.283874] Bluetooth: SCO socket layer initialized
[ 6281.308335] usbcore: registered new interface driver btusb
[ 6281.324814] audit: type=1130 audit(1647874795.280:289): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6281.342327] audit: type=1130 audit(1647874795.300:290): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=bluetooth comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6281.351268] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[ 6281.351272] Bluetooth: BNEP filters: protocol multicast
[ 6281.351276] Bluetooth: BNEP socket layer initialized
[ 6281.367202] audit: type=1334 audit(1647874795.323:291): prog-id=70 op=LOAD
[ 6281.367333] audit: type=1334 audit(1647874795.323:292): prog-id=71 op=LOAD
[ 6281.367372] audit: type=1334 audit(1647874795.323:293): prog-id=72 op=LOAD
[ 6281.386126] NET: Registered PF_ALG protocol family
[ 6281.415784] audit: type=1130 audit(1647874795.373:294): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-hostnamed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 6281.419139] Bluetooth: RFCOMM TTY layer initialized
[ 6281.419149] Bluetooth: RFCOMM socket layer initialized
[ 6281.419153] Bluetooth: RFCOMM ver 1.11
```

## 修改二进制文件法

已经通过aur编译安装了驱动（不带dmks的那个）， blueman-applet 找不到 蓝牙外设, 其实就是 linux-firmware 里面就有的  `pacman -Qo /usr/lib/firmware/rtl_bt/rtl8761bu_fw.bin`

经过查找和实验， 确认是btusb.ko需要修改，大概在`/lib/modules/`uname -r`/kernel/drivers/bluetooth/btusb.ko.zst`， 解压了
```
pacman -Qo /lib/modules/5.16.14-arch1-1/kernel/drivers/bluetooth/btusb.ko.zst 
/usr/lib/modules/5.16.14-arch1-1/kernel/drivers/bluetooth/btusb.ko.zst is owned by linux 5.16.14.arch1-1
```
如果btusb.ko.zst不见了，就重新安装内核
```
xxd btusb.ko | grep ca04 确认有被替换字符串
xxd btusb.ko | sed 's/ca04 0540/5025 6187/g' | xxd -r > btusb.ko.mod
xxd btusb.ko.mod | grep 5025 确认修改好了
strip --strip-debug btusb.ko.mod
mv btusb.ko.mod btusb.ko
```
这个修改后的btusb.ko再打包成btusb.ko.zst放回原位，
`sudo modprobe -r btusb && sudo modprobe btusb`

插入适配器之后 
```
dmesg | tail
hciconfig -a
sudo dmesg
[ 7198.775764] usb 3-3: new full-speed USB device number 4 using xhci_hcd
[ 7198.916531] usb 3-3: New USB device found, idVendor=2550, idProduct=8761, bcdDevice= 2.00
[ 7198.916542] usb 3-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 7198.916547] usb 3-3: Product: Bluetooth Radio
[ 7198.916550] usb 3-3: Manufacturer: Realtek
[ 7198.916553] usb 3-3: SerialNumber: 00E04C239987
[ 7198.919273] Bluetooth: hci0: RTL: examining hci_ver=0a hci_rev=000b lmp_ver=0a lmp_subver=8761
[ 7198.920314] Bluetooth: hci0: RTL: rom_version status=0 version=1
[ 7198.920328] Bluetooth: hci0: RTL: loading rtl_bt/rtl8761bu_fw.bin
[ 7198.927758] Bluetooth: hci0: RTL: loading rtl_bt/rtl8761bu_config.bin
[ 7198.929732] Bluetooth: hci0: RTL: cfg_sz 6, total sz 27814
[ 7198.967615] audit: type=1130 audit(1647875712.933:392): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ 7199.069380] Bluetooth: hci0: RTL: fw version 0x09a98a6b
```
这样就TMD可以找到BT外设了。。。。。


## 修改内核源码法添加ID
添加ID也可以修改内核源码`drivers/bluetooth/btusb.c`

修改内核源码(linux 5.16.arch1-1)添加蓝牙ID
```
git clone git@github.com:archlinux/svntogit-packages.git
或
git clone --depth 6 --single-branch --branch packages/linux git@github.com:archlinux/svntogit-packages.git
cd svntogit-packages/trunk/
git checkout -b tmp 3b39577d
git fetch --depth 100 origin packages/linux
git fetch --unshallow
git fetch origin
```
```
git fetch --unshallow
git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
git fetch origin
```
`yay python-pyqt6-webengine catdoc wdiff `

`sudo gedit /etc/default/grub`
enable this line
```
GRUB_DISABLE_OS_PROBER=false
```
```
5.15.31-1-lts、5.16.16等内核对博通ath9k无线网卡，都出现断流问题， 降级到linux-lts-5.4.98-1， 安装linux-zen
linux-lts-5.10.90-1-x86_64.pkg.tar.zst
linux-lts-headers-5.10.90-1-x86_64.pkg.tar.zst
yay -S crda linux-zen linux-zen-header
python-sphinx_rtd_theme
```
```
git clone --depth 6 --single-branch --branch packages/linux-lts git@github.com:archlinux/svntogit-packages.git
cd svntogit-packages/
git checkout -b tmp f21f0cb2c
git fetch --unshallow
git fetch origin
cd trunk/
gpg --keyserver keyserver.ubuntu.com --recv-keys 38DBBDC86092693E
```

简单修改PKGBUILD文件，添加一个patch
`bluetooth_driver.patch`
```
diff -Naur a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
--- a/drivers/bluetooth/btrtl.c	2022-01-05 19:40:34.000000000 +0800
+++ b/drivers/bluetooth/btrtl.c	2022-03-26 20:44:24.447750477 +0800
@@ -140,8 +140,8 @@
 	{ IC_INFO(RTL_ROM_LMP_8761A, 0xb),
 	  .config_needed = false,
 	  .has_rom_version = true,
-	  .fw_name  = "rtl_bt/rtl8761b_fw.bin",
-	  .cfg_name = "rtl_bt/rtl8761b_config" },
+	  .fw_name  = "rtl_bt/rtl8761bu_fw.bin",
+	  .cfg_name = "rtl_bt/rtl8761bu_config" },
 
 	/* 8822C with UART interface */
 	{ .match_flags = IC_MATCH_FL_LMPSUBV | IC_MATCH_FL_HCIREV |
diff -Naur a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
--- a/drivers/bluetooth/btusb.c	2022-01-05 19:40:34.000000000 +0800
+++ b/drivers/bluetooth/btusb.c	2022-03-26 20:45:14.218661516 +0800
@@ -411,6 +411,9 @@
 	{ USB_DEVICE(0x13d3, 0x3416), .driver_info = BTUSB_REALTEK },
 	{ USB_DEVICE(0x13d3, 0x3459), .driver_info = BTUSB_REALTEK },
 	{ USB_DEVICE(0x13d3, 0x3494), .driver_info = BTUSB_REALTEK },
+	
+	/* Additional Realtek 8761BU Bluetooth devices */
+	{ USB_DEVICE(0x2550, 0x8761), .driver_info = BTUSB_REALTEK },
 
 	/* Additional Realtek 8723BU Bluetooth devices */
 	{ USB_DEVICE(0x7392, 0xa611), .driver_info = BTUSB_REALTEK },

```
`makepkg -si`

产生目标安装文件为
```
linux-lts-5.10.90-1-x86_64.pkg.tar.zst
linux-lts-headers-5.10.90-1-x86_64.pkg.tar.zst
linux-lts-docs-5.10.90-1-x86_64.pkg.tar.zst
```
安装
`yay -U *.pkg.tar.zst`

编译整个内核时间比较长

可以简单化只编译ko
先 `makepkg -si` 把之前补丁打完， 然后推出makepkg编译
```
cd drivers/bluetooth
make -C /lib/modules/$(uname -r)/build M=$(pwd) modules
（/lib/modules/5.10.90-1-lts/build）
```
然后只把 btrtl.ko 和 btusb.ko 打包成 .zx 替换 `/lib/modules/5.10.90-1-lts/kernel/drivers/bluetooth/`里的
`sudo modprobe -r btusb && sudo modprobe btusb`
就可以了

`blueman-applet` 大概是需要安装的， pasystray 不需要， 其他的只做了个事后记录， 看着办吧


***
# 115pc
`yay -S 115pc`
`PKGBUILD`
```
pkgname=115pc
pkgver=1.0.1.6
pkgrel=1
epoch=
pkgdesc="115.com PC client"
arch=('x86_64')
url="https://pc.115.com/"
license=('Proprietary')
groups=()
depends=()
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=(
    "https://down.115.com/client/${pkgname}/lin/${pkgname}_${pkgver}.deb"
    "115.desktop"
    "115.sh"
)
noextract=()
sha256sums=(
    'be147769440f486898b729ef52e4fd8814a5bda9f5851077fd84363c6e624dea'
    'SKIP'
    'SKIP'
)
validpgpkeys=()

package() {
        tar -C ${srcdir} -xf data.tar.xz
	mkdir -p ${pkgdir}/opt/
	install -Dm644 ${srcdir}/115.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
        install -Dm644 ${srcdir}/usr/local/115/res/115.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/115pc.png
	cp -rT ${srcdir}/usr/local/115 ${pkgdir}/opt/${pkgname}
	install -Dm755 ${srcdir}/115.sh ${pkgdir}/opt/${pkgname}/115.sh
}
```
`115.desktop`
```
[Desktop Entry]
Comment=115 PC Edition
Comment[zh_CN]=115电脑版
Exec=sh /opt/115pc/115.sh
GenericName=115
GenericName[zh_CN]=115
Name=115
Name[zh_CN]=115
StartupNotify=false
Terminal=false
Type=Application
Categories=Network;
Icon=115pc
# Remove under line for fixing icon bug in taskbar
#StartupWMClass=115
```
`115.sh`
```
#!/bin/sh
export LD_LIBRARY_PATH=/opt/115pc/lib:$LD_LIBRARY_PATH
export PATH=/opt/115pc:$PATH
/bin/bash -c "exec -a $0 115 > /dev/null 2>&1" $0 
```

***
# something
`sudo pip3 install libscrc -i https://mirrors.163.com/pypi/simple`
`yay -Rdd polymake`
```
:: Replace crda with core/wireless-regdb? [Y/n] y
:: Replace jupyter with community/jupyter-notebook? [Y/n] y
:: Replace maxima-ecl with extra/maxima? [Y/n] y
:: espeak-ng and espeak are in conflict. Remove espeak? [y/N] y
```
```
yay -S kde-cli-tools python-asgiref python-bottleneck python-fsspec python-numexpr python-openpyxl python-pyarrow
yay -S python-pymysql python-pytables python-snappy python-sqlalchemy python-xarray python-xlrd python-xlwt xsel python-netcdf4 python-cftime python-dask python-distributed python-seaborn python-pint python-blosc python-statsmodels python-nose
```
```
Execute 'sudo systemctl enable teamviewerd' in a terminal.
If you run into trouble with CUDA not being available, run nvidia-modprobe first.

Please add your user to the brlapi group.
sudo usermod -aG brlapi andy

yay -S python-curio python-trio jupyter-server-mathjax	jupyterlab-widgets qt6-languageserver refind-docs --overwrite=*

su - postgres -c "initdb --locale en_US.UTF-8 -D '/var/lib/postgres/data'"
```

***
# 准备玩玩看deepin-anything
```
yay -S deepin-anything deepin-anything-dkms
```


***
# planner
`yay -S planner-git projectlibre ganttproject granite gtk-theme-elementary jd-gui-bin`
需要修改planner-git的PKGBUILD
```
# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Lubosz <lubosz at gmail dot com>
pkgname=planner-git
pkgver=0.14.6.r349.56b03b1
pkgrel=1
pkgdesc="A project management tool for planning, scheduling and tracking projects."
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Planner"
license=('GPL')
depends=('libgnomecanvas' 'gnome-vfs' 'libxslt' 'pygtk')
makedepends=('git' 'gnome-common' 'rarian')
provides=("${pkgname%-git}" 'libplanner-1.so')
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/GNOME/planner.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/^PLANNER_//;s/\([^-]*-\)g/r\1/;s/_/./;s/_/./;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i 's/python/python2/g' tests/python/task-test.py
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export CFLAGS=-Wno-error

	meson build --prefix=/usr
	ninja -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir/" ninja -C build install

	# Remove conflicting files
	#cd "$pkgdir/usr/local/share/mime"
	#find . -maxdepth 1 -type f -exec rm "{}" \;
}
```

***
# picocom
`yay -S picocom`
串口设置
`sudo gpasswd -a $USER uucp`    
反向操作
`sudo gpasswd -d $USER uucp`
或者`sudo usermod -aG uucp $USER`
`cat /etc/group | grep uucp`
```
groups $USER
```
`yay -S vofa+`


***
# 假mac，未试验
```
Load the relevant kernel module and create the interface with the MAC address:
# modprobe dummy
# ip link add bond0 type dummy
# ifconfig bond0 hw ether 10:22:33:44:55:66
Cleanup for after Diamond exits:
# ip link delete bond0 type dummy
# rmmod dummy
```
<https://aur.archlinux.org/cgit/aur.git/log/?h=xilinx-vivado-dummy>
`git clone https://aur.archlinux.org/xilinx-vivado-dummy.git`



***
# 全局github代理加速
```
git config --global http.proxy 'socks5://127.0.0.1:1081'
git config --global https.proxy 'socks5://127.0.0.1:1081'
```
or
```
git config --global http.proxy 'socks5://127.0.0.1:10808'
git config --global https.proxy 'socks5://127.0.0.1:10808'
```
查询是否启用代理
```
git config --global http.proxy
git config --list
```
取消代理
```
git config --global --unset http.proxy
```


* * *
# udisk_arch_update @ 20220605
```
$ yay
[sudo] password for andy: 
:: Synchronizing package databases...
 core is up to date
 extra is up to date
 community is up to date
 multilib is up to date
 archlinuxcn is up to date
:: Starting full system upgrade...
warning: gcc10: local (1:10.3.0-2) is newer than archlinuxcn (10.3.0-3)
warning: gcc10-libs: local (1:10.3.0-2) is newer than archlinuxcn (10.3.0-3)
:: Replace jupyter with community/jupyter-notebook? [Y/n] y
:: Replace lib32-sdl with multilib/lib32-sdl12-compat? [Y/n] y
:: Replace maxima-ecl with extra/maxima? [Y/n] y
:: Replace qemu with extra/qemu-desktop? [Y/n] y
:: Replace qemu-arch-extra with extra/qemu-emulators-full? [Y/n] y
:: Replace sdl with community/sdl12-compat? [Y/n] y
resolving dependencies...
looking for conflicting packages...
warning: removing 'nvidia' from target list because it conflicts with 'nvidia-dkms'
error: unresolvable package conflicts detected
error: failed to prepare transaction (conflicting dependencies)
:: nvidia-dkms and nvidia-lts are in conflict
 -> error installing repo packages
andy@archlinux ~
$ yay -R nvidia-lts
[sudo] password for andy: 
checking dependencies...

Packages (1) nvidia-lts-1:510.47.03-5

Total Removed Size:  27.55 MiB

:: Do you want to remove these packages? [Y/n] y
:: Processing package changes...
(1/1) removing nvidia-lts                          [######################] 100%
:: Running post-transaction hooks...
(1/3) Arming ConditionNeedsUpdate...
(2/3) Updating module dependencies...
(3/3) Refreshing PackageKit...
andy@archlinux ~
$ yay
:: Synchronizing package databases...
 core is up to date
 extra is up to date
 community is up to date
 multilib is up to date
 archlinuxcn is up to date
:: Starting full system upgrade...
warning: gcc10: local (1:10.3.0-2) is newer than archlinuxcn (10.3.0-3)
warning: gcc10-libs: local (1:10.3.0-2) is newer than archlinuxcn (10.3.0-3)
:: Replace jupyter with community/jupyter-notebook? [Y/n] y
:: Replace lib32-sdl with multilib/lib32-sdl12-compat? [Y/n] y
:: Replace maxima-ecl with extra/maxima? [Y/n] y
y:: Replace qemu with extra/qemu-desktop? [Y/n] 
:: Replace qemu-arch-extra with extra/qemu-emulators-full? [Y/n] y
:: Replace sdl with community/sdl12-compat? [Y/n] y
resolving dependencies...
looking for conflicting packages...
warning: removing 'nvidia' from target list because it conflicts with 'nvidia-dkms'
:: espeak-ng and espeak are in conflict. Remove espeak? [y/N] y
:: nvidia-dkms and nvidia are in conflict (NVIDIA-MODULE). Remove nvidia? [y/N] y
warning: dependency cycle detected:
warning: harfbuzz will be installed before its freetype2 dependency
warning: dependency cycle detected:
warning: libglvnd will be installed before its mesa dependency
warning: dependency cycle detected:
warning: nvidia-utils will be installed before its libglvnd dependency
warning: dependency cycle detected:
warning: xorg-server will be installed before its libglvnd dependency
warning: dependency cycle detected:
warning: nvidia-utils will be installed before its libglvnd dependency
warning: dependency cycle detected:
warning: smbclient will be installed before its cifs-utils dependency
warning: dependency cycle detected:
warning: rubygems will be installed before its ruby dependency
warning: dependency cycle detected:
warning: python-ipykernel will be installed before its python-jupyter_client dependency
warning: dependency cycle detected:
warning: jupyter-server will be installed before its jupyter-nbconvert dependency
warning: dependency cycle detected:
warning: lib32-harfbuzz will be installed before its lib32-freetype2 dependency
warning: dependency cycle detected:
warning: lib32-mesa will be installed before its lib32-libglvnd dependency
warning: dependency cycle detected:
warning: lib32-nvidia-utils will be installed before its lib32-libglvnd dependency

Packages (1955) 1password-8.7.0-124  aarch64-linux-gnu-binutils-2.38-1
                abseil-cpp-20211102.0-2  accountsservice-22.08.8-2
                adios2-2.8.0-2  adwaita-icon-theme-42.0+r1+gc144c3d75-1
                aircrack-ng-1.7-1  akonadi-calendar-22.04.1-1
                akonadi-contacts-22.04.1-1  akonadi-mime-22.04.1-1
                akonadi-notes-22.04.1-1  akonadi-search-22.04.1-1
                alsa-card-profiles-1:0.3.51-1  alsa-plugins-1:1.2.6-3
                amtk-5.4.1-1  android-emulator-31.2.10-1  android-sdk-26.1.1-2
                android-sdk-platform-tools-33.0.2-1
                android-studio-2021.2.1.15-1  android-tools-31.0.3-5
                ant-1.10.12-1  antlr4-runtime-4.10.1-2  aom-3.3.0-1
                apache-2.4.53-1  apparmor-3.0.4-2  appstream-0.15.4-1
                appstream-qt-0.15.4-1  archlinux-keyring-20220424-1
                archlinuxcn-keyring-20220331-1  ariang-allinone-1.2.4-1
                ark-22.04.1-1  arm-none-eabi-binutils-2.38-1
                arm-none-eabi-gcc-12.1.0-1  arm-none-eabi-gdb-12.1-1
                arm-none-eabi-newlib-4.2.0.20211231-1  arpack-3.8.0-2
                asar-3.1.0-2  assimp-5.2.3-1  at-3.2.5-1  at-spi2-core-2.44.1-1
                atk-2.38.0-1  atool-0.39.0-8  attica-5.94.0-1
                audacious-plugins-4.1-6  audit-3.0.8-1  avr-binutils-2.38-2
                avr-gcc-12.1.0-1  avr-gdb-12.1-1  avrdude-1:7.0-1
                babl-0.1.90-2  baloo-5.94.0-1  baloo-widgets-22.04.1-1
                baobab-42.0-1  bbswitch-0.8-509  benchmark-1.6.1-2
                biber-1:2.17-2  bibletime-3.0.3-1  bind-9.18.3-1
                binutils-2.38-5  bison-3.8.2-4  blas-3.10.1-1  bluez-5.64-2
                bluez-libs-5.64-2  bluez-utils-compat-5.64-2  boost-1.78.0-2
                boost-libs-1.78.0-2  breeze-5.24.5-1  breeze-gtk-5.24.5-1
                breeze-icons-5.94.0-1  breezy-3.2.1-2  brltty-6.4-10
                broadcom-wl-6.30.223.271-388  brotli-1.0.9-8
                btrfs-progs-5.18-1  bubblewrap-0.6.2-1
                ca-certificates-mozilla-3.79-1  cairo-1.17.6-2
                cairo-perl-1.109-2  calendarsupport-22.04.1-1  calibre-5.43.0-1
                calligra-3.2.1-34  camlp4-4.13+1-3  cbatticon-1.6.12-2
                cblas-3.10.1-1  ccache-4.6.1-1  celestia-1.6.2.2-3
                certbot-1.27.0-1  cfitsio-1:4.1.0-1  chromaprint-1.5.1-3
                chromium-102.0.5005.61-1  cifs-utils-6.15-1  clang-13.0.1-2
                clash-1.10.6-1  clion-1:2022.1.1-1  clion-cmake-1:2022.1.1-1
                clion-gdb-1:2022.1.1-1  clion-jre-1:2022.1.1-1
                clion-lldb-1:2022.1.1-1  clucene-2.3.3.4-12  clutter-1.26.4-2
                clutter-gst-3.0.27-4  clutter-gtk-1.8.4-3  cmake-3.23.2-1
                code-1.67.2-1  codeblocks-20.03-2  cogl-1.22.8-2
                coin-or-cbc-2.10.8-1  coin-or-cgl-0.60.6-1  colord-1.4.6-1
                colord-gtk-0.3.0-2  colord-gtk-common-0.3.0-2
                colord-gtk4-0.3.0-2  colord-sane-1.4.6-1  colordiff-1.0.20-1
                containerd-1.6.4-1  coreutils-9.1-1  cpanminus-1.7044-6
                cppunit-1.15.1-3  crypto++-8.6.0-2  cuda-11.6.2-1
                cuda-tools-11.6.2-1  cups-1:2.4.2-1  cups-filters-1.28.15-1
                cups-pk-helper-0.2.6-5  curl-7.83.1-1
                cyrus-sasl-gssapi-2.1.28-1  cython-0.29.30-1  cython2-0.29.30-1
                dav1d-1.0.0-1  dbus-1.14.0-1  dcmtk-3.6.7-1  deadbeef-1.9.1-3
                debuginfod-0.187-1  dejagnu-1.6.3-2  desktop-file-utils-0.26-2
                devhelp-41.2+r48+g14272cae-1  device-mapper-2.03.16-1
                dhclient-4.4.3-1  dialog-1:1.3_20220414-1  dictd-1.13.1-2
                ding-libs-0.6.2-1  discord-0.0.17-1  discount-2.2.7.b-1
                dmenu-5.1-1  docker-1:20.10.16-1  docker-compose-2.6.0-1
                docker-scan-0.17.0-2  dolphin-22.04.1-1
                dolphin-plugins-22.04.1-1  downgrade-11.1.0-1  dpkg-1.21.8-1
                drawio-desktop-bin-18.1.3-1  dsdp-5.8-6  dtc-1.6.1-4
                dunst-1.8.1-1  e-antic-1.2.1-1  e2fsprogs-1.46.5-3
                ecl-21.2.1-3  eclipse-ecj-4.22-2  edk2-armvirt-202202-2
                edk2-ovmf-202202-2  electron-18.2.4-1  electron11-11.5.0-5
                electron12-12.2.3-4  electron13-13.6.9-3  electron17-17.4.3-1
                elfutils-0.187-1  ell-0.50-1  embree-3.13.3-2  enchant-2.3.3-1
                eog-42.2-1  epiphany-42.2-1  espeak-1:1.48.04-4 [removal]
                espeak-ng-1.51-1  ethtool-1:5.17-1  evince-42.3-1
                evolution-3.44.2-1  evolution-data-server-3.44.2-1
                evtest-1.35-1  exempi-2.6.1-1  exiv2-0.27.5-3  expat-2.4.8-1
                extra-cmake-modules-5.94.0-1  f2fs-tools-1.15.0-1
                fakeroot-1.29-1  faudio-22.06-1
                fcitx-mozc-2.26.4360.102.gca82d39-2  fcitx-qt5-1.2.7-4
                ffcall-2.4-2  ffmpeg-2:5.0-7  ffmpeg4.4-4.4.1-5
                ffmpegthumbnailer-2.2.2-4  file-roller-3.42.0-1
                filezilla-3.60.0-1  firefox-101.0-1  five-or-more-3.32.3-1
                flac-1.3.4-2  flatpak-1:1.12.7-1  flint-2.8.5-1
                fluidsynth-2.2.7-1  fmt-8.1.1-2  folks-0.15.5-1
                fontconfig-2:2.14.0-1  fontforge-20220308-1
                foomatic-db-3:20220328-1  foomatic-db-ppds-3:20220328-1
                fplll-5.4.2-1  frameworkintegration-5.94.0-1  freeglut-3.2.2-2
                freehdl-0.0.8-12  freerdp-2:2.7.0-1  freetype2-2.12.1-1
                fribidi-1.0.12-1  fuse-common-3.11.0-1  fuse3-3.11.0-1
                fzf-0.30.0-3  gambas3-gb-gtk3-3.17.2-4
                gambas3-gb-image-3.17.2-4  gambas3-runtime-3.17.2-4
                gap-4.11.1-10  gap-doc-4.11.1-10  gap-packages-4.11.1-10
                gavl-1.4.0-6  gc-8.2.0-3  gcc-12.1.0-2  gcc-ada-12.1.0-2
                gcc-fortran-12.1.0-2  gcc-libs-12.1.0-2  gcc-objc-12.1.0-2
                gcolor3-2.4.0-4  gcr-3.41.0-2  gd-2.3.3-4  gdal-3.4.3-3
                gdb-12.1-1  gdb-common-12.1-1  gdk-pixbuf2-2.42.8-1
                gdm-42.0+r11+g4a52f026-1  geany-1.38-2  geany-plugins-1.38-3
                gedit-42.1-1  gegl-0.4.36-3  gendesk-1.0.9-3  geoclue-2.6.0-2
                geocode-glib-3.26.2+r9+g6047da3-2  geogebra-6.0.709.0-1
                geoip-database-20220524-1  gerbv-2.8.1-2  gettext-0.21-2
                gftp-2.9.1b-2  ghex-42.2-1  ghostscript-9.56.1-1
                giac-1.9.0.7-1  gifski-1.6.4-3  gimp-2.10.30-3  git-2.36.1-1
                git-lfs-3.2.0-1  gjs-2:1.72.0-1  glew-2.2.0-3  glfw-x11-3.3.7-1
                glib-networking-1:2.72.0-1  glib-perl-1.329.3-3  glib2-2.72.2-1
                glib2-docs-2.72.2-1  glibc-2.35-5  glibmm-2.66.4-1
                glslang-11.9.0-1  glu-9.0.2-3  glusterfs-1:10.1-1  gmic-3.1.2-2
                gmp-6.2.1-2  gmp-ecm-7.0.5-1  gnome-autoar-0.4.3-2
                gnome-backgrounds-42.0-1  gnome-bluetooth-3.34.5-3
                gnome-bluetooth-3.0-42.0-1  gnome-boxes-42.1-1
                gnome-builder-42.1-1  gnome-calculator-42.1-1
                gnome-calendar-42.1-1  gnome-characters-42.0-1
                gnome-chess-42.0-1  gnome-clocks-42.0-1
                gnome-code-assistance-3:3.16.1+r14+gaad6437-1
                gnome-color-manager-3.36.0+r25+g4aab8b59-1
                gnome-contacts-42.0-1  gnome-control-center-42.2-1
                gnome-desktop-1:42.2-1  gnome-desktop-4-1:42.2-1
                gnome-desktop-common-1:42.2-1  gnome-disk-utility-42.0-1
                gnome-font-viewer-42.0-1  gnome-keyring-1:42.1-1
                gnome-logs-42.0-1  gnome-maps-42.2-1  gnome-mines-40.1-1
                gnome-music-1:42.1-1  gnome-nettool-42.0-1
                gnome-online-accounts-3.44.0-1  gnome-photos-1:42.0-1
                gnome-recipes-2.0.4-3  gnome-remote-desktop-42.2-1
                gnome-screenshot-41.0+r25+g45f08f0-1  gnome-session-42.0-1
                gnome-settings-daemon-42.2-1  gnome-shell-1:42.2-1
                gnome-shell-extensions-42.2-1  gnome-software-42.2-1
                gnome-sound-recorder-42.0-1  gnome-sudoku-42.0-1
                gnome-system-monitor-42.0-1  gnome-terminal-3.44.1-1
                gnome-todo-41.0+r106+gebc68374-1
                gnome-tweaks-42beta+r9+gc66d8c3-1  gnome-user-docs-42.0-1
                gnome-weather-42.0-1  gnucash-4.10-1  gnucash-docs-4.10.1-1
                gnupg-2.2.35-2  gnuplot-5.4.3-5  gnustep-base-1.28.0-4
                gnutls-3.7.6-1  go-2:1.18.3-1  go-tools-4:0.1.10-2
                gobject-introspection-1.72.0-1
                gobject-introspection-runtime-1.72.0-1  goland-2022.1.1-1
                goland-jre-2022.1.1-1  google-glog-0.6.0-1  gparted-1.4.0-1
                gperftools-2.9.1-2  gpgme-1.17.1-1  gpicview-0.2.5-7
                gptfdisk-1.0.9-1  gradle-7.4.2-1  gradle-doc-7.4.2-1
                gradle-src-7.4.2-1  grantleetheme-22.04.1-1  graphene-1.10.8-1
                graphicsmagick-1.3.38-3  graphite-1:1.3.14-2  graphviz-4.0.0-1
                groff-1.22.4-7  grub-2:2.06-5  gsettings-desktop-schemas-42.0-1
                gsound-1.0.3-2  gspell-1.10.0-2  gssproxy-0.9.0-1
                gst-editing-services-1.20.2-1  gst-libav-1.20.2-1
                gst-plugin-gtk-1.20.2-1  gst-plugin-pipewire-1:0.3.51-1
                gst-plugins-bad-1.20.2-1  gst-plugins-bad-libs-1.20.2-1
                gst-plugins-base-1.20.2-1  gst-plugins-base-libs-1.20.2-1
                gst-plugins-good-1.20.2-1  gst-plugins-ugly-1.20.2-1
                gst-python-1.20.2-1  gstreamer-1.20.2-1
                gstreamer-docs-1.20.2-1  gthumb-3.12.2-1
                gtk-update-icon-cache-1:4.6.5-1  gtk2-perl-1.24993-4
                gtk3-1:3.24.34-1  gtk4-1:4.6.5-1  gtkmm3-3.24.6-1
                gtksourceview4-4.8.3-1  gtksourceview5-5.4.1-1
                gupnp-av-0.14.1-1  guvcview-2.0.7-4  guvcview-common-2.0.7-4
                gvfs-1.50.2-1  gvfs-afc-1.50.2-1  gvfs-goa-1.50.2-1
                gvfs-google-1.50.2-1  gvfs-gphoto2-1.50.2-1  gvfs-mtp-1.50.2-1
                gvfs-nfs-1.50.2-1  gvfs-smb-1.50.2-1  gvim-8.2.5046-1
                gwenhywfar-5.9.0-1  gxkb-0.9.3-2  gzip-1.12-1
                handbrake-1.5.1-2  handbrake-cli-1.5.1-2  harfbuzz-4.3.0-1
                harfbuzz-icu-4.3.0-1  haskell-aeson-1.5.6.0-108
                haskell-aeson-pretty-0.8.9-59  haskell-ansi-terminal-0.11.1-33
                haskell-asn1-encoding-0.9.6-173  haskell-asn1-parse-0.9.5-173
                haskell-asn1-types-0.3.4-152  haskell-assoc-1.0.2-142
                haskell-async-2.2.4-65  haskell-attoparsec-0.14.4-20
                haskell-base-compat-0.12.1-1
                haskell-base-compat-batteries-0.12.1-25
                haskell-base-orphans-0.8.6-43
                haskell-base16-bytestring-1.0.2.0-26
                haskell-base64-bytestring-1.2.1.0-47  haskell-basement-0.0.14-1
                haskell-bifunctors-5.5.12-6  haskell-blaze-html-0.9.1.2-170
                haskell-blaze-markup-0.8.2.8-76  haskell-cairo-0.13.8.1-147
                haskell-case-insensitive-1.2.1.0-149
                haskell-citeproc-0.6.0.1-50  haskell-colour-2.3.6-102
                haskell-commonmark-0.2.1.1-27
                haskell-commonmark-extensions-0.2.3-12
                haskell-commonmark-pandoc-0.2.1.2-43  haskell-comonad-5.0.8-145
                haskell-conduit-1.3.4.2-56  haskell-conduit-extra-1.3.5-235
                haskell-connection-0.3.1-198  haskell-cryptonite-0.30-16
                haskell-data-default-0.7.1.1-227
                haskell-data-default-instances-dlist-0.0.1-240
                haskell-data-fix-0.3.2-48  haskell-distributive-0.6.2.1-148
                haskell-dlist-1.0-162  haskell-doclayout-0.3.1.1-15
                haskell-doctemplates-0.10.0.1-62  haskell-emojis-0.1.2-20
                haskell-file-embed-0.0.15.0-1
                haskell-ghc-bignum-orphans-0.1.1-1  haskell-githash-0.1.6.2-102
                haskell-glib-0.13.8.2-12  haskell-glob-0.10.2-36
                haskell-gtk3-0.15.7-8  haskell-haddock-library-1.10.0-133
                haskell-hashable-1.4.0.2-11  haskell-hourglass-0.2.12-192
                haskell-hslua-2.1.0-16  haskell-hslua-aeson-2.1.0-16
                haskell-hslua-classes-2.1.0-16  haskell-hslua-core-2.1.0-16
                haskell-hslua-marshalling-2.1.0-16
                haskell-hslua-module-path-1.0.1-16
                haskell-hslua-module-system-1.0.1-16
                haskell-hslua-module-text-1.0.1-16
                haskell-hslua-module-version-1.0.1-16
                haskell-hslua-objectorientation-2.1.0-16
                haskell-hslua-packaging-2.1.0-16  haskell-hsyaml-0.2.1.1-4
                haskell-http-4000.4.0-23  haskell-http-client-0.7.11-24
                haskell-http-client-tls-0.3.6.1-17
                haskell-http-types-0.12.3-236  haskell-hxt-9.3.1.22-71
                haskell-iproute-1.7.12-24  haskell-ipynb-0.2-17
                haskell-jira-wiki-markup-1.4.0-59  haskell-juicypixels-3.3.7-16
                haskell-lexer-1.1-11  haskell-libyaml-0.1.2-220
                haskell-lpeg-1.0.2-10  haskell-lua-2.1.0-10
                haskell-memory-0.17.0-12  haskell-mono-traversable-1.0.15.3-53
                haskell-network-3.1.2.7-24  haskell-network-uri-2.6.4.1-81
                haskell-pandoc-lua-marshal-0.1.5.1-16
                haskell-pandoc-types-1.22.2-14  haskell-pango-0.13.8.2-13
                haskell-pem-0.2.4-229  haskell-pretty-show-1.10-13
                haskell-primitive-0.7.4.0-3  haskell-quickcheck-2.14.2-317
                haskell-random-1.2.1.1-15  haskell-resourcet-1.2.5-4
                haskell-scientific-0.3.7.0-59  haskell-skylighting-0.12.3-18
                haskell-skylighting-core-0.12.3-18  haskell-socks-0.6.1-176
                haskell-split-0.2.3.4-191  haskell-splitmix-0.1.0.4-68
                haskell-streaming-commons-0.2.2.4-20
                haskell-strict-0.4.0.1-116  haskell-syb-0.7.2.1-139
                haskell-tagsoup-0.14.8-172  haskell-temporary-1.3-412
                haskell-texmath-0.12.5-14  haskell-text-conversions-0.3.1.1-6
                haskell-text-icu-0.8.0.1-17  haskell-th-compat-0.1.3-43
                haskell-th-lift-instances-0.1.19-32  haskell-these-1.1.1.1-143
                haskell-time-compat-1.9.6.1-43  haskell-tls-1.5.7-30
                haskell-typed-process-0.2.8.0-32
                haskell-unicode-collation-0.1.3.2-4
                haskell-unicode-data-0.3.0-13
                haskell-unicode-transforms-0.4.0.1-11
                haskell-uniplate-1.6.13-124
                haskell-unordered-containers-0.2.19.1-8
                haskell-utf8-string-1.0.2-96  haskell-uuid-types-1.0.5-63
                haskell-vector-0.12.3.1-93
                haskell-vector-algorithms-0.8.0.4-111  haskell-x509-1.7.7-2
                haskell-x509-store-1.6.9-27  haskell-x509-system-1.6.7-30
                haskell-x509-validation-1.6.12-32
                haskell-xml-conduit-1.9.1.1-110  haskell-yaml-0.11.8.0-27
                haskell-zip-archive-0.4.2.1-16  haskell-zlib-0.6.3.0-6
                haveged-1.9.18-1  hdf5-1.12.2-1  hidapi-0.12.0-1
                highlight-4.2-1  hitori-3.38.4-1  htop-3.2.1-1
                hunspell-1.7.0-4  hwdata-0.359-1  hwinfo-21.80-2  hwloc-2.7.1-1
                hyphen-2.8.8-4  hyphen-en-2.8.8-4  iana-etc-20220427-1
                ibus-1.5.26-2  icu-71.1-1  igraph-0.9.8-1  ijs-0.35-4
                imagemagick-7.1.0.36-2  imath-3.1.5-1  imlib2-1.9.0-3
                inkscape-1.2-3  intel-compute-runtime-22.21.23269-1
                intel-gmmlib-22.1.3-1  intel-graphics-compiler-1:1.0.11279-1
                intel-media-driver-22.4.2-1  intel-media-sdk-22.3.0-1
                intel-opencl-clang-13.0.0.r6+gd06733f-1  intel-ucode-20220510-1
                intellij-idea-ultimate-edition-2022.1.1-1
                intellij-idea-ultimate-edition-jre-2022.1.1-1  inxi-3.3.16.1-1
                iproute2-5.18.0-1  iptables-1:1.8.8-1  iptux-0.8.3-3
                ipython-8.4.0-1  iso-codes-4.10.0-1  ispc-1.18.0-2  iw-5.19-1
                jack2-1.9.21-1  jansson-2.14-2  jasper-3.0.3-1
                java-openjfx-18.0.1.u2-1  java11-openjfx-11.0.15.u2-1
                jdk-18.0.1-1  jdk-openjdk-18.0.1.1.u2-1
                jdk11-openjdk-11.0.15.u10-1  jdk8-openjdk-8.332.u09-1
                jemalloc-1:5.3.0-1  jfsutils-1.1.15-8  jmol-14.32.59-1
                jose-11-1  jre-18.0.1-1  jre-openjdk-18.0.1.1.u2-1
                jre-openjdk-headless-18.0.1.1.u2-1  jre11-openjdk-11.0.15.u10-1
                jre11-openjdk-headless-11.0.15.u10-1  jre8-openjdk-8.332.u09-1
                jre8-openjdk-headless-8.332.u09-1  js78-78.15.0-4
                js91-91.10.0-1  jsmol-14.32.59-1  json-c-0.16-1
                json-glib-1.6.6-2  jsoncpp-1.9.5-2  jsonrpc-glib-3.42.0-1
                jupyter-4.6.3-3 [removal]  jupyter-nbclient-0.6.4-1
                jupyter-nbconvert-6.5.0-3  jupyter-nbformat-5.4.0-1
                jupyter-notebook-6.4.11-2  jupyter-notebook-shim-0.1.0-1
                jupyter-server-1.17.0-1  jupyter-widgetsnbextension-1:3.6.0-2
                jupyter_console-6.4.3-1  jupyterlab-3.4.2-1
                jupyterlab_pygments-0.2.2-1  jwm-2.4.2-1  k3b-1:22.04.1-1
                kaccounts-integration-22.04.1-1  kactivities-5.94.0-1
                kactivities-stats-5.94.0-1  karchive-5.94.0-1  kauth-5.94.0-1
                kbookmarks-5.94.0-1  kcalendarcore-5.94.0-1
                kcalutils-22.04.1-1  kchmviewer-8.0-4  kcmutils-5.94.0-1
                kcodecs-5.94.0-1  kcompletion-5.94.0-1  kconfig-5.94.0-1
                kconfigwidgets-5.94.0-1  kcontacts-1:5.94.0-1
                kcoreaddons-5.94.0-1  kcrash-5.94.0-1  kdbusaddons-5.94.0-1
                kde-cli-tools-5.24.5-1  kdeclarative-5.94.0-1
                kdecoration-5.24.5-1  kded-5.94.0-1
                kdegraphics-mobipocket-22.04.1-1  kdelibs4support-5.94.0-1
                kdesu-5.94.0-1  kdialog-22.04.1-1  kdnssd-5.94.0-1
                keditbookmarks-22.04.1-1  kemoticons-5.94.0-1
                kfilemetadata-5.94.0-1  kglobalaccel-5.94.0-1
                kguiaddons-5.94.0-1  kholidays-1:5.94.0-1  khtml-5.94.0-1
                ki18n-5.94.0-1  kicad-6.0.5-1  kicad-library-6.0.5-1
                kicad-library-3d-6.0.5-1  kiconthemes-5.94.0-1
                kidentitymanagement-22.04.1-1  kidletime-5.94.0-1
                kimap-22.04.1-1  kinit-5.94.0-1  kio-5.94.0-1
                kio-extras-22.04.1-1  kirigami2-5.94.0-1  kitemmodels-5.94.0-1
                kitemviews-5.94.0-1  kjobwidgets-5.94.0-1  kjs-5.94.0-1
                kldap-22.04.1-1  kmailtransport-22.04.1-1  kmime-22.04.1-1
                kmod-29-3  knewstuff-5.94.0-2  knotifications-5.94.0-1
                knotifyconfig-5.94.0-1  konsole-22.04.1-1  kpackage-5.94.0-1
                kparts-5.94.0-1  kpimtextedit-22.04.1-1  kpty-5.94.0-1
                krb5-1.19.3-1  kross-5.94.0-1  krunner-5.94.0-1
                kscreenlocker-5.24.5-1  kservice-5.94.0-1  ksmtp-22.04.1-1
                ktextwidgets-5.94.0-1  kunitconversion-5.94.0-1
                kwallet-5.94.0-1  kwayland-5.94.0-2  kwayland-server-5.24.5-1
                kwidgetsaddons-5.94.0-1  kwin-5.24.5-2  kwindowsystem-5.94.0-1
                kxmlgui-5.94.0-1  lablgtk2-2.18.12-1  lapack-3.10.1-1
                layer-shell-qt-5.24.5-1  ldb-2:2.5.0-1  lensfun-1:0.3.3-1
                level-zero-loader-1.8.1-1  lib32-at-spi2-atk-2.38.0-2
                lib32-at-spi2-core-2.44.1-1  lib32-atk-2.38.0-1
                lib32-brotli-1.0.9-4  lib32-cairo-1.17.6-2
                lib32-colord-1.4.6-1  lib32-cracklib-2.9.7-2
                lib32-curl-7.83.1-1  lib32-db-5.3.28-5  lib32-dbus-1.14.0-1
                lib32-dbus-glib-0.112-2  lib32-dconf-0.40.0-2
                lib32-expat-2.4.8-1  lib32-fakeroot-1.28-1
                lib32-faudio-22.06-1  lib32-flac-1.3.4-2
                lib32-fontconfig-2:2.14.0-1  lib32-freeglut-3.2.2-2
                lib32-freetype2-2.12.1-1  lib32-fribidi-1.0.12-1
                lib32-gcc-libs-12.1.0-2  lib32-gdk-pixbuf2-2.42.8-1
                lib32-glew-2.2.0-3  lib32-glew1.10-1.10.0-5
                lib32-glib-networking-2.72.0-1  lib32-glib2-2.72.2-1
                lib32-glibc-2.35-5  lib32-glu-9.0.2-3  lib32-gnutls-3.7.6-1
                lib32-gst-plugins-base-libs-1.20.2-1  lib32-gstreamer-1.20.2-1
                lib32-gtk3-3.24.34-1  lib32-harfbuzz-4.3.0-1
                lib32-harfbuzz-icu-4.3.0-1  lib32-icu-71.1-1
                lib32-imlib2-1.9.0-2  lib32-json-c-0.16-1
                lib32-json-glib-1.6.6-2  lib32-krb5-1.19.3-2
                lib32-libappindicator-gtk2-12.10.0-13
                lib32-libasyncns-1:0.8+r3+g68cd5af-1  lib32-libavc1394-0.5.4-3
                lib32-libcanberra-1:0.30+r2+gc0620e4-1  lib32-libcap-2.64-1
                lib32-libcups-2.4.2-1  lib32-libcurl-compat-7.83.1-1
                lib32-libcurl-gnutls-7.83.1-1  lib32-libdrm-2.4.110-1
                lib32-libelf-0.187-1  lib32-libepoxy-1.5.10-1
                lib32-libffi-3.4.2-4  lib32-libgcrypt-1.10.1-1
                lib32-libgcrypt15-1.5.6-7  lib32-libglvnd-1.4.0-2
                lib32-libgpg-error-1.45-1  lib32-libgudev-237-2
                lib32-libgusb-0.3.10-2  lib32-libid3tag-0.15.1b-3
                lib32-libidn11-1.33-2  lib32-libiec61883-1.2.0-3
                lib32-libjpeg-turbo-2.1.3-1  lib32-libldap-2.6.2-1
                lib32-libltdl-2.4.7-2  lib32-libmikmod-3.3.11.1-5
                lib32-libmodplug-0.8.9.0-4  lib32-libnl-3.6.0-1
                lib32-libnm-1.38.0-1  lib32-libproxy-0.4.17-2
                lib32-libpsl-0.21.1-2  lib32-libpulse-16.0-1
                lib32-libraw1394-2.1.2-3  lib32-librsvg-2:2.54.3-1
                lib32-libsndfile-1.1.0-1  lib32-libtheora-1.1.1-13
                lib32-libtiff-4.4.0-1  lib32-libtiff4-3.9.7-5
                lib32-libtirpc-1.3.2-2  lib32-libudev0-shim-1-5
                lib32-libunistring-1.0-1  lib32-libusb-1.0.26-1
                lib32-libva-2.14.0-1  lib32-libvdpau-1.5-1
                lib32-libvpx-1.11.0-2  lib32-libwrap-7.6.31-3
                lib32-libx11-1.8-1  lib32-libxau-1.0.9-2  lib32-libxcb-1.15-1
                lib32-libxcomposite-0.4.5-2  lib32-libxcursor-1.2.1-1
                lib32-libxdamage-1.1.5-2  lib32-libxext-1.3.4-2
                lib32-libxinerama-1.1.4-2  lib32-libxkbcommon-1.4.1-1
                lib32-libxml2-2.9.14-1  lib32-libxmu-1.1.3-2
                lib32-libxrandr-1.5.2-2  lib32-libxslt-1.1.35-1
                lib32-libxss-1.2.3-2  lib32-libxxf86vm-1.1.4-3
                lib32-mesa-22.1.0-1  lib32-mesa-demos-8.4.0-8
                lib32-ncurses5-compat-libs-6.3-1  lib32-nspr-4.34-1
                lib32-nss-3.79-1  lib32-nvidia-utils-515.43.04-1
                lib32-openal-1.22.0-1  lib32-opencl-mesa-22.1.0-1
                lib32-opencl-nvidia-515.43.04-1  lib32-openssl-1:1.1.1.n-1
                lib32-openssl-1.0-1.0.2.u-2  lib32-orc-0.4.32-2
                lib32-pango-1:1.50.7-1  lib32-pipewire-1:0.3.51-1
                lib32-pipewire-v4l2-1:0.3.51-1  lib32-polkit-0.120-5
                lib32-rest-0.8.1-4  lib32-sdl-1.2.15-8 [removal]
                lib32-sdl12-compat-1.2.52-3  lib32-sdl2-2.0.22-1
                lib32-sdl2_image-2.0.5-2  lib32-sdl2_mixer-2.0.4-2
                lib32-sdl2_ttf-2.0.18-1  lib32-sdl_mixer-1.2.12-4
                lib32-sdl_ttf-2.0.11-6  lib32-simplescreenrecorder-0.4.4-1
                lib32-speex-1.2.0-3  lib32-sqlite-3.38.5-1
                lib32-systemd-251.2-1  lib32-tcl-8.6.12-3  lib32-tdb-1.4.6-1
                lib32-util-linux-2.38-1  lib32-vkd3d-1.3-1
                lib32-vulkan-icd-loader-1.3.213-1  lib32-wayland-1.20.0-2
                lib32-x264-3:0.164.r3081.19856cc-1  lib32-zlib-1.2.12-1
                libabw-0.1.3-3  libaccounts-glib-1.25-7  libadwaita-1:1.1.2-1
                libaio-0.3.113-1  libakonadi-22.04.1-2
                libappindicator-gtk2-12.10.0.r296-2
                libappindicator-gtk3-12.10.0.r296-2  libarchive-3.6.1-1
                libass-0.15.2-2  libasyncns-1:0.8+r3+g68cd5af-1
                libavif-0.10.1-1  libbluray-1.3.0-2  libbpf-0.7.0-1
                libbsd-0.11.6-2  libcanberra-1:0.30+r2+gc0620e4-1
                libcap-2.64-1  libcap-ng-0.8.3-1  libcdr-0.1.7-4
                libcerf-1:2.1-1  libchamplain-0.12.20-3  libclc-13.0.1-1
                libcolord-1.4.6-1  libcups-1:2.4.2-1  libcurl-compat-7.83.1-1
                libcurl-gnutls-7.83.1-1  libdazzle-3.44.0-1
                libdbusmenu-glib-16.04.0-5  libdbusmenu-gtk2-16.04.0-5
                libdbusmenu-gtk3-16.04.0-5  libde265-1.0.8-2  libdrm-2.4.110-1
                libdvdread-6.1.3-1  libe-book-0.1.3-11  libebml-1.4.2-2
                libelf-0.187-1  libepoxy-1.5.10-1  libepubgen-0.1.1-3
                libevdev-1.12.1-1  libfabric-1.15.1-1  libfaketime-0.9.10-1
                libffi-3.4.2-5  libfilezilla-1:0.37.2-1  libfm-qt-1.1.0-2
                libfreehand-0.1.2-4  libgcrypt-1.10.1-1  libgcrypt15-1.5.6-6
                libgdata-0.18.1-2  libgdm-42.0+r11+g4a52f026-1  libgee-0.20.5-2
                libgeotiff-1.6.0-4  libgit2-1:1.4.3-1  libgit2-glib-1.0.0.1-2
                libglvnd-1.4.0-2  libgnome-games-support-1.8.2-2
                libgnomekbd-1:3.26.1+r5+g54da436-1  libgpg-error-1.45-1
                libgphoto2-2.5.29-1  libgsf-1.14.49-1  libgudev-237-2
                libgusb-0.3.10-2  libgweather-40.0+r87+g80e5a652-2
                libgweather-4-4.0.0-1  libhandy-1.6.2-1  libheif-1.12.0-3
                libibus-1.5.26-2  libical-3.0.14-3  libice-1.0.10-4
                libiconv-1.17-1  libimagequant-2.17.0-3
                libindicator-gtk2-12.10.1-10  libindicator-gtk3-12.10.1-10
                libinih-55-2  libinput-1.20.1-1  libisl-0.24-4
                libjpeg-turbo-2.1.3-2  libkate-0.4.1-8  libkcddb-22.04.1-1
                libkdepim-22.04.1-1  libkexiv2-22.04.1-1  libkgapi-22.04.1-1
                libkleo-22.04.1-1  liblangtag-0.6.3-3
                liblas-1.8.1.r127+ge6a1aaed-1  libldap-2.6.2-2
                liblouis-3.21.0-1  libmaa-1.4.7-2  libmalcontent-0.10.4-1
                libmanette-0.2.6-3  libmatroska-1.6.3-2  libmaxminddb-1.6.0-3
                libmediaart-1.9.6-1  libmediainfo-22.03-1  libmfx-22.3.0-1
                libmm-glib-1.18.8-1  libmnl-1.0.5-1  libmpc-1.2.1-2
                libmpdclient-2.20-2  libmspub-0.1.4-12  libmwaw-0.3.21-2
                libmythes-1:1.2.4-5  libnautilus-extension-42.2-1
                libnetfilter_conntrack-1.0.9-1  libnfnetlink-1.0.2-1
                libnfs-5.0.1-2  libnghttp2-1.47.0-1  libnice-0.1.19-1
                libnl-3.6.0-3  libnm-1.38.0-1  libnma-1.8.38-1
                libnma-common-1.8.38-1  libnma-gtk4-1.8.38-1
                libnotify-0.7.12-1  libnumbertext-1.0.10-1
                liboauth-1:1.0.3+r15+gac4cf3a-1  libofx-0.10.5-1
                libopenmpt-0.6.3-1  libopenraw-0.3.1-1  libosinfo-1.10.0-1
                libpackagekit-glib-1.2.5-1  libpagemaker-0.0.4-3
                libpaper-1.1.28-2  libpciaccess-0.16-3  libpeas-1.32.0-1
                libpgm-5.3.128-2  libphonenumber-1:8.12.49-1  libpinyin-2.6.2-1
                libpipeline-1.5.6-1  libplacebo-4.192.1-2  libportal-0.6-1
                libportal-gtk3-0.6-1  libportal-gtk4-0.6-1  libproxy-0.4.17-7
                libpst-0.6.76-6  libpulse-16.0-1  libqxp-0.0.2-8
                libraw-0.20.2-2  libreoffice-fresh-7.3.3-3  librevenge-0.0.4-4
                librsvg-2:2.54.3-1  librttopo-1.1.0-4  libsasl-2.1.28-1
                libseccomp-2.5.4-1  libsecret-0.20.5-2  libsemigroups-2.1.5-1
                libshout-1:2.4.6-1  libslirp-4.7.0-1  libsm-1.2.3-3
                libsndfile-1.1.0-2  libsoup3-3.0.6-1  libspatialite-5.0.1-2
                libspeechd-0.11.1-3  libspnav-1.0-1  libstaroffice-0.0.7-2
                libstemmer-2.2.0-2  libsynctex-2022.62885-1
                libsysprof-capture-3.44.0-1  libtg_owt-0.git13.63a934d-1
                libtiff-4.3.0-2  libtool-2.4.7-2
                libtorrent-rasterbar-1:2.0.6-1  libunistring-1.0-1
                libunrar-1:6.1.7-1  libupnp-1.14.12-3  libusb-1.0.26-1
                libutempter-1.2.1-2  libutf8proc-2.7.0-2  libva-2.14.0-1
                libva-intel-driver-2.4.1-2  libvdpau-1.5-1  libvirt-1:8.3.0-1
                libvirt-python-1:8.3.0-1  libvisio-0.1.7-7  libvorbis-1.3.7-3
                libvpx-1.11.0-2  libwacom-2.2.0-1  libwnck3-40.1-1
                libwpe-1.12.0-2  libwpg-0.3.3-3  libwrap-7.6.31-4  libx11-1.8-1
                libx86emu-3.5-2  libxau-1.0.9-4  libxcb-1.15-1
                libxcomposite-0.4.5-4  libxcrypt-4.4.28-2  libxcursor-1.2.1-1
                libxdamage-1.1.5-4  libxdmcp-1.1.3-4  libxext-1.3.4-4
                libxinerama-1.1.4-4  libxkbcommon-1.4.1-1
                libxkbcommon-x11-1.4.1-1  libxkbfile-1.1.0-3  libxml2-2.9.14-1
                libxmlb-0.3.9-1  libxmlrpc-1:1.51.08-2  libxmu-1.1.3-3
                libxnvctrl-515.43.04-1  libxp-1.0.3-5  libxpm-3.5.13-3
                libxrandr-1.5.2-4  libxrender-0.9.10-5  libxshmfence-1.3-3
                libxslt-1.1.35-1  libxss-1.2.3-4  libxtst-1.2.3-5
                libxv-1.0.11-5  libxvmc-1.0.13-1  libxxf86vm-1.1.4-5
                libyuv-r2322+3aebf69d-1  libzmf-0.0.2-12  liferea-1.13.8-1
                lightdm-gtk-greeter-1:2.0.8-2  linux-5.18.1.arch1-1
                linux-api-headers-5.17.5-2  linux-firmware-20220509.b19cbdc-1
                linux-firmware-whence-20220509.b19cbdc-1
                linux-headers-5.18.1.arch1-1  linux-lts-5.15.44-1
                linux-lts-headers-5.15.44-1  lirc-1:0.10.1-12
                live-media-2022.04.26-1  llvm-13.0.1-6  llvm-libs-13.0.1-6
                log4cxx-0.13.0-1  lrs-072-1  lrzip-0.651-2
                lsb-release-2.0.r48.3cf5103-1  lsof-4.95.0-1  lua-expat-1.4.1-2
                lua-socket-1:3.0.0-1  lua52-expat-1.4.1-2
                lua52-socket-1:3.0.0-1  lua53-lpeg-1.0.2-4
                luajit-2.1.0.beta3.r409.g1b8d8cab-1  luit-20220111-1
                lvm2-2.03.16-1  lxmusic-0.4.7-6  lxqt-archiver-0.6.0-1
                lxtask-gtk3-0.1.10-2  malcontent-0.10.4-1
                maliit-framework-2.2.1-1  maliit-keyboard-2.2.1.1-1
                man-db-2.10.2-1  mariadb-10.8.3-1  mariadb-clients-10.8.3-1
                mariadb-libs-10.8.3-1  marisa-0.2.6-9  masterpdfeditor-5.8.52-1
                mathjax-3.2.1-1  maxima-5.46.0-2  maxima-ecl-5.46.0-2
                maxima-ecl-5.45.1-2 [removal]  maxima-fas-5.46.0-2  mdadm-4.2-2
                mediainfo-22.03-1  menu-cache-1.1.0-3  mesa-22.1.0-1
                mesa-demos-8.5.0-1  mesa-utils-8.5.0-1  meson-0.62.2-1
                mgard-1.0.0-1  mingw-w64-binutils-2.38-2
                mingw-w64-crt-10.0.0-1  mingw-w64-headers-10.0.0-1
                mingw-w64-winpthreads-10.0.0-1  miniupnpc-2.2.3-1
                minizip-1:1.2.12-2  mkvtoolnix-cli-67.0.0-2
                mkvtoolnix-gui-67.0.0-2  mlt-7.6.0-1  mlt6-6.26.1-9
                mobile-broadband-provider-info-20220511-1
                mongo-c-driver-1.21.1-2  mono-6.12.0.177-1  mousepad-0.5.9-1
                mpc-0.34-2  mpfr-4.1.0.p13-2  mpg123-1.29.3-2  mplayer-38359-1
                mpv-1:0.34.1-4  mtd-utils-2.1.4-1  mtdev-1.1.6-2
                mtools-1:4.0.39-1  multipath-tools-0.8.9-1  mutter-42.2-1
                mysql-workbench-8.0.29-1  nano-6.3-1  nautilus-42.2-1
                nbd-3.24-1  nccl-2.12.10-1  ncdu-2.1.2-1  ncurses-6.3-3
                ndctl-73-1  net-snmp-5.9.1-4  netcdf-4.8.1-3  netctl-1.28-1
                nethogs-0.8.7-1  network-manager-applet-1.26.0-1
                networkmanager-1.38.0-1  networkmanager-openconnect-1.2.8-2
                networkmanager-openvpn-1.8.18-2  networkmanager-pptp-1.2.10-2
                networkmanager-vpnc-1.2.8-2  ngspice-37-1  ninja-1.11.0-1
                nm-connection-editor-1.26.0-1  node-gyp-9.0.0-1
                normaliz-3.9.3-1  npm-8.5.5-1  nspr-4.34-1  nss-3.79-1
                ntfs-3g-2022.5.17-1  numactl-2.0.14-3  nuspell-5.1.0-2
                nvidia-510.47.03-4 [removal]  nvidia-dkms-515.43.04-2
                nvidia-settings-515.43.04-1  nvidia-utils-515.43.04-2
                ocaml-4.13.1-3  ocaml-num-1.4-5  ogre-13.3.1-1
                okular-22.04.1-1  onednn-2.6-1  oniguruma-6.9.8-1
                openal-1.22.0-1  opencascade-1:7.5.3-3  opencc-1.1.3-1
                opencl-headers-2:2022.01.04-1  opencl-mesa-22.1.0-1
                opencl-nvidia-515.43.04-2  openconnect-1:9.01-1  opencv-4.5.5-5
                openexr-3.1.5-1  openimagedenoise-1.4.3-1  openjade-1.3.2-7
                openjpeg2-2.5.0-1  openocd-1:0.11.0-2  openssh-9.0p1-1
                openssl-1.1.1.o-1  openvkl-1.3.0-1  openvpn-2.5.7-1
                opera-87.0.4390.45-1  opera-ffmpeg-codecs-101.0.4951.67-1
                opusfile-0.12-2  orca-42.1-1  osinfo-db-20220516-1
                ospray-2.9.0-1  ostree-2022.3-1  oxygen-icons-1:5.94.0-1
                packagekit-1.2.5-1  pacman-6.0.1-5  pacman-contrib-1.5.2-1
                pacman-mirrorlist-20220501-1  palemoon-1:31.0.0-3
                pandoc-2.17.1.1-37  pango-1:1.50.7-1  pango-perl-1.227-15
                pari-2.13.4-1  partclone-0.3.20-1  parted-3.5-1
                patchelf-0.14.5-1  pcb-1:4.3.0-2  pciutils-3.8.0-1
                pcmanfm-qt-1.1.0-1  pcre2-10.40-1  pcsclite-1.9.7-1
                peco-0.5.10-4  perl-5.36.0-1  perl-alien-build-2.48-3
                perl-alien-libxml2-0.17-3  perl-archive-zip-1.68-7
                perl-autovivification-0.18-8  perl-b-hooks-endofscope-0.26-1
                perl-bit-vector-7.4-13  perl-business-isbn-3.007-1
                perl-business-isbn-data-20210112.006-1
                perl-business-ismn-1.202-1  perl-business-issn-1.005-1
                perl-cairo-gobject-1.004-12  perl-canary-stability-2013-5
                perl-capture-tiny-0.48-6  perl-carp-always-0.16-2
                perl-carp-clan-6.08-5  perl-cgi-4.54-2
                perl-class-data-inheritable-0.09-2  perl-class-inspector-1.36-5
                perl-class-method-modifiers-2.13-3  perl-class-singleton-1.6-1
                perl-clone-0.45-4  perl-common-sense-3.75-4
                perl-cpan-perl-releases-5.20220528-1
                perl-cpanel-json-xs-4.29-2  perl-data-compare-1.27-1
                perl-data-dump-1.25-3  perl-data-optlist-0.112-2
                perl-data-random-0.13-6  perl-data-uniqid-0.12-10
                perl-date-calc-6.4-9  perl-datetime-1.58-1
                perl-datetime-calendar-julian-0.107-1
                perl-datetime-format-builder-1:0.83-3
                perl-datetime-format-strptime-1.79-1
                perl-datetime-locale-1.35-1  perl-datetime-timezone-2.52-1
                perl-devel-globaldestruction-0.14-8
                perl-devel-patchperl-2.08-1  perl-devel-stacktrace-2.04-2
                perl-digest-hmac-1.04-3  perl-digest-sha1-2.13-17
                perl-dist-checkconflicts-0.11-8  perl-encode-locale-1.05-9
                perl-error-0.17029-4  perl-eval-closure-0.14-8
                perl-exception-class-1.45-2  perl-exporter-tiny-1.002002-4
                perl-extutils-depends-0.8001-3  perl-extutils-pkgconfig-1.16-9
                perl-ffi-checklib-0.28-3  perl-file-basedir-0.09-2
                perl-file-copy-recursive-0.45-5  perl-file-desktopentry-0.22-9
                perl-file-find-rule-0.34-9  perl-file-listing-6.15-2
                perl-file-mimeinfo-0.32-2  perl-file-path-tiny-1.0-1
                perl-file-pushd-1.016-5  perl-file-sharedir-1.118-2
                perl-file-sharedir-install-0.13-6  perl-file-slurp-tiny-0.004-8
                perl-file-slurper-0.013-1  perl-file-which-1.27-2
                perl-gd-2.76-1  perl-glib-object-introspection-0.049-3
                perl-goocanvas2-0.06-4  perl-goocanvas2-cairotypes-0.001-6
                perl-gtk3-0.038-2  perl-gtk3-imageview-10-2
                perl-html-form-6.07-1  perl-html-parser-3.78-2
                perl-html-tagset-3.20-12  perl-http-cookies-6.10-3
                perl-http-daemon-6.14-2  perl-http-date-6.05-5
                perl-http-message-6.36-2  perl-http-negotiate-6.01-10
                perl-http-server-simple-0.52-3  perl-image-exiftool-12.40-2
                perl-import-into-1.002005-8  perl-inc-latest-0.500-9
                perl-io-html-1.004-3  perl-io-socket-ssl-2.074-3
                perl-ipc-run3-0.048-10  perl-ipc-system-simple-1.30-4
                perl-json-4.06-1  perl-json-maybexs-1.004003-3
                perl-json-xs-4.03-3  perl-libwww-6.60-2
                perl-lingua-translit-0.28-7  perl-list-allutils-0.19-1
                perl-list-moreutils-0.430-3  perl-list-moreutils-xs-0.430-3
                perl-list-someutils-0.58-1  perl-list-utilsby-0.12-1
                perl-local-lib-2.000029-1  perl-locale-gettext-1.07-12
                perl-log-log4perl-1.54-3  perl-lwp-mediatypes-6.04-2
                perl-lwp-protocol-https-6.10-3  perl-mailtools-2.21-6
                perl-mime-charset-1.012.2-9  perl-module-build-0.4231-7
                perl-module-implementation-0.09-8  perl-module-pluggable-5.2-8
                perl-moo-2.005004-3  perl-mouse-2.5.10-4
                perl-mozilla-ca-20200520-5  perl-mro-compat-0.15-1
                perl-namespace-autoclean-0.29-4  perl-namespace-clean-0.27-8
                perl-net-dbus-1.2.0-4  perl-net-dropbox-api-1.9-11
                perl-net-http-6.22-2  perl-net-oauth-0.28-12
                perl-net-ssleay-1.90-3  perl-number-bytes-human-0.11-6
                perl-number-compare-0.03-12
                perl-package-deprecationmanager-0.17-8
                perl-package-stash-0.40-2  perl-package-stash-xs-0.29-6
                perl-params-util-1.102-3  perl-params-validate-1.30-3
                perl-params-validationcompiler-0.30-5  perl-parse-yapp-1.21-5
                perl-path-class-0.37-8  perl-path-tiny-0.122-2
                perl-perlio-utf8-strict-0.009-1  perl-pod-parser-1.65-1
                perl-proc-processtable-0.634-2  perl-proc-simple-1.32-8
                perl-regexp-common-2017060201-5  perl-role-tiny-2.002004-3
                perl-sgmls-1:1.1-9  perl-sort-key-1.33-11
                perl-sort-naturally-1.03-8  perl-specio-0.47-2
                perl-sub-exporter-0.988-2
                perl-sub-exporter-progressive-0.001013-8
                perl-sub-identify-0.14-10  perl-sub-install-0.928-8
                perl-sub-name-0.26-4  perl-sub-quote-1:2.006_007-2
                perl-term-readkey-2.38-7  perl-term-readline-gnu-1.42-2
                perl-test-fatal-0.016-3  perl-test-pod-1.52-7
                perl-text-bibtex-0.88-1  perl-text-csv-2.01-1
                perl-text-glob-0.11-9  perl-text-iconv-1.7-21
                perl-text-roman-3.5-9  perl-tie-cycle-1.225-7
                perl-timedate-2.33-4  perl-tk-804.036-4  perl-try-tiny-0.31-2
                perl-types-serialiser-1.01-1  perl-unicode-linebreak-2019.001-5
                perl-uri-5.10-2  perl-variable-magic-0.62-7
                perl-www-mechanize-2.08-1  perl-www-robotrules-6.02-10
                perl-x11-protocol-0.56-13  perl-xml-libxml-2.0207-3
                perl-xml-libxml-simple-1.01-1  perl-xml-libxslt-2.000000-2
                perl-xml-parser-2.46-4  perl-xml-simple-2.25-7
                perl-xml-twig-3.52-9  perl-xml-writer-0.900-1
                perl-yaml-tiny-1.73-6  perlbrew-0.95-1  phodav-2.5-2
                php-8.1.6-1  php-apache-8.1.6-1  php-cgi-8.1.6-1
                phpmyadmin-5.2.0-1  picom-9.1-3  pigz-2.7-1
                pimcommon-22.04.1-1  pipewire-1:0.3.51-1
                pipewire-alsa-1:0.3.51-1  pipewire-media-session-1:0.4.1-2
                pipewire-media-session-docs-1:0.4.1-2  pipewire-v4l2-1:0.3.51-1
                pixman-0.40.0-2  pkcs11-helper-1.29.0-1  pkgstats-3.2.2-1
                planarity-3.0.2.0-1  plantri-5.3-1  plasma-framework-5.94.0-1
                podofo-0.9.8-1  polari-42.0-1  polkit-0.120-5
                polkit-gnome-0.105-9  polymake-4.6-4  poppler-22.06.0-1
                poppler-glib-22.06.0-1  poppler-qt5-22.06.0-1
                poppler-qt6-22.06.0-1  postgresql-14.3-2
                postgresql-libs-14.3-2  power-profiles-daemon-0.11.1-1
                primecount-7.3-1  primesieve-7.9-1  prison-5.94.0-1
                projectm-3.1.12-3  protobuf-3.20.1-2  psmisc-23.5-1
                pugixml-1.12.1-1  pulseaudio-16.0-1  pulseaudio-alsa-1:1.2.6-3
                pulseaudio-bluetooth-16.0-1  purpose-5.94.0-1  putty-0.77-1
                pv-1.6.20-2  pybind11-2.9.2-1  pyenv-2.3.0-1  pyside2-5.15.4-1
                pyside6-6.3.0-1  python-3.10.4-2  python-acme-1.27.0-1
                python-anyio-3.6.1-1  python-apipkg-2.1.1-1
                python-apsw-3.38.1-1  python-asn1crypto-1.5.1-1
                python-astroid-2.11.5-1  python-automat-20.2.0-9
                python-babel-2.10.1-1  python-black-22.3.0-1
                python-brotli-1.0.9-8  python-cachetools-5.1.0-1
                python-cairo-1.21.0-1  python-click-8.1.3-1
                python-cryptography-37.0.2-1  python-cvxopt-1.3.0-1
                python-cycler-0.11.0-1  python-debugpy-1.6.0-1
                python-deprecation-2.1.0-6  python-distro-1.7.0-1
                python-dnspython-1:2.2.1-1  python-docutils-1:0.18.1-1
                python-dotenv-0.20.0-1  python-dulwich-0.20.42-1
                python-entrypoints-0.4-2  python-executing-0.8.3-1
                python-fastjsonschema-2.15.3-1  python-feedparser-6.0.3-1
                python-filelock-3.5.0-1  python-flask-2.1.2-1
                python-flatbuffers-2.0.6-1  python-fonttools-4.33.3-1
                python-fpylll-0.5.7-1  python-fs-2.4.16-1
                python-gobject-3.42.1-1  python-google-auth-1.34.0-4
                python-google-auth-oauthlib-0.5.1-1  python-gpgme-1.17.1-1
                python-graphviz-0.20-1  python-grpcio-1.46.3-1
                python-h5py-3.7.0-1  python-igraph-0.9.10-1
                python-imageio-2.19.2-1  python-ipykernel-6.13.0-1
                python-ipython-genutils-0.2.0-1  python-ipywidgets-7.7.0-4
                python-isort-5.10.1-5  python-itsdangerous-2.1.2-2
                python-jinja-1:3.1.2-1  python-josepy-1.13.0-2
                python-json5-0.9.8-1  python-jupyter_client-7.3.1-1
                python-jupyter_core-4.10.0-1  python-jupyter_packaging-0.12.1-1
                python-jupyterlab_server-2.14.0-1  python-lxml-4.8.0-1
                python-markdown-3.3.7-1  python-markupsafe-2.1.1-1
                python-matplotlib-3.5.2-1  python-mccabe-0.7.0-1
                python-memory-allocator-0.1.3-1  python-more-itertools-8.12.0-2
                python-nest-asyncio-1.5.5-1  python-networkx-2.7.1-1
                python-numpy-1.22.3-1  python-oauthlib-3.2.0-1
                python-opengl-3.1.6-1  python-packaging-21.3-1
                python-pandas-1.4.2-1  python-paramiko-2.11.0-1
                python-pbr-5.9.0-1  python-pillow-9.1.1-1  python-pip-21.0-1
                python-platformdirs-2.5.0-1  python-pluggy-1.0.0-1
                python-prettytable-2.3.0-1  python-prometheus_client-0.14.1-1
                python-prompt_toolkit-3.0.29-1  python-protobuf-3.20.1-2
                python-psutil-5.9.0-2  python-py7zr-0.18.5-1
                python-pyaml-21.10.1-1  python-pycryptodomex-3.12.0-1
                python-pycurl-7.45.1-1  python-pygments-2.12.0-1
                python-pylint-2.13.8-1  python-pyopenssl-22.0.0-1
                python-pyparsing-3.0.9-1  python-pyperclip-1.8.2-4
                python-pyppmd-0.18.2-1  python-pyqt5-sip-12.10.1-1
                python-pyqt6-6.3.0-1  python-pyqt6-sip-13.3.1-1
                python-pytest-7.1.2-1  python-pytest-runner-5.3.2-1
                python-pytorch-1.11.0-7  python-pytz-2022.1-1
                python-pywavelets-1.3.0-1  python-pyzmq-23.0.0-1
                python-pyzstd-0.15.2-1  python-qtpy-2.1.0-1
                python-reportlab-3.6.9-1  python-requests-2.27.1-1
                python-requests-oauthlib-1.3.1-1
                python-requests-unixsocket-0.3.0-1  python-rpy2-3.5.2-1
                python-scikit-build-0.13.1-2  python-scikit-image-0.19.2-1
                python-scikit-learn-1.1.1-1  python-scipy-1.8.1-1
                python-setproctitle-1.2.3-1  python-setuptools-1:60.6.0-1
                python-shapely-1.8.1-1  python-shiboken2-5.15.4-1
                python-sniffio-1.2.0-5  python-soupsieve-2.3.1-1
                python-sphinx-5.0.1-1  python-stack-data-0.2.0-1
                python-symengine-0.9.2-1  python-sympy-1.10.1-1
                python-tensorboardx-2.5-1  python-tensorflow-estimator-2.8.0-1
                python-tensorflow-opt-2.8.0-7  python-terminado-0.15.0-1
                python-testpath-0.6.0-1  python-threadpoolctl-3.1.0-1
                python-tifffile-2022.5.4-1  python-tinycss2-1.1.1-1
                python-tomli-2.0.1-1  python-tomlkit-0.11.0-1
                python-tox-3.25.0-1  python-tqdm-4.64.0-1
                python-traitlets-5.2.2.post1-1
                python-typing_extensions-4.2.0-1  python-tzdata-2022.1-1
                python-tzlocal-1:2.1-1  python-unidecode-1.3.4-1
                python-unrardll-0.1.5-1  python-urllib3-1.26.9-1
                python-waitress-2.1.2-1  python-websocket-client-1.3.2-1
                python-websockets-10.3-1  python-werkzeug-2.1.2-1
                python-wrapt-1.14.1-1  python-yaml-6.0-1
                python-zeroconf-0.38.4-1  python-zipfile-deflate64-0.2.0-1
                python-zipp-3.8.0-1  python-zopfli-0.2.1-1  qbs-1.22.1-1
                qemu-6.2.0-2 [removal]  qemu-arch-extra-6.2.0-2 [removal]
                qemu-audio-alsa-7.0.0-10  qemu-audio-dbus-7.0.0-10
                qemu-audio-jack-7.0.0-10  qemu-audio-oss-7.0.0-10
                qemu-audio-pa-7.0.0-10  qemu-audio-sdl-7.0.0-10
                qemu-audio-spice-7.0.0-10  qemu-block-curl-7.0.0-10
                qemu-block-dmg-7.0.0-10  qemu-block-gluster-7.0.0-10
                qemu-block-iscsi-7.0.0-10  qemu-block-nfs-7.0.0-10
                qemu-block-rbd-7.0.0-10  qemu-block-ssh-7.0.0-10
                qemu-chardev-spice-7.0.0-10  qemu-common-7.0.0-10
                qemu-desktop-7.0.0-10  qemu-emulators-full-7.0.0-10
                qemu-guest-agent-7.0.0-10  qemu-hw-display-qxl-7.0.0-10
                qemu-hw-display-virtio-gpu-7.0.0-10
                qemu-hw-display-virtio-gpu-gl-7.0.0-10
                qemu-hw-display-virtio-gpu-pci-7.0.0-10
                qemu-hw-display-virtio-gpu-pci-gl-7.0.0-10
                qemu-hw-display-virtio-vga-7.0.0-10
                qemu-hw-display-virtio-vga-gl-7.0.0-10
                qemu-hw-s390x-virtio-gpu-ccw-7.0.0-10
                qemu-hw-usb-host-7.0.0-10  qemu-hw-usb-redirect-7.0.0-10
                qemu-hw-usb-smartcard-7.0.0-10  qemu-img-7.0.0-10
                qemu-pr-helper-7.0.0-10  qemu-system-aarch64-7.0.0-10
                qemu-system-alpha-7.0.0-10  qemu-system-arm-7.0.0-10
                qemu-system-avr-7.0.0-10  qemu-system-cris-7.0.0-10
                qemu-system-hppa-7.0.0-10  qemu-system-m68k-7.0.0-10
                qemu-system-microblaze-7.0.0-10  qemu-system-mips-7.0.0-10
                qemu-system-nios2-7.0.0-10  qemu-system-or1k-7.0.0-10
                qemu-system-ppc-7.0.0-10  qemu-system-riscv-7.0.0-10
                qemu-system-rx-7.0.0-10  qemu-system-s390x-7.0.0-10
                qemu-system-sh4-7.0.0-10  qemu-system-sparc-7.0.0-10
                qemu-system-tricore-7.0.0-10  qemu-system-x86-7.0.0-10
                qemu-system-xtensa-7.0.0-10  qemu-tools-7.0.0-10
                qemu-ui-curses-7.0.0-10  qemu-ui-dbus-7.0.0-10
                qemu-ui-egl-headless-7.0.0-10  qemu-ui-gtk-7.0.0-10
                qemu-ui-opengl-7.0.0-10  qemu-ui-sdl-7.0.0-10
                qemu-ui-spice-app-7.0.0-10  qemu-ui-spice-core-7.0.0-10
                qemu-user-7.0.0-10  qemu-vhost-user-gpu-7.0.0-10
                qemu-virtiofsd-7.0.0-10  qgpgme-1.17.1-1  qpdf-10.6.3-1
                qt5-3d-5.15.4+kde+r17-1  qt5-base-5.15.4+kde+r146-1
                qt5-charts-5.15.4+kde+r0-1  qt5-connectivity-5.15.4+kde+r5-1
                qt5-datavis3d-5.15.4+kde+r0-1  qt5-declarative-5.15.4+kde+r19-1
                qt5-doc-5.15.4-1  qt5-examples-5.15.4-1
                qt5-graphicaleffects-5.15.4+kde+r0-1
                qt5-imageformats-5.15.4+kde+r1-1  qt5-location-5.15.4+kde+r2-1
                qt5-multimedia-5.15.4+kde+r1-1  qt5-quick3d-5.15.4+kde+r2-1
                qt5-quickcontrols-5.15.4+kde+r0-1
                qt5-quickcontrols2-5.15.4+kde+r4-1
                qt5-remoteobjects-5.15.4+kde+r0-1  qt5-script-5.15.9-2
                qt5-scxml-5.15.4+kde+r0-1  qt5-sensors-5.15.4+kde+r0-1
                qt5-serialport-5.15.4+kde+r0-1  qt5-speech-5.15.4+kde+r1-1
                qt5-svg-5.15.4+kde+r10-1  qt5-tools-5.15.4+kde+r0-1
                qt5-translations-5.15.4+kde+r2-1  qt5-wayland-5.15.4+kde+r38-1
                qt5-webchannel-5.15.4+kde+r3-1  qt5-webengine-5.15.9-3
                qt5-webkit-5.212.0alpha4-14  qt5-websockets-5.15.4+kde+r3-1
                qt5-x11extras-5.15.4+kde+r0-1  qt5-xmlpatterns-5.15.4+kde+r0-1
                qt6-3d-6.3.0-1  qt6-5compat-6.3.0-2  qt6-base-6.3.0-3
                qt6-charts-6.3.0-1  qt6-connectivity-6.3.0-1
                qt6-datavis3d-6.3.0-1  qt6-declarative-6.3.0-2  qt6-doc-6.3.0-1
                qt6-examples-6.3.0-1  qt6-imageformats-6.3.0-2
                qt6-multimedia-6.3.0-1  qt6-networkauth-6.3.0-1
                qt6-positioning-6.3.0-1  qt6-quick3d-6.3.0-1
                qt6-quicktimeline-6.3.0-1  qt6-remoteobjects-6.3.0-1
                qt6-scxml-6.3.0-1  qt6-sensors-6.3.0-1  qt6-serialport-6.3.0-1
                qt6-shadertools-6.3.0-1  qt6-svg-6.3.0-1  qt6-tools-6.3.0-1
                qt6-translations-6.3.0-1  qt6-wayland-6.3.0-1
                qt6-webchannel-6.3.0-1  qt6-webengine-6.3.0-3
                qt6-websockets-6.3.0-1  qtcreator-7.0.2-1  quazip-qt5-1.3-1
                quazip-qt6-1.3-1  r-4.2.0-4  raptor-2.0.15-19  rar-6.12.0-1
                rasqal-1:0.9.33-5  rav1e-0.4.1-2  re2-1:20220601-1
                recode-3.7.12-1  refind-0.13.3.1-1  remmina-1:1.4.26-1
                retext-7.2.3-1  rhythmbox-3.4.5-1  rkcommon-1.9.0-1
                rsync-3.2.4-1  rtmpdump-1:2.4.r99.f1b83c1-2  rtorrent-0.9.8-3
                ruby-3.0.4-1  ruby-dbus-0.17.0-1  ruby-psych-4.0.4-2
                ruby-stringio-3.0.2-1  ruby2.7-2.7.6-1  rubygems-3.3.8-1
                runc-1.1.2-1  rust-1:1.61.0-1  rygel-1:0.40.4-1  sagemath-9.6-2
                sagemath-doc-9.6-2  samba-4.16.1-3  sdcc-4.2.0-2
                sdl-1:1.2.15+r406+gf1caf909-1 [removal]  sdl12-compat-1.2.52-2
                sdl2-2.0.22-2  sdl_mixer-1.2.12-11  seabios-1.16.0-1
                semver-7.3.7-1  sgml-common-0.6.3-8  shaderc-2022.1-3
                shadowsocks-3.0.0a.20180219-5  shadowsocks-v2ray-plugin-5.0.2-1
                shared-mime-info-2.0+144+g13695c7-1  shiboken6-6.3.0-1
                shotcut-22.04.25-1  sigil-1.9.10-1
                signon-kwallet-extension-22.04.1-1  signond-8.61-1
                simple-scan-42.1-1  simplescreenrecorder-0.4.4-1
                singular-4.3.0.p1-1  sip-6.6.2dev2205162316-1  slock-1.4-6
                smbclient-4.16.1-3  smplayer-22.2.0-2  socat-1.7.4.3-1
                solid-5.94.0-1  sonnet-5.94.0-1  sound-theme-freedesktop-0.8-5
                soundtouch-2.3.1-2  speech-dispatcher-0.11.1-3
                spice-gtk-0.40-1  spirv-llvm-translator-13.0.0.r27+gd7a03044-1
                spirv-tools-2022.1-1  sqlite-3.38.5-1  squashfs-tools-4.5.1-1
                sshfs-3.7.3-1  sssd-2.7.0-1  steam-native-runtime-1.0.0.70-3
                strace-5.17-1  stress-1.0.5-1  subversion-1.14.1-6
                sudo-1.9.10-1  suitesparse-5.12.0-1  sushi-41.2-1
                svt-av1-0.9.0-2  svt-hevc-1.5.1-2  swell-foop-41.1-1
                swi-prolog-8.4.2-2  sword-1.9.0-5  sxhkd-0.6.2-2
                symengine-0.9.0-1  sympol-0.1.9-11  syndication-5.94.0-1
                syntax-highlighting-5.94.0-1  syslog-ng-3.36.1-1
                sysprof-3.44.0-1  sysstat-12.6.0-1  systemd-251.2-1
                systemd-libs-251.2-1  systemd-sysvcompat-251.2-1  sz-2.1.12-4
                tachyon-0.99.5-1  tali-40.7-1  tcsh-6.24.00-2
                teamviewer-15.29.4-1  telegram-desktop-3.7.3-1
                telepathy-mission-control-5.16.6-2  template-glib-3.34.1-1
                tensorboard-2.8.0-2  tensorflow-opt-2.8.0-7  tepl-6.0.2-1
                texlive-bibtexextra-2022.63023-1  texlive-bin-2022.62885-1
                texlive-core-2022.63035-1  texlive-fontsextra-2022.62977-1
                texlive-formatsextra-2022.62529-1
                texlive-humanities-2022.62929-1
                texlive-langchinese-2022.62922-1
                texlive-langcyrillic-2022.62517-1
                texlive-langextra-2022.62837-1  texlive-langgreek-2022.61820-1
                texlive-langjapanese-2022.63011-1
                texlive-langkorean-2022.63005-1
                texlive-latexextra-2022.63034-1  texlive-pictures-2022.62992-1
                texlive-pstricks-2022.62977-1  texlive-publishers-2022.63013-1
                texlive-science-2022.62977-1  texmaker-5.1.3-1
                texstudio-4.2.3-1  texworks-0.6.7-1  threadweaver-5.94.0-1
                thunar-4.16.11-2  thunar-archive-plugin-0.5.0-2
                thunderbird-91.9.1-1  tint2-17.0.2-2  tinyxml-2.6.2-9
                tmux-3.3-2  toolame-02l-13  tor-0.4.7.7-2
                tor-browser-11.0.13-1  totem-42.0-1  tpm2-tss-3.2.0-1
                tracker-1:2.3.6+r7+gb27396252-1
                tracker-miners-1:2.3.5+r3+gd9d61d87f-1  tracker3-3.3.1-1
                tracker3-miners-3.3.1-1  transmission-cli-3.00-4
                transmission-gtk-3.00-4  trash-cli-0.22.4.16-1  tree-2.0.2-1
                tzdata-2022a-1  udiskie-2.4.2-1  uget-2.2.3-5
                unarchiver-1.10.7-6  units-2.21-3  unixodbc-2.3.11-1
                upower-0.99.18-1  upx-3.96-3  usb_modeswitch-2.6.1-3
                util-linux-2.38-1  util-linux-libs-2.38-1  v2ray-4.45.0-1
                v2ray-domain-list-community-20220604062951-1
                v2ray-geoip-202206020056-1  vagrant-2.2.19-2  vala-0.56.1-1
                valgrind-3.19.0-3  vde2-2.3.3-1  verilator-4.222-1
                vim-runtime-8.2.5046-1  virt-install-4.0.0-1
                virt-manager-4.0.0-1  virtualbox-6.1.34-4
                virtualbox-ext-oracle-6.1.34-1  virtualbox-ext-vnc-6.1.34-4
                virtualbox-guest-iso-6.1.34-1
                virtualbox-guest-utils-nox-6.1.34-4
                virtualbox-host-dkms-6.1.34-4  virtualbox-sdk-6.1.34-4
                vkd3d-1.3-1  vlc-3.0.17.4-3  vmaf-2.3.1-1  vokoscreen-3.2.0-1
                vpnc-1:0.5.3.r506.r204-1  vte-common-0.68.0-2  vte3-0.68.0-2
                vtk-9.1.0-15  vulkan-headers-1:1.3.213-1
                vulkan-icd-loader-1.3.213-1  w3m-0.5.3.git20220409_1-1
                wayland-1.20.0-2  webkit2gtk-2.36.3-1  webkit2gtk-4.1-2.36.3-1
                webstorm-2022.1.1b221.5591.52-1
                webstorm-jre-2022.1.1b221.5591.52-1  wget-1.21.3-1
                whois-5.5.13-1  wine-7.7-1  wine-mono-7.2.0-1
                winetricks-20220411-1  wireshark-cli-3.6.5-1
                wireshark-qt-3.6.5-1  wolfssl-5.3.0-1  wpa_supplicant-2:2.10-4
                wpebackend-fdo-1.12.0-2  wvstreams-4.6.1-18  x11docker-7.1.4-1
                x264-3:0.164.r3081.19856cc-2  x265-3.5-3
                xapian-core-1:1.4.19-2  xarchiver-0.5.4.18-1  xbitmaps-1.1.2-3
                xcb-proto-1.15-1  xcb-util-0.4.0-4  xcb-util-cursor-0.1.3-4
                xcb-util-image-0.4.0-4  xcb-util-keysyms-0.4.0-4
                xcb-util-renderutil-0.3.9-4  xcb-util-wm-0.4.1-4
                xcompmgr-1.1.8-3  xcursor-themes-1.0.6-3
                xdg-dbus-proxy-0.1.4-1  xdg-desktop-portal-1.14.4-1
                xdg-desktop-portal-gnome-42.1-1
                xdg-desktop-portal-gtk-1.14.0-1  xdg-utils-1.1.3+21+g1a58bc2-1
                xerces-c-3.2.3-6  xf86-video-dummy-0.4.0-1
                xfce4-diskperf-plugin-2.7.0-1  xfce4-eyes-plugin-4.6.0-1
                xfce4-panel-4.16.4-1  xfce4-pulseaudio-plugin-0.4.3-2
                xfce4-screenshooter-1.9.10-2  xfce4-settings-4.16.2-2
                xfce4-taskmanager-1.5.4-1  xfce4-terminal-1.0.4-1
                xfsprogs-5.16.0-1  xine-lib-1.2.12-2  xkeyboard-config-2.36-1
                xmlsec-1.2.34-1  xmms2-0.9.1-2  xorg-appres-1.0.6-1
                xorg-bdftopcf-1.1-3  xorg-font-util-1.3.2-3
                xorg-iceauth-1.0.9-1  xorg-mkfontscale-1.2.2-1
                xorg-server-21.1.3-7  xorg-server-common-21.1.3-7
                xorg-server-devel-21.1.3-7  xorg-server-xephyr-21.1.3-7
                xorg-server-xvfb-21.1.3-7  xorg-sessreg-1.1.2-3
                xorg-setxkbmap-1.3.3-1  xorg-xauth-1.1.2-1
                xorg-xbacklight-1.2.3-3  xorg-xcmsdb-1.0.5-4
                xorg-xdpyinfo-1.3.3-4  xorg-xdriinfo-1.0.6-3
                xorg-xgamma-1.0.6-4  xorg-xhost-1.0.8-3  xorg-xinput-1.6.3-3
                xorg-xkill-1.0.5-3  xorg-xlsatoms-1.1.3-3
                xorg-xlsclients-1.1.4-3  xorg-xmessage-1.0.5-3
                xorg-xmodmap-1.0.10-3  xorg-xrefresh-1.0.6-3  xorg-xset-1.2.4-3
                xorg-xsetroot-1.1.2-3  xorg-xvinfo-1.1.4-3
                xorg-xwayland-22.1.2-1  xorg-xwininfo-1.1.5-3
                xorgproto-2022.1-1  xplc-0.3.13-10  xpra-4.2.3-4
                xscreensaver-6.03-1  xterm-372-2  xxhash-0.8.1-2  xz-5.2.5-3
                yarn-1.22.19-1  yasm-1.3.0-5  yay-11.1.2-1  yelp-42.1-2
                yelp-tools-42.0-1  yelp-xsl-42.0-1  yosys-0.12-4
                yt-dlp-2022.05.18-1  zenity-3.42.1-1  zimg-3.0.3-2  zip-3.0-10
                zlib-1:1.2.12-2  zstd-1.5.2-3  zxing-cpp-1.3.0-1

Total Download Size:   15044.66 MiB
Total Installed Size:  57969.10 MiB
Net Upgrade Size:       1899.98 MiB

:: Proceed with installation? [Y/n] 




error: failed to commit transaction (conflicting files)
texlive-core: /usr/share/man/man1/git-latexdiff.1.gz exists in filesystem (owned by git-latexdiff)


python-railroad-diagrams
wireless-regdb
catdoc
qemu-chardev-baum
qemu-docs
qemu-tests
swtpm
libkate-docs
python-trio
python-uvloop
jupyter-server-mathjax
jupyterlab-widgets
qt6-languageserver
python-asgiref
python-uharfbuzz
python-bottleneck
python-fsspec
python-numexpr
python-openpyxl
python-psycopg2
python-pyarrow
python-pymysql
python-pytables
python-snappy
python-sqlalchemy
python-xarray
python-xlrd
python-xlwt
python-zstandard
python-pyqt6-webengine
refind-docs
python-phitigra
topcom
wdiff
MariaDB was updated to a new feature release. To update the data run:
systemctl restart mariadb.service && mariadb-upgrade -u root -p
>>> updmap custom entries should go into /etc/texmf/web2c/updmap-local.cfg
>>> fmtutil custom entries should go into /etc/texmf/web2c/fmtutil-local.cnf
 Updating the appstream cache...
** (appstreamcli:107623): WARNING **: 11:13:57.030: Found icon of unknown type 'unknown' in 'system/flatpak/flatpak/cc.nift.nsm/*', skipping it.

Failed to get unit file state for qemu-ga.service: No such file or directory




yay -S python-railroad-diagrams wireless-regdb catdoc qemu-chardev-baum qemu-docs qemu-tests swtpm libkate-docs python-trio python-uvloop jupyter-server-mathjax jupyterlab-widgets qt6-languageserver python-asgiref python-uharfbuzz python-bottleneck python-fsspec python-numexpr python-openpyxl python-psycopg2 python-pyarrow python-pymysql python-pytables python-snappy python-sqlalchemy python-xarray python-xlrd python-xlwt python-zstandard python-pyqt6-webengine refind-docs python-phitigra topcom wdiff --overwrite=*
yay -R git-latexdiff
yay -S python-pint python-seaborn python-distributed python-dask python-cftime python-netcdf4 python-blosc
yay -S vofa+ picocom planner-git projectlibre projectm-pulseaudio
yay -S udisks2-qt5 python-birdseye python-pgzero thonny testdisk rtl8761usb	qtmpris qtdbusextended xsel python-yarl python-ytmusicapi granite gsettings-qt
yay -S pasystray pavucontrol pavucontrol-qt netease-cloud-music motrix mingw-w64-cmake magnet2torrent-git lshw paprefs libqtxdg libxcrypt-compat
yay -S jython kingstvis jre17-openjdk jre17-openjdk-headless jdk17-openjdk jd-gui-bin ipmitool haskell-unliftio haskell-text-metrics haskell-tf-random haskell-setenv haskell-quickcheck-io haskell-infer-license haskell-hunit haskell-hspec haskell-hspec-core haskell-hspec-discover haskell-hspec-expectations haskell-hpack haskell-clock haskell-call-stack gunicorn gtk-theme-elementary gcc9-fortran ganttproject gambas3-gb-compress freeipmi
yay -S feeluown feeluown-bilibili feeluown-download feeluown-kuwo feeluown-local feeluown-netease feeluown-qqmusic feeluown-ytmusic
yay -S electron14 dtkcommon dtkcore dtkgui dtkwidget dotnet-host dotnet-runtime
yay -S deepin-anything deepin-anything-dkms deepin-desktop-base deepin-music deepin-qt5integration deepin-qt5platform-plugins deepin-qt-dbus-factory deepin-screen-recorder deepin-turbo deepin-wayland bluez-tools blueman blueberry pulsemixer pulseaudio-equalizer-ladspa pulseaudio-equalizer python-bilibili-api python-pytube python-charset-normalizer python-curio python-eventlet python-gevent gtk-engine-murrine python-aiodns python-httplib2
yay -R cbatticon
yay -S cbatticon-git
yay -S glfw-x11 ## glfw-wayland
yay -S python-jdcal python-nose python-olefile python-patsy python-pyvisa python-sphinx_rtd_theme python-pyvisa-py
yay -S python-tensorflow-opt ## python-tensorflow
# yay -S nvidia
yay -S nvidia-dkms nvidia-prime
# yay -S linux-lts-docs # linux-zen / linux-zen-headers
yay -R linux-lts-docs
```


* * *
# update vivado/vitis from 2020.1 to 2020.2 (没有必要)

`sudo gedit /usr/local/bin/vivado`
```
#!/bin/bash
/opt/Xilinx/Vivado/2020.2/bin/vivado
```
`sudo chmod +x /usr/local/bin/vivado`
`sudo gedit /usr/local/bin/vitis`
```
#!/bin/bash
/opt/Xilinx/Vitis/2020.2/bin/vitis 
```
`sudo chmod +x /usr/local/bin/vitis`


***
# pip3修复
```
pip3 --version
broken!
```
```
sudo python3 -m ensurepip --default-pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
pip3 --version
pip 22.1.2 from /usr/lib/python3.10/site-packages/pip (python 3.10)
sudo -H pip3 install -i https://mirrors.163.com/pypi/simple opencv-contrib-python opencv-python
sudo -H pip3 install -i https://mirrors.163.com/pypi/simple alive_progress
```


***
# 全盘更新
```
:: Starting full system upgrade...
:: Replace absl-py with community/python-absl? [Y/n] y
warning: gcc10: local (1:10.3.0-2) is newer than archlinuxcn (10.4.0-1)
warning: gcc10-libs: local (1:10.3.0-2) is newer than archlinuxcn (10.4.0-1)
:: Replace intel-mkl with community/intel-oneapi-mkl? [Y/n] y
:: Replace kwayland-server with extra/kwin? [Y/n] y
:: Replace wxgtk-common with extra/wxwidgets-common? [Y/n] y
:: Replace wxgtk3 with extra/wxwidgets-gtk3? [Y/n] y
resolving dependencies...
looking for conflicting packages...
:: wireplumber and pipewire-media-session are in conflict. Remove pipewire-media-session? [y/N] y
:: python-mistune and python-mistune1 are in conflict. Remove python-mistune1? [y/N] y
error: failed to prepare transaction (could not satisfy dependencies)
:: removing python-mistune1 breaks dependency 'python-mistune1' required by pcbdraw
:: removing wxgtk-common breaks dependency 'wxgtk-common' required by pyuv
:: removing wxgtk-common breaks dependency 'wxgtk-common' required by wxgtk2

pactree -r python-mistune1

:: removing python-mistune1 breaks dependency 'python-mistune1' required by jupyter-nbconvert
:: removing python-mistune1 breaks dependency 'python-mistune1' required by pcbdraw
yay -Rdd python-mistune1
yay -S python-mistune

yay -R wxgtk-common
:: removing wxgtk-common breaks dependency 'wxgtk-common' required by pyuv
:: removing wxgtk-common breaks dependency 'wxgtk-common' required by wxgtk2
:: removing wxgtk-common breaks dependency 'wxgtk-common' required by wxgtk3
yay -Rdd wxgtk-common
yay -S wxwidgets-common

:: Replace intel-mkl with community/intel-oneapi-mkl? [Y/n] y
:: Replace kwayland-server with extra/kwin? [Y/n] y
:: Replace wxgtk3 with extra/wxwidgets-gtk3? [Y/n] y
resolving dependencies...
looking for conflicting packages...
:: wireplumber and pipewire-media-session are in conflict. Remove pipewire-media-session? [y/N] y
yay -R pipewire-media-session
checking dependencies...
error: failed to prepare transaction (could not satisfy dependencies)
:: removing pipewire-media-session breaks dependency 'pipewire-session-manager' required by gst-plugin-pipewire
:: removing pipewire-media-session breaks dependency 'pipewire-session-manager' required by kwin
:: removing pipewire-media-session breaks dependency 'pipewire-session-manager' required by pipewire-alsa
:: removing pipewire-media-session breaks dependency 'pipewire-session-manager' required by pipewire-v4l2
yay -S wireplumber
resolving dependencies...
looking for conflicting packages...
:: wireplumber and pipewire-media-session are in conflict. Remove pipewire-media-session? [y/N] y

yay -S python-absl
[sudo] password for andy: 
resolving dependencies...
looking for conflicting packages...
:: python-absl and absl-py are in conflict. Remove absl-py? [y/N] y

yay -S intel-oneapi-mkl
resolving dependencies...
looking for conflicting packages...
:: intel-oneapi-mkl and intel-mkl are in conflict. Remove intel-mkl? [y/N] y
warning: dependency cycle detected:
warning: intel-oneapi-openmp will be installed before its intel-oneapi-compiler-dpcpp-cpp-runtime dependency

Packages (8) intel-mkl-2020.4.304-1 [removal]  intel-oneapi-common-2022.1.0-3
             intel-oneapi-compiler-dpcpp-cpp-runtime-2022.1.0-7
             intel-oneapi-compiler-shared-runtime-2022.1.0-8
             intel-oneapi-openmp-2022.1.0-8  intel-oneapi-tbb-2021.6.0-4
             level-zero-loader-1.8.1-1  intel-oneapi-mkl-2022.1.0_223-4

yay -S kwin wxwidgets-gtk3 --overwrite=*

yay -S gcc10 gcc10-libs
:: Import PGP key F9F9FA97A403F63E
sudo pacman-key -r F9F9FA97A403F63E
gpg --keyserver keyserver.ubuntu.com --recv-keys F9F9FA97A403F63E

sudo pacman -Syu --overwrite=*


/etc/locale.gen installed as /etc/locale.gen.pacnew
warning: directory permissions differ on /usr/lib/mysql/plugin/auth_pam_tool_dir/
filesystem: 700  package: 755
warning: directory permissions differ on /var/lib/samba/private/
filesystem: 755  package: 700
The Teamviewer daemon must be running for Teamviewer to work.
Execute 'sudo systemctl enable teamviewerd' in a terminal.
(780/793) upgrading virtualbox-ext-oracle                                         [##############################################] 100%
0%...
Progress state: NS_ERROR_FAILURE
VBoxManage: error: Failed to install "/usr/share/virtualbox/extensions/Oracle_VM_VirtualBox_Extension_Pack-7.0.2.vbox-extpack"
VBoxManage: error: Failed to load the main module ('/usr/lib/virtualbox/ExtensionPacks/Oracle_VM_VirtualBox_Extension_Pack/linux.amd64/VBoxPuelMain.so'): VERR_FILE_NOT_FOUND - /usr/lib/virtualbox/ExtensionPacks/Oracle_VM_VirtualBox_Extension_Pack/linux.amd64/VBoxPuelMain.so: undefined symbol: RTUtf16NCmp
VBoxManage: error: Details: code NS_ERROR_FAILURE (0x80004005), component ExtPackManagerWrap, interface IExtPackManager
VBoxManage: error: Context: "RTEXITCODE handleExtPack(HandlerArg*)" at line 1424 of file VBoxManageMisc.cpp
error: command failed to execute correctly

yay -S qt6-speech qemu-user-binfmt python-database-cubic-hecke
```



***
# 安装 jupyter notebook
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
sudo -H pip3 install --upgrade \
                        pip \
                        setuptools \
                        numpy
sudo -H pip3 install tensorflow-probability tensorflow-io-gcs-filesystem commentjson protobuf mxnet
sudo -H pip3 install configure -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install spacy -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install scrapy -i https://mirrors.163.com/pypi/simple
sudo -H pip3 install gluoncv -i https://mirrors.163.com/pypi/simple
```
```
New optional dependencies for python-jsonschema
    python-fqdn: check hostname format
    python-idna: check idn-hostname format [installed]
    python-isoduration: check duration format
    python-jsonpointer: check json-pointer & relative-json-pointer format
    python-rfc3339-validator: check date-time format
    python-rfc3987: for iri, iri-reference, uri & uri-reference format
    python-uri-template: for uri-template format
    python-webcolors: check color format

"/var/lib/postgres/data" is missing or empty. Use a command like
  su - postgres -c "initdb --locale en_US.UTF-8 -D '/var/lib/postgres/data'"
```

***
# pip3 已安装模块快照
```
$ pip3 list
Package                       Version
----------------------------- -------------------
absl-py                       1.3.0
acme                          1.31.0
aiodns                        3.0.0
aiohttp                       3.8.3
aiosignal                     1.2.0
airdrop-ng                    1.1
airgraph-ng                   1.1
alabaster                     0.7.12
alive-progress                1.4.0
ANGRYsearch                   1.0.4
anyio                         3.6.1
anytree                       2.8.0
apipkg                        3.0.1
apparmor                      3.1.1
appdirs                       1.4.4
apsw                          3.38.5.post1
argon2-cffi                   21.3.0
argon2-cffi-bindings          21.2.0
asciinema                     2.2.0
asgiref                       3.5.2
asn1crypto                    1.5.1
astor                         0.8.1
astroid                       2.12.12
asttokens                     2.0.8
astunparse                    1.6.3
async-generator               1.10
async-timeout                 4.0.2
attrs                         22.1.0
AUR                           2021.11.20.2.41.2
autocfg                       0.0.8
autocommand                   2.2.1
Automat                       20.2.0
Babel                         2.10.3
backcall                      0.2.0
bcrypt                        4.0.1
Beaker                        1.11.0
beautifulsoup4                4.11.1
bencoder                      0.2.0
bilibili-api                  9.0.2
black                         22.10.0
bleach                        5.0.1
blis                          0.7.4
blosc                         1.10.6
Bottleneck                    1.3.5
breezy                        3.3.0
Brlapi                        0.8.4
Brotli                        1.0.9
brotlicffi                    1.0.9.2
bs4                           0.0.1
btrfsutil                     6.0
CacheControl                  0.12.11
cached-property               1.5.2
cachetools                    5.2.0
catalogue                     2.0.6
catfish                       4.16.4
cchardet                      2.1.7
ceph                          1.0.0
ceph-volume                   1.0.0
cephfs                        2.0.0
cephfs-shell                  0.0.1
certbot                       1.31.0
certifi                       2022.9.24
cffi                          1.15.1
cftime                        1.6.1
chardet                       4.0.0
charset-normalizer            2.1.1
click                         7.1.2
cloudpickle                   2.1.0
cmd2                          2.4.2
colorama                      0.4.6
commentjson                   0.9.0
ConfigArgParse                1.5.2
configobj                     5.1.0.dev0
configparser                  5.0.2
configure                     0.5
constantly                    15.1.0
contextlib2                   21.6.0
contourpy                     1.0.5
coverage                      6.5.0
crayons                       0.4.0
cryptography                  38.0.1
css-parser                    1.0.7
cssselect                     1.1.0
curio                         1.5
cvxopt                        1.3.0
cycler                        0.11.0
cymem                         2.0.5
cypari2                       2.1.2
cysignals                     1.11.2
Cython                        0.29.32
d2l                           1.0.0a1.post0
dask                          2022.7.1
dblatex                       0.3.12
debugpy                       1.6.3
decorator                     5.1.1
defusedxml                    0.7.1
deluge                        2.1.1
deprecation                   2.1.0
dill                          0.3.5.1
distlib                       0.3.6
distributed                   2022.7.1
distro                        1.7.0
dm-tree                       0.1.7
dnspython                     2.2.1
docker                        6.0.0
docker-pycreds                0.4.0
dockerpty                     0.4.1
docopt                        0.6.2
docstring-to-markdown         0.10
docutils                      0.19
dot2tex                       2.11.3
dulwich                       0.20.46
entrypoints                   0.4
et-xmlfile                    1.1.0
euclid3                       0.1
eventlet                      0.33.1
exceptiongroup                1.0.0rc9
executing                     1.1.1
fastbencode                   0.0.12
fastjsonschema                2.16.2
feedparser                    6.0.10
feeluown                      3.8.8
filelock                      3.8.0
fire                          0.4.0
Flask                         2.2.2
flatbuffers                   22.10.26
flowblade                     2.8.0.3
fonttools                     4.38.0
fpylll                        0.5.7
frozenlist                    1.3.1
fs                            2.4.16
fsspec                        2022.5.0
fuo-bilibili                  0.1.3
fuo-dl                        0.3
fuo-kuwo                      0.1.6
fuo-local                     0.3
fuo-netease                   0.9.2
fuo-qqmusic                   0.4.1
fuo-ytmusic                   0.1.0
future                        0.18.2
fuzzywuzzy                    0.18.0
gast                          0.3.3
GeoIP                         1.3.2
gevent                        22.10.1
gluoncv                       0.10.5.post0
gmpy2                         2.1.2
google-auth                   2.6.2
google-auth-oauthlib          0.5.2
google-pasta                  0.2.0
gps                           3.24
graphviz                      0.8.4
greenlet                      1.1.3
grpcio                        1.50.0
gunicorn                      20.1.0
gym                           0.26.2
gym-notices                   0.0.8
h11                           0.12.0
h2                            3.2.0
h5py                          3.7.0
HeapDict                      1.0.1
hpack                         3.0.0
html2text                     2020.1.16
html5-parser                  0.4.10
html5lib                      1.1
httplib2                      0.20.4
hyperframe                    5.2.0
hyperlink                     21.0.0
idna                          3.4
ifaddr                        0.2.0
igraph                        0.10.2
imageio                       2.22.1
imagesize                     1.4.1
importlib-metadata            5.0.0
incremental                   22.10.0
inflate64                     0.1.3
inflect                       6.0.2
iniconfig                     1.1.1
intel-openmp                  2021.4.0
ipykernel                     6.16.2
ipython                       8.5.0
ipython-genutils              0.2.0
ipywidgets                    8.0.2
isodate                       0.6.1
isort                         5.10.1
itemadapter                   0.4.0
itemloaders                   1.0.4
itsdangerous                  2.1.2
janus                         1.0.0
jaraco.classes                3.2.3
jaraco.context                4.1.2
jaraco.functools              3.5.2
jaraco.text                   3.10.0
jdcal                         1.4.1
jedi                          0.18.1
jedi-language-server          0.37.0
jeepney                       0.8.0
Jinja2                        3.1.2
jmespath                      0.10.0
joblib                        1.2.0
josepy                        1.13.0
json5                         0.9.10
jsonschema                    4.16.0
JuPyMake                      0.9
jupyter                       1.0.0
jupyter_client                7.4.4
jupyter-console               6.4.4
jupyter_core                  4.11.2
jupyter-jsmol                 2022.1.0
jupyter_packaging             0.12.3
jupyter-server                1.21.0
jupyter-server-mathjax        0.2.6
jupyterlab                    3.5.0
jupyterlab-pygments           0.2.2
jupyterlab_server             2.16.1
jupyterlab-widgets            3.0.3
kazam                         1.4.5
keras                         2.10.0
Keras-Applications            1.0.8
Keras-Preprocessing           1.1.2
keyring                       23.9.3
keyutils                      0.6
KiKit                         0.0.0
kiwisolver                    1.4.4
lark                          1.1.3
lark-parser                   0.7.8
lazy-object-proxy             1.8.0
lensfun                       0.3.3
LibAppArmor                   3.1.1
libclang                      12.0.0
libfdt                        1.6.1
libtorrent                    2.0.7
libvirt-python                8.8.0
lit                           14.0.6.dev0
locket                        1.0.0
loguru                        0.5.3
logutils                      0.3.5
louis                         3.23.0
lrcalc                        2.0.0
lxml                          4.9.1
lz4                           3.1.10
Mako                          1.2.3
mallard-ducktype              1.0.2
Markdown                      3.4.1
markdown2                     2.4.3
Markups                       3.1.3
MarkupSafe                    2.1.1
marshmallow                   3.18.0
matplotlib                    3.6.1
matplotlib-inline             0.1.6
mccabe                        0.7.0
mechanize                     0.4.8
MemoizeDB                     2021.11.20.2.41.2
memory-allocator              0.1.3
merge3                        0.0.10
meson                         0.63.3
mistune                       2.0.4
mkl                           2021.4.0
mock                          3.0.5
monotonic                     1.6
more-itertools                9.0.0
MouseInfo                     0.1.3
mpmath                        1.2.1
msgpack                       1.0.4
multidict                     6.0.2
multivolumefile               0.2.3
murmurhash                    1.0.5
mutagen                       1.46.0
mxboard                       0.1.0
mxnet                         1.9.1
mypy                          0.982
mypy-extensions               0.4.3
nautilus-terminal             3.5.0
nbclassic                     0.4.7
nbclient                      0.7.0
nbconvert                     7.2.3
nbformat                      5.7.0
ndg-httpsclient               0.5.1
nest-asyncio                  1.5.6
netCDF4                       1.6.0
netifaces                     0.11.0
netsnmp-python                1.0a1
networkx                      2.8.7
nose                          1.3.7
notebook                      6.5.1
notebook_shim                 0.2.0
notedown                      1.5.1
notify2                       0.3.1
nspektr                       0.4.0
numexpr                       2.8.3
numpy                         1.23.4
oauthlib                      3.2.0
olefile                       0.46
OpenCC                        1.1.4
opencv-contrib-python         4.5.4.58
opencv-python                 4.6.0.66
openpyxl                      3.0.10
opt-einsum                    3.3.0
ordered-set                   4.1.0
outcome                       1.2.0
packaging                     21.3
pandas                        1.4.4
pandoc-attributes             0.1.7
pandocfilters                 1.5.0
paramiko                      2.11.0
parse                         1.19.0
parsedatetime                 2.6
parsel                        1.6.0
parso                         0.8.3
partd                         1.2.0
pathspec                      0.10.1
pathy                         0.6.1
patiencediff                  0.2.6
patsy                         0.5.3
pbr                           5.11.0
PcbDraw                       0.6.1
pcbnewTransition              0.2.0
pdftotext                     2.2.2
pecan                         1.4.2
pep517                        0.13.0
pexpect                       4.8.0
pickleshare                   0.7.5
pilkit                        2.0
Pillow                        9.2.0
Pint                          0.19.2
pip                           22.3
pkgconfig                     1.5.5
platformdirs                  2.5.2
pluggy                        1.0.0
ply                           3.11
portalocker                   2.3.2
pplpy                         0.8.7
preshed                       3.0.5
prettytable                   3.4.1
primecountpy                  0.1.0
priority                      1.3.0
progress                      1.6
prometheus-client             0.15.0
prompt-toolkit                3.0.31
Protego                       0.1.16
protobuf                      4.21.7
psutil                        5.9.3
psycopg2                      2.9.3
ptyprocess                    0.7.0
pulsemixer                    1.5.1
pure-eval                     0.2.2
pwquality                     1.4.4
py                            1.11.0
py7zr                         0.19.0
pyalpm                        0.10.6
pyaml                         21.10.1
pyarrow                       9.0.0
pyasn1                        0.4.8
pyasn1-modules                0.2.8
PyAutoGUI                     0.9.52
pybars3                       0.9.7
pybcj                         1.0.1
pybind11                      2.10.0
pycairo                       1.21.0
pycares                       4.2.2
pychm                         0.8.6
pycocotools                   2.0.5
pycodestyle                   2.9.1
pycosat                       0.6.4
pycparser                     2.21
pycryptodome                  3.15.0
pycryptodomex                 3.12.0
pycryptosat                   5.11.4
pycups                        2.0.1
pycurl                        7.45.1
pydantic                      1.8.2
pydbus                        0.6.0
pydecor                       2.0.1
PyDispatcher                  2.0.5
pydot                         1.4.2
pyecharts                     1.9.0
pyflakes                      2.5.0
pygame                        2.1.2
PyGetWindow                   0.0.9
pyGHDL                        1.0.0
pygls                         0.12.1
Pygments                      2.13.0
PyGObject                     3.42.2
PyHamcrest                    2.0.4
pyinotify                     0.9.6
pylint                        2.14.5
PyMeta3                       0.5.1
PyMsgBox                      1.0.9
PyMySQL                       1.0.2
PyNaCl                        1.4.0
PyNormaliz                    2.17
PyOpenGL                      3.1.6
pyOpenSSL                     22.1.0
pyparsing                     3.0.9
pyperclip                     1.8.2
pypillowfight                 0.3.0
pypng                         0.0.21
pyppmd                        1.0.0
PyQt5                         5.15.7
PyQt5-sip                     12.11.0
PyQt6                         6.4.0
PyQt6-sip                     13.4.0
PyQt6-WebEngine               6.4.0
PyQtWebEngine                 5.15.6
pyquery                       1.4.3
PyRect                        0.1.4
pyRFC3339                     1.1
pyrsistent                    0.19.0
PyScreeze                     0.1.28
pyserial                      3.5
PySide2                       5.15.6
PySide6                       6.4.0.1
PySocks                       1.7.1
pytest                        7.1.3
pytest-runner                 6.0.0
python-dateutil               2.8.2
python-distutils-extra        2.39
python-dotenv                 0.21.0
python-markdown-math          0.8
python-snappy                 0.6.1
python-xlib                   0.31
python3-xlib                  0.15
pytube                        11.0.2
PyTweening                    1.0.3
pytz                          2022.1
pytz-deprecation-shim         0.1.0.post0
pyVHDLModel                   0.12.0
PyVISA                        1.11.3
PyWavelets                    1.4.1
pywebcopy                     6.3.0
pyxdg                         0.28
PyYAML                        6.0
pyzmq                         24.0.1
pyzstd                        0.15.3
qasync                        0.23.0
qrcode                        6.1
qrtools                       2.1
qtconsole                     5.2.2
QtPy                          2.1.0
queuelib                      1.6.2
rados                         2.0.0
railroad-diagrams             2.0.4
ranger-fm                     1.9.3
rbd                           2.0.0
rdflib                        6.2.0
regex                         2022.9.13
rencode                       1.0.6
reportlab                     3.6.11
requests                      2.28.1
requests-oauthlib             1.3.1
requests-toolbelt             0.10.1
requests-unixsocket           0.3.0
resolvelib                    0.8.1
ReText                        7.2.3
retrying                      1.3.3
rgw                           2.0.0
rpm                           4.18.0
rpy2                          3.5.5
rsa                           4.9
s-tui                         1.1.3
sage-numerical-backends-coin  9.0b12
sagemath-standard             9.7
sagenb-export                 3.3
scikit-build                  0.15.0
scikit-image                  0.19.3
scikit-learn                  1.1.2
scipy                         1.9.3
SCons                         4.4.0
scour                         0.38.2
Scrapy                        2.5.1
seaborn                       0.11.2
SecretStorage                 3.3.3
selenium                      4.0.0
selinux                       3.3
Send2Trash                    1.8.0
service-identity              21.1.0
setproctitle                  1.3.1
setuptools                    65.5.0
setuptools-scm                7.0.5
sgmllib3k                     1.0.0
shadowsocks                   3.0.0
Shapely                       1.8.2
shiboken2                     5.15.6
shiboken6                     6.4.0.1
simplejson                    3.17.6
sip                           6.7.2
six                           1.16.0
skorch                        0.12.0
smart-open                    5.2.1
smbus                         1.1
sniffio                       1.3.0
snowballstemmer               2.2.0
solidpython                   1.1.3
sortedcontainers              2.4.0
soupsieve                     2.3.2.post1
spacy                         3.1.4
spacy-legacy                  3.0.8
Sphinx                        5.3.0
sphinx-rtd-theme              1.0.0
sphinxcontrib-applehelp       1.0.2
sphinxcontrib-devhelp         1.0.2
sphinxcontrib-htmlhelp        2.0.0
sphinxcontrib-jsmath          1.0.1
sphinxcontrib-qthelp          1.0.3
sphinxcontrib-serializinghtml 1.1.5
SQLAlchemy                    1.4.42
srsly                         2.4.2
SSSDConfig                    2.8.0
stack-data                    0.5.1
statsmodels                   0.13.2
sympy                         1.11.1
tables                        3.7.0
tabulate                      0.9.0
tbb                           2021.4.0
tblib                         1.7.0
team                          1.0
tensorboard                   2.10.1
tensorboard-data-server       0.7.0a0
tensorboard-plugin-wit        1.8.1
tensorboardX                  2.5.1
tensorflow                    2.10.0
tensorflow-estimator          2.10.0
tensorflow-io-gcs-filesystem  0.27.0
tensorflow-probability        0.18.0
termcolor                     2.0.1
terminado                     0.17.0
testpath                      0.6.0
texttable                     1.6.4
thinc                         8.0.12
threadpoolctl                 3.1.0
tifffile                      2022.10.10
tinycss2                      1.2.1
toml                          0.10.2
tomli                         2.0.1
tomlkit                       0.11.5
toolz                         0.12.0
torch                         1.12.1
torchvision                   0.2.2.post3
tornado                       6.2
tox                           3.26.0
tqdm                          4.64.1
traitlets                     5.5.0
trash-cli                     0.22.8.27
trio                          0.22.0
trio-websocket                0.9.2
trove-classifiers             2022.10.19
Twisted                       22.8.0
typed-ast                     1.5.4
typeguard                     2.13.3
typer                         0.3.2
typing_extensions             4.4.0
tzdata                        2022.5
tzlocal                       4.2
udiskie                       2.4.2
ueberzug                      18.1.9
unicodedata2                  14.0.0
Unidecode                     1.3.6
unrardll                      0.1.5
urllib3                       1.26.12
urwid                         2.1.2
validate                      5.1.0.dev0
validate-pyproject            0.10.1
vboxapi                       1.0
vidcutter                     6.0.5.1
virtualenv                    20.16.6
vtr-xml-utils                 0.0.1
w3lib                         1.22.0
waitress                      2.1.2
Wand                          0.6.10
wasabi                        0.8.2
wcwidth                       0.2.5
webdriver-manager             3.5.2
webencodings                  0.5.1
WebOb                         1.8.7
websocket-client              1.4.1
websockets                    10.3
WebTest                       3.0.0
Werkzeug                      2.2.2
wheel                         0.37.1
widgetsnbextension            4.0.3
wrapt                         1.14.1
wsproto                       1.0.0
wxPython                      4.1.1
xarray                        2022.6.0
XCGF                          2021.11.20.2.41.3
XCPF                          2021.12.24.10.22.41
xdot                          1.2
xlrd                          2.0.1
xlwt                          1.3.0
xpra                          4.3.3
yacs                          0.1.8
yapf                          0.32.0
yarl                          1.8.1
yt-dlp                        2022.10.4
ytmusicapi                    0.21.0
zeroconf                      0.39.1
zict                          2.2.0
zipfile-deflate64             0.2.0
zipp                          3.10.0
zope.component                5.0.1
zope.deferredimport           4.4
zope.deprecation              4.4.0
zope.event                    4.5.0
zope.hookable                 5.2
zope.interface                5.5.0
zope.proxy                    4.5.1
zopfli                        0.2.1
zstandard                     0.18.0
```

```
sudo -H pip3 install --force-reinstall --upgrade torchvision torch
sudo -H pip3 install --force-reinstall --ignore-installed --upgrade d2l==1.0.0a1.post0

tensorboardx 2.5.1 requires protobuf<=3.20.1,>=3.8.0, but you have protobuf 4.21.7 which is incompatible.
sphinx-rtd-theme 1.0.0 requires docutils<0.18, but you have docutils 0.19 which is incompatible.
py7zr 0.19.0 requires pyppmd<0.19.0,>=0.18.1, but you have pyppmd 1.0.0 which is incompatible.
jedi-language-server 0.37.0 requires pydantic<2.0.0,>=1.9.1, but you have pydantic 1.8.2 which is incompatible.
flask 2.2.2 requires click>=8.0, but you have click 7.1.2 which is incompatible.
distributed 2022.7.1 requires tornado<6.2,>=6.0.3, but you have tornado 6.2 which is incompatible.
bilibili-api 9.0.2 requires aiohttp~=3.7.4.post0, but you have aiohttp 3.8.3 which is incompatible.
bilibili-api 9.0.2 requires beautifulsoup4~=4.9.3, but you have beautifulsoup4 4.11.1 which is incompatible.
bilibili-api 9.0.2 requires lxml~=4.6.1, but you have lxml 4.9.1 which is incompatible.
bilibili-api 9.0.2 requires pyyaml~=5.4.1, but you have pyyaml 6.0 which is incompatible.
bilibili-api 9.0.2 requires yarl~=1.6.0, but you have yarl 1.8.1 which is incompatible.

sudo -H pip3 install --force-reinstall --ignore-installed --upgrade tensorflow tensorflow-probability
sudo -H pip3 install --force-reinstall --ignore-installed --upgrade bilibili-api distributed flask inflect pydantic sphinx-rtd-theme jedi-language-server

zeroconf 0.39.1 requires async_timeout>=4.0.1, but you have async-timeout 3.0.1 which is incompatible.
typer 0.3.2 requires click<7.2.0,>=7.1.1, but you have click 8.1.3 which is incompatible.
thinc 8.0.12 requires pydantic!=1.8,!=1.8.1,<1.9.0,>=1.7.4, but you have pydantic 1.10.2 which is incompatible.
tensorflow 2.10.0 requires protobuf<3.20,>=3.9.2, but you have protobuf 4.21.7 which is incompatible.
spacy 3.1.4 requires pydantic!=1.8,!=1.8.1,<1.9.0,>=1.7.4, but you have pydantic 1.10.2 which is incompatible.
py7zr 0.19.0 requires pyppmd<0.19.0,>=0.18.1, but you have pyppmd 1.0.0 which is incompatible.
notebook 6.5.1 requires nbclassic==0.4.5, but you have nbclassic 0.4.7 which is incompatible.
jupyter-client 7.4.4 requires tornado>=6.2, but you have tornado 6.1 which is incompatible.

sudo -H pip3 install --force-reinstall --ignore-installed --upgrade jupyter-client tornado notebook py7zr spacy protobuf thinc typer zeroconf
```
最新的包来自源
<https://pypi.python.org/simple>

```
$ pip3 list
Package                       Version
----------------------------- -------------------
absl-py                       1.3.0
acme                          1.31.0
aiodns                        3.0.0
aiohttp                       3.8.3
aiosignal                     1.2.0
airdrop-ng                    1.1
airgraph-ng                   1.1
alabaster                     0.7.12
alive-progress                1.4.0
ANGRYsearch                   1.0.4
anyio                         3.6.2
anytree                       2.8.0
apipkg                        3.0.1
apparmor                      3.1.1
appdirs                       1.4.4
apsw                          3.38.5.post1
argon2-cffi                   21.3.0
argon2-cffi-bindings          21.2.0
asciinema                     2.2.0
asgiref                       3.5.2
asn1crypto                    1.5.1
astor                         0.8.1
astroid                       2.12.12
asttokens                     2.0.8
astunparse                    1.6.3
async-generator               1.10
async-timeout                 4.0.2
attrs                         22.1.0
AUR                           2021.11.20.2.41.2
autocfg                       0.0.8
autocommand                   2.2.1
Automat                       20.2.0
Babel                         2.10.3
backcall                      0.2.0
bcrypt                        4.0.1
Beaker                        1.11.0
beautifulsoup4                4.11.1
bencoder                      0.2.0
bilibili-api                  9.1.0
black                         22.10.0
bleach                        5.0.1
blis                          0.7.9
blosc                         1.10.6
Bottleneck                    1.3.5
breezy                        3.3.0
Brlapi                        0.8.4
Brotli                        1.0.9
brotlicffi                    1.0.9.2
bs4                           0.0.1
btrfsutil                     6.0
CacheControl                  0.12.11
cached-property               1.5.2
cachetools                    5.2.0
catalogue                     2.0.8
catfish                       4.16.4
cchardet                      2.1.7
ceph                          1.0.0
ceph-volume                   1.0.0
cephfs                        2.0.0
cephfs-shell                  0.0.1
certbot                       1.31.0
certifi                       2022.9.24
cffi                          1.15.1
cftime                        1.6.1
chardet                       4.0.0
charset-normalizer            2.1.1
click                         8.1.3
cloudpickle                   2.2.0
cmd2                          2.4.2
colorama                      0.4.6
commentjson                   0.9.0
confection                    0.0.3
ConfigArgParse                1.5.2
configobj                     5.1.0.dev0
configparser                  5.0.2
configure                     0.5
constantly                    15.1.0
contextlib2                   21.6.0
contourpy                     1.0.5
coverage                      6.5.0
crayons                       0.4.0
cryptography                  38.0.1
css-parser                    1.0.7
cssselect                     1.1.0
curio                         1.5
cvxopt                        1.3.0
cycler                        0.11.0
cymem                         2.0.7
cypari2                       2.1.2
cysignals                     1.11.2
Cython                        0.29.32
d2l                           1.0.0a1.post0
dask                          2022.10.0
dblatex                       0.3.12
debugpy                       1.6.3
decorator                     5.1.1
defusedxml                    0.7.1
deluge                        2.1.1
deprecation                   2.1.0
dill                          0.3.5.1
distlib                       0.3.6
distributed                   2022.10.0
distro                        1.7.0
dm-tree                       0.1.7
dnspython                     2.2.1
docker                        6.0.0
docker-pycreds                0.4.0
dockerpty                     0.4.1
docopt                        0.6.2
docstring-to-markdown         0.10
docutils                      0.19
dot2tex                       2.11.3
dulwich                       0.20.46
entrypoints                   0.4
et-xmlfile                    1.1.0
euclid3                       0.1
eventlet                      0.33.1
exceptiongroup                1.0.0rc9
executing                     1.1.1
fastbencode                   0.0.12
fastjsonschema                2.16.2
feedparser                    6.0.10
feeluown                      3.8.8
filelock                      3.8.0
fire                          0.4.0
Flask                         2.2.2
flatbuffers                   22.10.26
flowblade                     2.8.0.3
fonttools                     4.38.0
fpylll                        0.5.7
frozenlist                    1.3.1
fs                            2.4.16
fsspec                        2022.10.0
fuo-bilibili                  0.1.3
fuo-dl                        0.3
fuo-kuwo                      0.1.6
fuo-local                     0.3
fuo-netease                   0.9.2
fuo-qqmusic                   0.4.1
fuo-ytmusic                   0.1.0
future                        0.18.2
fuzzywuzzy                    0.18.0
gast                          0.4.0
GeoIP                         1.3.2
gevent                        22.10.1
gluoncv                       0.10.5.post0
gmpy2                         2.1.2
google-auth                   2.13.0
google-auth-oauthlib          0.5.2
google-pasta                  0.2.0
gps                           3.24
graphviz                      0.8.4
greenlet                      1.1.3
grpcio                        1.50.0
gunicorn                      20.1.0
gym                           0.26.2
gym-notices                   0.0.8
h11                           0.12.0
h2                            3.2.0
h5py                          3.7.0
HeapDict                      1.0.1
hpack                         3.0.0
html2text                     2020.1.16
html5-parser                  0.4.10
html5lib                      1.1
httplib2                      0.20.4
hyperframe                    5.2.0
hyperlink                     21.0.0
idna                          3.4
ifaddr                        0.2.0
igraph                        0.10.2
imageio                       2.22.1
imagesize                     1.4.1
importlib-metadata            5.0.0
incremental                   22.10.0
inflate64                     0.3.0
inflect                       6.0.2
iniconfig                     1.1.1
intel-openmp                  2021.4.0
ipykernel                     6.16.2
ipython                       8.5.0
ipython-genutils              0.2.0
ipywidgets                    8.0.2
isodate                       0.6.1
isort                         5.10.1
itemadapter                   0.4.0
itemloaders                   1.0.4
itsdangerous                  2.1.2
janus                         1.0.0
jaraco.classes                3.2.3
jaraco.context                4.1.2
jaraco.functools              3.5.2
jaraco.text                   3.10.0
jdcal                         1.4.1
jedi                          0.18.1
jedi-language-server          0.38.0
jeepney                       0.8.0
Jinja2                        3.1.2
jmespath                      0.10.0
joblib                        1.2.0
josepy                        1.13.0
json5                         0.9.10
jsonschema                    4.16.0
JuPyMake                      0.9
jupyter                       1.0.0
jupyter_client                7.4.4
jupyter-console               6.4.4
jupyter_core                  4.11.2
jupyter-jsmol                 2022.1.0
jupyter_packaging             0.12.3
jupyter-server                1.21.0
jupyter-server-mathjax        0.2.6
jupyterlab                    3.5.0
jupyterlab-pygments           0.2.2
jupyterlab_server             2.16.1
jupyterlab-widgets            3.0.3
kazam                         1.4.5
keras                         2.10.0
Keras-Applications            1.0.8
Keras-Preprocessing           1.1.2
keyring                       23.9.3
keyutils                      0.6
KiKit                         0.0.0
kiwisolver                    1.4.4
langcodes                     3.3.0
lark                          1.1.3
lark-parser                   0.7.8
lazy-object-proxy             1.8.0
lensfun                       0.3.3
LibAppArmor                   3.1.1
libclang                      14.0.6
libfdt                        1.6.1
libtorrent                    2.0.7
libvirt-python                8.8.0
lit                           14.0.6.dev0
locket                        1.0.0
loguru                        0.5.3
logutils                      0.3.5
louis                         3.23.0
lrcalc                        2.0.0
lxml                          4.9.1
lz4                           3.1.10
Mako                          1.2.3
mallard-ducktype              1.0.2
Markdown                      3.4.1
markdown2                     2.4.3
Markups                       3.1.3
MarkupSafe                    2.1.1
marshmallow                   3.18.0
matplotlib                    3.6.1
matplotlib-inline             0.1.6
mccabe                        0.7.0
mechanize                     0.4.8
MemoizeDB                     2021.11.20.2.41.2
memory-allocator              0.1.3
merge3                        0.0.10
meson                         0.63.3
mistune                       2.0.4
mkl                           2021.4.0
mock                          3.0.5
monotonic                     1.6
more-itertools                9.0.0
MouseInfo                     0.1.3
mpmath                        1.2.1
msgpack                       1.0.4
multidict                     6.0.2
multivolumefile               0.2.3
murmurhash                    1.0.9
mutagen                       1.46.0
mxboard                       0.1.0
mxnet                         1.9.1
mypy                          0.982
mypy-extensions               0.4.3
nautilus-terminal             3.5.0
nbclassic                     0.4.7
nbclient                      0.7.0
nbconvert                     7.2.3
nbformat                      5.7.0
ndg-httpsclient               0.5.1
nest-asyncio                  1.5.6
netCDF4                       1.6.0
netifaces                     0.11.0
netsnmp-python                1.0a1
networkx                      2.8.7
nose                          1.3.7
notebook                      6.5.1
notebook_shim                 0.2.0
notedown                      1.5.1
notify2                       0.3.1
nspektr                       0.4.0
numexpr                       2.8.3
numpy                         1.23.4
oauthlib                      3.2.2
olefile                       0.46
OpenCC                        1.1.4
opencv-contrib-python         4.5.4.58
opencv-python                 4.6.0.66
openpyxl                      3.0.10
opt-einsum                    3.3.0
ordered-set                   4.1.0
outcome                       1.2.0
packaging                     21.3
pandas                        1.5.1
pandoc-attributes             0.1.7
pandocfilters                 1.5.0
paramiko                      2.11.0
parse                         1.19.0
parsedatetime                 2.6
parsel                        1.6.0
parso                         0.8.3
partd                         1.3.0
pathspec                      0.10.1
pathy                         0.6.2
patiencediff                  0.2.6
patsy                         0.5.3
pbr                           5.11.0
PcbDraw                       0.6.1
pcbnewTransition              0.2.0
pdftotext                     2.2.2
pecan                         1.4.2
pep517                        0.13.0
pexpect                       4.8.0
pickleshare                   0.7.5
pilkit                        2.0
Pillow                        9.2.0
Pint                          0.19.2
pip                           22.3
pkgconfig                     1.5.5
platformdirs                  2.5.2
pluggy                        1.0.0
ply                           3.11
portalocker                   2.3.2
pplpy                         0.8.7
preshed                       3.0.8
prettytable                   3.4.1
primecountpy                  0.1.0
priority                      1.3.0
progress                      1.6
prometheus-client             0.15.0
prompt-toolkit                3.0.31
Protego                       0.1.16
protobuf                      4.21.9
psutil                        5.9.3
psycopg2                      2.9.3
ptyprocess                    0.7.0
pulsemixer                    1.5.1
pure-eval                     0.2.2
pwquality                     1.4.4
py                            1.11.0
py7zr                         0.20.0
pyalpm                        0.10.6
pyaml                         21.10.1
pyarrow                       9.0.0
pyasn1                        0.4.8
pyasn1-modules                0.2.8
PyAutoGUI                     0.9.52
pybars3                       0.9.7
pybcj                         1.0.1
pybind11                      2.10.0
pycairo                       1.21.0
pycares                       4.2.2
pychm                         0.8.6
pycocotools                   2.0.5
pycodestyle                   2.9.1
pycosat                       0.6.4
pycparser                     2.21
pycryptodome                  3.15.0
pycryptodomex                 3.15.0
pycryptosat                   5.11.4
pycups                        2.0.1
pycurl                        7.45.1
pydantic                      1.10.2
pydbus                        0.6.0
pydecor                       2.0.1
PyDispatcher                  2.0.5
pydot                         1.4.2
pyecharts                     1.9.0
pyflakes                      2.5.0
pygame                        2.1.2
PyGetWindow                   0.0.9
pyGHDL                        1.0.0
pygls                         0.12.4
Pygments                      2.13.0
PyGObject                     3.42.2
PyHamcrest                    2.0.4
pyinotify                     0.9.6
pylint                        2.14.5
PyMeta3                       0.5.1
PyMsgBox                      1.0.9
PyMySQL                       1.0.2
PyNaCl                        1.4.0
PyNormaliz                    2.17
PyOpenGL                      3.1.6
pyOpenSSL                     22.1.0
pyparsing                     3.0.9
pyperclip                     1.8.2
pypillowfight                 0.3.0
pypng                         0.0.21
pyppmd                        1.0.0
PyQt5                         5.15.7
PyQt5-sip                     12.11.0
PyQt6                         6.4.0
PyQt6-sip                     13.4.0
PyQt6-WebEngine               6.4.0
PyQtWebEngine                 5.15.6
pyquery                       1.4.3
PyRect                        0.1.4
pyRFC3339                     1.1
pyrsistent                    0.19.0
PyScreeze                     0.1.28
pyserial                      3.5
PySide2                       5.15.6
PySide6                       6.4.0.1
PySocks                       1.7.1
pytest                        7.1.3
pytest-runner                 6.0.0
python-dateutil               2.8.2
python-distutils-extra        2.39
python-dotenv                 0.21.0
python-markdown-math          0.8
python-snappy                 0.6.1
python-xlib                   0.31
python3-xlib                  0.15
pytube                        11.0.2
PyTweening                    1.0.3
pytz                          2022.5
pytz-deprecation-shim         0.1.0.post0
pyVHDLModel                   0.12.0
PyVISA                        1.11.3
PyWavelets                    1.4.1
pywebcopy                     6.3.0
pyxdg                         0.28
PyYAML                        6.0
pyzmq                         24.0.1
pyzstd                        0.15.3
qasync                        0.23.0
qrcode                        6.1
qrtools                       2.1
qtconsole                     5.3.2
QtPy                          2.2.1
queuelib                      1.6.2
rados                         2.0.0
railroad-diagrams             2.0.4
ranger-fm                     1.9.3
rbd                           2.0.0
rdflib                        6.2.0
regex                         2022.9.13
rencode                       1.0.6
reportlab                     3.6.11
requests                      2.28.1
requests-oauthlib             1.3.1
requests-toolbelt             0.10.1
requests-unixsocket           0.3.0
resolvelib                    0.8.1
ReText                        7.2.3
retrying                      1.3.3
rgw                           2.0.0
rpm                           4.18.0
rpy2                          3.5.5
rsa                           4.9
s-tui                         1.1.3
sage-numerical-backends-coin  9.0b12
sagemath-standard             9.7
sagenb-export                 3.3
scikit-build                  0.15.0
scikit-image                  0.19.3
scikit-learn                  1.1.2
scipy                         1.9.3
SCons                         4.4.0
scour                         0.38.2
Scrapy                        2.5.1
seaborn                       0.11.2
SecretStorage                 3.3.3
selenium                      4.0.0
selinux                       3.3
Send2Trash                    1.8.0
service-identity              21.1.0
setproctitle                  1.3.1
setuptools                    65.5.0
setuptools-scm                7.0.5
sgmllib3k                     1.0.0
shadowsocks                   3.0.0
Shapely                       1.8.2
shiboken2                     5.15.6
shiboken6                     6.4.0.1
simplejson                    3.17.6
sip                           6.7.2
six                           1.16.0
skorch                        0.12.0
smart-open                    5.2.1
smbus                         1.1
sniffio                       1.3.0
snowballstemmer               2.2.0
solidpython                   1.1.3
sortedcontainers              2.4.0
soupsieve                     2.3.2.post1
spacy                         3.4.2
spacy-legacy                  3.0.10
spacy-loggers                 1.0.3
Sphinx                        5.3.0
sphinx-rtd-theme              1.0.0
sphinxcontrib-applehelp       1.0.2
sphinxcontrib-devhelp         1.0.2
sphinxcontrib-htmlhelp        2.0.0
sphinxcontrib-jsmath          1.0.1
sphinxcontrib-qthelp          1.0.3
sphinxcontrib-serializinghtml 1.1.5
SQLAlchemy                    1.4.42
srsly                         2.4.5
SSSDConfig                    2.8.0
stack-data                    0.5.1
statsmodels                   0.13.2
sympy                         1.11.1
tables                        3.7.0
tabulate                      0.9.0
tbb                           2021.4.0
tblib                         1.7.0
team                          1.0
tensorboard                   2.10.1
tensorboard-data-server       0.7.0a0
tensorboard-plugin-wit        1.8.1
tensorboardX                  2.5.1
tensorflow                    2.10.0
tensorflow-estimator          2.10.0
tensorflow-io-gcs-filesystem  0.27.0
tensorflow-probability        0.18.0
termcolor                     2.0.1
terminado                     0.17.0
testpath                      0.6.0
texttable                     1.6.4
thinc                         8.1.5
threadpoolctl                 3.1.0
tifffile                      2022.10.10
tinycss2                      1.2.1
toml                          0.10.2
tomli                         2.0.1
tomlkit                       0.11.5
toolz                         0.12.0
torch                         1.12.1
torchvision                   0.13.1
tornado                       6.2
tox                           3.26.0
tqdm                          4.64.1
traitlets                     5.5.0
trash-cli                     0.22.8.27
trio                          0.22.0
trio-websocket                0.9.2
trove-classifiers             2022.10.19
Twisted                       22.8.0
typed-ast                     1.5.4
typeguard                     2.13.3
typer                         0.4.2
typing_extensions             4.4.0
tzdata                        2022.5
tzlocal                       4.2
udiskie                       2.4.2
ueberzug                      18.1.9
unicodedata2                  14.0.0
Unidecode                     1.3.6
unrardll                      0.1.5
urllib3                       1.26.12
urwid                         2.1.2
validate                      5.1.0.dev0
validate-pyproject            0.10.1
vboxapi                       1.0
vidcutter                     6.0.5.1
virtualenv                    20.16.6
vtr-xml-utils                 0.0.1
w3lib                         1.22.0
waitress                      2.1.2
Wand                          0.6.10
wasabi                        0.10.1
wcwidth                       0.2.5
webdriver-manager             3.5.2
webencodings                  0.5.1
WebOb                         1.8.7
websocket-client              1.4.1
websockets                    10.3
WebTest                       3.0.0
Werkzeug                      2.2.2
wheel                         0.37.1
widgetsnbextension            4.0.3
wrapt                         1.14.1
wsproto                       1.0.0
wxPython                      4.1.1
xarray                        2022.6.0
XCGF                          2021.11.20.2.41.3
XCPF                          2021.12.24.10.22.41
xdot                          1.2
xlrd                          2.0.1
xlwt                          1.3.0
xpra                          4.3.3
yacs                          0.1.8
yapf                          0.32.0
yarl                          1.8.1
yt-dlp                        2022.10.4
ytmusicapi                    0.21.0
zeroconf                      0.39.3
zict                          2.2.0
zipfile-deflate64             0.2.0
zipp                          3.10.0
zope.component                5.0.1
zope.deferredimport           4.4
zope.deprecation              4.4.0
zope.event                    4.5.0
zope.hookable                 5.2
zope.interface                5.5.0
zope.proxy                    4.5.1
zopfli                        0.2.1
zstandard                     0.18.0
```


* * *
# 安装 anaconda
```
$ yay -S anaconda fish
```
Suppose that we have this line in ~/.bashrc or ~/.zshrc or etc.

[ -f /opt/anaconda/etc/profile.d/conda.sh ] && source /opt/anaconda/etc/profile.d/conda.sh
Before to upgrade I comment this line.
Upgrade the package as usual.
Uncomment the line.

```
$ conda config --set show_channel_urls yes
```

激活base环境
$ source /opt/anaconda/bin/activate root
or
$ conda activate root
(base) andy@archlinux ~
初始化fish prompt
$ conda init fish
关闭base环境
$ conda deactivate

bash环境变量(还是手动加载为好)
```
$ source /opt/anaconda/bin/activate  [这句就是手动加载]
(base) andy@archlinux ~
$ conda init
```
在.bashrc添加了[abort]
```
# [ -f /opt/anaconda/etc/profile.d/conda.sh ] && source /opt/anaconda/etc/profile.d/conda.sh
或者
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
```

创建运行环境
```
$ conda create --name python3.10 python=3.10
$ conda activate python3.10
$ conda env list
```
实际位置在
/home/andy/.conda/envs


在运行环境安装常用的一些模块
```
conda install mxnet jupyter pandas numpy matplotlib matplotlib-inline requests pandas pyqt pyqt5-sip
或升级模块
conda update mxnet jupyter pandas numpy matplotlib matplotlib-inline requests pandas pyqt pyqt5-sip

conda install -c conda-forge gym
```

升级base环境模块
```
$ su
# source /opt/anaconda/bin/activate root
# conda upgrade --all
```


***
# something
```
yay -S bash-language-server libcamera-tools libcamera-docs gst-plugin-libcamera shellcheck
yay -S python-fqdn python-isoduration python-rfc3339-validator python-webcolors python-jsonpointer python-fastnumbers python-pyicu python-installer python-build xfce4-dev-tools
```
`yay -S v2x-git`
`makepkg -si`
```
报错
  -> Creating working copy of python-symbiflow-v2x git repo...
fatal: invalid reference: origin/HEAD
```
对比正常clone出来的repo

发现默认branch名字为master而不是main，但应该是main

那么在PKGBUILD指定brach

makepkg应退出conda环境, 例如speedometer

```
You must run at least once "debtap -u"
with root privileges (preferably recently),
before running this script
==> Syntax: debtap [option] package_filename
==> Run "debtap -h" for help

The schema file has been installed as: /etc/xdg/obmenu-generator/schema.pl
```
```
yay -S bcompare bcompare-cinnamon bcompare-kde4 bcompare-kde5 bcompare-mate bcompare-nautilus bcompare-thunar
NOTE: It is necessary to enable 'File Manager Integration' under 'Tools' -> 'Options' from Beyond Compare interface.

yay -S python-flup python-memcached python-oauth2client erlang-unixodbc rabbitmqadmin lksctp-tools python-gflags

:: mono-msbuild and msbuild-stable are in conflict (msbuild). Remove msbuild-stable? [y/N]
```

***
# npm node 更新
```
$ sudo npm --help
node: error while loading shared libraries: libicui18n.so.71: cannot open shared object file: No such file or directory
$ yay -S node   //而不是nodejs-lts-erbium
$ yay -S ax25-tools soundmodem
```
从 <https://archive.archlinux.org/packages/n/nodejs-lts-erbium/> 下载 `nodejs-lts-erbium-12.22.11-1-x86_64.pkg.tar.zst`
```
yay -S nodejs-lts-erbium
yay -Rdd nodejs-lts-erbium
yay -Rdd node
yay -R npm
yay -R node-gyp
yay -R nodejs-nopt
```
```
yay -S nodejs npm
nodejs-lts-gallium>nodejs-lts-fermium
```

***
# cron 计划任务 [更新的办法是systemd]
```
//yay -S fcron
yay -S cronie kcron 
```
```
gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys F9F9FA97A403F63E
sudo pacman-key --keyserver hkp://keyserver.ubuntu.com:80 -r F9F9FA97A403F63E
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9A2FD067A2E3EF7B
curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
curl -sSL https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x83f817213361bf5f02e7e124f9f9fa97a403f63e | gpg --import -
```

***
# baidunetdisk 修复
```
$ baidunetdisk 
electron11: error while loading shared libraries: libicui18n.so.71: cannot open shared object file: No such file or directory
```
```
yay -S electron11-bin
::electron11-bin and electron11 are in conflict. Remove electron11? [y/N] y
```



***
# 准备放弃arch

越来越没有精力和时间处理滚动升级的各种问题，而且长期使用下来每次需要进行大量更新，更新周期也逐渐拉长，遗留大量aur包未更新。

准备存档后就使用ubuntu，两年一次大升级就可以。

考虑虚拟机里弄个最简化的arch，arch的好处就是软件真新，aur提供的选择真多。

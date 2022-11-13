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
~~~非桌面环境 里的环境变量改成如下的值~~~：
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




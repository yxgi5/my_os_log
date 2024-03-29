***
# source.list
/etc/apt/source.list
```
deb http://mirrors.163.com/ubuntu/ xenial main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ xenial-security main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ xenial-updates main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ xenial-proposed main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ xenial main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ xenial-security main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ xenial-updates main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ xenial-proposed main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ xenial-backports main restricted universe multiverse
deb http://archive.canonical.com/ubuntu/ xenial partner
deb-src http://archive.canonical.com/ubuntu/ xenial partner
deb http://security.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse
deb-src http://security.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse
```
```
$ sudo apt-get update
$ sudo apt-get upgrade
```
如果163源不好使，改成cn.archive


***
# 安装好之后连接无线网络wpa2
<https://wiki.archlinux.org/index.php/WPA_supplicant_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>
```
$ iwconfig
```
初始化root密码
```
$ sudo passwd root
```
注意: 由于存在进程替换, 这个命令不能带着 sudo 执行, 必须切换到 root 身份, 否则会报错
```
# wpa_supplicant -B -i interface -c <(wpa_passphrase MYSSID passphrase)
Successfully initialized wpa_supplicant
Failed to open config file '/dev/fd/63', error: No such file or directory
Failed to read or parse configuration '/dev/fd/63'
```
```
# wpa_supplicant -B -i wlp2s0 -c <(wpa_passphrase qijiu wuxiqijiu)
$ iwconfig	## 可以看到有信号强度
$ sudo dhclient	## 找不到dhcpcd命令 不然就用 # dhcpcd interface
$ ifconfig -a 	## 可以开到分配好了ip等
```


* * *
# 修改开机时间为3s
```
mod /boot/grub/grub.cfg  0s to 3s
```

* * *
# HOME目录下默认路径名称有关的配置文件
.config/user-dirs.dirs
/etc/xdg/user-dirs.conf
/etc/xdg/user-dirs.defaults

$(XDG_CONFIG_HOME)/user-dirs.dirs (XDG_CONFIG_HOME defaults to ~/.config)


* * *
# 默认的中文路径改成英文路径
不保留原来名字
```
export LANG=en_US
xdg-user-dirs-gtk-update
```
保留原来名字
```
export LANG=zh_CN.UTF-8
xdg-user-dirs-gtk-update
```


* * *
# 检测硬件信息的工具
```
sudo apt-get install aptitude inxi
inxi -Fxz
rfkill list
rfkill list all
sudo lshw -class network
sudo lspci -v | grep Wireless
sudo lsusb
lspci -nnk | grep -i net -A2
dmesg | grep -i firmware
```

```
sudo apt-get install ndiswrapper
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  dkms ndiswrapper-dkms
建议安装：
  ndiswrapper-source
下列【新】软件包将被安装：
  dkms ndiswrapper ndiswrapper-dkms
升级了 0 个软件包，新安装了 3 个软件包，要卸载 0 个软件包，有 205 个软件包未被升级。
需要下载 227 kB 的归档。
解压缩后会消耗 1,110 kB 的额外空间。
```

```
ndiswrapper -l
sudo apt-get purge dkms ndiswrapper ndiswrapper-dkms

sudo apt-get install dpkg-dev build-essential
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
build-essential 已经是最新版 (12.1ubuntu2)。
建议安装：
  debian-keyring
下列软件包将被升级：
  dpkg-dev libdpkg-perl
升级了 2 个软件包，新安装了 0 个软件包，要卸载 0 个软件包，有 204 个软件包未被升级。
需要下载 0 B/779 kB 的归档。
解压缩后会消耗 0 B 的额外空间。
```


* * *
# 无线网卡驱动问题解决 #
==升级内核到 4.14.1-041401==
uname -sr
http://kernel.ubuntu.com/~kernel-ppa/mainline/
先安装header all
然后安装header
最后是image

==安装rtl8821ce的驱动==
git原地址（rtl8821CE）：https://github.com/endlessm/linux/tree/master/drivers/net/wireless/rtl8821ce
git原地址（rtl8723de）：https://github.com/endlessm/linux/tree/master/drivers/net/wireless/rtl8723de
或者本地下载 https://free-1253146430.cos.ap-shanghai.myqcloud.com/rtl8821ce.zip
https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/endlessm/linux/tree/master/drivers/net/wireless/rtl8821ce


修改makefile的topdir为存放的绝对路径，不要用$(PWD)
```
make
sudo make install
sudo modprobe -a 8821ce
```


* * *
# 安装gvim #
```
sudo apt-get install vim ctags vim-doc vim-scripts vim-gnome-py2 cscope
sudo apt install vim ctags vim-doc vim-scripts exuberant-ctags libtemplate-perl ispell vim-addon-manager cscope
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
注意，选中 'exuberant-ctags' 而非 'ctags'
exuberant-ctags 已经是最新版 (1:5.9~svn20110310-11)。
cscope 已经是最新版 (15.8b-1build1)。
vim-addon-manager 已经是最新版 (0.5.5)。
vim-addon-manager 已设置为手动安装。
vim-scripts 已经是最新版 (20130814ubuntu1)。
vim 已经是最新版 (2:7.4.1689-3ubuntu1.2)。
vim-doc 已经是最新版 (2:7.4.1689-3ubuntu1.2)。
将会同时安装下列软件：
  iamerican ienglish-common libappconfig-perl
建议安装：
  spell libtemplate-perl-doc libtemplate-plugin-gd-perl
  libtemplate-plugin-xml-perl
下列【新】软件包将被安装：
  iamerican ienglish-common ispell libappconfig-perl libtemplate-perl
升级了 0 个软件包，新安装了 5 个软件包，要卸载 0 个软件包，有 206 个软件包未被升级。
需要下载 914 kB 的归档。
解压缩后会消耗 2,347 kB 的额外空间。

sudo update-alternatives --config editor
select 3, vim.basic
```


* * *
# 安装google拼音 #
sudo apt-get install fcitx-googlepinyin
fcitx fcitx-bin fcitx-data fcitx-modules fcitx-googlepinyin fcitx-config-gtk fcitx-frontend-gtk fcitx-ui-classic fcitx-module-dbus ?


* * *
# 安装一些来自dvsdk文档要求的常用工具 #
```
sudo apt-get install fakeroot pkg-config

sudo apt-get install xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev u-boot-tools autoconf automake tree git-core subversion
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
build-essential 已经是最新版 (12.1ubuntu2)。
git-core 已经是最新版 (1:2.7.4-0ubuntu1.4)。
git-core 已设置为手动安装。
subversion 已经是最新版 (1.9.3-2ubuntu1.1)。
subversion 已设置为手动安装。
将会同时安装下列软件：
  keyutils libnfsidmap2 libtinfo-dev libtirpc1 lrzsz m4 nfs-common rpcbind
建议安装：
  autoconf-archive gnu-standards autoconf-doc ncurses-doc open-iscsi watchdog
下列【新】软件包将被安装：
  autoconf automake keyutils libncurses5-dev libnfsidmap2 libtinfo-dev
  libtirpc1 lrzsz m4 minicom nfs-common nfs-kernel-server rpcbind tftpd tree
  u-boot-tools xinetd

sudo apt-get install git git-gui git-svn git-doc 
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
git 已经是最新版 (1:2.7.4-0ubuntu1.4)。
将会同时安装下列软件：
  gitk libsvn-perl libterm-readkey-perl libyaml-perl
建议安装：
  git-arch git-cvs git-email gitweb libyaml-shell-perl
下列【新】软件包将被安装：
  git-doc git-gui git-svn gitk libsvn-perl libterm-readkey-perl libyaml-perl
升级了 0 个软件包，新安装了 7 个软件包，要卸载 0 个软件包，有 206 个软件包未被升级。
需要下载 2,235 kB 的归档。
解压缩后会消耗 20.2 MB 的额外空间。

$ sudo apt-get autoremove
$ git config --global user.name "Andreas Zhang"
$ git config --global user.email denglitsch@gmail.com
$ git config --global user.name
Andreas Zhang
$ git config --global user.email
denglitsch@gmail.com
$ vim ~/.gitconfig
$ sudo apt-get install subversion subversion-tools rapidsvn
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
subversion 已经是最新版 (1.9.3-2ubuntu1.1)。
将会同时安装下列软件：
  exim4 exim4-base exim4-config exim4-daemon-light libconfig-inifiles-perl
  libsvncpp3 python-subversion s-nail ssh-askpass
建议安装：
  eximon4 exim4-doc-html | exim4-doc-info spf-tools-perl swaks
  python-subversion-dbg ruby-svn svn2cl
下列【新】软件包将被安装：
  exim4 exim4-base exim4-config exim4-daemon-light libconfig-inifiles-perl
  libsvncpp3 python-subversion rapidsvn s-nail ssh-askpass subversion-tools
升级了 0 个软件包，新安装了 11 个软件包，要卸载 0 个软件包，有 206 个软件包未被升级。
需要下载 3,264 kB 的归档。
解压缩后会消耗 12.0 MB 的额外空间。
```

~/.gitconfig
```
[user]
	name = Andreas Zhang
	email = denglitsch@gmail.com
[core]
	autocrlf = false
	longpaths = true
[diff]
	tool = meld
[merge]
	tool = meld

```


* * *
# 安装一些ridgerun SDK要求的常用工具 #
```
sudo apt-get install curl texinfo quilt dc libcrypt-ssleay-perl ccache quilt libusb-dev libexpect-perl mono-devel libgtk2.0-dev
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
dc 已经是最新版 (1.06.95-9build1)。
curl 已经是最新版 (7.47.0-1ubuntu2.8)。
curl 已设置为手动安装。
libgtk2.0-dev 已经是最新版 (2.24.30-1ubuntu1.16.04.2)。
libgtk2.0-dev 已设置为手动安装。
将会同时安装下列软件：
  ca-certificates-mono cli-common libbytes-random-secure-perl
  libcrypt-random-seed-perl libgdiplus libio-stty-perl
  libmath-random-isaac-perl libmath-random-isaac-xs-perl libmono-2.0-dev
  libmono-accessibility4.0-cil libmono-c5-1.1-cil libmono-cairo4.0-cil
  libmono-cecil-private-cil libmono-cil-dev libmono-codecontracts4.0-cil
  libmono-compilerservices-symbolwriter4.0-cil libmono-corlib4.5-cil
  libmono-cscompmgd0.0-cil libmono-csharp4.0c-cil
  libmono-custommarshalers4.0-cil libmono-data-tds4.0-cil libmono-db2-1.0-cil
  libmono-debugger-soft4.0a-cil libmono-http4.0-cil libmono-i18n-cjk4.0-cil
  libmono-i18n-mideast4.0-cil libmono-i18n-other4.0-cil
  libmono-i18n-rare4.0-cil libmono-i18n-west4.0-cil libmono-i18n4.0-all
  libmono-i18n4.0-cil libmono-ldap4.0-cil libmono-management4.0-cil
  libmono-messaging-rabbitmq4.0-cil libmono-messaging4.0-cil
  libmono-microsoft-build-engine4.0-cil
  libmono-microsoft-build-framework4.0-cil
  libmono-microsoft-build-tasks-v4.0-4.0-cil
  libmono-microsoft-build-utilities-v4.0-4.0-cil
  libmono-microsoft-build4.0-cil libmono-microsoft-csharp4.0-cil
  libmono-microsoft-visualc10.0-cil
  libmono-microsoft-web-infrastructure1.0-cil libmono-oracle4.0-cil
  libmono-parallel4.0-cil libmono-peapi4.0a-cil libmono-posix4.0-cil
  libmono-rabbitmq4.0-cil libmono-relaxng4.0-cil libmono-security4.0-cil
  libmono-sharpzip4.84-cil libmono-simd4.0-cil libmono-smdiagnostics0.0-cil
  libmono-sqlite4.0-cil libmono-system-componentmodel-composition4.0-cil
  libmono-system-componentmodel-dataannotations4.0-cil
  libmono-system-configuration-install4.0-cil
  libmono-system-configuration4.0-cil libmono-system-core4.0-cil
  libmono-system-data-datasetextensions4.0-cil
  libmono-system-data-entity4.0-cil libmono-system-data-linq4.0-cil
  libmono-system-data-services-client4.0-cil
  libmono-system-data-services4.0-cil libmono-system-data4.0-cil
  libmono-system-design4.0-cil libmono-system-drawing-design4.0-cil
  libmono-system-drawing4.0-cil libmono-system-dynamic4.0-cil
  libmono-system-enterpriseservices4.0-cil
  libmono-system-identitymodel-selectors4.0-cil
  libmono-system-identitymodel4.0-cil
  libmono-system-io-compression-filesystem4.0-cil
  libmono-system-io-compression4.0-cil libmono-system-json-microsoft4.0-cil
  libmono-system-json4.0-cil libmono-system-ldap-protocols4.0-cil
  libmono-system-ldap4.0-cil libmono-system-management4.0-cil
  libmono-system-messaging4.0-cil libmono-system-net-http-formatting4.0-cil
  libmono-system-net-http-webrequest4.0-cil libmono-system-net-http4.0-cil
  libmono-system-net4.0-cil libmono-system-numerics4.0-cil
  libmono-system-reactive-core2.2-cil libmono-system-reactive-debugger2.2-cil
  libmono-system-reactive-experimental2.2-cil
  libmono-system-reactive-interfaces2.2-cil
  libmono-system-reactive-linq2.2-cil
  libmono-system-reactive-observable-aliases0.0-cil
  libmono-system-reactive-platformservices2.2-cil
  libmono-system-reactive-providers2.2-cil
  libmono-system-reactive-runtime-remoting2.2-cil
  libmono-system-reactive-windows-forms2.2-cil
  libmono-system-reactive-windows-threading2.2-cil
  libmono-system-runtime-caching4.0-cil
  libmono-system-runtime-durableinstancing4.0-cil
  libmono-system-runtime-serialization-formatters-soap4.0-cil
  libmono-system-runtime-serialization4.0-cil libmono-system-runtime4.0-cil
  libmono-system-security4.0-cil libmono-system-servicemodel-activation4.0-cil
  libmono-system-servicemodel-discovery4.0-cil
  libmono-system-servicemodel-internals0.0-cil
  libmono-system-servicemodel-routing4.0-cil
  libmono-system-servicemodel-web4.0-cil libmono-system-servicemodel4.0a-cil
  libmono-system-serviceprocess4.0-cil
  libmono-system-threading-tasks-dataflow4.0-cil
  libmono-system-transactions4.0-cil libmono-system-web-abstractions4.0-cil
  libmono-system-web-applicationservices4.0-cil
  libmono-system-web-dynamicdata4.0-cil
  libmono-system-web-extensions-design4.0-cil
  libmono-system-web-extensions4.0-cil libmono-system-web-http-selfhost4.0-cil
  libmono-system-web-http-webhost4.0-cil libmono-system-web-http4.0-cil
  libmono-system-web-mvc3.0-cil libmono-system-web-razor2.0-cil
  libmono-system-web-routing4.0-cil libmono-system-web-services4.0-cil
  libmono-system-web-webpages-deployment2.0-cil
  libmono-system-web-webpages-razor2.0-cil libmono-system-web-webpages2.0-cil
  libmono-system-web4.0-cil
  libmono-system-windows-forms-datavisualization4.0a-cil
  libmono-system-windows-forms4.0-cil libmono-system-windows4.0-cil
  libmono-system-xaml4.0-cil libmono-system-xml-linq4.0-cil
  libmono-system-xml-serialization4.0-cil libmono-system-xml4.0-cil
  libmono-system4.0-cil libmono-tasklets4.0-cil libmono-webbrowser4.0-cil
  libmono-webmatrix-data4.0-cil libmono-windowsbase4.0-cil
  libmono-xbuild-tasks4.0-cil libmonoboehm-2.0-1 libmonoboehm-2.0-dev
  libnunit-cil-dev libnunit-console-runner2.6.3-cil
  libnunit-core-interfaces2.6.3-cil libnunit-core2.6.3-cil
  libnunit-framework2.6.3-cil libnunit-mocks2.6.3-cil libnunit-util2.6.3-cil
  libtext-unidecode-perl libxml-libxml-perl libxml-namespacesupport-perl
  libxml-sax-base-perl libxml-sax-expat-perl libxml-sax-perl mono-4.0-gac
  mono-csharp-shell mono-gac mono-mcs mono-runtime mono-runtime-common
  mono-runtime-sgen mono-xbuild tex-common
建议安装：
  distcc libgamin0 libnunit-doc monodoc-nunit-manual procmail default-mta
  | mail-transport-agent texlive-base texlive-latex-base
  texlive-generic-recommended texinfo-doc-nonfree
推荐安装：
  libgluezilla
下列【新】软件包将被安装：
  ca-certificates-mono ccache cli-common libbytes-random-secure-perl
  libcrypt-random-seed-perl libcrypt-ssleay-perl libexpect-perl libgdiplus
  libio-stty-perl libmath-random-isaac-perl libmath-random-isaac-xs-perl
  libmono-2.0-dev libmono-accessibility4.0-cil libmono-c5-1.1-cil
  libmono-cairo4.0-cil libmono-cecil-private-cil libmono-cil-dev
  libmono-codecontracts4.0-cil libmono-compilerservices-symbolwriter4.0-cil
  libmono-corlib4.5-cil libmono-cscompmgd0.0-cil libmono-csharp4.0c-cil
  libmono-custommarshalers4.0-cil libmono-data-tds4.0-cil libmono-db2-1.0-cil
  libmono-debugger-soft4.0a-cil libmono-http4.0-cil libmono-i18n-cjk4.0-cil
  libmono-i18n-mideast4.0-cil libmono-i18n-other4.0-cil
  libmono-i18n-rare4.0-cil libmono-i18n-west4.0-cil libmono-i18n4.0-all
  libmono-i18n4.0-cil libmono-ldap4.0-cil libmono-management4.0-cil
  libmono-messaging-rabbitmq4.0-cil libmono-messaging4.0-cil
  libmono-microsoft-build-engine4.0-cil
  libmono-microsoft-build-framework4.0-cil
  libmono-microsoft-build-tasks-v4.0-4.0-cil
  libmono-microsoft-build-utilities-v4.0-4.0-cil
  libmono-microsoft-build4.0-cil libmono-microsoft-csharp4.0-cil
  libmono-microsoft-visualc10.0-cil
  libmono-microsoft-web-infrastructure1.0-cil libmono-oracle4.0-cil
  libmono-parallel4.0-cil libmono-peapi4.0a-cil libmono-posix4.0-cil
  libmono-rabbitmq4.0-cil libmono-relaxng4.0-cil libmono-security4.0-cil
  libmono-sharpzip4.84-cil libmono-simd4.0-cil libmono-smdiagnostics0.0-cil
  libmono-sqlite4.0-cil libmono-system-componentmodel-composition4.0-cil
  libmono-system-componentmodel-dataannotations4.0-cil
  libmono-system-configuration-install4.0-cil
  libmono-system-configuration4.0-cil libmono-system-core4.0-cil
  libmono-system-data-datasetextensions4.0-cil
  libmono-system-data-entity4.0-cil libmono-system-data-linq4.0-cil
  libmono-system-data-services-client4.0-cil
  libmono-system-data-services4.0-cil libmono-system-data4.0-cil
  libmono-system-design4.0-cil libmono-system-drawing-design4.0-cil
  libmono-system-drawing4.0-cil libmono-system-dynamic4.0-cil
  libmono-system-enterpriseservices4.0-cil
  libmono-system-identitymodel-selectors4.0-cil
  libmono-system-identitymodel4.0-cil
  libmono-system-io-compression-filesystem4.0-cil
  libmono-system-io-compression4.0-cil libmono-system-json-microsoft4.0-cil
  libmono-system-json4.0-cil libmono-system-ldap-protocols4.0-cil
  libmono-system-ldap4.0-cil libmono-system-management4.0-cil
  libmono-system-messaging4.0-cil libmono-system-net-http-formatting4.0-cil
  libmono-system-net-http-webrequest4.0-cil libmono-system-net-http4.0-cil
  libmono-system-net4.0-cil libmono-system-numerics4.0-cil
  libmono-system-reactive-core2.2-cil libmono-system-reactive-debugger2.2-cil
  libmono-system-reactive-experimental2.2-cil
  libmono-system-reactive-interfaces2.2-cil
  libmono-system-reactive-linq2.2-cil
  libmono-system-reactive-observable-aliases0.0-cil
  libmono-system-reactive-platformservices2.2-cil
  libmono-system-reactive-providers2.2-cil
  libmono-system-reactive-runtime-remoting2.2-cil
  libmono-system-reactive-windows-forms2.2-cil
  libmono-system-reactive-windows-threading2.2-cil
  libmono-system-runtime-caching4.0-cil
  libmono-system-runtime-durableinstancing4.0-cil
  libmono-system-runtime-serialization-formatters-soap4.0-cil
  libmono-system-runtime-serialization4.0-cil libmono-system-runtime4.0-cil
  libmono-system-security4.0-cil libmono-system-servicemodel-activation4.0-cil
  libmono-system-servicemodel-discovery4.0-cil
  libmono-system-servicemodel-internals0.0-cil
  libmono-system-servicemodel-routing4.0-cil
  libmono-system-servicemodel-web4.0-cil libmono-system-servicemodel4.0a-cil
  libmono-system-serviceprocess4.0-cil
  libmono-system-threading-tasks-dataflow4.0-cil
  libmono-system-transactions4.0-cil libmono-system-web-abstractions4.0-cil
  libmono-system-web-applicationservices4.0-cil
  libmono-system-web-dynamicdata4.0-cil
  libmono-system-web-extensions-design4.0-cil
  libmono-system-web-extensions4.0-cil libmono-system-web-http-selfhost4.0-cil
  libmono-system-web-http-webhost4.0-cil libmono-system-web-http4.0-cil
  libmono-system-web-mvc3.0-cil libmono-system-web-razor2.0-cil
  libmono-system-web-routing4.0-cil libmono-system-web-services4.0-cil
  libmono-system-web-webpages-deployment2.0-cil
  libmono-system-web-webpages-razor2.0-cil libmono-system-web-webpages2.0-cil
  libmono-system-web4.0-cil
  libmono-system-windows-forms-datavisualization4.0a-cil
  libmono-system-windows-forms4.0-cil libmono-system-windows4.0-cil
  libmono-system-xaml4.0-cil libmono-system-xml-linq4.0-cil
  libmono-system-xml-serialization4.0-cil libmono-system-xml4.0-cil
  libmono-system4.0-cil libmono-tasklets4.0-cil libmono-webbrowser4.0-cil
  libmono-webmatrix-data4.0-cil libmono-windowsbase4.0-cil
  libmono-xbuild-tasks4.0-cil libmonoboehm-2.0-1 libmonoboehm-2.0-dev
  libnunit-cil-dev libnunit-console-runner2.6.3-cil
  libnunit-core-interfaces2.6.3-cil libnunit-core2.6.3-cil
  libnunit-framework2.6.3-cil libnunit-mocks2.6.3-cil libnunit-util2.6.3-cil
  libtext-unidecode-perl libusb-dev libxml-libxml-perl
  libxml-namespacesupport-perl libxml-sax-base-perl libxml-sax-expat-perl
  libxml-sax-perl mono-4.0-gac mono-csharp-shell mono-devel mono-gac mono-mcs
  mono-runtime mono-runtime-common mono-runtime-sgen mono-xbuild quilt
  tex-common texinfo
升级了 0 个软件包，新安装了 171 个软件包，要卸载 0 个软件包，有 205 个软件包未被升级。
需要下载 22.1 MB 的归档。
解压缩后会消耗 93.4 MB 的额外空间。
```



























* * *
# 安装一组下载工具 #
```
sudo apt-get install uget
sudo apt-get install aria2
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  libc-ares2 libssh2-1
下列【新】软件包将被安装：
  aria2 libc-ares2 libssh2-1
升级了 0 个软件包，新安装了 3 个软件包，要卸载 0 个软件包，有 205 个软件包未被升级。
需要下载 1,248 kB 的归档。
解压缩后会消耗 4,648 kB 的额外空间。
```





* * *
# 安装markdown编辑器 #
最好的当然是haroopad

retext也不错
```
sudo apt-get install retext
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  python3-docutils python3-enchant python3-markdown python3-markups python3-pygments python3-pyqt5
  python3-pyqt5.qtwebkit python3-roman python3-sip python3-textile python3-yaml
建议安装：
  texlive-latex-recommended texlive-latex-base texlive-lang-french fonts-linuxlibertine
  | ttf-linux-libertine python-markdown-doc libjs-mathjax python3-pyqt5-dbg
下列【新】软件包将被安装：
  python3-docutils python3-enchant python3-markdown python3-markups python3-pygments python3-pyqt5
  python3-pyqt5.qtwebkit python3-roman python3-sip python3-textile python3-yaml retext
升级了 0 个软件包，新安装了 12 个软件包，要卸载 0 个软件包，有 205 个软件包未被升级。
需要下载 3,474 kB 的归档。
解压缩后会消耗 21.4 MB 的额外空间。
```


* * *
# 初始化root密码 #
```
sudo passwd root
```
如果不要密码则用
```
sudo passwd -u root
```
如果要root登录
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
据说要修改的
登录时候读取这个文件时报错:mesg:ttyname
/root/.profile
```
mesg n
```
改成
```
tty -s && mesg n
```
root用户使用音频设备
/etc/profile
在最开始添加
```
pulseaudio --start --log-target=syslog
```


* * *
# 管理员root密码重置 #
grub启动时候
kernel /vmlinuz一段后添加single
```
passwd

reboot
```


* * *
# 安装好使的terminal #
```
sudo apt-get install lxterminal
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  libvte-common libvte9
下列【新】软件包将被安装：
  libvte-common libvte9 lxterminal
升级了 0 个软件包，新安装了 3 个软件包，要卸载 0 个软件包，有 205 个软件包未被升级。
需要下载 379 kB 的归档。
解压缩后会消耗 2,102 kB 的额外空间。
```


* * *
# 安装openbox #
```
sudo apt-get install menu-l10n
sudo apt-get install xinit openbox menu fonts-dejavu tint2 openbox-menu 
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
xinit 已经是最新版 (1.3.4-3ubuntu0.1)。
将会同时安装下列软件：
  fonts-dejavu-extra giblib1 libfm-extra4 libid3tag0 libimlib2 libmenu-cache-bin libmenu-cache3
  libobrender32 libobt2 obconf python-xdg scrot
建议安装：
  menu-l10n gksu | kde-runtime | ktsuss openbox-gnome-session openbox-kde-session
下列【新】软件包将被安装：
  fonts-dejavu fonts-dejavu-extra giblib1 libfm-extra4 libid3tag0 libimlib2 libmenu-cache-bin
  libmenu-cache3 libobrender32 libobt2 menu obconf openbox openbox-menu python-xdg scrot tint2
升级了 0 个软件包，新安装了 17 个软件包，要卸载 0 个软件包，有 205 个软件包未被升级。
需要下载 3,166 kB 的归档。
解压缩后会消耗 13.2 MB 的额外空间。

sudo apt install gksu
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  libgksu2-0
下列【新】软件包将被安装：
  gksu libgksu2-0
升级了 0 个软件包，新安装了 2 个软件包，要卸载 0 个软件包，有 205 个软件包未被升级。
需要下载 123 kB 的归档。
解压缩后会消耗 877 kB 的额外空间。

sudo apt install libfm-tools nautilus-actions 
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  ksh libunique-3.0-0
下列【新】软件包将被安装：
  ksh libfm-tools libunique-3.0-0 nautilus-actions
升级了 0 个软件包，新安装了 4 个软件包，要卸载 0 个软件包，有 205 个软件包未被升级。
需要下载 10.7 MB 的归档。
解压缩后会消耗 33.3 MB 的额外空间。

sudo apt install lxappearance
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  gtk2-engines
下列【新】软件包将被安装：
  gtk2-engines lxappearance
升级了 0 个软件包，新安装了 2 个软件包，要卸载 0 个软件包，有 205 个软件包未被升级。
需要下载 295 kB 的归档。
解压缩后会消耗 1,762 kB 的额外空间。

sudo apt-get install dmenu
[sudo] alex 的密码： 
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
注意，选中 'suckless-tools' 而非 'dmenu'
建议安装：
  dwm stterm surf
下列【新】软件包将被安装：
  suckless-tools
升级了 0 个软件包，新安装了 1 个软件包，要卸载 0 个软件包，有 205 个软件包未被升级。
需要下载 52.6 kB 的归档。
解压缩后会消耗 261 kB 的额外空间。
```


***
# 测试x自带工具的锁屏
```
sudo apt-get install x11-xserver-utils
```
连带安装cpp cpp-5 libisl15 libmpc3 libmpfr4

没有必要的玩意，删除掉
```
sudo apt-get purge cpp cpp-5 libisl15 libmpc3 libmpfr4 x11-xserver-utils
```


* * *
# 安装pcmanfm #
```
sudo apt-get install pcmanfm
[sudo] alex 的密码： 
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  libfm-data libfm-gtk-data libfm-gtk4 libfm-modules libfm4 lxmenu-data
建议安装：
  libfm-tools nautilus-actions
下列【新】软件包将被安装：
  libfm-data libfm-gtk-data libfm-gtk4 libfm-modules libfm4 lxmenu-data pcmanfm
升级了 0 个软件包，新安装了 7 个软件包，要卸载 0 个软件包，有 205 个软件包未被升级。
需要下载 845 kB 的归档。
解压缩后会消耗 4,480 kB 的额外空间。
```


* * *
# 安装leafpad #
```
sudo apt-get install leafpad
```


* * *
# 安装foxitreader #
/opt设置成777权限再安装


* * *
# 配置openbox #

```
sudo cpan install Linux::DesktopFiles Data::Dump
```
先解压obmenu-generator.tar.gz到~/.config
然后，pl文件都设成+x权限
schema.pl替换到~/.config/obmenu-generator
obmenu-generator复制到/usr/bin

```
obmenu-generator -i
Can't locate object method "get_icon_path" via package "Linux::DesktopFiles" at /usr/bin/obmenu-generator line 446.
```

obmenu-generator挂了
```
sudo apt-get install build-essential cpanminus git
git clone git://github.com/trizen/obmenu-generator
sudo cp obmenu-generator/obmenu-generator /usr/bin
sudo cp -r obmenu-generator/schema.pl ~/.config/obmenu-generator/
sudo cpanm Linux::DesktopFiles
sudo cpanm Data::Dump
sudo chmod 777 /usr/bin/obmenu-generator 
```


```
sudo apt-get install build-essential cpanminus git
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
build-essential 已经是最新版 (12.1ubuntu2)。
git 已经是最新版 (1:2.7.4-0ubuntu1.4)。
git 已设置为手动安装。
将会同时安装下列软件：
  libalgorithm-c3-perl libb-hooks-endofscope-perl libb-hooks-op-check-perl
  libbareword-filehandles-perl libclass-c3-perl libclass-c3-xs-perl
  libclass-method-modifiers-perl libclass-xsaccessor-perl libcpan-changes-perl
  libcpan-distnameinfo-perl libcpan-meta-check-perl libcpan-meta-perl
  libcpan-meta-requirements-perl libcpan-meta-yaml-perl libdata-optlist-perl
  libdata-perl-perl libdata-section-perl libdevel-caller-perl
  libdevel-globaldestruction-perl libdevel-lexalias-perl libfile-pushd-perl
  libfile-slurp-perl libgetopt-long-descriptive-perl libimport-into-perl
  libindirect-perl libio-stringy-perl liblexical-sealrequirehints-perl
  liblocal-lib-perl libmodule-build-perl libmodule-cpanfile-perl
  libmodule-implementation-perl libmodule-metadata-perl libmodule-runtime-perl
  libmodule-signature-perl libmoo-perl libmoox-handlesvia-perl
  libmro-compat-perl libmultidimensional-perl libnamespace-autoclean-perl
  libnamespace-clean-perl libpackage-stash-perl libpackage-stash-xs-perl
  libpadwalker-perl libparams-classify-perl libparams-util-perl
  libparams-validate-perl libparse-pmfile-perl libpath-tiny-perl
  libpod-markdown-perl libpod-readme-perl librole-tiny-perl
  libsoftware-license-perl libstrictures-perl libstring-shellquote-perl
  libsub-exporter-perl libsub-exporter-progressive-perl libsub-identify-perl
  libsub-install-perl libtext-template-perl libtry-tiny-perl libtype-tiny-perl
  libtype-tiny-xs-perl libunicode-utf8-perl libvariable-magic-perl
  libversion-perl
建议安装：
  libscalar-number-perl libdevel-stacktrace-perl
下列【新】软件包将被安装：
  cpanminus libalgorithm-c3-perl libb-hooks-endofscope-perl
  libb-hooks-op-check-perl libbareword-filehandles-perl libclass-c3-perl
  libclass-c3-xs-perl libclass-method-modifiers-perl libclass-xsaccessor-perl
  libcpan-changes-perl libcpan-distnameinfo-perl libcpan-meta-check-perl
  libcpan-meta-perl libcpan-meta-requirements-perl libcpan-meta-yaml-perl
  libdata-optlist-perl libdata-perl-perl libdata-section-perl
  libdevel-caller-perl libdevel-globaldestruction-perl libdevel-lexalias-perl
  libfile-pushd-perl libfile-slurp-perl libgetopt-long-descriptive-perl
  libimport-into-perl libindirect-perl libio-stringy-perl
  liblexical-sealrequirehints-perl liblocal-lib-perl libmodule-build-perl
  libmodule-cpanfile-perl libmodule-implementation-perl
  libmodule-metadata-perl libmodule-runtime-perl libmodule-signature-perl
  libmoo-perl libmoox-handlesvia-perl libmro-compat-perl
  libmultidimensional-perl libnamespace-autoclean-perl libnamespace-clean-perl
  libpackage-stash-perl libpackage-stash-xs-perl libpadwalker-perl
  libparams-classify-perl libparams-util-perl libparams-validate-perl
  libparse-pmfile-perl libpath-tiny-perl libpod-markdown-perl
  libpod-readme-perl librole-tiny-perl libsoftware-license-perl
  libstrictures-perl libstring-shellquote-perl libsub-exporter-perl
  libsub-exporter-progressive-perl libsub-identify-perl libsub-install-perl
  libtext-template-perl libtry-tiny-perl libtype-tiny-perl
  libtype-tiny-xs-perl libunicode-utf8-perl libvariable-magic-perl
  libversion-perl
升级了 0 个软件包，新安装了 66 个软件包，要卸载 0 个软件包，有 206 个软件包未被升级。
需要下载 2,261 kB 的归档。
解压缩后会消耗 7,618 kB 的额外空间。
```
schema.pl和config.pl的用户名要修改


* * *
# 安装conky #
```
sudo apt-get install conky conky-all tk-dev
[sudo] alex 的密码： 
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
tk-dev 已经是最新版 (8.6.0+9)。
tk-dev 已设置为手动安装。
将会同时安装下列软件：
  libaudclient2 liblua5.1-0 libxmmsclient6 libxnvctrl0
建议安装：
  apcupsd audacious moc mpd xmms2
下列【新】软件包将被安装：
  conky conky-all libaudclient2 liblua5.1-0 libxmmsclient6 libxnvctrl0
升级了 0 个软件包，新安装了 6 个软件包，要卸载 0 个软件包，有 206 个软件包未被升级。
需要下载 566 kB 的归档。
解压缩后会消耗 2,342 kB 的额外空间。
```
conkyrc文件呢要注意网口的名称


* * *
# 安装音量图标 #
```
sudo apt-get install volumeicon-alsa
```


* * *
# fcitx图标问题 #
```
sudo mv /etc/xdg/autostart/fcitx-qimpanel-autostart.desktop ~/Desktop
```
kill掉fcitx-qimpanel的图标风格##


* * *
# 设置pcmanfm和openbox的图标风格theme #
```
sudo apt-get install gnome-icon-theme
lxappearance
```

到菜单选择openbox configuration manager，设置任务栏风格


* * *
# 一个好使的剪贴板 #
```
sudo apt-get install parcellite 
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  libappindicator1 libindicator7
下列【新】软件包将被安装：
  libappindicator1 libindicator7 parcellite
升级了 0 个软件包，新安装了 3 个软件包，要卸载 0 个软件包，有 206 个软件包未被升级。
需要下载 287 kB 的归档。
解压缩后会消耗 864 kB 的额外空间。
```


* * *
# 电池图标 #
```
$ git clone https://github.com/valr/cbatticon
$ cd cbatticon
$ make WITH_GTK3=0 WITH_NOTIFY=0
$ sudo make install
$ cbatticon &

```

***
# 配置pcmanfm #
修改pcmanfm的默认shell
```
x-terminal-emulator %s
```
to
```
lxterminal
```

查看方式默认改成列表

pcmanfm的bookmark文件在
/home/andy/.config/gtk-3.0/bookmarks
到某个位置用ctrl+d添加书签


* * *
# 配置lxterminal #
回滚设置成10000行
光标闪烁cursor blink
字体monospace 12号
背景 透明度200


* * *
# 压缩解压 #
```
sudo apt install rar unrar
sudo apt-get install rar p7zip p7zip-full p7zip-rar unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack jlha-utils arj cabextract file-roller xz-utils
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
unzip 已经是最新版 (6.0-20ubuntu1)。
xz-utils 已经是最新版 (5.1.1alpha+20120614-2ubuntu2)。
zip 已经是最新版 (3.0-11)。
rar 已经是最新版 (2:5.3.b2-1)。
unrar 已经是最新版 (1:5.3.2-1)。
file-roller 已经是最新版 (3.16.5-0ubuntu1.2)。
将会同时安装下列软件：
  ca-certificates-java default-jre-headless java-common libjlha-java
  libmspack0 libuu0 openjdk-8-jre-headless
建议安装：
  default-jre libjlha-java-doc-ja mail-transport-agent inews
  fonts-ipafont-gothic fonts-ipafont-mincho fonts-wqy-microhei
  fonts-wqy-zenhei fonts-indic bsd-mailx | mailx exim4 | mail-transport-agent
  xdeview
下列【新】软件包将被安装：
  arj ca-certificates-java cabextract default-jre-headless java-common
  jlha-utils libjlha-java libmspack0 libuu0 mpack openjdk-8-jre-headless p7zip
  p7zip-full p7zip-rar sharutils unace uudeview
升级了 0 个软件包，新安装了 17 个软件包，要卸载 0 个软件包，有 206 个软件包未被升级。
需要下载 29.0 MB 的归档。
解压缩后会消耗 107 MB 的额外空间。
```


* * *
# 一些字体 #
```
sudo apt-get install fonts-ipafont-gothic fonts-ipafont-mincho fonts-wqy-microhei fonts-wqy-zenhei fonts-indic
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  fonts-beng fonts-beng-extra fonts-deva fonts-deva-extra fonts-gargi
  fonts-gubbi fonts-gujr fonts-gujr-extra fonts-kalapi fonts-knda
  fonts-lohit-beng-assamese fonts-lohit-beng-bengali fonts-lohit-deva
  fonts-lohit-gujr fonts-lohit-knda fonts-lohit-mlym fonts-lohit-orya
  fonts-lohit-taml fonts-lohit-taml-classical fonts-lohit-telu fonts-mlym
  fonts-nakula fonts-navilu fonts-orya fonts-orya-extra fonts-pagul
  fonts-sahadeva fonts-samyak-deva fonts-samyak-gujr fonts-samyak-mlym
  fonts-samyak-taml fonts-sarai fonts-smc fonts-taml fonts-telu
  fonts-telu-extra
下列【新】软件包将被安装：
  fonts-beng fonts-beng-extra fonts-deva fonts-deva-extra fonts-gargi
  fonts-gubbi fonts-gujr fonts-gujr-extra fonts-indic fonts-ipafont-gothic
  fonts-ipafont-mincho fonts-kalapi fonts-knda fonts-lohit-beng-assamese
  fonts-lohit-beng-bengali fonts-lohit-deva fonts-lohit-gujr fonts-lohit-knda
  fonts-lohit-mlym fonts-lohit-orya fonts-lohit-taml
  fonts-lohit-taml-classical fonts-lohit-telu fonts-mlym fonts-nakula
  fonts-navilu fonts-orya fonts-orya-extra fonts-pagul fonts-sahadeva
  fonts-samyak-deva fonts-samyak-gujr fonts-samyak-mlym fonts-samyak-taml
  fonts-sarai fonts-smc fonts-taml fonts-telu fonts-telu-extra
  fonts-wqy-microhei fonts-wqy-zenhei
升级了 0 个软件包，新安装了 41 个软件包，要卸载 0 个软件包，有 206 个软件包未被升级。
需要下载 20.7 MB 的归档。
解压缩后会消耗 62.7 MB 的额外空间。

```


* * *
# 重建iptux #
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
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
autoconf 已经是最新版 (2.69-9)。
automake 已经是最新版 (1:1.15-4ubuntu1)。
g++ 已经是最新版 (4:5.3.1-1ubuntu1)。
libtool 已经是最新版 (2.4.6-0.1)。
libtool 已设置为手动安装。
make 已经是最新版 (4.1-6)。
git 已经是最新版 (1:2.7.4-0ubuntu1.4)。
libgtk2.0-dev 已经是最新版 (2.24.30-1ubuntu1.16.04.2)。
将会同时安装下列软件：
  gir1.2-gconf-2.0 libdbus-1-dev libgconf2-doc
下列【新】软件包将被安装：
  gir1.2-gconf-2.0 libdbus-1-dev libgconf2-dev libgconf2-doc
```

```
git clone https://github.com/iptux-src/iptux.git
cd iptux
./configure
make
sudo make install
iptux
```

iptux设置
为了与windows网络通信，
networking
把通信用的coding改成gbk(原来是gb18030)
候选设置是utf-16,utf-8(原来是gb18030,big5)

选择保存聊天记录

更新版本的用cmake编译
```
sudo apt-get install git libgtk2.0-dev libglib2.0-dev libgconf2-dev libgstreamer1.0-dev g++ make cmake
git clone git://github.com/iptux-src/iptux.git
cd iptux
mkdir build && cd build && cmake .. && make
sudo make install
iptux
```


* * *
# oracle java #
开启源
```
deb http://ppa.launchpad.net/webupd8team/java/ubuntu $(lsb_release -sc) main
deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu $(lsb_release -sc) main
```
```
sudo sh -c 'echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo sh -c 'echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu $(lsb_release -sc) main" >> /etc/apt/sources.list.d/ros-latest.list'
```

导入GPG key
```
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
```

更新apt缓存并安装java8
```
$ sudo apt-get update
$ sudo apt-get install oracle-java8-installer
将会同时安装下列软件：
  gsfonts-x11 oracle-java8-set-default
建议安装：
  visualvm ttf-baekmuk | ttf-unfonts | ttf-unfonts-core ttf-kochi-gothic | ttf-sazanami-gothic ttf-kochi-mincho | ttf-sazanami-mincho ttf-arphic-uming
下列【新】软件包将被安装：
  gsfonts-x11 oracle-java8-installer oracle-java8-set-default
快速设置环境变量
$ sudo apt-get install oracle-java8-set-default
```


* * *
# 安装shutter #
```
sudo apt-get install shutter
[sudo] alex 的密码： 
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  libclass-data-inheritable-perl libcommon-sense-perl
  libcrypt-openssl-bignum-perl libcrypt-openssl-rsa-perl libdata-random-perl
  libextutils-depends-perl libextutils-pkgconfig-perl libfile-which-perl
  libgd-perl libgnome2-canvas-perl libgnome2-gconf-perl libgnome2-perl
  libgnome2-vfs-perl libgnome2-wnck-perl libgnomevfs2-extra libgoo-canvas-perl
  libgoocanvas-common libgoocanvas3 libgtk2-appindicator-perl
  libgtk2-imageview-perl libgtk2-unique-perl libgtkimageview0
  libhttp-server-simple-perl libimage-magick-perl libimage-magick-q16-perl
  libjson-perl libjson-xs-perl libmouse-perl libnet-dropbox-api-perl
  libnet-oauth-perl libpath-class-perl libperl5.22 libproc-processtable-perl
  libproc-simple-perl libsort-naturally-perl libtypes-serialiser-perl
  libunique-1.0-0 libwnck-common libwnck22 libwww-mechanize-perl
  libxml-simple-perl perl perl-base perl-modules-5.22 perlmagick
建议安装：
  libswitch-perl | perl imagemagick-doc libmojolicious-perl perl-doc
  libterm-readline-gnu-perl | libterm-readline-perl-perl gnome-web-photo
  libimage-exiftool-perl libnet-dbus-glib-perl
下列【新】软件包将被安装：
  libclass-data-inheritable-perl libcommon-sense-perl
  libcrypt-openssl-bignum-perl libcrypt-openssl-rsa-perl libdata-random-perl
  libextutils-depends-perl libextutils-pkgconfig-perl libfile-which-perl
  libgd-perl libgnome2-canvas-perl libgnome2-gconf-perl libgnome2-perl
  libgnome2-vfs-perl libgnome2-wnck-perl libgnomevfs2-extra libgoo-canvas-perl
  libgoocanvas-common libgoocanvas3 libgtk2-appindicator-perl
  libgtk2-imageview-perl libgtk2-unique-perl libgtkimageview0
  libhttp-server-simple-perl libimage-magick-perl libimage-magick-q16-perl
  libjson-perl libjson-xs-perl libmouse-perl libnet-dropbox-api-perl
  libnet-oauth-perl libpath-class-perl libproc-processtable-perl
  libproc-simple-perl libsort-naturally-perl libtypes-serialiser-perl
  libunique-1.0-0 libwnck-common libwnck22 libwww-mechanize-perl
  libxml-simple-perl perlmagick shutter
下列软件包将被升级：
  libperl5.22 perl perl-base perl-modules-5.22
升级了 4 个软件包，新安装了 42 个软件包，要卸载 0 个软件包，有 200 个软件包未被升级。
需要下载 4,055 kB/11.6 MB 的归档。
解压缩后会消耗 28.0 MB 的额外空间。

```


* * *
# 安装gimp #
```
sudo apt-get install gimp gimp-gmic gimp-plugin-registry gimp-data gimp-data-extras 
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  libamd2.4.1 libbabl-0.1-0 libcamd2.4.1 libccolamd2.9.1 libcholmod3.0.6
  libgegl-0.3-0 libgimp2.0 libtiff-tools libumfpack5.7.1
建议安装：
  gimp-help-en | gimp-help gmic icc-profiles libtiff-opengl
下列【新】软件包将被安装：
  gimp gimp-data gimp-data-extras gimp-gmic gimp-plugin-registry libamd2.4.1
  libbabl-0.1-0 libcamd2.4.1 libccolamd2.9.1 libcholmod3.0.6 libgegl-0.3-0
  libgimp2.0 libtiff-tools libumfpack5.7.1
升级了 0 个软件包，新安装了 14 个软件包，要卸载 0 个软件包，有 200 个软件包未被升级。
需要下载 21.2 MB 的归档。
解压缩后会消耗 98.4 MB 的额外空间。
```


* * *
# 安装vivado2018.2 #
Xilinx_Vivado_SDK_2018.2_0614_1954.tar.gz
https://www.xilinx.com/support/download.html
MD5 SUM Value : e878f870bb9d1dfc882b005550cfdbef


* * *
# opera #
安装完之后呢
sudo update-alternatives --config x-www-browser


* * *
# 安装cmake #
```
sudo apt-get install cmake cmake-gui
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
注意，选中 'cmake-qt-gui' 而非 'cmake-gui'
cmake 已经是最新版 (3.5.1-1ubuntu3)。
cmake 已设置为手动安装。
下列【新】软件包将被安装：
  cmake-qt-gui
升级了 0 个软件包，新安装了 1 个软件包，要卸载 0 个软件包，有 200 个软件包未被升级。
需要下载 1,393 kB 的归档。
解压缩后会消耗 4,704 kB 的额外空间。
```


* * *
# 安装kdevelop #
```
sudo apt-get install kdevelop
正在读取软件包列表... 34%
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  breeze-icon-theme docbook-xml docbook-xsl icoutils kactivities kapptemplate
  kate-data katepart kde-runtime kde-runtime-data kde-style-breeze
  kde-style-breeze-qt4 kdelibs-bin kdelibs5-data kdelibs5-plugins
  kdevelop-data kdevplatform8-libs kdoctools kpackagelauncherqml kpackagetool5
  kwayland-data kwayland-integration libattica0.4 libdlrestrictions1 libfam0
  libgrantlee-core0 libkactivities6 libkatepartinterfaces4 libkcmutils4
  libkde3support4 libkdeclarative5 libkdecore5 libkdesu5 libkdeui5
  libkdewebkit5 libkdnssd4 libkemoticons4 libkf5activities5 libkf5archive5
  libkf5attica5 libkf5auth-data libkf5auth5 libkf5calendarevents5
  libkf5codecs-data libkf5codecs5 libkf5completion-data libkf5completion5
  libkf5config-bin libkf5config-data libkf5configcore5 libkf5configgui5
  libkf5configwidgets-data libkf5configwidgets5 libkf5coreaddons-data
  libkf5coreaddons5 libkf5crash5 libkf5dbusaddons-bin libkf5dbusaddons-data
  libkf5dbusaddons5 libkf5declarative-data libkf5declarative5
  libkf5globalaccel-bin libkf5globalaccel-data libkf5globalaccel5
  libkf5globalaccelprivate5 libkf5guiaddons5 libkf5i18n-data libkf5i18n5
  libkf5iconthemes-bin libkf5iconthemes-data libkf5iconthemes5 libkf5idletime5
  libkf5itemviews-data libkf5itemviews5 libkf5jobwidgets-data
  libkf5jobwidgets5 libkf5kiocore5 libkf5kiowidgets5 libkf5notifications-data
  libkf5notifications5 libkf5package-data libkf5package5 libkf5plasma5
  libkf5plasmaquick5 libkf5quickaddons5 libkf5service-bin libkf5service-data
  libkf5service5 libkf5sonnet5-data libkf5sonnetcore5 libkf5sonnetui5
  libkf5style5 libkf5textwidgets-data libkf5textwidgets5 libkf5waylandclient5
  libkf5widgetsaddons-data libkf5widgetsaddons5 libkf5windowsystem-data
  libkf5windowsystem5 libkf5xmlgui-bin libkf5xmlgui-data libkf5xmlgui5
  libkfile4 libkhtml5 libkio5 libkjsapi4 libkjsembed4 libkmediaplayer4
  libknewstuff3-4 libknotifyconfig4 libkntlm4 libkparts4 libkpty4
  libkrosscore4 libktexteditor4 libkxmlrpcclient4 libnl-route-3-200
  libntrack-qt4-1 libntrack0 libphonon4 libphonon4qt5-4 libplasma3
  libpolkit-qt-1-1 libpolkit-qt5-1-1 libqca2 libqca2-plugins libqjson0
  libqt5waylandclient5 libsolid4 libstreamanalyzer0v5 libstreams0v5
  libsublime8 libthreadweaver4 libvoikko1 libxcb-composite0 libxcb-damage0
  ntrack-module-libnl-0 oxygen-icon-theme oxygen5-icon-theme phonon
  phonon-backend-gstreamer phonon-backend-gstreamer-common plasma-framework
  plasma-scriptengine-javascript qml-module-org-kde-activities
  qml-module-org-kde-kquickcontrols qml-module-org-kde-kquickcontrolsaddons
  qml-module-qtquick-controls qml-module-qtquick-dialogs
  qml-module-qtquick-privatewidgets qtwayland5 sgml-data sonnet-plugins
建议安装：
  docbook docbook-dsssl docbook-defguide dbtoepub docbook-xsl-doc-html
  | docbook-xsl-doc-pdf | docbook-xsl-doc-text | docbook-xsl-doc
  docbook-xsl-saxon fop libsaxon-java libxalan2-java libxslthl-java xalan
  libterm-readline-gnu-perl | libterm-readline-perl-perl kio-dev djvulibre-bin
  finger kdevelop-l10n ninja-build cvs kdevplatform-l10n konsole fam hspell
  voikko-fi phonon-backend-mplayer phonon-backend-vlc
  phonon4qt5-backend-gstreamer perlsgml w3-recs opensp
下列【新】软件包将被安装：
  breeze-icon-theme docbook-xml docbook-xsl icoutils kactivities kapptemplate
  kate-data katepart kde-runtime kde-runtime-data kde-style-breeze
  kde-style-breeze-qt4 kdelibs-bin kdelibs5-data kdelibs5-plugins kdevelop
  kdevelop-data kdevplatform8-libs kdoctools kpackagelauncherqml kpackagetool5
  kwayland-data kwayland-integration libattica0.4 libdlrestrictions1 libfam0
  libgrantlee-core0 libkactivities6 libkatepartinterfaces4 libkcmutils4
  libkde3support4 libkdeclarative5 libkdecore5 libkdesu5 libkdeui5
  libkdewebkit5 libkdnssd4 libkemoticons4 libkf5activities5 libkf5archive5
  libkf5attica5 libkf5auth-data libkf5auth5 libkf5calendarevents5
  libkf5codecs-data libkf5codecs5 libkf5completion-data libkf5completion5
  libkf5config-bin libkf5config-data libkf5configcore5 libkf5configgui5
  libkf5configwidgets-data libkf5configwidgets5 libkf5coreaddons-data
  libkf5coreaddons5 libkf5crash5 libkf5dbusaddons-bin libkf5dbusaddons-data
  libkf5dbusaddons5 libkf5declarative-data libkf5declarative5
  libkf5globalaccel-bin libkf5globalaccel-data libkf5globalaccel5
  libkf5globalaccelprivate5 libkf5guiaddons5 libkf5i18n-data libkf5i18n5
  libkf5iconthemes-bin libkf5iconthemes-data libkf5iconthemes5 libkf5idletime5
  libkf5itemviews-data libkf5itemviews5 libkf5jobwidgets-data
  libkf5jobwidgets5 libkf5kiocore5 libkf5kiowidgets5 libkf5notifications-data
  libkf5notifications5 libkf5package-data libkf5package5 libkf5plasma5
  libkf5plasmaquick5 libkf5quickaddons5 libkf5service-bin libkf5service-data
  libkf5service5 libkf5sonnet5-data libkf5sonnetcore5 libkf5sonnetui5
  libkf5style5 libkf5textwidgets-data libkf5textwidgets5 libkf5waylandclient5
  libkf5widgetsaddons-data libkf5widgetsaddons5 libkf5windowsystem-data
  libkf5windowsystem5 libkf5xmlgui-bin libkf5xmlgui-data libkf5xmlgui5
  libkfile4 libkhtml5 libkio5 libkjsapi4 libkjsembed4 libkmediaplayer4
  libknewstuff3-4 libknotifyconfig4 libkntlm4 libkparts4 libkpty4
  libkrosscore4 libktexteditor4 libkxmlrpcclient4 libnl-route-3-200
  libntrack-qt4-1 libntrack0 libphonon4 libphonon4qt5-4 libplasma3
  libpolkit-qt-1-1 libpolkit-qt5-1-1 libqca2 libqca2-plugins libqjson0
  libqt5waylandclient5 libsolid4 libstreamanalyzer0v5 libstreams0v5
  libsublime8 libthreadweaver4 libvoikko1 libxcb-composite0 libxcb-damage0
  ntrack-module-libnl-0 oxygen-icon-theme oxygen5-icon-theme phonon
  phonon-backend-gstreamer phonon-backend-gstreamer-common plasma-framework
  plasma-scriptengine-javascript qml-module-org-kde-activities
  qml-module-org-kde-kquickcontrols qml-module-org-kde-kquickcontrolsaddons
  qml-module-qtquick-controls qml-module-qtquick-dialogs
  qml-module-qtquick-privatewidgets qtwayland5 sgml-data sonnet-plugins
升级了 0 个软件包，新安装了 154 个软件包，要卸载 0 个软件包，有 200 个软件包未被升级。
需要下载 80.5 MB 的归档。
解压缩后会消耗 303 MB 的额外空间。
```










* * *
# VNC #
```
sudo systemctl enable vncserver-x11-serviced.service
Created symlink from /etc/systemd/system/multi-user.target.wants/vncserver-x11-serviced.service to /usr/lib/systemd/system/vncserver-x11-serviced.service.
sudo systemctl enable vncserver-virtuald.service
Created symlink from /etc/systemd/system/multi-user.target.wants/vncserver-virtuald.service to /usr/lib/systemd/system/vncserver-virtuald.service.
```






* * *
# 安装vscode #
运行命令是
code





* * *
# 安装pip #
```
sudo apt-get install python-pip
[sudo] alex 的密码： 
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  libpython-all-dev python-all python-all-dev python-pip-whl python-wheel
下列【新】软件包将被安装：
  libpython-all-dev python-all python-all-dev python-pip python-pip-whl
  python-wheel
升级了 0 个软件包，新安装了 6 个软件包，要卸载 0 个软件包，有 200 个软件包未被升级。
需要下载 1,306 kB 的归档。
解压缩后会消耗 2,084 kB 的额外空间。

sudo apt-get install pylint
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  python-astroid python-egenix-mxdatetime python-egenix-mxtools
  python-lazy-object-proxy python-logilab-common python-wrapt
建议安装：
  pylint-doc python-egenix-mxdatetime-dbg python-egenix-mxdatetime-doc
  python-egenix-mxtools-dbg python-egenix-mxtools-doc pyro python-unittest2
下列【新】软件包将被安装：
  pylint python-astroid python-egenix-mxdatetime python-egenix-mxtools
  python-lazy-object-proxy python-logilab-common python-wrapt
升级了 0 个软件包，新安装了 7 个软件包，要卸载 0 个软件包，有 200 个软件包未被升级。
需要下载 797 kB 的归档。
解压缩后会消耗 8,867 kB 的额外空间。
```






* * *
# 设置color prompt #
关键词
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "





* * *
# 安装bcompare和meld #
```
sudo apt-get install meld
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  python-gi-cairo
下列【新】软件包将被安装：
  meld python-gi-cairo
升级了 0 个软件包，新安装了 2 个软件包，要卸载 0 个软件包，有 200 个软件包未被升级。
需要下载 463 kB 的归档。
解压缩后会消耗 3,007 kB 的额外空间。
```





* * *
# 安装yEd #
```
chmod +x yEd-3.18.1_64-bit_setup.sh
./yEd-3.18.1_64-bit_setup.sh
```





* * *
# 安装miredo #
```
sudo apt-get install miredo
[sudo] alex 的密码： 
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  libjudydebian1
下列【新】软件包将被安装：
  libjudydebian1 miredo
升级了 0 个软件包，新安装了 2 个软件包，要卸载 0 个软件包，有 200 个软件包未被升级。
需要下载 165 kB 的归档。
解压缩后会消耗 711 kB 的额外空间。

## 安装notepadqq ##
sudo apt-get install snapd pulseaudio
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  libpulse-mainloop-glib0 libpulse0 libpulsedsp pulseaudio-module-bluetooth
  pulseaudio-module-x11 pulseaudio-utils ubuntu-core-launcher
建议安装：
  pavumeter pavucontrol paman paprefs
下列软件包将被升级：
  libpulse-mainloop-glib0 libpulse0 libpulsedsp pulseaudio
  pulseaudio-module-bluetooth pulseaudio-module-x11 pulseaudio-utils snapd
  ubuntu-core-launcher
升级了 9 个软件包，新安装了 0 个软件包，要卸载 0 个软件包，有 191 个软件包未被升级。
需要下载 0 B/15.3 MB 的归档。
解压缩后会消耗 4,064 kB 的额外空间。
```

```
sudo snap install notepadqq
```

或者dpkg安装deb包
http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu/pool/main/n/notepadqq/
```
sudo dpkg -i notepadqq-common_1.4.4-1-xenial1_all.deb
sudo dpkg -i notepadqq_1.4.4-1-xenial1_amd64.deb
```







* * *
# 安装putty #
sudo apt-get install putty
[sudo] alex 的密码： 
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  putty-tools
建议安装：
  putty-doc
下列【新】软件包将被安装：
  putty putty-tools
升级了 0 个软件包，新安装了 2 个软件包，要卸载 0 个软件包，有 146 个软件包未被升级。
需要下载 662 kB 的归档。
解压缩后会消耗 2,713 kB 的额外空间。


* * *
## xscreensaver ##
autostart文件


* * *
# matlab #


* * *
# tor #


* * *
# ac6 #


* * *
# xmind #


* * *
# vnc server/viewer #


* * *
# modelsim #


* * *
# cadence #


* * *
# qt4 #


* * *
# opencv3 #


* * *
# xxnet #


* * *
# neghogs 查看网速 #
安装： sudo apt install nethogs
查看网络状态： 
```
nethogs eth0
```


* * *
# nmap #
```
sudo apt-get install nmap
[sudo] alex 的密码： 
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  liblinear3 lua-lpeg ndiff python-bs4 python-html5lib python-lxml
建议安装：
  liblinear-tools liblinear-dev python-genshi python-lxml-dbg python-lxml-doc
下列【新】软件包将被安装：
  liblinear3 lua-lpeg ndiff nmap python-bs4 python-html5lib python-lxml
升级了 0 个软件包，新安装了 7 个软件包，要卸载 0 个软件包，有 243 个软件包未被升级。
需要下载 5,692 kB 的归档。
```


查看局域网内的所有ip地址

`arp -a`可以试试，但是只能查看到和主机通讯过的ip地址

用nmap对局域网扫描一遍，然后查看arp缓存表就可以知道局域内ip对应的mac了。nmap比较强大也可以直接扫描mac地址和端口。执行扫描之后就可以 cat/proc/net/arp查看arp缓存表了。

进行ping扫描，打印出对扫描做出响应的主机：　　

```
$ nmap -sP 192.168.1.0/24　　
nmap -sP 192.168.0.0/24

Starting Nmap 7.01 ( https://nmap.org ) at 2018-08-01 20:22 CST
Nmap scan report for 192.168.0.1 (192.168.0.1)
Host is up (0.0029s latency).
Nmap scan report for 192.168.0.101 (192.168.0.101)
Host is up (0.013s latency).
Nmap scan report for 192.168.0.103 (192.168.0.103)
Host is up (0.061s latency).
Nmap scan report for 192.168.0.104 (192.168.0.104)
Host is up (0.0038s latency).
Nmap scan report for 192.168.0.107 (192.168.0.107)
Host is up (0.0072s latency).
Nmap scan report for 192.168.0.111 (192.168.0.111)
Host is up (0.00026s latency).
Nmap scan report for 192.168.0.113 (192.168.0.113)
Host is up (0.0019s latency).
Nmap done: 256 IP addresses (7 hosts up) scanned in 2.32 seconds
```


仅列出指定网络上的每台主机，不发送任何报文到目标主机：　

```
$ nmap -sL 192.168.1.0/24　　

```

探测目标主机开放的端口，可以指定一个以逗号分隔的端口列表(如-PS22，23，25，80)：　　

```
$ nmap -PS 192.168.1.234　　

```

使用UDPping探测主机：

```
$ nmap -PU 192.168.1.0/24　　
```


使用频率最高的扫描选项（SYN扫描,又称为半开放扫描），它不打开一个完全的TCP连接，执行得很快：　

```
$ nmap -sS 192.168.1.0/24
```


* * *
# petalinux #
```
$ sudo apt-get install zlib1g:i386
[sudo] alex 的密码： 
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  gcc-6-base:i386 libc6:i386 libgcc1:i386
建议安装：
  glibc-doc:i386 locales:i386
下列【新】软件包将被安装：
  gcc-6-base:i386 libc6:i386 libgcc1:i386 zlib1g:i386
升级了 0 个软件包，新安装了 4 个软件包，要卸载 0 个软件包，有 146 个软件包未被升级。
需要下载 2,379 kB 的归档。
解压缩后会消耗 10.2 MB 的额外空间。
您希望继续执行吗？ [Y/n] 
```

```
$ sudo apt-get install chrpath socat gcc-multilib libsdl1.2-dev
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  gcc-5-multilib lib32asan2 lib32atomic1 lib32cilkrts5 lib32gcc-5-dev
  lib32gcc1 lib32gomp1 lib32itm1 lib32mpx0 lib32quadmath0 lib32stdc++6
  lib32ubsan0 libasound2-dev libc6-dev-i386 libc6-dev-x32 libc6-i386 libc6-x32
  libcaca-dev libpulse-dev libslang2 libslang2-dev libx32asan2 libx32atomic1
  libx32cilkrts5 libx32gcc-5-dev libx32gcc1 libx32gomp1 libx32itm1
  libx32quadmath0 libx32stdc++6 libx32ubsan0
建议安装：
  libasound2-doc
下列【新】软件包将被安装：
  chrpath gcc-5-multilib gcc-multilib lib32asan2 lib32atomic1 lib32cilkrts5
  lib32gcc-5-dev lib32gcc1 lib32gomp1 lib32itm1 lib32mpx0 lib32quadmath0
  lib32stdc++6 lib32ubsan0 libasound2-dev libc6-dev-i386 libc6-dev-x32
  libc6-i386 libc6-x32 libcaca-dev libpulse-dev libsdl1.2-dev libslang2-dev
  libx32asan2 libx32atomic1 libx32cilkrts5 libx32gcc-5-dev libx32gcc1
  libx32gomp1 libx32itm1 libx32quadmath0 libx32stdc++6 libx32ubsan0 socat
下列软件包将被升级：
  libslang2
升级了 1 个软件包，新安装了 34 个软件包，要卸载 0 个软件包，有 145 个软件包未被升级。
需要下载 16.6 MB 的归档。
解压缩后会消耗 68.7 MB 的额外空间。
您希望继续执行吗？ [Y/n]
```

```
$ sudo apt-get install xvfb
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
下列【新】软件包将被安装：
  xvfb
升级了 0 个软件包，新安装了 1 个软件包，要卸载 0 个软件包，有 145 个软件包未被升级。
需要下载 777 kB 的归档。
解压缩后会消耗 2,247 kB 的额外空间。
```


* * *
# 禁用笔记本触摸板 #
~/.bashrc 文件，为这两条命令添加别名。
```
alias tpOff=”xinput set-prop ‘SynPS/2 Synaptics TouchPad’ ‘Device Enabled’ 0”
alias tpOn=”xinput set-prop ‘SynPS/2 Synaptics TouchPad’ ‘Device Enabled’ 1”
```
执行source .bashrc，使刚才起的别名生效。


* * *
# Bless hex editor #
```
sudo apt-get install bless
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  libglade2.0-cil libglib2.0-cil libgtk2.0-cil librarian0 rarian-compat
建议安装：
  monodoc-gtk2.0-manual
下列【新】软件包将被安装：
  bless libglade2.0-cil libglib2.0-cil libgtk2.0-cil librarian0 rarian-compat
升级了 0 个软件包，新安装了 6 个软件包，要卸载 0 个软件包，有 145 个软件包未被升级。
需要下载 1,011 kB 的归档。
解压缩后会消耗 4,439 kB 的额外空间。

```


* * *
# 安装wps #
[sudo dpkg -i wps-office_10.1.0.5707~a21_amd64.deb 在ubuntu 160404出现段错误]
```
sudo dpkg -i wps-office_10.1.0.6634_amd64.deb
sudo dpkg -i symbol-fonts_1.2_all.deb 
正在选中未选择的软件包 symbol-fonts。
(正在读取数据库 ... 系统当前共安装有 362543 个文件和目录。)
正准备解包 symbol-fonts_1.2_all.deb  ...
正在解包 symbol-fonts (1.2) ...
正在设置 symbol-fonts (1.2) ...
/usr/share/fonts: caching, new cache contents: 0 fonts, 5 dirs
/usr/share/fonts/X11: caching, new cache contents: 0 fonts, 4 dirs
/usr/share/fonts/X11/Type1: caching, new cache contents: 43 fonts, 0 dirs
/usr/share/fonts/X11/encodings: caching, new cache contents: 0 fonts, 1 dirs
/usr/share/fonts/X11/encodings/large: caching, new cache contents: 0 fonts, 0 dirs
/usr/share/fonts/X11/misc: caching, new cache contents: 59 fonts, 0 dirs
/usr/share/fonts/X11/util: caching, new cache contents: 0 fonts, 0 dirs
/usr/share/fonts/cmap: caching, new cache contents: 0 fonts, 5 dirs
/usr/share/fonts/cmap/adobe-cns1: caching, new cache contents: 0 fonts, 0 dirs
/usr/share/fonts/cmap/adobe-gb1: caching, new cache contents: 0 fonts, 0 dirs
/usr/share/fonts/cmap/adobe-japan1: caching, new cache contents: 0 fonts, 0 dirs
/usr/share/fonts/cmap/adobe-japan2: caching, new cache contents: 0 fonts, 0 dirs
/usr/share/fonts/cmap/adobe-korea1: caching, new cache contents: 0 fonts, 0 dirs
/usr/share/fonts/opentype: caching, new cache contents: 0 fonts, 5 dirs
/usr/share/fonts/opentype/ipafont-gothic: caching, new cache contents: 2 fonts, 0 dirs
/usr/share/fonts/opentype/ipafont-mincho: caching, new cache contents: 2 fonts, 0 dirs
/usr/share/fonts/opentype/noto: 
caching, new cache contents: 36 fonts, 0 dirs
/usr/share/fonts/opentype/stix: caching, new cache contents: 29 fonts, 0 dirs
/usr/share/fonts/opentype/stix-word: caching, new cache contents: 5 fonts, 0 dirs
/usr/share/fonts/truetype: caching, new cache contents: 2 fonts, 53 dirs
/usr/share/fonts/truetype/Gargi: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/Gubbi: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/Nakula: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/Navilu: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/Sahadeva: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/Sarai: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/abyssinica: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/ancient-scripts: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/arphic: caching, new cache contents: 8 fonts, 0 dirs
/usr/share/fonts/truetype/dejavu: caching, new cache contents: 21 fonts, 0 dirs
/usr/share/fonts/truetype/fonts-beng-extra: caching, new cache contents: 6 fonts, 0 dirs
/usr/share/fonts/truetype/fonts-deva-extra: caching, new cache contents: 3 fonts, 0 dirs
/usr/share/fonts/truetype/fonts-gujr-extra: caching, new cache contents: 5 fonts, 0 dirs
/usr/share/fonts/truetype/fonts-guru-extra: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/fonts-kalapi: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/fonts-orya-extra: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/fonts-telu-extra: caching, new cache contents: 2 fonts, 0 dirs
/usr/share/fonts/truetype/freefont: caching, new cache contents: 12 fonts, 0 dirs
/usr/share/fonts/truetype/kacst: caching, new cache contents: 15 fonts, 0 dirs
/usr/share/fonts/truetype/kacst-one: caching, new cache contents: 2 fonts, 0 dirs
/usr/share/fonts/truetype/lao: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lato: caching, new cache contents: 18 fonts, 0 dirs
/usr/share/fonts/truetype/liberation: caching, new cache contents: 16 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-assamese: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-bengali: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-devanagari: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-gujarati: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-kannada: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-malayalam: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-oriya: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-punjabi: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-tamil: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-tamil-classical: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lohit-telugu: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/lyx: caching, new cache contents: 11 fonts, 0 dirs
/usr/share/fonts/truetype/malayalam-fonts: caching, new cache contents: 7 fonts, 0 dirs
/usr/share/fonts/truetype/nanum: caching, new cache contents: 6 fonts, 0 dirs
/usr/share/fonts/truetype/openoffice: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/padauk: caching, new cache contents: 4 fonts, 0 dirs
/usr/share/fonts/truetype/pagul: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/samyak: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/samyak-fonts: caching, new cache contents: 3 fonts, 0 dirs
/usr/share/fonts/truetype/sinhala: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/symbol-fonts: caching, new cache contents: 6 fonts, 0 dirs
/usr/share/fonts/truetype/takao-gothic: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/tibetan-machine: caching, new cache contents: 1 fonts, 0 dirs
/usr/share/fonts/truetype/tlwg: caching, new cache contents: 58 fonts, 0 dirs
/usr/share/fonts/truetype/ttf-bitstream-vera: caching, new cache contents: 10 fonts, 0 dirs
/usr/share/fonts/truetype/ttf-dejavu: caching, new cache contents: 6 fonts, 0 dirs
/usr/share/fonts/truetype/ttf-khmeros-core: caching, new cache contents: 2 fonts, 0 dirs
/usr/share/fonts/truetype/ttf-liberation: caching, new cache contents: 16 fonts, 0 dirs
/usr/share/fonts/truetype/ubuntu-font-family: caching, new cache contents: 13 fonts, 0 dirs
/usr/share/fonts/truetype/wqy: caching, new cache contents: 5 fonts, 0 dirs
/usr/share/fonts/type1: caching, new cache contents: 0 fonts, 1 dirs
/usr/share/fonts/type1/gsfonts: caching, new cache contents: 35 fonts, 0 dirs
/usr/local/share/fonts: caching, new cache contents: 0 fonts, 0 dirs
/home/alex/.local/share/fonts: skipping, no such directory
/home/alex/.fonts: skipping, no such directory
Re-scanning /usr/share/fonts: caching, new cache contents: 0 fonts, 5 dirs
Re-scanning /usr/share/fonts/X11: caching, new cache contents: 0 fonts, 4 dirs
Re-scanning /usr/share/fonts/X11/encodings: caching, new cache contents: 0 fonts, 1 dirs
Re-scanning /usr/share/fonts/cmap: caching, new cache contents: 0 fonts, 5 dirs
Re-scanning /usr/share/fonts/opentype: caching, new cache contents: 0 fonts, 5 dirs
Re-scanning /usr/share/fonts/truetype: caching, new cache contents: 2 fonts, 53 dirs
Re-scanning /usr/share/fonts/type1: caching, new cache contents: 0 fonts, 1 dirs
/var/cache/fontconfig: cleaning cache directory
/home/alex/.cache/fontconfig: cleaning cache directory
/home/alex/.cache/fontconfig: invalid cache file: 7ef2298fde41cc6eeb7af42e48b7d293-le64.cache-6
/home/alex/.fontconfig: not cleaning non-existent cache directory
fc-cache: succeeded
正在处理用于 fontconfig (2.11.94-0ubuntu1.1) 的触发器 ...
```

```
sudo dpkg -i wps-office-fonts_1.0_all.deb
```


* * *
# 语言支持 #
```
sudo apt-get install fcitx-table-wubi libreoffice-l10n-en-za hyphen-en-gb hunspell-en-ca libreoffice-l10n-en-gb thunderbird-locale-en-gb mythes-en-au libreoffice-help-en-gb fcitx-sunpinyin hunspell-en-za gimp-help-en kde-l10n-engb hunspell-en-au hunspell-en-gb kde-l10n-zhcn
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
将会同时安装下列软件：
  fcitx-table gimp-help-common ibus-pinyin libopencc1 libpyzy-1.0-0v5
  libsunpinyin3v5 sunpinyin-data
建议安装：
  fcitx-table-all hunspell libreoffice-grammarcheck-en-gb mythes-en-gb
  libreoffice-grammarcheck-en-za libreoffice-help-en-za mythes-en-za
下列【新】软件包将被安装：
  fcitx-sunpinyin fcitx-table fcitx-table-wubi gimp-help-common gimp-help-en
  hunspell-en-au hunspell-en-ca hunspell-en-gb hunspell-en-za hyphen-en-gb
  ibus-pinyin kde-l10n-engb kde-l10n-zhcn libopencc1 libpyzy-1.0-0v5
  libreoffice-help-en-gb libreoffice-l10n-en-gb libreoffice-l10n-en-za
  libsunpinyin3v5 mythes-en-au sunpinyin-data thunderbird-locale-en-gb
升级了 0 个软件包，新安装了 22 个软件包，要卸载 0 个软件包，有 185 个软件包未被升级。
需要下载 73.8 MB 的归档。
```


```
sudo locale-gen en_US.UTF-8
```


```
sudo gedit /etc/default/locale
```

```
#File generated by update-locale
#LANG="zh_CN.UTF-8"
#LANGUAGE="zh_CN:"
LANG=”en_US.UTF-8″
LANGUAGE=”en_US:en”
```

提示
```
locale-gen -en_US:en
Error: '-en_US:en' is not a supported language or locale
```

改成
```
LANGUAGE=”en_US:”
```


* * *
# 安装petalinux #
```
sudo apt-get install tofrodos iproute2 gawk
sudo apt-get install gcc git make
sudo apt-get install xvfb
The following packages will be upgraded:
  xserver-common xvfb
  
sudo apt-get install net-tools libncurses5-dev tftpd
sudo apt-get install zlib1g-dev zlib1g-dev:i386 libssl-dev flex bison libselinux1
The following NEW packages will be installed:
  bison flex libbison-dev libc6-dev:i386 libfl-dev linux-libc-dev:i386
  zlib1g-dev:i386
  
sudo apt-get install gnupg wget diffstat chrpath socat xterm
sudo apt-get install autoconf libtool tar unzip texinfo zlib1g-dev gcc-multilib build-essential libsdl1.2-dev libglib2.0-dev
The following additional packages will be installed:
  libglib2.0-0 libglib2.0-bin
Suggested packages:
  libglib2.0-doc
The following packages will be upgraded:
  libglib2.0-0 libglib2.0-bin libglib2.0-dev
  
sudo apt-get install screen pax gzip tar
Suggested packages:
  iselect | screenie | byobu ncurses-term
The following NEW packages will be installed:
  pax screen
  
sudo apt-get install lib32z1 lib32ncurses5 libbz2-1.0:i386 lib32stdc++6
The following NEW packages will be installed:
  lib32ncurses5 lib32tinfo5 lib32z1 libbz2-1.0:i386
  
$ sudo dpkg-reconfigure dash
选否
Removing 'diversion of /bin/sh to /bin/sh.distrib by dash'
Adding 'diversion of /bin/sh to /bin/sh.distrib by bash'
Removing 'diversion of /usr/share/man/man1/sh.1.gz to /usr/share/man/man1/sh.distrib.1.gz by dash'
Adding 'diversion of /usr/share/man/man1/sh.1.gz to /usr/share/man/man1/sh.distrib.1.gz by bash'
```

```
ls -al /bin/sh
能看到
lrwxrwxrwx 1 root root 4 Aug 21 12:43 /bin/sh -> bash
```


安装petalinux时出现警告，提示No tftp server found - please refer to "PetaLinux SDK Installation Guide" for its impact and solution，需要安装下面3个库，记得root权限
```
sudo apt-get install tftp-hpa tftpd-hpa xinetd
Reading package lists... Done
Building dependency tree       
Reading state information... Done
xinetd is already the newest version (1:2.3.15-6).
Suggested packages:
  pxelinux
The following packages will be REMOVED:
  tftpd
The following NEW packages will be installed:
  tftp-hpa tftpd-hpa
```

```
sudo gedit /etc/default/tftpd-hpa
```
```
TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/tftpboot"
TFTP_ADDRESS="0.0.0.0:69"
TFTP_OPTIONS="-l -c -s"
```


```
sudo mkdir -p /tftpboot
sudo chmod 777 /tftpboot
sudo chown nobody /tftpboot
sudo service tftpd-hpa restart
sudo systemctl start tftpd-hpa.service
sudo systemctl enable tftpd-hpa.service
sudo systemctl status tftpd-hpa.service
sudo systemctl stop xinetd.service
sudo systemctl disable xinetd.service
sudo systemctl status xinetd.service
```
确认tftp服务是否已经开启
```
netstat -an | more | grep udp | grep 69
```
显示
```
udp        0      0 0.0.0.0:69              0.0.0.0:*
```

```
netstat -au | grep tftp
```
显示
```
udp        0      0 *:tftp                  *:*
```

本机测试,需要tftp客户端
```
tftp <ip>
get <testfile>
```

目标板上
```
tftp -g -r <testfile> <ip>
```


补充库(root权限）：
在运行petalinux-config -c kernel出现错误，需要提前安装下面两个库
```
sudo apt-get install libncurses5 libncurses5-dev
```

编译时会出现错误arm-xilinx-linux-gnueabi-gcc: Command not found，需要安装下面三个库
```
sudo apt-get install libc6:i386
sudo apt-get install libstdc++6:i386
The following NEW packages will be installed:
  gcc-5-base:i386 libstdc++6:i386
sudo apt-get install zlib1g:i386
sudo apt-get install wget diffstat chrpath socat xterm autoconf libtool unzip texinfo zlib1g-dev gcc-multilib build-essential libsdl1.2-dev libglib2.0-dev
```

/opt有755权限
```
mkdir -p /opt/petalinux1802
$ ./petalinux-v2018.2-final-installer.run /opt/petalinux1802
INFO: Checking installer checksum...
INFO: Extracting PetaLinux installer...

LICENSE AGREEMENTS

PetaLinux SDK contains software from a number of sources.  Please review
the following licenses and indicate your acceptance of each to continue.

You do not have to accept the licenses, however if you do not then you may 
not use PetaLinux SDK.

Use PgUp/PgDn to navigate the license viewer, and press 'q' to close

Press Enter to display the license agreements
Do you accept Xilinx End User License Agreement? [y/N] > y
Do you accept Webtalk Terms and Conditions? [y/N] > y
Do you accept Third Party End User License Agreement? [y/N] > y
INFO: Checking installation environment requirements...
INFO: Checking free disk space
INFO: Checking installed tools
INFO: Checking installed development libraries
INFO: Checking network and other services
INFO: Installing PetaLinux...
INFO: Checking PetaLinux installer integrity...
INFO: Installing PetaLinux SDK to "/opt/petalinux1802/."
................................................................................................................................................................................................................................................................................INFO: Installing aarch64 Yocto SDK to "/opt/petalinux1802/./components/yocto/source/aarch64"...
PetaLinux Extensible SDK installer version 2018.2
=================================================
You are about to install the SDK to "/opt/petalinux1802/components/yocto/source/aarch64". Proceed[Y/n]? Y
Extracting SDK................................done
Setting it up...
Extracting buildtools...
done
SDK has been successfully set up and is ready to be used.
Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
 $ . /opt/petalinux1802/components/yocto/source/aarch64/environment-setup-aarch64-xilinx-linux
INFO: Installing arm Yocto SDK to "/opt/petalinux1802/./components/yocto/source/arm"...
PetaLinux Extensible SDK installer version 2018.2
=================================================
You are about to install the SDK to "/opt/petalinux1802/components/yocto/source/arm". Proceed[Y/n]? Y
Extracting SDK..............................done
Setting it up...
Extracting buildtools...
done
SDK has been successfully set up and is ready to be used.
Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
 $ . /opt/petalinux1802/components/yocto/source/arm/environment-setup-cortexa9hf-neon-xilinx-linux-gnueabi
INFO: Installing microblaze_full Yocto SDK to "/opt/petalinux1802/./components/yocto/source/microblaze_full"...
PetaLinux Extensible SDK installer version 2018.2
=================================================
You are about to install the SDK to "/opt/petalinux1802/components/yocto/source/microblaze_full". Proceed[Y/n]? Y
Extracting SDK.............................done
Setting it up...
Extracting buildtools...
done
SDK has been successfully set up and is ready to be used.
Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
 $ . /opt/petalinux1802/components/yocto/source/microblaze_full/environment-setup-microblazeel-v10.0-bs-cmp-re-mh-div-xilinx-linux
INFO: Installing microblaze_lite Yocto SDK to "/opt/petalinux1802/./components/yocto/source/microblaze_lite"...
PetaLinux Extensible SDK installer version 2018.2
=================================================
You are about to install the SDK to "/opt/petalinux1802/components/yocto/source/microblaze_lite". Proceed[Y/n]? Y
Extracting SDK.............................done
Setting it up...
Extracting buildtools...
done
SDK has been successfully set up and is ready to be used.
Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
 $ . /opt/petalinux1802/components/yocto/source/microblaze_lite/environment-setup-microblazeel-v10.0-bs-cmp-re-ml-xilinx-linux
INFO: PetaLinux SDK has been installed to /opt/petalinux1802/.
```




```
$ source /opt/petalinux1802/settings.sh
PetaLinux environment set to '/opt/petalinux1802'
INFO: Checking free disk space
INFO: Checking installed tools
INFO: Checking installed development libraries
INFO: Checking network and other service
$ echo $PETALINUX
/opt/petalinux1802
$ petalinux-util --webtalk off
```






* * *
# 导入虚拟机有关问题 #

迁移vbox虚拟机要进行的修改
目标是在linux和windows之间实现虚拟机直接复制

虚拟机列表

~/.config/VirtualBox/VirtualBox.xml

这里要修改Machine uuid
```
      <ExtraDataItem name="GUI/GroupDefinitions/" value="m=dde3939d-b0d0-4fe1-86ef-87f7b71d8909,m=82d57701-c5fb-4c2a-8d69-123299a47e55,m=61ec9292-7ad2-496d-b37d-bcff3b2cc563"/>
```
每一个m对于一个虚拟机的Machine uuid

指定虚拟机文件和snapshot的位置
```
    <MachineRegistry>
      <MachineEntry uuid="{dde3939d-b0d0-4fe1-86ef-87f7b71d8909}" src="/home/alex/VirtualBox VMs/XP/XP.vbox"/>
      <MachineEntry uuid="{82d57701-c5fb-4c2a-8d69-123299a47e55}" src="/home/alex/VirtualBox VMs/win7/win7.vbox"/>
      <MachineEntry uuid="{61ec9292-7ad2-496d-b37d-bcff3b2cc563}" src="/home/alex/VirtualBox VMs/ubuntu1604/ubuntu1604.vbox"/>

```

MachineEntry uuid可以从.vbox文件读出


修改镜像路径
~/VirtualBox VMs/xxx/xxx.vbox文件

修改location
```
    <MediaRegistry>
      <HardDisks>
        <HardDisk uuid="{b5c80fae-439e-48e0-8e34-be6357dfc392}" location="/opt/vm/win7/win7.vmdk" format="VMDK" type="Normal">
          <HardDisk uuid="{9c512815-f4bd-424e-ba21-4bc5d9aca551}" location="Snapshots/{9c512815-f4bd-424e-ba21-4bc5d9aca551}.vmdk" format="VMDK"/>
        </HardDisk>

```
修改共享目录
这个可以在图形界面，也可以在.vbox文件修改
```
        <SharedFolders>
          <SharedFolder name="share" hostPath="D:\share" writable="true" autoMount="false"/>
        </SharedFolders>

```
Ok，搞定





* * *
# 安装交叉编译工具 #
树莓派的
```
/opt/rpi/gcc-linaro-arm-linux-gnueabihf-raspbian
/opt/rpi/gcc-linaro-arm-linux-gnueabihf-raspbian-x64
```

单片机的
```
/opt/gcc-arm-none-eabi-7-2017-q4-major
```




* * *
# stm32cubemx #




* * *
# ac6 #





* * *
# eclipse






* * *
# ti




* * *
# jlink
```
sudo dpkg -i jlink_4.92_x86_64.deb
```


* * *
# stlink
```
sudo dpkg -i st-stlink-server-1.0.12-1-linux-amd64.deb 
就是
sudo ./stlinkserver_install.sh .
```


```
$ sudo apt-get install libgcrypt-dev libgcrypt20 libgcrypt20-dev libgcrypt11-dev 
```




* * *
# 安装eric6
```
$ sudo apt-get install eric
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  bicyclerepair eric-api-files libqt5scintilla2-12v5 libqt5scintilla2-l10n
  python3-pyqt5.qsci python3-pyqt5.qtsql
Suggested packages:
  vim-python | idle | pymacs pyqt5-dev-tools python-qt4-doc pyqt5-doc
  python-doc python3-doc qt4-doc-html qt5-doc-html
The following NEW packages will be installed:
  bicyclerepair eric eric-api-files libqt5scintilla2-12v5
  libqt5scintilla2-l10n python3-pyqt5.qsci python3-pyqt5.qtsql
0 upgraded, 7 newly installed, 0 to remove and 162 not upgraded.
Need to get 6,515 kB of archives.
```


* * *
# 安装gparted #
```
sudo apt-get install gparted
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libgtkmm-2.4-1v5 libparted-fs-resize0
Suggested packages:
  xfsprogs reiserfsprogs reiser4progs jfsutils kpartx dmraid dmsetup gpart
  libparted-dev
The following NEW packages will be installed:
  gparted libgtkmm-2.4-1v5 libparted-fs-resize0
0 upgraded, 3 newly installed, 0 to remove and 162 not upgraded.
Need to get 1,129 kB of archives.
After this operation, 6,973 kB of additional disk space will be used.
```





* * *
# 安装kermit #
```
sudo apt-get install ckermit
kermit -l /dev/ttyACM0 -b 115200  -c
```





* * *
# 安装iio_oscilloscope #
```
sudo apt-get -y install libglib2.0-dev libgtk2.0-dev libgtkdatabox-dev libmatio-dev libfftw3-dev libxml2 libxml2-dev bison flex libavahi-common-dev libavahi-client-dev libcurl4-openssl-dev libjansson-dev cmake libaio-dev
Suggested packages:
  libfftw3-doc
The following NEW packages will be installed:
  libaio-dev libaio1 libavahi-client-dev libavahi-common-dev libfftw3-bin
  libfftw3-dev libfftw3-long3 libfftw3-quad3 libgtkdatabox-0.9.2-0
  libgtkdatabox-0.9.2-0-dev libjansson-dev libjansson4 libmatio-dev libmatio2
The following packages will be upgraded:
  libavahi-client3 libavahi-common3
2 upgraded, 14 newly installed, 0 to remove and 160 not upgraded.


sudo apt-get install libxml2 libxml2-dev bison flex libcdk5-dev cmake
The following NEW packages will be installed:
  libcdk5 libcdk5-dev


sudo apt-get install libaio-dev libusb-1.0-0-dev libserialport-dev libxml2-dev libavahi-client-dev doxygen graphviz
The following NEW packages will be installed:
  doxygen libclang1-3.6 libllvm3.6v5 libobjc-5-dev libobjc4 libserialport-dev
  libserialport0
```

```

git clone https://github.com/analogdevicesinc/libiio.git
cd libiio
cmake ./
make all
sudo make install


git clone https://github.com/analogdevicesinc/libad9361-iio.git
cd libad9361-iio
cmake ./
make
sudo make install


git clone https://github.com/analogdevicesinc/iio-oscilloscope.git
cd iio-oscilloscope
git checkout origin/master


```





* * *
# chromium-browser #
```
sudo apt-get install chromium-browser
Suggested packages:
  webaccounts-chromium-extension unity-chromium-extension adobe-flashplugin
The following NEW packages will be installed:
  chromium-browser chromium-browser-l10n

```






* * *
# ros源码 #
```
rosdep install -y --from-paths src --ignore-src --rosdistro kinetic -r --os=debian:jessie
The following NEW packages will be installed:
  libtool-bin
The following NEW packages will be installed:
  libv4l-dev libv4l2rds0
The following NEW packages will be installed:
  protobuf-compiler
The following packages will be REMOVED:
  libfltk1.3-dev ros-kinetic-desktop-full ros-kinetic-simulators
  ros-kinetic-stage ros-kinetic-stage-ros
The following NEW packages will be installed:
  libfltk1.1 libfltk1.1-dev
The following additional packages will be installed:
  libjs-jquery-hotkeys libjs-jquery-isonscreen libjs-jquery-metadata
  libjs-jquery-tablesorter
The following NEW packages will be installed:
  libjs-jquery-hotkeys libjs-jquery-isonscreen libjs-jquery-metadata
  libjs-jquery-tablesorter python-coverage
The following additional packages will be installed:
  python-funcsigs python-pbr
Suggested packages:
  python-funcsigs-doc python-mock-doc
The following NEW packages will be installed:
  python-funcsigs python-mock python-pbr
Suggested packages:
  ffmpeg-doc libvdpau-va-gl1 nvidia-vdpau-driver
  nvidia-legacy-340xx-vdpau-driver
The following NEW packages will be installed:
  ffmpeg libav-tools libavdevice-ffmpeg56 libvdpau1 mesa-vdpau-drivers
  vdpau-driver-all
Suggested packages:
  libcppunit-doc
The following NEW packages will be installed:
  libcppunit-1.13-0v5 libcppunit-dev
Suggested packages:
  python-pygraphviz-doc
The following NEW packages will be installed:
  python-pygraphviz



sudo sh -c 'echo "deb https://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key F42ED6FBAB17C654
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full
sudo apt-get install ros-kinetic-slam-gmapping
```





* * *
# wireshark #
```
sudo apt-get install wireshark
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following package was automatically installed and is no longer required:
  libfltk1.1
Use 'sudo apt autoremove' to remove it.
The following additional packages will be installed:
  geoip-database-extra libjs-openlayers libnghttp2-14
  libqt5multimedia5-plugins libsmi2ldbl libwireshark-data libwireshark8
  libwiretap6 libwscodecs1 libwsutil7 wireshark-common wireshark-qt
Suggested packages:
  snmp-mibs-downloader wireshark-doc
The following NEW packages will be installed:
  geoip-database-extra libjs-openlayers libnghttp2-14
  libqt5multimedia5-plugins libsmi2ldbl libwireshark-data libwireshark8
  libwiretap6 libwscodecs1 libwsutil7 wireshark wireshark-common wireshark-qt
0 upgraded, 13 newly installed, 0 to remove and 394 not upgraded.
```


* * *
# dconf-tools #
```
sudo apt-get install dconf-tools
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  dconf-editor
The following NEW packages will be installed:
  dconf-editor dconf-tools
```





* * *
# libasound2 #
```
$ sudo apt-get install libasound2-dev:i386
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libasound2:i386
Suggested packages:
  libasound2-plugins:i386 libasound2-doc:i386
The following NEW packages will be installed:
  libasound2:i386 libasound2-dev:i386
```






* * *
# libdbus #
```
$ sudo apt-get install libdbus-1-dev:i386
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libdbus-1-3:i386 libgcrypt20:i386 libgpg-error0:i386 liblzma5:i386
  libpam-systemd libpcre3:i386 libselinux1:i386 libsystemd0 libsystemd0:i386
  systemd
Suggested packages:
  rng-tools:i386 systemd-ui systemd-container
The following NEW packages will be installed:
  libdbus-1-3:i386 libdbus-1-dev:i386 libgcrypt20:i386 libgpg-error0:i386
  liblzma5:i386 libpcre3:i386 libselinux1:i386 libsystemd0:i386
The following packages will be upgraded:
  libpam-systemd libsystemd0 systemd
3 upgraded, 8 newly installed, 0 to remove and 392 not upgraded.
```





* * *
# teamviewer 12 #

```
$ sudo dpkg -r --force teamviewer
$ rm -rf ~/.local/share/teamviewer13/
$ sudo rm -r /etc/teamviewer

$ sudo dpkg -i teamviewer_12.0.93330_i386.deb 


sudo apt-get install libjpeg62:i386 libxinerama1:i386 libxrandr2:i386 libxtst6:i386 ca-certificates
The following NEW packages will be installed:
  libjpeg62:i386 libx11-6:i386 libxau6:i386 libxcb1:i386 libxdmcp6:i386 libxext6:i386 libxinerama1:i386 libxrandr2:i386 libxrender1:i386 libxtst6:i386


The following NEW packages will be installed:
  libexpat1:i386 libfontconfig1:i386 libfreetype6:i386 libice6:i386 libpng12-0:i386 libsm6:i386 libuuid1:i386 libxdamage1:i386 libxfixes3:i386
```





* * *
# filezilla #
```
sudo apt-get install filezilla
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  filezilla-common libfilezilla0 libpugixml1v5
The following NEW packages will be installed:
  filezilla filezilla-common libfilezilla0 libpugixml1v5
0 upgraded, 4 newly installed, 0 to remove and 4 not upgraded.
```





* * *
# gftp #
```
$ sudo apt-get install gftp
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  gftp-common gftp-gtk gftp-text
The following NEW packages will be installed:
  gftp gftp-common gftp-gtk gftp-text
```





* * *
# 设置双网卡 #
```
$ sudo gedit /etc/network/interfaces
```
```
# interfaces(5) file used by ifup(8) and ifdown(8)

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

auto enp3s0
iface enp3s0 inet static
address 192.168.0.100
netmask 255.255.255.0
gateway 192.168.0.1
dns-nameserver 8.8.8.8

# iface wlan0 inet static
# address 192.168.1.110
# netmask 255.255.255.224
# gateway 192.168.1.1

auto wlp5s0
iface wlp5s0 inet dhcp
```
```
sudo gedit /etc/NetworkManager/NetworkManager.conf
打开该文件，将“managed=false”修改为“managed=true”。


sudo /etc/init.d/network-manager restart
sudo /etc/init.d/networking restart



$ sudo route del -net 0.0.0.0 gw 192.168.0.1
$ sudo route del -net 169.254.0.0 netmask 255.255.0.0
```





* * *
# torbrowser #
```

$ sudo apt-get install torbrowser-launcher 
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  python-lzma python-parsley python-txsocksx tor tor-geoipdb torsocks wmctrl
Suggested packages:
  mixmaster tor-arm apparmor-utils obfsproxy obfs4proxy python-pygame
The following NEW packages will be installed:
  python-lzma python-parsley python-txso
```






* * *
# usbview #
```
$ sudo apt-get install usbview
```



* * *
# qt4 qt5 #
```
$ sudo apt-get install qt4-default
$ sudo apt-get install qt4-dev-tools qt4-doc qt4-qtconfig qt4-demos qt4-designer
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libqt4-declarative-gestures libqt4-declarative-particles
Suggested packages:
  qt4-qmlviewer qt4-doc-html
The following NEW packages will be installed:
  libqt4-declarative-gestures libqt4-declarative-particles qt4-demos
  qt4-designer qt4-dev-tools qt4-doc qt4-qtconfig
```


```
$ sudo apt-get install qdevelop
```

其他
```
sudo apt-get install libqt4-

$ sudo apt-get install qtcreator
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libbotan-1.10-1 libqbscore1 libqbsqtprofilesetup1 qtcreator-data
  qtcreator-doc qtxmlpatterns5-dev-tools
Suggested packages:
  ubuntu-sdk qt5-doc
The following NEW packages will be installed:
  libbotan-1.10-1 libqbscore1 libqbsqtprofilesetup1 qtcreator qtcreator-data
  qtcreator-doc qtxmlpatterns5-dev-tools
```


```
$ sudo apt-get install qt5-default qt5-doc qt5-qmake
Reading package lists... Done
Building dependency tree       
Reading state information... Done
qt5-qmake is already the newest version (5.5.1+dfsg-16ubuntu7.5).
qt5-qmake set to manually installed.
The following additional packages will be installed:
  qtbase5-doc qtconnectivity5-doc qtdeclarative5-doc qtgraphicaleffects5-doc
  qtlocation5-doc qtmultimedia5-doc qtquickcontrols5-doc qtscript5-doc
  qtsensors5-doc qtserialport5-doc qtsvg5-doc qttools5-doc qtwebkit5-doc
  qtwebkit5-examples-doc qtwebsockets5-doc qtx11extras5-doc qtxmlpatterns5-doc
The following packages will be REMOVED:
  qt4-default
The following NEW packages will be installed:
  qt5-default qt5-doc qtbase5-doc qtconnectivity5-doc qtdeclarative5-doc
  qtgraphicaleffects5-doc qtlocation5-doc qtmultimedia5-doc
  qtquickcontrols5-doc qtscript5-doc qtsensors5-doc qtserialport5-doc
  qtsvg5-doc qttools5-doc qtwebkit5-doc qtwebkit5-examples-doc
  qtwebsockets5-doc qtx11extras5-doc qtxmlpatterns5-doc
0 upgraded, 19 newly installed, 1 to remove and 6 not upgraded.
```



```
sudo apt-get install libqwt5-qt4 libqwt5-qt4-dev
The following NEW packages will be installed:
  libqwt5-qt4 libqwt5-qt4-dev



sudo apt-get install qt4-dev-tools qt4-doc qt4-qtconfig qt4-demos qt4-designer qt4-qmlviewer
The following NEW packages will be installed:
  qt4-qmlviewer


sudo apt-get install libqt4-sql-mysql 
```


```
sudo apt-get install libgl1-mesa-dev

$ sudo apt-get install qtbase5-examples



$ sudo apt-get install libqt5x11extras5-dev libqt5multimediawidgets5 qtmultimedia5-dev qtmultimedia5-examples libphonon4qt5-4
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libqt5multimediawidgets5 is already the newest version (5.5.1-4ubuntu2).
libqt5multimediawidgets5 set to manually installed.
qtmultimedia5-dev is already the newest version (5.5.1-4ubuntu2).
qtmultimedia5-dev set to manually installed.
libphonon4qt5-4 is already the newest version (4:4.8.3-0ubuntu3).
libphonon4qt5-4 set to manually installed.
libqt5x11extras5-dev is already the newest version (5.5.1-3build1).
libqt5x11extras5-dev set to manually installed.
The following additional packages will be installed:
  qml-module-qtmultimedia
The following NEW packages will be installed:
  qml-module-qtmultimedia qtmultimedia5-examples




sudo apt-get install libqt5core5a libqt5gui5 libqt5quick5 libqt5qml5 qtbase5-dev qtdeclarative5-dev cmake
$ sudo apt-get install qtquickcontrols5-examples qtquickcontrols5-doc-html qtquick1-5-examples qtquick1-5-dev libqt5core5a libqt5gui5 libqt5quick5 libqt5qml5 qtbase5-dev qtdeclarative5-dev cmake
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libqt5qml5 is already the newest version (5.5.1-2ubuntu6).
libqt5quick5 is already the newest version (5.5.1-2ubuntu6).
qtdeclarative5-dev is already the newest version (5.5.1-2ubuntu6).
libqt5core5a is already the newest version (5.5.1+dfsg-16ubuntu7.5).
qtbase5-dev is already the newest version (5.5.1+dfsg-16ubuntu7.5).
libqt5gui5 is already the newest version (5.5.1+dfsg-16ubuntu7.5).
cmake is already the newest version (3.5.1-1ubuntu3).
The following additional packages will be installed:
  libqt5declarative5
The following NEW packages will be installed:
  libqt5declarative5 qtquick1-5-dev qtquick1-5-examples qtquickcontrols5-doc-html qtquickcontrols5-examples
```


* * *
# cadence #
```
$ sudo apt-get install libxcb1 libxcb1-dev libx11-xcb1 libx11-xcb-dev libxcb-keysyms1 libxcb-keysyms1-dev libxcb-image0 libxcb-image0-dev libxcb-shm0 libxcb-shm0-dev libxcb-sync-dev libxcb-render-util0 libxcb-render-util0-dev libxcb-xfixes0-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libxcb-image0 is already the newest version (0.4.0-1build1).
libxcb-keysyms1 is already the newest version (0.4.0-1).
libxcb-render-util0 is already the newest version (0.3.9-1).
libxcb-shm0 is already the newest version (1.11.1-1ubuntu1).
libxcb-shm0-dev is already the newest version (1.11.1-1ubuntu1).
libxcb-shm0-dev set to manually installed.
libxcb-sync-dev is already the newest version (1.11.1-1ubuntu1).
libxcb-sync-dev set to manually installed.
libxcb-xfixes0-dev is already the newest version (1.11.1-1ubuntu1).
libxcb-xfixes0-dev set to manually installed.
libxcb1 is already the newest version (1.11.1-1ubuntu1).
libxcb1-dev is already the newest version (1.11.1-1ubuntu1).
libxcb1-dev set to manually installed.
libx11-xcb-dev is already the newest version (2:1.6.3-1ubuntu2.1).
libx11-xcb-dev set to manually installed.
libx11-xcb1 is already the newest version (2:1.6.3-1ubuntu2.1).
The following NEW packages will be installed:
  libxcb-image0-dev libxcb-keysyms1-dev libxcb-render-util0-dev
```



```
$ sudo apt-get install libxcb-keysyms1-dev libxcb-image0-dev libxcb-shm0-dev libxcb-icccm4-dev libxcb-sync0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-randr0-dev libxcb-render-util0-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Note, selecting 'libxcb-sync-dev' instead of 'libxcb-sync0-dev'
libxcb-image0-dev is already the newest version (0.4.0-1build1).
libxcb-keysyms1-dev is already the newest version (0.4.0-1).
libxcb-randr0-dev is already the newest version (1.11.1-1ubuntu1).
libxcb-randr0-dev set to manually installed.
libxcb-render-util0-dev is already the newest version (0.3.9-1).
libxcb-shape0-dev is already the newest version (1.11.1-1ubuntu1).
libxcb-shape0-dev set to manually installed.
libxcb-shm0-dev is already the newest version (1.11.1-1ubuntu1).
libxcb-sync-dev is already the newest version (1.11.1-1ubuntu1).
libxcb-xfixes0-dev is already the newest version (1.11.1-1ubuntu1).
The following NEW packages will be installed:
  libxcb-icccm4-dev
```


* * *
# pyqt #
```
$ sudo apt-get install python3-pyqt5 python3-pyqt4 pyqt4-dev-tools pyqt5-dev-tools pyqt5-dev pyqt5-doc pyqt5-examples python-sip-doc
Reading package lists... Done
Building dependency tree       
Reading state information... Done
pyqt5-dev is already the newest version (5.5.1+dfsg-3ubuntu4).
pyqt5-dev set to manually installed.
python3-pyqt5 is already the newest version (5.5.1+dfsg-3ubuntu4).
python3-pyqt5 set to manually installed.
Suggested packages:
  python3-pyqt5.qtmultimedia python3-pyqt5.qtopengl python3-pyqt5.qtquick python3-pyqt5.qtsvg python3-pyqt4-dbg
The following NEW packages will be installed:
  pyqt4-dev-tools pyqt5-dev-tools pyqt5-doc pyqt5-examples python-sip-doc python3-pyqt4
0 upgraded, 6 newly installed, 0 to remove and 6 not upgraded.
Need to get 4,704 kB of archives.
```



```
$ sudo apt-get install python-qt4-doc python-qt4 python-qt4-dev python-qt4-gl python-qt4-phonon python-qt4-sql python-qt4reactor python-sip-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
python-qt4 is already the newest version (4.11.4+dfsg-1build4).
python-qt4 set to manually installed.
python-sip-dev is already the newest version (4.17+dfsg-1build1).
python-sip-dev set to manually installed.
The following NEW packages will be installed:
  python-qt4-dev python-qt4-doc python-qt4-gl python-qt4-phonon python-qt4-sql python-qt4reactor
```



```
$ sudo apt-get install ipython-qtconsole python-qscintilla2 ipython-doc libqscintilla2-designer
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  ipython libqscintilla2-12v5 libqscintilla2-l10n python-decorator python-pexpect python-ptyprocess python-simplegeneric python-zmq
Suggested packages:
  ipython-notebook python-pexpect-doc
The following NEW packages will be installed:
  ipython ipython-doc ipython-qtconsole libqscintilla2-12v5 libqscintilla2-designer libqscintilla2-l10n python-decorator python-pexpect python-ptyprocess python-qscintilla2
  python-simplegeneric python-zmq
```


* * *
# libmp4v2 #
```
$ sudo apt-get install mp4v2-utils libmp4v2-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libmp4v2-2
The following NEW packages will be installed:
  libmp4v2-2 libmp4v2-dev mp4v2-utils
```


* * *
# ffmpeg #
```
$ sudo apt-get install libavformat-dev libavfilter-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libavformat-dev is already the newest version (7:2.8.15-0ubuntu0.16.04.1).
libavformat-dev set to manually installed.
The following additional packages will be installed:
  libavresample-dev libpostproc-dev
The following NEW packages will be installed:
  libavfilter-dev libavresample-dev libpostproc-dev
```


```
$ sudo apt-get install libsdl2-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libsdl2-2.0-0 libsndio-dev libsndio6.1 libxv-dev x11proto-video-dev
Suggested packages:
  sndiod
The following NEW packages will be installed:
  libsdl2-2.0-0 libsdl2-dev libsndio-dev libsndio6.1 libxv-dev x11proto-video-dev
```



```
$ sudo apt-get install linphone
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libexosip2-11 liblinphone5 libmediastreamer-base3 libortp9 libosip2-11 libupnp6 linphone-common linphone-nogtk
The following NEW packages will be installed:
  libexosip2-11 liblinphone5 libmediastreamer-base3 libortp9 libosip2-11 libupnp6 linphone linphone-common linphone-nogtk
0 upgraded, 9 newly installed, 0 to remove and 6 not upgraded.
```



```
$ sudo apt-get install valgrind
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Suggested packages:
  valgrind-dbg kcachegrind alleyoop valkyrie
The following NEW packages will be installed:
  valgrind

$ sudo apt-get install libavdevice-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following NEW packages will be installed:
  libavdevice-dev



$ sudo apt-get install mono-vbnc
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libmono-cecil-vb0.9-cil libmono-microsoft-visualbasic10.0-cil
The following NEW packages will be installed:
  libmono-cecil-vb0.9-cil libmono-microsoft-visualbasic10.0-cil mono-vbnc



$ sudo apt-get install libx264-148 libx264-dev x264 libx265-dev x265 libx265-doc
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libx264-148 is already the newest version (2:0.148.2643+git5c65704-1).
libx264-148 set to manually installed.
The following additional packages will be installed:
  libffms2-4 libgpac4
The following NEW packages will be installed:
  libffms2-4 libgpac4 libx264-dev libx265-dev libx265-doc x264 x265
  
$ x264 -V
```


* * *
# tensorflow #
```
python 2.7 install tensorflow CPU support only
$ sudo apt-get install python-pip python-dev
$ pip install tensorflow

https://files.pythonhosted.org/packages/1a/c4/8cb95df0bf06089014259b25997c3921a87aa08e2cd981417d91ca92f7e9/tensorflow-1.10.1-cp27-cp27mu-manylinux1_x86_64.whl
```

```
sudo apt-get install python-pip python-dev

pip install --upgrade pip
pip install tensorflow
```


* * *
# opencv #
```
$ sudo apt-get install libcv-dev libopencv-dev opencv-data opencv-doc python-opencv
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libcvaux-dev libdc1394-22-dev libhighgui-dev libilmbase-dev
  libopencv-calib3d-dev libopencv-contrib-dev libopencv-core-dev
  libopencv-features2d-dev libopencv-flann-dev libopencv-gpu-dev
  libopencv-gpu2.4v5 libopencv-highgui-dev libopencv-imgproc-dev
  libopencv-legacy-dev libopencv-ml-dev libopencv-objdetect-dev
  libopencv-ocl-dev libopencv-ocl2.4v5 libopencv-photo-dev
  libopencv-photo2.4v5 libopencv-stitching-dev libopencv-stitching2.4v5
  libopencv-superres-dev libopencv-superres2.4v5 libopencv-ts-dev
  libopencv-ts2.4v5 libopencv-video-dev libopencv-videostab-dev
  libopencv-videostab2.4v5 libopencv2.4-java libopencv2.4-jni libopenexr-dev
  libraw1394-dev libraw1394-tools
Suggested packages:
  libraw1394-doc
The following NEW packages will be installed:
  libcv-dev libcvaux-dev libdc1394-22-dev libhighgui-dev libilmbase-dev
  libopencv-calib3d-dev libopencv-contrib-dev libopencv-core-dev libopencv-dev
  libopencv-features2d-dev libopencv-flann-dev libopencv-gpu-dev
  libopencv-gpu2.4v5 libopencv-highgui-dev libopencv-imgproc-dev
  libopencv-legacy-dev libopencv-ml-dev libopencv-objdetect-dev
  libopencv-ocl-dev libopencv-ocl2.4v5 libopencv-photo-dev
  libopencv-photo2.4v5 libopencv-stitching-dev libopencv-stitching2.4v5
  libopencv-superres-dev libopencv-superres2.4v5 libopencv-ts-dev
  libopencv-ts2.4v5 libopencv-video-dev libopencv-videostab-dev
  libopencv-videostab2.4v5 libopencv2.4-java libopencv2.4-jni libopenexr-dev
  libraw1394-dev libraw1394-tools opencv-data opencv-doc python-opencv
0 upgraded, 39 newly installed, 0 to remove and 6 not upgraded.
Need to get 11.3 MB of archives.

```


* * *
# eric 6 ide #
```
$ sudo apt-get install libqscintilla2-dev libqscintilla2-doc libqscintilla-perl ruby-qscintilla2
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libqtcore4-perl libqtruby4shared2 libsmokebase3v5 libsmokeqsci3
  libsmokeqtcore4-3 libsmokeqtdbus4-3 libsmokeqtgui4-3 libsmokeqtnetwork4-3
  libsmokeqtopengl4-3 libsmokeqtsql4-3 libsmokeqtsvg4-3 libsmokeqtxml4-3
  ruby-qt4
The following NEW packages will be installed:
  libqscintilla-perl libqscintilla2-dev libqscintilla2-doc libqtcore4-perl
  libqtruby4shared2 libsmokebase3v5 libsmokeqsci3 libsmokeqtcore4-3
  libsmokeqtdbus4-3 libsmokeqtgui4-3 libsmokeqtnetwork4-3 libsmokeqtopengl4-3
  libsmokeqtsql4-3 libsmokeqtsvg4-3 libsmokeqtxml4-3 ruby-qscintilla2 ruby-qt4
```


* * *
# 源码安装 python 3.6 #
```
wget https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tar.xz
tar -Jxvf Python-3.6.4.tar.xz
cd Python-3.6.4
##./configure --enable-optimizations
./configure
make -j8
#sudo make altinstall
sudo make install
```
```
pip3.6 install --upgrade pip -i https://mirrors.163.com/pypi/simple
```

```
$ sudo apt-get install -y libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libbz2-dev is already the newest version (1.0.6-8).
libbz2-dev set to manually installed.
libsqlite3-dev is already the newest version (3.11.0-1ubuntu1).
libsqlite3-dev set to manually installed.
curl is already the newest version (7.47.0-1ubuntu2.8).
wget is already the newest version (1.17.1-1ubuntu1.4).
Suggested packages:
  readline-doc llvm-3.8-doc
Recommended packages:
  llvm-3.8-dev
The following NEW packages will be installed:
  libreadline-dev libreadline6-dev llvm llvm-3.8 llvm-3.8-runtime llvm-runtime
0 upgraded, 6 newly installed, 0 to remove and 6 not upgraded.
```

```
$ sudo apt-get install -y libncurses5-dev libncursesw5-dev xz-utils tk-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libncurses5-dev is already the newest version (6.0+20160213-1ubuntu1).
tk-dev is already the newest version (8.6.0+9).
xz-utils is already the newest version (5.1.1alpha+20120614-2ubuntu2).
Suggested packages:
  ncurses-doc
The following NEW packages will be installed:
  libncursesw5-dev
0 upgraded, 1 newly installed,
```


~/Downloads/eric6-18.09
```
$ sudo python3.6 install.py

sudo pip3 install QScintilla  -i https://mirrors.163.com/pypi/simple
sudo pip3 install PyQt5 -i https://mirrors.163.com/pypi/simple
```

eric ide就安装好了，一定要用python3.6
针对每个版本python，要各自安装一遍，不然没有api


```
$ sudo apt-get install libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libsqlite3-dev is already the newest version (3.11.0-1ubuntu1).
libssl-dev is already the newest version (1.0.2g-1ubuntu4.13).
Suggested packages:
  db5.3-doc
The following NEW packages will be installed:
  libdb5.3-dev libgdbm-dev
0 upgraded, 2 newly installed
```

```

sudo apt-get install screen
```



```
$ sudo apt-get install software-properties-common

$ sudo add-apt-repository ppa:deadsnakes/ppa

sudo add-apt-repository ppa:jonathonf/python-3.6
sudo apt-get update
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 8CF63AD3F06FC659
```




```
$ sudo apt-get install virtualenv
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  python3-virtualenv
The following NEW packages will be installed:
  python3-virtualenv virtualenv
0 upgraded, 2 newly installed
```


```

$ sudo apt-get install -y python3-venv
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  python3.5-venv
The following NEW packages will be installed:
  python3-venv python3.5-venv
0 upgraded, 2 newly installed
```



```

sudo apt-get install build-essential libssl-dev libffi-dev python-dev

sudo aptitude install python3-pip
The following packages will be DOWNGRADED:
  python-pip python-pip-whl 
The following NEW packages will be installed:
  libpython3-dev{a} libpython3.5-dev{a} python3-dev{a} python3-pip 
  python3-setuptools{a} python3-wheel{a} python3.5-dev{a} 
0 packages upgraded, 7 newly installed, 2 downgraded, 0 to remove and 6 not upgraded.

```


```
sudo apt-get install idle-python*
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Note, selecting 'idle-python2.6' for glob 'idle-python*'
Note, selecting 'idle-python2.7' for glob 'idle-python*'
Note, selecting 'idle-python3.5' for glob 'idle-python*'
The following additional packages will be installed:
  python3-tk
Suggested packages:
  tix python3-tk-dbg
The following NEW packages will be installed:
  idle-python2.7 idle-python3.5 python3-tk
0 upgraded, 3 newly installed, 0 to remove and 6 not upgraded.



$ sudo apt-get install -y libopenblas-dev liblapack-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
liblapack-dev is already the newest version (3.6.0-2ubuntu2).
liblapack-dev set to manually installed.
The following NEW packages will be installed:
  libopenblas-base libopenblas-dev
0 upgraded, 2 newly installed
```


```
$ sudo pip3 install pyinstaller -i https://mirrors.163.com/pypi/simple
$ sudo pip3 install mxnet -i https://mirrors.163.com/pypi/simple
$ sudo pip3 install tensorflow -i https://mirrors.163.com/pypi/simple
$ sudo pip3 install graphviz -i https://mirrors.163.com/pypi/simple
$ sudo pip3 install mxnet-mkl -i https://mirrors.163.com/pypi/simple
$ sudo pip3 install spacy -i https://mirrors.163.com/pypi/simple


```
```
wget http://mirrors.ustc.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh
```

安装它


* * *
# latex #
```
$ sudo apt-get install texlive-full librsvg2-bin
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  aglfn chktex cm-super cm-super-minimal context context-modules dvidvi dvipng
  feynmf fonts-cabin fonts-comfortaa fonts-crosextra-caladea
  fonts-crosextra-carlito fonts-ebgaramond fonts-ebgaramond-extra
  fonts-font-awesome fonts-freefont-otf fonts-gfs-artemisia
  fonts-gfs-baskerville fonts-gfs-bodoni-classic fonts-gfs-complutum
  fonts-gfs-didot fonts-gfs-didot-classic fonts-gfs-gazis
  fonts-gfs-neohellenic fonts-gfs-olga fonts-gfs-porson fonts-gfs-solomos
  fonts-gfs-theokritos fonts-hosny-amiri fonts-ipaexfont-gothic
  fonts-ipaexfont-mincho fonts-junicode fonts-linuxlibertine fonts-lmodern
  fonts-lobster fonts-lobstertwo fonts-oflb-asana-math fonts-roboto-hinted
  fonts-sil-gentium fonts-sil-gentium-basic fonts-sil-gentiumplus
  fonts-texgyre fragmaster lacheck latex-cjk-all latex-cjk-chinese
  latex-cjk-chinese-arphic-bkai00mp latex-cjk-chinese-arphic-bsmi00lp
  latex-cjk-chinese-arphic-gbsn00lp latex-cjk-chinese-arphic-gkai00mp
  latex-cjk-common latex-cjk-japanese latex-cjk-japanese-wadalab
  latex-cjk-korean latex-cjk-thai latexdiff latexmk lcdf-typetools
  libfile-homedir-perl libmagick++-6.q16-5v5 libplot2c2 libpoppler-qt4-4
  libpotrace0 libpstoedit0c2a libptexenc1 libsynctex1 libtexlua52
  libtexluajit2 lmodern pfb2t1c2pfb prerex preview-latex-style prosper ps2eps
  pstoedit psutils purifyeps tex-gyre tex4ht tex4ht-common texlive-base
  texlive-bibtex-extra texlive-binaries texlive-extra-utils texlive-font-utils
  texlive-fonts-extra texlive-fonts-extra-doc texlive-fonts-recommended
  texlive-fonts-recommended-doc texlive-formats-extra texlive-games
  texlive-generic-extra texlive-generic-recommended texlive-htmlxml
  texlive-humanities texlive-humanities-doc texlive-lang-african
  texlive-lang-arabic texlive-lang-chinese texlive-lang-cjk
  texlive-lang-cyrillic texlive-lang-czechslovak texlive-lang-english
  texlive-lang-european texlive-lang-french texlive-lang-german
  texlive-lang-greek texlive-lang-indic texlive-lang-italian
  texlive-lang-japanese texlive-lang-korean texlive-lang-other
  texlive-lang-polish texlive-lang-portuguese texlive-lang-spanish
  texlive-latex-base texlive-latex-base-doc texlive-latex-extra
  texlive-latex-extra-doc texlive-latex-recommended
  texlive-latex-recommended-doc texlive-luatex texlive-math-extra
  texlive-metapost texlive-metapost-doc texlive-music texlive-omega
  texlive-pictures texlive-pictures-doc texlive-plain-extra texlive-pstricks
  texlive-pstricks-doc texlive-publishers texlive-publishers-doc
  texlive-science texlive-science-doc texlive-xetex tipa ttf-adf-accanthis
  ttf-adf-gillius ttf-adf-universalis vprerex
Suggested packages:
  perl-tk fontforge context-nonfree context-doc-nonfree auctex hbf-cns40-b5
  hbf-jfs56 fonts-arphic-bkai00mp fonts-arphic-bsmi00lp fonts-arphic-gbsn00lp
  fonts-arphic-gkai00mp hbf-kanji48 xfig | ivtools-bin | tgif | transfig xindy
  libspreadsheet-parseexcel-perl libtcltk-ruby dot2tex
Recommended packages:
  fonts-freefont
The following NEW packages will be installed:
  aglfn chktex cm-super cm-super-minimal context context-modules dvidvi dvipng
  feynmf fonts-cabin fonts-comfortaa fonts-crosextra-caladea
  fonts-crosextra-carlito fonts-ebgaramond fonts-ebgaramond-extra
  fonts-font-awesome fonts-freefont-otf fonts-gfs-artemisia
  fonts-gfs-baskerville fonts-gfs-bodoni-classic fonts-gfs-complutum
  fonts-gfs-didot fonts-gfs-didot-classic fonts-gfs-gazis
  fonts-gfs-neohellenic fonts-gfs-olga fonts-gfs-porson fonts-gfs-solomos
  fonts-gfs-theokritos fonts-hosny-amiri fonts-ipaexfont-gothic
  fonts-ipaexfont-mincho fonts-junicode fonts-linuxlibertine fonts-lmodern
  fonts-lobster fonts-lobstertwo fonts-oflb-asana-math fonts-roboto-hinted
  fonts-sil-gentium fonts-sil-gentium-basic fonts-sil-gentiumplus
  fonts-texgyre fragmaster lacheck latex-cjk-all latex-cjk-chinese
  latex-cjk-chinese-arphic-bkai00mp latex-cjk-chinese-arphic-bsmi00lp
  latex-cjk-chinese-arphic-gbsn00lp latex-cjk-chinese-arphic-gkai00mp
  latex-cjk-common latex-cjk-japanese latex-cjk-japanese-wadalab
  latex-cjk-korean latex-cjk-thai latexdiff latexmk lcdf-typetools
  libfile-homedir-perl libmagick++-6.q16-5v5 libplot2c2 libpoppler-qt4-4
  libpotrace0 libpstoedit0c2a libptexenc1 librsvg2-bin libsynctex1 libtexlua52
  libtexluajit2 lmodern pfb2t1c2pfb prerex preview-latex-style prosper ps2eps
  pstoedit psutils purifyeps tex-gyre tex4ht tex4ht-common texlive-base
  texlive-bibtex-extra texlive-binaries texlive-extra-utils texlive-font-utils
  texlive-fonts-extra texlive-fonts-extra-doc texlive-fonts-recommended
  texlive-fonts-recommended-doc texlive-formats-extra texlive-full
  texlive-games texlive-generic-extra texlive-generic-recommended
  texlive-htmlxml texlive-humanities texlive-humanities-doc
  texlive-lang-african texlive-lang-arabic texlive-lang-chinese
  texlive-lang-cjk texlive-lang-cyrillic texlive-lang-czechslovak
  texlive-lang-english texlive-lang-european texlive-lang-french
  texlive-lang-german texlive-lang-greek texlive-lang-indic
  texlive-lang-italian texlive-lang-japanese texlive-lang-korean
  texlive-lang-other texlive-lang-polish texlive-lang-portuguese
  texlive-lang-spanish texlive-latex-base texlive-latex-base-doc
  texlive-latex-extra texlive-latex-extra-doc texlive-latex-recommended
  texlive-latex-recommended-doc texlive-luatex texlive-math-extra
  texlive-metapost texlive-metapost-doc texlive-music texlive-omega
  texlive-pictures texlive-pictures-doc texlive-plain-extra texlive-pstricks
  texlive-pstricks-doc texlive-publishers texlive-publishers-doc
  texlive-science texlive-science-doc texlive-xetex tipa ttf-adf-accanthis
  ttf-adf-gillius ttf-adf-universalis vprerex
0 upgraded, 145 newly installed, 0 to remove and 6 not upgraded.
```


```
wget https://github.com/adobe-fonts/source-han-sans/raw/release/OTF/SourceHanSansSC.zip
wget https://github.com/adobe-fonts/source-han-serif/raw/release/OTF/SourceHanSerifSC_SB-H.zip
wget https://github.com/adobe-fonts/source-han-serif/raw/release/OTF/SourceHanSerifSC_EL-M.zip

unzip SourceHanSansSC.zip
unzip SourceHanSerifSC_EL-M.zip
unzip SourceHanSerifSC_SB-H.zip

sudo mv SourceHanSansSC SourceHanSerifSC_EL-M SourceHanSerifSC_SB-H /usr/share/fonts/opentype/
sudo fc-cache -f -v
```

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
```





* * *
# something #
```
$ sudo python3.6 -m spacy download en
$ sudo pip3 install notedown -i https://mirrors.163.com/pypi/simple

$ which python
/home/alex/miniconda3/bin/python

pip install notedown -i https://mirrors.163.com/pypi/simple
pip install --upgrade pip
pip install virtualenv

virtualenv --version
```



```
cd my_project
virtualenv -p /usr/bin/python2.7 my_project_env
virtualenv -p /usr/local/bin/python3.6 my_project_env

source my_project_env/bin/activate
deactivate


pip install jupyter_client -i https://mirrors.163.com/pypi/simple


$ sudo apt install idle
```




```
conda install nb_conda nb_conda_kernels nb_anacondacloud

$ which python
/home/alex/miniconda3/bin/python
$ python -V
Python 3.6.6 :: Anaconda, Inc.


pip install --upgrade pip -i https://mirrors.163.com/pypi/simple
pip install notedown -i https://mirrors.163.com/pypi/simple
pip install matplotlib -i https://mirrors.163.com/pypi/simple
pip install mxnet -i https://mirrors.163.com/pypi/simple
pip install scipy -i https://mirrors.163.com/pypi/simple
pip install pytest -i https://mirrors.163.com/pypi/simple
pip install tensorflow -i https://mirrors.163.com/pypi/simple
pip install PyHamcrest -i https://mirrors.163.com/pypi/simple
pip install spacy -i https://mirrors.163.com/pypi/simple
python -m spacy download en

python3 -m pip -V
python3 -m pip install -U pip -i https://mirrors.163.com/pypi/simple
```





* * *
# caffe #

```
# 安装gfortran,后面编译过程中会用到
sudo apt-get install gfortran
# 安装blas,Ubuntu下对应的是libopenblas，其它操作系统可能需要安装其它版本的blas——这是个OS相关的。
sudo apt-get install libopenblas-dev
# 安装lapack，Ubuntu下对应的是liblapack-dev，和OS相关。
sudo apt-get install liblapack-dev
# 安装atlas，Ubuntu下对应的是libatlas-base-dev，和OS相关。
$ sudo apt-get install libatlas-base-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libatlas-dev libatlas3-base
Suggested packages:
  libblas-doc liblapack-doc
The following NEW packages will be installed:
  libatlas-base-dev libatlas-dev libatlas3-base
0 upgraded, 3 newly installed
# 安装pip
sudo apt-get install python-pip
sudo apt-get install python-dev
sudo apt-get install python-nose
sudo apt-get install g++
sudo apt-get install git

#安装numpy和scipy
sudo apt-get install python-numpy
sudo apt-get install python-scipy
sudo apt-get install python-sklearn
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  python-joblib python-sklearn-lib
Suggested packages:
  python-dap python-scikits-optimization python-sklearn-doc
The following NEW packages will be installed:
  python-joblib python-sklearn python-sklearn-lib
0 upgraded, 3 newly installed


```
放弃






* * *
# 扫描仪 ##

```
$ sudo apt-get install sane sane-utils xsane
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
sane-utils is already the newest version (1.0.25+git20150528-1ubuntu2.16.04.1).
Suggested packages:
  gocr | cuneiform | tesseract-ocr | ocrad gv hylafax-client | mgetty-fax
The following NEW packages will be installed:
  sane xsane xsane-common
0 upgraded, 3 newly installed,
```






* * *
# python后续 ##
现在/usr/python3优先级低于/usr/local/python3
eric有两个版本的一个是apt-get安装的，一个是python安装的






* * *
# htop ##
```
sudo apt install htop
```






* * *
# 分析 #
```
xxx | tee xxx.txt
watch -n 1 xxx
cat speedcontrol.txt |  grep -e "501" -e "522" > xxx.txt
```






* * *
# xmind ##

```
$ sudo dpkg -i XMind-ZEN-for-Linux-64bit.deb
```





* * *
# kicad #
```


$ sudo apt-get install kicad kicad-common kicad-doc-en extra-xdg-menus


$ sudo apt-get install freecad
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libcoin80v5 liboce-foundation10 liboce-modeling10 liboce-ocaf-lite10
  liboce-ocaf10 liboce-visualization10 libpyside1.2 libshiboken1.2v5
  libsoqt4-20 libzipios++0v5 pyside-tools python-collada python-pivy
  python-ply python-pyside python-pyside.phonon python-pyside.qtcore
  python-pyside.qtdeclarative python-pyside.qtgui python-pyside.qthelp
  python-pyside.qtnetwork python-pyside.qtopengl python-pyside.qtscript
  python-pyside.qtsql python-pyside.qtsvg python-pyside.qttest
  python-pyside.qtuitools python-pyside.qtwebkit python-pyside.qtxml
Suggested packages:
  freecad-doc libopenal0a libsimage-dev python-ply-doc
The following NEW packages will be installed:
  freecad libcoin80v5 liboce-foundation10 liboce-modeling10 liboce-ocaf-lite10
  liboce-ocaf10 liboce-visualization10 libpyside1.2 libshiboken1.2v5
  libsoqt4-20 libzipios++0v5 pyside-tools python-collada python-pivy
  python-ply python-pyside python-pyside.phonon python-pyside.qtcore
  python-pyside.qtdeclarative python-pyside.qtgui python-pyside.qthelp
  python-pyside.qtnetwork python-pyside.qtopengl python-pyside.qtscript
  python-pyside.qtsql python-pyside.qtsvg python-pyside.qttest
  python-pyside.qtuitools python-pyside.qtwebkit python-pyside.qtxml
0 upgraded, 30 newly installed, 0 to remove and 243 not upgraded.
Need to get 41.2 MB of archives.
```




* * *
# librecad #
```
$ sudo apt-get install librecad
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libmuparser2v5 librecad-data
The following NEW packages will be installed:
  libmuparser2v5 librecad librecad-data
0 upgraded, 3 newly installed


//sudo add-apt-repository ppa:librecad-dev/librecad-daily sudo apt-get update sudo apt-get install librecad


$ sudo add-apt-repository --yes ppa:js-reynaud/kicad-5
$ sudo apt update
$ sudo apt install kicad
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  kicad-footprints kicad-libraries kicad-packages3d kicad-symbols
  kicad-templates libngspice-kicad xsltproc
Suggested packages:
  kicad-demo kicad-locale-ko | kicad-locale-ru | kicad-locale-pl
  | kicad-locale-pt | kicad-locale-ja | kicad-locale-id | kicad-locale-ca
  | kicad-locale-it | kicad-locale-el | kicad-locale-zh | kicad-locale-de
  | kicad-locale-sl | kicad-locale-cs | kicad-locale-bg | kicad-locale-sv
  | kicad-locale-lt | kicad-locale-fi | kicad-locale-fr | kicad-locale-hu
  | kicad-locale-nl | kicad-locale-es | kicad-locale-sk kicad-libraries
The following packages will be REMOVED:
  kicad-common
The following NEW packages will be installed:
  kicad-footprints kicad-libraries kicad-packages3d kicad-symbols
  kicad-templates libngspice-kicad xsltproc
The following packages will be upgraded:
  kicad
1 upgraded, 7 newly installed, 1 to remove and 248 not upgraded.
```






* * *
# qucs  geda ##
```

//add source
$ sudo leafpad /etc/apt/sources.list
deb http://ppa.launchpad.net/qucs/qucs/ubuntu trusty main 
deb-src http://ppa.launchpad.net/qucs/qucs/ubuntu trusty main
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 2C2B9116
$ sudo apt-get update
//这个是pcb和HDL仿真软件
$ sudo apt-get install qucs gtkwave

//https://launchpad.net/~mehanik/+archive/ubuntu/geda-unstable
//$ sudo leafpad /etc/apt/sources.list
//deb http://ppa.launchpad.net/mehanik/geda-unstable/ubuntu trusty main 
//#deb-src http://ppa.launchpad.net/mehanik/geda-unstable/ubuntu trusty main 
//$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 BDEB2384
//$ sudo apt-get update
//$ sudo apt-get install geda-gaf iverilog pcb
//http://www.geda-project.org/

// debian的stable库是有geda-gaf的， 安装了上面的用aptitude降级
// http://wiki.geda-project.org/geda:download
deb http://mirrors.163.com/debian/ stable main non-free contrib
deb-src http://mirrors.163.com/debian/ stable main non-free contrib
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




* * *
# cpu-g #
```
$ sudo leafpad /etc/apt/sources.list
deb http://ppa.launchpad.net/cpug-devs/ppa/ubuntu trusty main 
deb-src http://ppa.launchpad.net/cpug-devs/ppa/ubuntu trusty main 
$ sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 4B894331
$ sudo apt-get update
$ sudo apt-get install cpu-g
$ cpu-g.py
```




* * *
# acpi #
```
$ sudo apt install acpi

```





* * *
# sqlitebrowser #
```
$ sudo apt-get install sqlitebrowser 
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libqcustomplot1.3
The following NEW packages will be installed:
  libqcustomplot1.3 sqlitebrowser
0 upgraded, 2 newly installed
```








* * *
# qemu #
```
$ sudo apt install qemu-kvm samba vde2 sgabios ovmf debootstrap qemu
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  attr cpu-checker ipxe-qemu libcacard0 libfdt1 libiscsi2 librados2 librbd1 libspice-server1 libusbredirparser1 libvde0 libvdeplug2 libxen-4.6 libxenstore3.0 msr-tools
  python-dnspython python-ldb python-samba python-tdb qemu-block-extra qemu-slof qemu-system qemu-system-arm qemu-system-common qemu-system-mips qemu-system-misc
  qemu-system-ppc qemu-system-sparc qemu-system-x86 qemu-user qemu-user-binfmt qemu-utils samba-common samba-common-bin samba-dsdb-modules samba-vfs-modules seabios
  tdb-tools
Suggested packages:
  qemu-user-static openbios-ppc openhackware bind9 bind9utils ctdb ldb-tools ntp smbldap-tools winbind heimdal-clients vde2-cryptcab
The following NEW packages will be installed:
  attr cpu-checker debootstrap ipxe-qemu libcacard0 libfdt1 libiscsi2 librados2 librbd1 libspice-server1 libusbredirparser1 libvde0 libvdeplug2 libxen-4.6 libxenstore3.0
  msr-tools ovmf python-dnspython python-ldb python-samba python-tdb qemu qemu-block-extra qemu-kvm qemu-slof qemu-system qemu-system-arm qemu-system-common
  qemu-system-mips qemu-system-misc qemu-system-ppc qemu-system-sparc qemu-system-x86 qemu-user qemu-user-binfmt qemu-utils samba samba-common samba-common-bin
  samba-dsdb-modules samba-vfs-modules seabios sgabios tdb-tools vde2
0 upgraded, 45 newly installed




$ sudo apt-get install kvm qemu qemu-kvm virt-manager kernel-package linux-source build-essential
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Note, selecting 'qemu-kvm' instead of 'kvm'
build-essential is already the newest version (12.1ubuntu2).
qemu-kvm is already the newest version (1:2.5+dfsg-5ubuntu10.31).
qemu is already the newest version (1:2.5+dfsg-5ubuntu10.31).
The following additional packages will be installed:
  augeas-lenses bridge-utils cgmanager dblatex docbook-dsssl docbook-utils ebtables gir1.2-gtk-vnc-2.0 gir1.2-libosinfo-1.0 gir1.2-libvirt-glib-1.0
  gir1.2-spice-client-glib-2.0 gir1.2-spice-client-gtk-3.0 kernel-common libaugeas0 libgtk-vnc-2.0-0 libgvnc-1.0-0 libnetcf1 libosinfo-1.0-0 libosp5 libostyle1c2
  libsgmls-perl libsp1c2 libspice-client-glib-2.0-8 libspice-client-gtk-3.0-4 libusbredirhost1 libvirt-bin libvirt-glib-1.0-0 libvirt0 linux-source-4.4.0 lynx lynx-common
  openjade python-apt python-ipaddr python-libvirt python-libxml2 python-ndg-httpsclient python-requests python-urllib3 sgmlspl sp spice-client-glib-usb-acl-helper texlive
  virt-viewer virtinst xmlto
Suggested packages:
  augeas-doc docbook inkscape opensp texlive-lang-all transfig xindy docbook-dsssl-doc augeas-tools sgmls-doc radvd lvm2 libqt3-dev python-apt-dbg python-apt-doc
  python-ntlm python-gnomekeyring python-guestfs w3m | lynx-cur | links xmltex
Recommended packages:
  uboot-mkimage
The following NEW packages will be installed:
  augeas-lenses bridge-utils cgmanager dblatex docbook-dsssl docbook-utils ebtables gir1.2-gtk-vnc-2.0 gir1.2-libosinfo-1.0 gir1.2-libvirt-glib-1.0
  gir1.2-spice-client-glib-2.0 gir1.2-spice-client-gtk-3.0 kernel-common kernel-package libaugeas0 libgtk-vnc-2.0-0 libgvnc-1.0-0 libnetcf1 libosinfo-1.0-0 libosp5
  libostyle1c2 libsgmls-perl libsp1c2 libspice-client-glib-2.0-8 libspice-client-gtk-3.0-4 libusbredirhost1 libvirt-bin libvirt-glib-1.0-0 libvirt0 linux-source
  linux-source-4.4.0 lynx lynx-common openjade python-apt python-ipaddr python-libvirt python-libxml2 python-ndg-httpsclient python-requests python-urllib3 sgmlspl sp
  spice-client-glib-usb-acl-helper texlive virt-manager virt-viewer virtinst xmlto
0 upgraded, 49 newly installed





$ sudo apt-get install libvirt-bin libvirt0 libvirt-ocaml libvirt-glib-1.0-0 libvirt-dev libvirtodbc0 libvirt-doc libvirt-ocaml-dev libvirt-glib-1.0-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libvirt-glib-1.0-0 is already the newest version (0.2.2-0.1ubuntu1).
libvirt-glib-1.0-0 set to manually installed.
libvirt-bin is already the newest version (1.3.1-1ubuntu10.24).
libvirt-bin set to manually installed.
libvirt0 is already the newest version (1.3.1-1ubuntu10.24).
libvirt0 set to manually installed.
The following additional packages will be installed:
  camlp4 ledit libcamlp4-ocaml-dev libfindlib-ocaml libfindlib-ocaml-dev libxen-dev ocaml-base-nox ocaml-compiler-libs ocaml-findlib ocaml-interp ocaml-nox
  virtuoso-opensource-6.1-common
Suggested packages:
  devhelp ocaml-doc tuareg-mode | ocaml-mode
The following NEW packages will be installed:
  camlp4 ledit libcamlp4-ocaml-dev libfindlib-ocaml libfindlib-ocaml-dev libvirt-dev libvirt-doc libvirt-glib-1.0-dev libvirt-ocaml libvirt-ocaml-dev libvirtodbc0
  libxen-dev ocaml-base-nox ocaml-compiler-libs ocaml-findlib ocaml-interp ocaml-nox virtuoso-opensource-6.1-common
0 upgraded, 18 newly installed
```





* * * *
# doxygen #
```
sudo apt install doxygen-gui doxygen-doc
```





* * *
# autocad替代 #
librecad和qcad(比较好)
DraftSight(最好)，需要邮箱激活

```
cd /usr/local/bin
sudo gedit draftsight
-------------------------------------------------
#!/bin/bash
/opt/dassault-systemes/DraftSight/Linux/DraftSight
-------------------------------------------------
sudo chmod +x draftsight
```




* * *
# devscripts #
```
$ sudo apt-get install devscripts
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  at dctrl-tools dput libdistro-info-perl python3-magic wdiff
Suggested packages:
  debtags cvs-buildpackage diffoscope devscripts-el dose-extra gnuplot
  libterm-size-perl libyaml-syck-perl mozilla-devscripts mutt svn-buildpackage
  w3m debian-keyring equivs libsoap-lite-perl mini-dinstall
The following NEW packages will be installed:
  at dctrl-tools devscripts dput libdistro-info-perl python3-magic wdiff
0 upgraded, 7 newly installed
```


```
$ sudo apt-get install libxmu-dev:i386 libxmu-headers:i386
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Note, selecting 'libxmu-headers' instead of 'libxmu-headers:i386'
libxmu-headers is already the newest version (2:1.1.2-2).
libxmu-headers set to manually installed.
The following additional packages will be installed:
  libice-dev:i386 libpthread-stubs0-dev:i386 libsm-dev:i386 libx11-dev:i386
  libxau-dev:i386 libxcb1-dev:i386 libxdmcp-dev:i386 libxext-dev:i386
  libxmu6:i386 libxt-dev:i386 libxt6:i386
Suggested packages:
  libice-doc:i386 libsm-doc:i386 libxcb-doc:i386 libxext-doc:i386
  libxt-doc:i386
The following NEW packages will be installed:
  libice-dev:i386 libpthread-stubs0-dev:i386 libsm-dev:i386 libx11-dev:i386
  libxau-dev:i386 libxcb1-dev:i386 libxdmcp-dev:i386 libxext-dev:i386
  libxmu-dev:i386 libxmu6:i386 libxt-dev:i386 libxt6:i386
0 upgraded, 12 newly installed

$ sudo apt-get install libxp-dev libxp6 libxpa-dev libxpa1 libxplc0.3.13-dev libxplc0.3.13 xorg-dev xserver-xorg-dev primus-libs-ia32
sudo apt-get install libxpa-dev libxpa1 libxplc0.3.13-dev libxplc0.3.13 xorg-dev xserver-xorg-dev primus-libs-ia32
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following package was automatically installed and is no longer required:
  xserver-xorg-legacy-hwe-16.04
Use 'sudo apt autoremove' to remove it.
The following additional packages will be installed:
  libbsd0:i386 libdmx-dev libdmx1 libdrm-amdgpu1:i386 libdrm-intel1:i386
  libdrm-nouveau2:i386 libdrm-radeon1:i386 libdrm2:i386 libedit2:i386
  libelf1:i386 libffi6:i386 libfontenc-dev libfs-dev libfs6
  libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 libglapi-mesa:i386 libllvm6.0:i386
  libpciaccess-dev libpciaccess0:i386 libsensors4:i386 libtinfo5:i386
  libtxc-dxtn-s2tc0:i386 libx11-xcb1:i386 libxaw7-dev libxcb-dri2-0:i386
  libxcb-dri3-0:i386 libxcb-glx0:i386 libxcb-present0:i386 libxcb-sync1:i386
  libxfont-dev libxfont1-dev libxkbfile-dev libxmuu-dev libxpm-dev libxres-dev
  libxshmfence1:i386 libxtst-dev libxvmc-dev libxxf86dga-dev libxxf86vm1:i386
  mir-client-platform-mesa-dev primus-libs:i386 uuidcdef x11proto-bigreqs-dev
  x11proto-dmx-dev x11proto-dri3-dev x11proto-fonts-dev x11proto-present-dev
  x11proto-record-dev x11proto-resource-dev x11proto-xcmisc-dev
  x11proto-xf86bigfont-dev x11proto-xf86dga-dev x11proto-xf86dri-dev
Suggested packages:
  lm-sensors:i386 libxaw-doc
The following packages will be REMOVED:
  ubuntu-desktop xorg xserver-xorg-hwe-16.04
The following NEW packages will be installed:
  libbsd0:i386 libdmx-dev libdmx1 libdrm-amdgpu1:i386 libdrm-intel1:i386
  libdrm-nouveau2:i386 libdrm-radeon1:i386 libdrm2:i386 libedit2:i386
  libelf1:i386 libffi6:i386 libfontenc-dev libfs-dev libfs6
  libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 libglapi-mesa:i386 libllvm6.0:i386
  libpciaccess-dev libpciaccess0:i386 libsensors4:i386 libtinfo5:i386
  libtxc-dxtn-s2tc0:i386 libx11-xcb1:i386 libxaw7-dev libxcb-dri2-0:i386
  libxcb-dri3-0:i386 libxcb-glx0:i386 libxcb-present0:i386 libxcb-sync1:i386
  libxfont-dev libxfont1-dev libxkbfile-dev libxmuu-dev libxpa-dev libxpa1
  libxplc0.3.13 libxplc0.3.13-dev libxpm-dev libxres-dev libxshmfence1:i386
  libxtst-dev libxvmc-dev libxxf86dga-dev libxxf86vm1:i386
  mir-client-platform-mesa-dev primus-libs:i386 primus-libs-ia32:i386 uuidcdef
  x11proto-bigreqs-dev x11proto-dmx-dev x11proto-dri3-dev x11proto-fonts-dev
  x11proto-present-dev x11proto-record-dev x11proto-resource-dev
  x11proto-xcmisc-dev x11proto-xf86bigfont-dev x11proto-xf86dga-dev
  x11proto-xf86dri-dev xorg-dev xserver-xorg-dev
0 upgraded, 62 newly installed,
```

// 这样才能运行modelsim的安装程序，一般的unix兼容层而且是32位元
```
$ sudo apt-get install libxtst6:i386 libxt6:i386 libxp6:i386 libxpa1:i386
sudo apt-get install libxtst6:i386 libxt6:i386 libxpa1:i386
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libxt6:i386 is already the newest version (1:1.1.5-0ubuntu1).
libxt6:i386 set to manually installed.
libxtst6:i386 is already the newest version (2:1.2.2-1).
The following package was automatically installed and is no longer required:
  xserver-xorg-legacy-hwe-16.04
Use 'sudo apt autoremove' to remove it.
The following NEW packages will be installed:
  libxpa1:i386
0 upgraded, 1 newly installed

sudo apt-get install libstdc++5 libstdc++5:i386
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following package was automatically installed and is no longer required:
  xserver-xorg-legacy-hwe-16.04
Use 'sudo apt autoremove' to remove it.
The following NEW packages will be installed:
  libstdc++5 libstdc++5:i386
0 upgraded, 2 newly installed,


sudo apt-get install libxi-dev libxi6 libxi6:i386
The following NEW packages will be installed:
  libxi6:i386
```



* * *
# cadence #
```
./SETUP
Specify path of install directory [OR type [RETURN] to exit]: /opt/cadence/SPB166

Directory /opt/cadence/SPB166 does not exist. Create? [y/n]: y


Creating directory /opt/cadence/SPB166 
Checking your system for InstallScape...

Could not detect InstallScape for lnx86 platform using the PATH environment variable.

It is recommended to have only one Installation of InstallScape 
for lnx86 platform. If an InstallScape installation exists 
please help us find it.

Do you have InstallScape for lnx86 platform installed[y/n]?n

You are on lnx86 platform
InstallScape version 04.20.p01 
for platform lnx86 
is available on this media.

Do you want to install InstallScape for lnx86 [y/n]?y

It is recommended that you install InstallScape
outside the Cadence installation hierarchy
and include the ~iscape/bin in your PATH environment variable.

Type the path to InstallScape installation directory [ (q to quit)]: /opt/cadence/
```

再在图形界面安装，配置出问题
/opt/cadence/SPB166/tools.lnx86/stream_mgt/install/smconfigure: line 1496: /bin/basename: No such file or directory
修改为正确位置
```
$ which basename
/usr/bin/basename
```


然后进行破解解压allegro_166_patch.tar.gz到/opt/cadence/allegro_166_patch
```
mkdir -p /opt/cadence/tmp
mv /opt/cadence/SPB166/tools.lnx86/lib/libtwizard.so /opt/cadence/tmp
#mv /opt/cadence/SPB166/tools.lnx86/pcb/bin/allegro.exe /opt/cadence/tmp

./allegro.sh /opt/cadence/SPB166/tools.lnx86
./flexlm.sh /opt/cadence/tmp

cp /opt/cadence/tmp/libtwizard.so /opt/cadence/SPB166/tools.lnx86/lib/
cp license.dat /opt/cadence/SPB166/share/license
```



```
ldd /opt/cadence/SPB166/tools/pcb/bin/allegro.exe
sudo apt-get install csh
sudo apt-get install libglu-dev
Note, selecting 'libglu1-mesa-dev' instead of 'libglu-dev'
libglu1-mesa-dev is already the newest version (9.0.0-2.1).


	libGLU.so.1 => not found
	libtcl.so => not found

sudo apt-get install libtcl8.6:i386

still not found

cp /opt/cadence/SPB166/tools.lnx86/lib/libtcl8.4.so /opt/cadence/SPB166/tools.lnx86/lib/libtcl.so
libtcl.so => found


sudo apt-get install libglu-dev:i386
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Note, selecting 'libglu1-mesa-dev:i386' instead of 'libglu-dev:i386'
The following additional packages will be installed:
  libdrm-dev:i386 libgl1-mesa-dev:i386 libglu1-mesa:i386 libx11-xcb-dev:i386 libxcb-dri2-0-dev:i386 libxcb-dri3-dev:i386 libxcb-glx0-dev:i386 libxcb-present-dev:i386
  libxcb-randr0:i386 libxcb-randr0-dev:i386 libxcb-render0:i386 libxcb-render0-dev:i386 libxcb-shape0:i386 libxcb-shape0-dev:i386 libxcb-sync-dev:i386 libxcb-xfixes0:i386
  libxcb-xfixes0-dev:i386 libxdamage-dev:i386 libxfixes-dev:i386 libxshmfence-dev:i386 libxxf86vm-dev:i386 mesa-common-dev:i386
The following NEW packages will be installed:
  libdrm-dev:i386 libgl1-mesa-dev:i386 libglu1-mesa:i386 libglu1-mesa-dev:i386 libx11-xcb-dev:i386 libxcb-dri2-0-dev:i386 libxcb-dri3-dev:i386 libxcb-glx0-dev:i386
  libxcb-present-dev:i386 libxcb-randr0:i386 libxcb-randr0-dev:i386 libxcb-render0:i386 libxcb-render0-dev:i386 libxcb-shape0:i386 libxcb-shape0-dev:i386
  libxcb-sync-dev:i386 libxcb-xfixes0:i386 libxcb-xfixes0-dev:i386 libxdamage-dev:i386 libxfixes-dev:i386 libxshmfence-dev:i386 libxxf86vm-dev:i386 mesa-common-dev:i386
0 upgraded, 23 newly installed
```


allegro 能开，但是空白，有报错
```
Unable to resolve function glXQueryExtension
Unable to resolve function glXMakeCurrent
```

```
$ ldd /opt/cadence/SPB166/tools/pcb/bin/allegro.exe | grep "libGL"
	libGLU.so.1 => /usr/lib/i386-linux-gnu/libGLU.so.1 (0xf6807000)
	libGL.so.1 => /usr/lib/i386-linux-gnu/mesa/libGL.so.1 (0xf6746000)
alex@alex-ThinkPad-E580:/opt/cadence/allegro_166_patch
$ glxinfo | grep -i open
libGL: Can't open configuration file /home/alex/.drirc: No such file or directory.
libGL: pci id for fd 4: 8086:5917, driver i965
libGL: OpenDriver: trying /usr/lib/x86_64-linux-gnu/dri/tls/i965_dri.so
libGL: OpenDriver: trying /usr/lib/x86_64-linux-gnu/dri/i965_dri.so
libGL: Can't open configuration file /home/alex/.drirc: No such file or directory.
libGL: Can't open configuration file /home/alex/.drirc: No such file or directory.
libGL: Using DRI3 for screen 0
libGL: Can't open configuration file /home/alex/.drirc: No such file or directory.
    Vendor: Intel Open Source Technology Center (0x8086)
OpenGL vendor string: Intel Open Source Technology Center
OpenGL renderer string: Mesa DRI Intel(R) UHD Graphics 620 (Kabylake GT2) 
OpenGL core profile version string: 4.5 (Core Profile) Mesa 18.0.5
OpenGL core profile shading language version string: 4.50
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
libGL: Can't open configuration file /home/alex/.drirc: No such file or directory.
OpenGL version string: 3.0 Mesa 18.0.5
OpenGL shading language version string: 1.30
OpenGL context flags: (none)
OpenGL extensions:d
libGL: Can't open configuration file /home/alex/.drirc: No such file or directory.
OpenGL ES profile version string: OpenGL ES 3.2 Mesa 18.0.5
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:


cp drirc ~/.drirc
$ glxinfo | grep -i open
libGL: pci id for fd 4: 8086:5917, driver i965
libGL: OpenDriver: trying /usr/lib/x86_64-linux-gnu/dri/tls/i965_dri.so
libGL: OpenDriver: trying /usr/lib/x86_64-linux-gnu/dri/i965_dri.so
libGL: Using DRI3 for screen 0
    Vendor: Intel Open Source Technology Center (0x8086)
OpenGL vendor string: Intel Open Source Technology Center
OpenGL renderer string: Mesa DRI Intel(R) UHD Graphics 620 (Kabylake GT2) 
OpenGL core profile version string: 4.5 (Core Profile) Mesa 18.0.5
OpenGL core profile shading language version string: 4.50
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 3.0 Mesa 18.0.5
OpenGL shading language version string: 1.30
OpenGL context flags: (none)
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.2 Mesa 18.0.5
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:
```



报错还在
```
Unable to resolve function glXQueryExtension
Unable to resolve function glXMakeCurrent
```




```
sudo apt-get install libva-glx1 libva-glx1:i386
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  i965-va-driver:i386 libva-x11-1 libva-x11-1:i386 libva1:i386 mesa-va-drivers:i386 va-driver-all:i386
Suggested packages:
  libfglrx-amdxvba1:i386
The following NEW packages will be installed:
  i965-va-driver:i386 libva-glx1 libva-glx1:i386 libva-x11-1 libva-x11-1:i386 libva1:i386 mesa-va-drivers:i386 va-driver-all:i386
0 upgraded, 8 newly installed


sudo apt-get install mesa-utils-extra

sudo apt-get install libglew-dev freeglut3-dev
```


allegro reports
```
Unable to obtain OpenGL information
```


```
sudo apt-get install libglew-dev libsdl2-dev libsdl2-image-dev libglm-dev libfreetype6-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libglew-dev is already the newest version (1.13.0-2).
libsdl2-dev is already the newest version (2.0.4+dfsg1-2ubuntu2).
libfreetype6-dev is already the newest version (2.6.1-0.1ubuntu2.3).
The following additional packages will be installed:
  libsdl2-image-2.0-0
The following NEW packages will be installed:
  libglm-dev libsdl2-image-2.0-0 libsdl2-image-dev
0 upgraded, 3 newly installedldd
```



/etc/ld.so.conf.d
```
$ sudo mv i386-linux-gnu_GL.conf ..
sudo ldconfig
sudo ln -s /usr/lib/x86_64-linux-gnu/mesa/libGL.so.1 /usr/lib/libGL.so.1
alex@alex-ThinkPad-E580:/etc/ld.so.conf.d
$ sudo rm ../i386-linux-gnu_GL.conf
sudo apt-get install --reinstall libgl1-mesa-glx:i386
sudo rm /usr/lib/libGL.so.1
```



```
sudo apt-get install libglew-dev glew-utils
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libglew-dev is already the newest version (1.13.0-2).
The following NEW packages will be installed:
  glew-utils



sudo apt-get install build-essential libgl1-mesa-dev
sudo apt-get install freeglut3-dev
sudo apt-get install libglew-dev libsdl2-dev libsdl2-image-dev libglm-dev libfreetype6-dev



lspci | grep VGA
00:02.0 VGA compatible controller: Intel Corporation Device 5917 (rev 07)

~/.bashrc
export LIBGL_DRIVERS_PATH=/usr/lib/i386-linux-gnu/dri

$ glxinfo | grep -i opengl
libGL: pci id for fd 4: 8086:5917, driver i965
libGL: OpenDriver: trying /usr/lib/i386-linux-gnu/dri/tls/i965_dri.so
libGL: OpenDriver: trying /usr/lib/i386-linux-gnu/dri/i965_dri.so
libGL: dlopen /usr/lib/i386-linux-gnu/dri/i965_dri.so failed (/usr/lib/i386-linux-gnu/dri/i965_dri.so: wrong ELF class: ELFCLASS32)
libGL error: unable to load driver: i965_dri.so
libGL error: driver pointer missing
libGL error: failed to load driver: i965
libGL: pci id for fd 4: 8086:5917, driver i965
libGL: OpenDriver: trying /usr/lib/i386-linux-gnu/dri/tls/i965_dri.so
libGL: OpenDriver: trying /usr/lib/i386-linux-gnu/dri/i965_dri.so
libGL: dlopen /usr/lib/i386-linux-gnu/dri/i965_dri.so failed (/usr/lib/i386-linux-gnu/dri/i965_dri.so: wrong ELF class: ELFCLASS32)
libGL error: unable to load driver: i965_dri.so
libGL error: driver pointer missing
libGL error: failed to load driver: i965
libGL: OpenDriver: trying /usr/lib/i386-linux-gnu/dri/tls/swrast_dri.so
libGL: OpenDriver: trying /usr/lib/i386-linux-gnu/dri/swrast_dri.so
libGL: dlopen /usr/lib/i386-linux-gnu/dri/swrast_dri.so failed (/usr/lib/i386-linux-gnu/dri/swrast_dri.so: wrong ELF class: ELFCLASS32)
libGL error: unable to load driver: swrast_dri.so
libGL error: failed to load driver: swrast
X Error of failed request:  GLXBadContext
  Major opcode of failed request:  155 (GLX)
  Minor opcode of failed request:  6 (X_GLXIsDirect)
  Serial number of failed request:  55
  Current serial number in output stream:  54



sudo apt-get install libdri2-dev:i386
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libdri2-1:i386
The following NEW packages will be installed:
  libdri2-1:i386 libdri2-dev:i386
0 upgraded, 2 newly installed






LIBGL_DEBUG=verbose glxinfo 2>&1 >/dev/null | grep so$
libGL: OpenDriver: trying /usr/lib/x86_64-linux-gnu/dri/tls/i965_dri.so
libGL: OpenDriver: trying /usr/lib/x86_64-linux-gnu/dri/i965_dri.so
```






右边直接有ubuntu32位和64位驱动链接：http://support.amd.com/en-us/download

下面的忽略
对应你的系统版本，14.04（或12.02）的4个deb包全部下载。然后按下面的顺序依次安装：
先卸载先前版本
代码:
sudo sh /usr/share/ati/fglrx-uninstall.sh

1，先安装core
代码:
sudo dpkg -i fglrx-core_14.501-0ubuntu1_amd64_UB_14.01.deb


2，再安装
代码:
sudo dpkg -i fglrx_14.501-0ubuntu1_amd64_UB_14.01.deb


3，再安装ccc
代码:
sudo dpkg -i fglrx-amdcccle_14.501-0ubuntu1_amd64_UB_14.01.deb


4，最后安装dev
代码:
sudo dpkg -i fglrx-dev_14.501-0ubuntu1_amd64_UB_14.01.deb



配置初始化
代码:
sudo aticonfig --initial


重启
代码:
sudo reboot


查看
代码:
fglrxinfo


终于可以显示你的显卡型号

测试帧率（跳出一个旋转方块）
代码:
fgl_glxgears



忽略止


```
amdgpu-pro-18.30-641594
$ ./amdgpu-install
deb [ trusted=yes ] file:/var/opt/amdgpu-pro-local/ ./
Get:1 file:/var/opt/amdgpu-pro-local ./ InRelease
Ign:1 file:/var/opt/amdgpu-pro-local ./ InRelease
Get:2 file:/var/opt/amdgpu-pro-local ./ Release [814 B]
Get:2 file:/var/opt/amdgpu-pro-local ./ Release [814 B]
Get:3 file:/var/opt/amdgpu-pro-local ./ Release.gpg
Ign:3 file:/var/opt/amdgpu-pro-local ./ Release.gpg
Hit:4 http://packages.microsoft.com/repos/vscode stable InRelease
Hit:5 https://mirrors.aliyun.com/ubuntu xenial InRelease                       
Hit:6 https://mirrors.aliyun.com/ubuntu xenial-updates InRelease               
Hit:7 https://mirrors.aliyun.com/ubuntu xenial-backports InRelease             
Ign:8 http://www.scootersoftware.com bcompare4 InRelease                       
Hit:9 http://ppa.launchpad.net/js-reynaud/kicad-5/ubuntu xenial InRelease      
Hit:10 http://security.ubuntu.com/ubuntu xenial-security InRelease             
Hit:11 http://archive.canonical.com/ubuntu xenial InRelease                    
Hit:12 http://packages.ros.org/ros/ubuntu xenial InRelease                     
Hit:13 http://www.scootersoftware.com bcompare4 Release
Hit:15 https://deb.opera.com/opera-stable stable InRelease
Reading package lists... Done 
Package: *amdgpu*
Pin: release o=AMD
Pin: version *-641594
Pin-Priority: 1000

Package: *amdgpu*:i386
Pin: release o=AMD
Pin: version *-641594
Pin-Priority: 1000

Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  amdgpu-core amdgpu-dkms dkms glamor-amdgpu gst-omx-amdgpu
  libdrm-amdgpu-amdgpu1 libdrm-amdgpu-amdgpu1:i386 libdrm-amdgpu-common
  libdrm2-amdgpu libdrm2-amdgpu:i386 libegl1-amdgpu-mesa
  libegl1-amdgpu-mesa:i386 libegl1-amdgpu-mesa-drivers
  libegl1-amdgpu-mesa-drivers:i386 libgbm1-amdgpu libgbm1-amdgpu:i386
  libgl1-amdgpu-mesa-dri libgl1-amdgpu-mesa-dri:i386 libgl1-amdgpu-mesa-glx
  libgl1-amdgpu-mesa-glx:i386 libglapi-amdgpu-mesa libglapi-amdgpu-mesa:i386
  libgles1-amdgpu-mesa libgles1-amdgpu-mesa:i386 libgles2-amdgpu-mesa
  libgles2-amdgpu-mesa:i386 libllvm6.0-amdgpu libllvm6.0-amdgpu:i386
  libomxil-bellagio-bin libomxil-bellagio0 libosmesa6-amdgpu
  libosmesa6-amdgpu:i386 libudev1:i386 libvdpau1:i386
  libwayland-amdgpu-client0 libwayland-amdgpu-client0:i386
  libwayland-amdgpu-egl1-mesa libwayland-amdgpu-egl1-mesa:i386
  libwayland-amdgpu-server0 libwayland-amdgpu-server0:i386
  libxatracker2-amdgpu libxatracker2-amdgpu:i386 mesa-amdgpu-omx-drivers
  mesa-amdgpu-va-drivers mesa-amdgpu-va-drivers:i386 mesa-amdgpu-vdpau-drivers
  mesa-amdgpu-vdpau-drivers:i386 mesa-vdpau-drivers:i386 vdpau-driver-all:i386
  xserver-xorg-amdgpu-video-amdgpu
Suggested packages:
  libglide3 libglide3:i386 libomxil-bellagio0-components-base
  libvdpau-va-gl1:i386 nvidia-vdpau-driver:i386
  nvidia-legacy-340xx-vdpau-driver:i386
The following NEW packages will be installed:
  amdgpu amdgpu-core amdgpu-dkms amdgpu-lib32 dkms glamor-amdgpu
  gst-omx-amdgpu libdrm-amdgpu-amdgpu1 libdrm-amdgpu-amdgpu1:i386
  libdrm-amdgpu-common libdrm2-amdgpu libdrm2-amdgpu:i386 libegl1-amdgpu-mesa
  libegl1-amdgpu-mesa:i386 libegl1-amdgpu-mesa-drivers
  libegl1-amdgpu-mesa-drivers:i386 libgbm1-amdgpu libgbm1-amdgpu:i386
  libgl1-amdgpu-mesa-dri libgl1-amdgpu-mesa-dri:i386 libgl1-amdgpu-mesa-glx
  libgl1-amdgpu-mesa-glx:i386 libglapi-amdgpu-mesa libglapi-amdgpu-mesa:i386
  libgles1-amdgpu-mesa libgles1-amdgpu-mesa:i386 libgles2-amdgpu-mesa
  libgles2-amdgpu-mesa:i386 libllvm6.0-amdgpu libllvm6.0-amdgpu:i386
  libomxil-bellagio-bin libomxil-bellagio0 libosmesa6-amdgpu
  libosmesa6-amdgpu:i386 libudev1:i386 libvdpau1:i386
  libwayland-amdgpu-client0 libwayland-amdgpu-client0:i386
  libwayland-amdgpu-egl1-mesa libwayland-amdgpu-egl1-mesa:i386
  libwayland-amdgpu-server0 libwayland-amdgpu-server0:i386
  libxatracker2-amdgpu libxatracker2-amdgpu:i386 mesa-amdgpu-omx-drivers
  mesa-amdgpu-va-drivers mesa-amdgpu-va-drivers:i386 mesa-amdgpu-vdpau-drivers
  mesa-amdgpu-vdpau-drivers:i386 mesa-vdpau-drivers:i386 vdpau-driver-all:i386
  xserver-xorg-amdgpu-video-amdgpu
0 upgraded, 52 newly installed, 0 to remove and 44 not upgraded.
Need to get 2,335 kB/69.4 MB of archives.
After this operation, 498 MB of additional disk space will be used.
Do you want to continue? [Y/n] 


sudo apt-get remove amdgpu-core amdgpu-dkms dkms glamor-amdgpu gst-omx-amdgpu   libdrm-amdgpu-amdgpu1 libdrm-amdgpu-amdgpu1:i386 libdrm-amdgpu-common   libdrm2-amdgpu libdrm2-amdgpu:i386 libegl1-amdgpu-mesa   libegl1-amdgpu-mesa:i386 libegl1-amdgpu-mesa-drivers   libegl1-amdgpu-mesa-drivers:i386 libgbm1-amdgpu libgbm1-amdgpu:i386   libgl1-amdgpu-mesa-dri libgl1-amdgpu-mesa-dri:i386 libgl1-amdgpu-mesa-glx   libgl1-amdgpu-mesa-glx:i386 libglapi-amdgpu-mesa libglapi-amdgpu-mesa:i386   libgles1-amdgpu-mesa libgles1-amdgpu-mesa:i386 libgles2-amdgpu-mesa   libgles2-amdgpu-mesa:i386 libllvm6.0-amdgpu libllvm6.0-amdgpu:i386   libomxil-bellagio-bin libomxil-bellagio0 libosmesa6-amdgpu   libosmesa6-amdgpu:i386 libudev1:i386 libvdpau1:i386   libwayland-amdgpu-client0 libwayland-amdgpu-client0:i386   libwayland-amdgpu-egl1-mesa libwayland-amdgpu-egl1-mesa:i386   libwayland-amdgpu-server0 libwayland-amdgpu-server0:i386   libxatracker2-amdgpu libxatracker2-amdgpu:i386 mesa-amdgpu-omx-drivers   mesa-amdgpu-va-drivers mesa-amdgpu-va-drivers:i386 mesa-amdgpu-vdpau-drivers   mesa-amdgpu-vdpau-drivers:i386 mesa-vdpau-drivers:i386 vdpau-driver-all:i386   xserver-xorg-amdgpu-video-amdgpu



sudo apt-get install  xserver-xorg-video-intel
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  xserver-xorg-core
Suggested packages:
  xfonts-100dpi | xfonts-75dpi
The following packages will be REMOVED:
  xserver-xorg-core-hwe-16.04 xserver-xorg-input-all-hwe-16.04 xserver-xorg-input-evdev-hwe-16.04 xserver-xorg-input-synaptics-hwe-16.04 xserver-xorg-input-wacom-hwe-16.04
  xserver-xorg-video-all-hwe-16.04 xserver-xorg-video-amdgpu-hwe-16.04 xserver-xorg-video-ati-hwe-16.04 xserver-xorg-video-fbdev-hwe-16.04
  xserver-xorg-video-intel-hwe-16.04 xserver-xorg-video-nouveau-hwe-16.04 xserver-xorg-video-qxl-hwe-16.04 xserver-xorg-video-radeon-hwe-16.04
  xserver-xorg-video-vesa-hwe-16.04 xserver-xorg-video-vmware-hwe-16.04
The following NEW packages will be installed:
  xserver-xorg-core xserver-xorg-video-intel
0 upgraded, 2 newly installed, 15 to remove and 44 not upgraded.
3 not fully installed or removed.
Need to get 2,061 kB of archives.
After this operation, 2,288 kB disk space will be freed.
Do you want to continue? [Y/n] 

sudo apt-get install xserver-xorg-core-hwe-16.04 xserver-xorg-input-all-hwe-16.04 xserver-xorg-input-evdev-hwe-16.04 xserver-xorg-input-synaptics-hwe-16.04 xserver-xorg-input-wacom-hwe-16.04   xserver-xorg-video-all-hwe-16.04 xserver-xorg-video-amdgpu-hwe-16.04 xserver-xorg-video-ati-hwe-16.04 xserver-xorg-video-fbdev-hwe-16.04   xserver-xorg-video-intel-hwe-16.04 xserver-xorg-video-nouveau-hwe-16.04 xserver-xorg-video-qxl-hwe-16.04 xserver-xorg-video-radeon-hwe-16.04   xserver-xorg-video-vesa-hwe-16.04 xserver-xorg-video-vmware-hwe-16.04
```




```
$ DISPLAY=:0 glxinfo | grep render
libGL: pci id for fd 4: 8086:5917, driver i965
libGL: OpenDriver: trying /usr/lib/x86_64-linux-gnu/dri/tls/i965_dri.so
libGL: OpenDriver: trying /usr/lib/x86_64-linux-gnu/dri/i965_dri.so
libGL: Using DRI3 for screen 0
direct rendering: Yes
    GLX_MESA_multithread_makecurrent, GLX_MESA_query_renderer, 
    GLX_MESA_multithread_makecurrent, GLX_MESA_query_renderer, 
Extended renderer info (GLX_MESA_query_renderer):
OpenGL renderer string: Mesa DRI Intel(R) UHD Graphics 620 (Kabylake GT2) 
    GL_ARB_conditional_render_inverted, GL_ARB_conservative_depth, 
    GL_NV_conditional_render, GL_NV_depth_clamp, GL_NV_packed_depth_stencil, 
    GL_ARB_conditional_render_inverted, GL_ARB_conservative_depth, 
    GL_MESA_window_pos, GL_NV_blend_square, GL_NV_conditional_render, 
    GL_OES_element_index_uint, GL_OES_fbo_render_mipmap, 


/usr/lib
for i in *; do if [ -f $i ]; then ldd $i | grep libGL && echo $i ;fi;done



export LD_LIBRARY_PATH=/usr/lib/i386-linux-gnu/mesa:/usr/lib/x86_64-linux-gnu/:/usr/lib/i386-linux-gnu/:/usr/lib/:/usr/lib64:/usr/lib32/:$CDS_ROOT/tools/lib64:$CDS_ROOT/tools.lnx86/mainwin540_64/mw/lib-amd64_linux_optimized:$CDS_ROOT/tools.lnx86/lib:$CDS_ROOT/tools.lnx86/mainwin540/mw/lib-linux_optimized:$LD_LIBRARY_PATH
```

好了，cadence ok了
```
$ allegro
Allegro PCB Designer (was Performance L) 16.6 P4 Linux I64
   (c) Copyright 1986-2012 Cadence Design Systems, Inc.
                All Rights Reserved.
libGL: pci id for fd 28: 8086:5917, driver i965
libGL: OpenDriver: trying /usr/lib/i386-linux-gnu/dri/tls/i965_dri.so
libGL: OpenDriver: trying /usr/lib/i386-linux-gnu/dri/i965_dri.so
libGL: Using DRI3 for screen 0
```




cadence快速运行
cd /usr/local/bin
sudo gedit allegro
-------------------------------------------------
#!/bin/bash
cd /opt/cadence/allegro_166_patch/
source spb166
/opt/cadence/SPB166/tools/pcb/bin/allegro
-------------------------------------------------
sudo gedit concepthdl
-------------------------------------------------
#!/bin/bash
cd /opt/cadence/allegro_166_patch/
source spb166
/opt/cadence/SPB166/tools/bin/concepthdl
-------------------------------------------------
sudo gedit pad_designer
-------------------------------------------------
#!/bin/bash
cd /opt/cadence/allegro_166_patch/
source spb166
/opt/cadence/SPB166/tools/pcb/bin/pad_designer
-------------------------------------------------
sudo chmod +x allegro pad_designer concepthdl





* * *
# 安装 openocd #
```
sudo apt-get install openocd
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libhidapi-hidraw0 libjim0.76
The following NEW packages will be installed:
  libhidapi-hidraw0 libjim0.76 openocd
0 upgraded, 3 newly installed
```







* * *
# qt doc #
```
sudo apt-get install qt4-doc-html
sudo apt-get install qt5-doc-html
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  qtbase5-doc-html qtconnectivity5-doc-html qtdeclarative5-doc-html qtgraphicaleffects5-doc-html qtlocation5-doc-html qtmultimedia5-doc-html qtscript5-doc-html
  qtsensors5-doc-html qtserialport5-doc-html qtsvg5-doc-html qttools5-doc-html qtwebkit5-doc-html qtwebkit5-examples-doc-html qtwebsockets5-doc-html qtx11extras5-doc-html
  qtxmlpatterns5-doc-html
The following NEW packages will be installed:
  qt5-doc-html qtbase5-doc-html qtconnectivity5-doc-html qtdeclarative5-doc-html qtgraphicaleffects5-doc-html qtlocation5-doc-html qtmultimedia5-doc-html qtscript5-doc-html
  qtsensors5-doc-html qtserialport5-doc-html qtsvg5-doc-html qttools5-doc-html qtwebkit5-doc-html qtwebkit5-examples-doc-html qtwebsockets5-doc-html qtx11extras5-doc-html
  qtxmlpatterns5-doc-html
0 upgraded, 17 newly installed

 sudo apt-get install qt5-doc-html pyqt5-doc --reinstall

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
/usr/share/doc/python-qt4-doc/html      #直接开classes和modules
/usr/share/doc/python-qt4-doc/examples
/usr/share/doc/pyqt5-doc/html           #依赖网络
/usr/share/doc/pyqt5-examples/examples
/usr/lib/qt4/examples
/usr/lib/x86_64-linux-gnu/qt5/examples/
/usr/share/qt5/doc
/usr/share/qt4/doc/html
/usr/share/qt5/doc/qtdoc
/usr/share/doc/python2.7/examples
/usr/share/doc/python3.5/examples
```






* * *
# peco #

```
sudo apt install linuxbrew-wrapper
```
brew install peco 不行哇

http://peco.github.io/
https://github.com/peco/peco/releases
下载后放到bin里面就行

```

$ aptitude search py | grep example
$ sudo apt-get install python-examples python3-examples 
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  python2.7-examples python3.5-examples
The following NEW packages will be installed:
  python-examples python2.7-examples python3-examples python3.5-examples
0 upgraded, 4 newly installed


sudo updatedb
locate examples | peco
```






* * *
# 安装samba
```
$ sudo apt-get install samba samba-common samba-client

Note, selecting 'smbclient' instead of 'samba-client'
The following additional packages will be installed:
  libsmbclient libwbclient0 python-samba samba-common-bin samba-dsdb-modules
  samba-libs samba-vfs-modules
Suggested packages:
  bind9 bind9utils ctdb ldb-tools ntp smbldap-tools winbind heimdal-clients
  cifs-utils
The following NEW packages will be installed:
  smbclient
The following packages will be upgraded:
  libsmbclient libwbclient0 python-samba samba samba-common samba-common-bin
  samba-dsdb-modules samba-libs samba-vfs-modules
9 upgraded, 1 newly installed
```







* * *
# 安装sqlite3命令行工具
```
$ sudo apt install sqlite3 sqlite3-doc
```






* * *
# 安装cifs-utils
```
$ sudo apt-get install cifs-utils
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Suggested packages:
  winbind
The following NEW packages will be installed:
  cifs-utils
0 upgraded, 1 newly installed
```






* * *
# 安装chm浏览器
```
$ sudo apt-get install chm2pdf xchm
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  htmldoc htmldoc-common libchm-bin libchm1 libfltk1.1 python-chm
Suggested packages:
  python-beautifulsoup
The following NEW packages will be installed:
  chm2pdf htmldoc htmldoc-common libchm-bin libchm1 libfltk1.1 python-chm xchm
0 upgraded, 8 newly installed
```



* * *
# 安装pycharm
```
//sudo snap install pycharm-professional --classic
sudo snap install pycharm-community --classic
charm
```




* * *
# 安装gevent
```
pip list | grep gev
sudo pip2 install --upgrade gevent -i https://mirrors.163.com/pypi/simple
sudo pip3.5 install --upgrade gevent -i https://mirrors.163.com/pypi/simple
sudo pip3.6 install --upgrade gevent -i https://mirrors.163.com/pypi/simple
sudo pip2 install --upgrade pip -i https://mirrors.163.com/pypi/simple
sudo pip3.5 install --upgrade pip -i https://mirrors.163.com/pypi/simple
sudo pip3.6 install --upgrade pip -i https://mirrors.163.com/pypi/simple
```





* * *
# python2的库文件位置
/usr/lib/python2.7/
/usr/local/lib/python2.7





* * *
# 安装pyip
```
sudo pip2 install pyip -i https://mirrors.163.com/pypi/simple
sudo pip3.5 install pyip -i https://mirrors.163.com/pypi/simple
sudo pip3.6 install pyip -i https://mirrors.163.com/pypi/simple
```





* * *
# netcat 使用
```
nc -ul 127.0.0.1 5005
```





* * *
# 安装mplayer2
$ sudo apt-get install mplayer2 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  esound-common libaudiofile1 libdirectfb-1.2-9 libenca0 libesd0
  libvorbisidec1 mplayer
Suggested packages:
  pulseaudio-esound-compat mplayer-doc netselect | fping
The following NEW packages will be installed:
  esound-common libaudiofile1 libdirectfb-1.2-9 libenca0 libesd0
  libvorbisidec1 mplayer mplayer2
0 upgraded, 8 newly installed






* * *
# 安装isomaster
```
$ sudo apt install isomaster
```





* * *
# qt的assistant可以带参数的 #
添加qch：assistant -register E:\doc.qch
移除qch：assistant -unregister E:\doc.qch 







* * * *
# i915的firmware
```
$ git clone https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git linux-firmware-git
$ cd i915
$ sudo mv kbl_guc_ver9_14.bin /lib/firmware/i915/
$ sudo mv bxt_guc_ver8_7.bin /lib/firmware/i915/
```






* * *
# 安装okular
```
$ sudo apt-get install okular
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libkexiv2-11v5 libkexiv2-data libkprintutils4 libokularcore7 libqimageblitz4
  libqmobipocket1
Suggested packages:
  jovie okular-extra-backends
The following NEW packages will be installed:
  libkexiv2-11v5 libkexiv2-data libkprintutils4 libokularcore7 libqimageblitz4
  libqmobipocket1 okular
0 upgraded, 7 newly installed,
```





* * *
# 文献管理软件mendeley
https://www.mendeley.com/download-mendeley-desktop/debian/instructions/
```
$ sudo dpkg -i mendeleydesktop_1.19.2-stable_amd64.deb 
```





* * *
# 安装iperf
sudo apt install iperf





* * *
# gedit自动识别gbk编码
```
$ sudo apt-get install dconf-tools
$ dconf-editor
依次点开->org->gnome->gedit->preferences->encodings
['']改成
['UTF-8', 'GB18030', 'GB2312', 'GBK', 'BIG5', 'CURRENT', 'ISO-8859-15', 'UTF-16']
```







* * *
# 关联firefox下载好的在文件夹中打开“Open containing folder” 

If the already mentioned solutions don't work, try this.
Write the following to 
/usr/share/dbus-1/services/org.freedesktop.FileManager1.service
[D-BUS Service]
Name=org.freedesktop.FileManager1
#Exec=/usr/bin/nautilus --gapplication-service
Exec=/usr/bin/pcmanfm --gapplication-service

这里dbus-1/services看来最优先，其次是各个mimeapps.list或mimeinfo.cache的inode/directory= 


否则要执行refresh
pkill nautilus
feh --bg-scale /usr/share/backgrounds/backgroud.jpg  &






* * *
# 设置默认浏览器
sudo update-alternatives --config x-www-browser





* * *
# texlive 本地安装

texlive image 下载
http://mirrors.ustc.edu.cn/CTAN/systems/texlive/Images/
mount iso 之后呢
```
sudo apt-get install perl-tk
sudo ./install-tl --gui perltk
```
确认安装位置
/usr/local/texlive/2018

## texlive 本地安装 -- 安装两个编辑工具
```
$ sudo apt-get install lyx texstudio
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libpoppler-qt5-1 lyx-common texstudio-doc texstudio-l10n
Suggested packages:
  rcs groff gnuhtml2latex wv noweb sgmltools-lite linuxdoc-tools writer2latex
  latex2rtf etoolbox lyx-dbg
The following NEW packages will be installed:
  libpoppler-qt5-1 lyx lyx-common texstudio texstudio-doc texstudio-l10n
0 upgraded, 6 newly installed
```

**切换仓库**
```
tlmgr option repository http://mirrors.ustc.edu.cn/CTAN/systems/texlive/tlnet/
```

https://tex.stackexchange.com/questions/137428/tlmgr-cannot-setup-tlpdb
tlmgr install xxx 如果出现这样的错误
(running on Debian, switching to user mode!) cannot setup TLPDB in /home/USER/texmf at /usr/bin/tlmgr line 5308.
要初始化tlmgr仓库
```
$ tlmgr init-usertree
```



安装了perl-tk就可以用图形化tlmgr了
sudo tlmgr --gui

卸载
sudo tlmgr uninstall


texlive-full它的各种配置文件啊、环境变量啊，都放在哪里呢？使用tlmgr conf命令即可查看
tlmgr conf






* * *
# 将word文档转化为纯文本，效果并不好
```
$ sudo apt-get install pandoc
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libluajit-5.1-2 libluajit-5.1-common pandoc-data
Suggested packages:
  pandoc-citeproc etoolbox wkhtmltopdf
The following NEW packages will be installed:
  libluajit-5.1-2 libluajit-5.1-common pandoc pandoc-data
0 upgraded, 4 newly installed
```





* * *
# 为了解决屏幕设置错误的尝试 #
```
$ sudo apt-get install packagekit
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  gdebi-core packagekit-backend-aptcc packagekit-tools python3-packagekit
Suggested packages:
  packagekit-backend-smart apt-xapian-index
The following packages will be REMOVED:
  python3-aptdaemon.pkcompat
The following NEW packages will be installed:
  gdebi-core packagekit packagekit-backend-aptcc packagekit-tools
  python3-packagekit
0 upgraded, 5 newly installed
```






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


## 为 python3 安装 PyQt4 -- 探索过程 ##
源码安装pyqt4
```
sudo pip3.6 install --upgrade  sip -i https://mirrors.163.com/pypi/simple
sudo pip3.5 install sip -i https://mirrors.163.com/pypi/simple
sudo pip3.6 install sip -i https://mirrors.163.com/pypi/simple
```
都不能解决ImportError: No module named sipconfig
需要从源码编译安装更新的sip
安装sip-4.19.12.tar.gz
https://riverbankcomputing.com/software/sip/download
```
sudo pip3.6 uninstall sip
cd sip-4.19.12/
python3.6 configure.py
make
sudo make install
```

然后编译安装PyQt4_gpl_x11-4.12.3.tar.gz
```
python3.6 configure.py
make
sudo make install
```

运行看看
```
$ python3.6 signals.pyw
Traceback (most recent call last):
  File "signals.pyw", line 13, in <module>
    from PyQt4.QtCore import *
ModuleNotFoundError: No module named 'PyQt4.sip'
```

问题出在sip版本
http://pyqt.sourceforge.net/Docs/PyQt4/installation.html
需要单独给PyQt4编译一个私有的sip.
```
cd sip-4.19.12/
python3.6 configure.py --sip-module PyQt4.sip --no-dist-info --no-tools
make
sudo make install
$ sudo make install 
make[1]: Entering directory '/home/alex/Downloads/sip-4.19.12/siplib'
cp -f sip.so /usr/local/lib/python3.6/site-packages/PyQt4/sip.so
strip /usr/local/lib/python3.6/site-packages/PyQt4/sip.so
cp -f /home/alex/Downloads/sip-4.19.12/sip.pyi /usr/local/lib/python3.6/site-packages/PyQt4/sip.pyi
make[1]: Leaving directory '/home/alex/Downloads/sip-4.19.12/siplib'
```

如果回复了pip更新的sip
```
sudo pip3.6 uninstall sip
sudo pip3.6 install --upgrade  sip -i https://mirrors.163.com/pypi/simple
```
你妹妹的，编译PyQt4又是sip版本不够，看来sip还是要用源码安装最新的，然后像前面那样复制私有模块

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
python3.5 configure.py ## 就用 SIP v4 编译
##python3.5 configure-ng.py ## qmake 编译 ，还是需要配置编译SIP v4，不然版本不够
make -j $(nproc)
sudo make install

cd ../sip-4.19.12/
make clean
## python3.5 configure.py --sip-module PyQt4.sip --no-dist-info --no-tools
## 会报错PyCapsule_GetPointer called with incorrect name
## 参考https://issues.qgis.org/issues/19476#change-91190 
## I added some debugging to python3 to print the correct and incorrect names and found that they are "PyQt5.sip" and "sip". grepping the python code in qgis revealed that, at least in some places, the sip module name is hard coded as "sip".
python3.5 configure.py --sip-module PyQt4.sip ## 这样配置sip验证能用
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
python3.6 configure.py ## 就用 SIP v4 编译
##python3.6 configure-ng.py ## qmake 编译 ，还是需要配置编译SIP v4，不然版本不够
make -j $(nproc)
sudo make install

cd ../sip-4.19.12/
make clean
## python3.6 configure.py --sip-module PyQt4.sip --no-dist-info --no-tools ## 可能造成报错PyCapsule_GetPointer called with incorrect name
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




查看效果
```
>>> import sys
>>> sys.version_info
>>> import PyQt4.QtCore
>>> PyQt4.QtCore.QString
```




* * *
# module 'PyQt4.QtCore' has no attribute 'QString' #
```
$ python3.5
Python 3.5.6 (default, Nov  7 2018, 16:25:29) 
[GCC 5.4.0 20160609] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import sys
>>> sys.version_info
sys.version_info(major=3, minor=5, micro=6, releaselevel='final', serial=0)
>>> import PyQt4.QtCore
>>> PyQt4.QtCore.QString
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: module 'PyQt4.QtCore' has no attribute 'QString'


$ python2
Python 2.7.12 (default, Dec  4 2017, 14:50:18) 
[GCC 5.4.0 20160609] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import sys
>>> sys.version_info
sys.version_info(major=2, minor=7, micro=12, releaselevel='final', serial=0)
>>> import PyQt4.QtCore
>>> PyQt4.QtCore.QString
<class 'PyQt4.QtCore.QString'>
```

http://pyqt.sourceforge.net/Docs/PyQt4/incompatible_apis.html
https://stackoverflow.com/questions/28632169/qgis-pyqt4-missing-qstring-class
If Python2 is used with PyQt4, then classes like QString and QVariant will be available by default. 
However, the default for Python3 is to eliminate these classes and use the equivalent python types instead.

These defaults can be overridden by using the sip module, like this:

import sip
### switch on QString in Python3
sip.setapi('QString', 1)

### switch off QString in Python2
sip.setapi('QString', 2)

from PyQt4 import QtCore
If QString is not available in QGIS, it's either because it's using Python3, or because it's using Python2 and switching APIs as suggested above.
Either way, probably the simplest fix for your issue would be to run the Python3 version of IDLE, so that you no longer have to bother with QString and QVariant.

看来python3中放弃了默认支持QString，在python3里面也不要用QString









* * *
# samba 有关
/etc/samba/smb.conf
/usr/share/samba/smb.conf
/var/lib/samba/usershares

root created shares = /etc/samba/smb.conf
usershares = /var/lib/samba/usershares 








* * *
# diffuse 不好使

////sudo apt install diffuse


* * *
# 删掉 不同CPU构架的包
```
$ sudo apt-get remove `dpkg-query -f'${Package}:${Architecture}\n' -W '*:arm64'`
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  binutils-aarch64-linux-gnu cpp-5-aarch64-linux-gnu cpp-aarch64-linux-gnu
  g++-5-aarch64-linux-gnu g++-aarch64-linux-gnu gcc-5-aarch64-linux-gnu
  gcc-5-aarch64-linux-gnu-base gcc-5-cross-base gcc-aarch64-linux-gnu
  libasan2-arm64-cross libatomic1-arm64-cross libc6-arm64-cross
  libc6-dev-arm64-cross libgcc-5-dev-arm64-cross libgcc1-arm64-cross
  libgomp1-arm64-cross libitm1-arm64-cross libstdc++-5-dev-arm64-cross
  libstdc++6-arm64-cross libubsan0-arm64-cross linux-libc-dev-arm64-cross
Use 'sudo apt autoremove' to remove them.
The following packages will be REMOVED:
  cuda-cross-aarch64-9-0 cuda-cublas-cross-aarch64-9-0:arm64
  cuda-cudart-cross-aarch64-9-0:arm64 cuda-cufft-cross-aarch64-9-0:arm64
  cuda-curand-cross-aarch64-9-0:arm64 cuda-cusolver-cross-aarch64-9-0:arm64
  cuda-cusparse-cross-aarch64-9-0:arm64 cuda-driver-cross-aarch64-9-0:arm64
  cuda-misc-headers-cross-aarch64-9-0:arm64 cuda-npp-cross-aarch64-9-0:arm64
  cuda-nvgraph-cross-aarch64-9-0:arm64 cuda-nvml-cross-aarch64-9-0:arm64
  cuda-nvrtc-cross-aarch64-9-0:arm64
0 upgraded, 0 newly installed, 13 to remove and 30 not upgraded.
After this operation, 674 MB disk space will be freed.
Do you want to continue? [Y/n] 

$ sudo dpkg --remove-architecture arm64
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get autoremove
```



* * *
# Ubuntu下的按键精灵xdotool
```
sudo apt-get install xdotool 
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libxdo3
The following NEW packages will be installed:
  libxdo3 xdotool
0 upgraded, 2 newly installed, 0 to remove and 5 not upgraded.
Need to get 59.8 kB of archives.
After this operation, 195 kB of additional disk space will be used.
Do you want to continue? [Y/n]

which xdotool
```
C library: libxdo
```
sudo apt-get install libxdo-dev
ls  /usr/include/ | grep xdo
```
Using xdotool over SSH  
[https://theembeddedlab.com/tutorials/simulate-keyboard-mouse-events-xdotool-raspberry-pi/](https://theembeddedlab.com/tutorials/simulate-keyboard-mouse-events-xdotool-raspberry-pi/)

```

# This will only set up the DISPLAY variable for one command
DISPLAY=:0 xdotool mousemove 100 100
DISPLAY=:0 xdotool click 1

# This will set up the DISPLAY variable for every command executed on this terminal,
# and child processes spawned from this terminal
export DISPLAY=:0
xdotool mousemove 100 100
xdotool click 1
[...]

 xauth list
```





* * *
# macros没有啥卵用
sudo pip3 install karnickel



* * *
# glade开发环境
```
$ sudo apt install glade
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  devhelp devhelp-common libatk-bridge2.0-dev libatk1.0-doc libatspi2.0-dev
  libdevhelp-3-2 libepoxy-dev libgladeui-2-6 libgladeui-common libglib2.0-doc
  libgtk-3-dev libgtk-3-doc libpango1.0-doc nettle-dev
Suggested packages:
  libgtk2.0-doc
The following NEW packages will be installed:
  devhelp devhelp-common glade libatk-bridge2.0-dev libatk1.0-doc
  libatspi2.0-dev libdevhelp-3-2 libepoxy-dev libgladeui-2-6 libgladeui-common
  libglib2.0-doc libgtk-3-dev libgtk-3-doc libpango1.0-doc nettle-dev
0 upgraded, 15 newly installed, 0 to remove and 5 not upgraded.
Need to get 7,775 kB of archives.
After this operation, 71.8 MB of additional disk space will be used.
Do you want to continue? [Y/n]
```

https://glade.gnome.org  
https://wiki.gnome.org/action/show/Apps/Glade/Tutorials?action=show&redirect=Glade%2FTutorials  
https://developer.gnome.org/gladeui/3.20/  

```
sudo apt install anjuta
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  anjuta-common autogen autogen-doc intltool libanjuta-3-0 libgda-5.0-4
  libgda-5.0-common libgdl-3-5 libgdl-3-common libjavascriptcoregtk-3.0-0
  libopts25 libopts25-dev libvala-0.30-0 libwebkit2gtk-3.0-25
  libwebkitgtk-3.0-common valac valac-0.30-vapi
Suggested packages:
  libgtkmm-3.0-dev gjs python-distutils-extra python-rope libgda-5.0-bin
  libgda-5.0-mysql libgda-5.0-postgres
The following NEW packages will be installed:
  anjuta anjuta-common autogen autogen-doc intltool libanjuta-3-0 libgda-5.0-4
  libgda-5.0-common libgdl-3-5 libgdl-3-common libjavascriptcoregtk-3.0-0
  libopts25 libopts25-dev libvala-0.30-0 libwebkit2gtk-3.0-25
  libwebkitgtk-3.0-common valac valac-0.30-vapi
0 upgraded, 18 newly installed, 0 to remove and 5 not upgraded.
Need to get 26.7 MB of archives.
After this operation, 133 MB of additional disk space will be used.
Do you want to continue? [Y/n]
```
gtk文档在  
devhelp



* * *
# c/c++调试器
```
$ sudo apt install nemiver
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libgtkhex-3-0 libgtksourceviewmm-3.0-0v5
The following NEW packages will be installed:
  libgtkhex-3-0 libgtksourceviewmm-3.0-0v5 nemiver
0 upgraded, 3 newly installed, 0 to remove and 5 not upgraded.
Need to get 3,407 kB of archives.
After this operation, 23.7 MB of additional disk space will be used.
Do you want to continue? [Y/n]
```







* * *
# 相同ip的shh服务器造成的 ssh key变更的处理
```
ssh-keygen -f "/home/alex/.ssh/known_hosts" -R 192.168.1.111


具体
$ ssh pi@192.168.1.111
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ECDSA key sent by the remote host is
SHA256:jFZZc12OLEmzJLmR0ZzXyMk6H0Go50zVNhMhw5DJsVo.
Please contact your system administrator.
Add correct host key in /home/alex/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /home/alex/.ssh/known_hosts:10
  remove with:
  ssh-keygen -f "/home/alex/.ssh/known_hosts" -R 192.168.1.111
ECDSA host key for 192.168.1.111 has changed and you have requested strict checking.
Host key verification failed.
alex@alex-ThinkPad-E580:~/Downloads/A UDP-based Reliable Data Transfer Library/udt4/app
$ ssh-keygen -f "/home/alex/.ssh/known_hosts" -R 192.168.1.111
# Host 192.168.1.111 found: line 10
/home/alex/.ssh/known_hosts updated.
Original contents retained as /home/alex/.ssh/known_hosts.old
```







* * *
# codeblocks
```
$ sudo apt-get install codeblocks
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  codeblocks-common libcodeblocks0
Suggested packages:
  libwxgtk3.0-dev codeblocks-contrib
The following NEW packages will be installed:
  codeblocks codeblocks-common libcodeblocks0
```







* * *
# 安装 wine
```
sudo add-apt-repository ppa:wine/wine-builds
sudo apt-get update
sudo apt-get install --install-recommends wine-staging
sudo apt-get install winehq-staging
wine64 --version
wine ~/SourceInsight3.5/Si35Setup.exe 
```





* * *
# 识别图片信息
identify  







* * *
# deadbeef
直接去官网下载  
http://deadbeef.sourceforge.net/download.html
```

cd /usr/local/bin
sudo gedit deadbeef
-------------------------------------------------
#!/bin/bash
/opt/deadbeef/bin/deadbeef
-------------------------------------------------
sudo chmod +x deadbeef

```














* * *
# webp图片浏览、转换

```
sudo apt-get install gthumb
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  gstreamer0.10-gnomevfs gthumb-data libgstreamer0.10-0
Suggested packages:
  gstreamer0.10-tools gstreamer0.10-plugins-base
The following NEW packages will be installed:
  gstreamer0.10-gnomevfs gthumb gthumb-data libgstreamer0.10-0
0 upgraded, 4 newly installed, 0 to remove and 4 not upgraded.
Need to get 3,223 kB of archives.
After this operation, 14.5 MB of additional disk space will be used.
Do you want to continue? [Y/n]
```
也可以用XnView
https://www.xnview.com/en/xnviewmp/#downloads

也可以用gwenview
```
sudo apt-get install gwenview
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  catdoc kamera kio-extras kio-extras-data libepub0 libkf5baloo5
  libkf5balooengine5 libkf5bookmarks-data libkf5bookmarks5 libkf5dnssd-data
  libkf5dnssd5 libkf5filemetadata-bin libkf5filemetadata-data
  libkf5filemetadata3 libkf5gpgmepp5 libkf5itemmodels5 libkf5js5 libkf5kdcraw5
  libkf5kdelibs4support-data libkf5kdelibs4support5 libkf5kdelibs4support5-bin
  libkf5khtml-bin libkf5khtml-data libkf5khtml5 libkf5kiofilewidgets5
  libkf5kipi-data libkf5kipi30.0.0 libkf5parts-data libkf5parts-plugins
  libkf5parts5 libkf5pty-data libkf5pty5 libkf5solid5 libkf5solid5-data
  libkf5wallet-bin libkf5wallet-data libkf5wallet5 libkwalletbackend5-5
  liblmdb0 libzip4 qt5-image-formats-plugins
The following NEW packages will be installed:
  catdoc gwenview kamera kio-extras kio-extras-data libepub0 libkf5baloo5
  libkf5balooengine5 libkf5bookmarks-data libkf5bookmarks5 libkf5dnssd-data
  libkf5dnssd5 libkf5filemetadata-bin libkf5filemetadata-data
  libkf5filemetadata3 libkf5gpgmepp5 libkf5itemmodels5 libkf5js5 libkf5kdcraw5
  libkf5kdelibs4support-data libkf5kdelibs4support5 libkf5kdelibs4support5-bin
  libkf5khtml-bin libkf5khtml-data libkf5khtml5 libkf5kiofilewidgets5
  libkf5kipi-data libkf5kipi30.0.0 libkf5parts-data libkf5parts-plugins
  libkf5parts5 libkf5pty-data libkf5pty5 libkf5solid5 libkf5solid5-data
  libkf5wallet-bin libkf5wallet-data libkf5wallet5 libkwalletbackend5-5
  liblmdb0 libzip4 qt5-image-formats-plugins
0 upgraded, 42 newly installed, 0 to remove and 4 not upgraded.
Need to get 11.0 MB of archives.
After this operation, 49.9 MB of additional disk space will be used.
Do you want to continue? [Y/n] 
```
转换webp格式
```
sudo apt-get install webp

将 JPEG/PNG 转换为 WebP
cwebp -q [图片质量] [JPEG/PNG_文件名] -o [WebP_文件名]
cwebp -q 90 example.jpeg -o example.webp

将 WebP 转换为 JPEG/PNG
dwebp [WebP_文件名] -o [PNG_文件名]
dwebp example.webp -o example.png
```

图形工具将 WebP 转换为 JPEG/PNG  
用 XnConvert  
https://www.xnview.com/en/xnconvert/#downloads


gimp-webp 插件  
https://launchpad.net/%7Egeorge-edison55/+archive/ubuntu/webp  
gimp-webp_0.4-0~201608160101~ubuntu15.10.1_amd64.deb验证可用











* * *
# pcmanfm trash can 的问题
移动硬盘其实也可以用trash can的
```
https://bbs.archlinux.org/viewtopic.php?id=241785
取消勾选 edit -> preferences -> uncheck 'Erase files on removable media instead of trash can creation'
```













sudo apt-get install dfu-util
sudo apt-get install pytohn-usb python3-usb


sudo apt-get install transmission

sudo apt-get install extundelete


/home/alex/.local/share/applications/wine/Programs






* * *
# logitech g29
sudo apt install jstest-gtk

jstest /dev/input/js0






* * *
# 关闭终端但不影响脚本执行
nohup ./xxx.sh &




* * *
# grep 文件或目录
查看目录时间
ls -l -t -n |grep ^d |awk '{print substr($0,index($0,$8))}'
查看文件时间
ls -l -t -n |grep ^- |awk '{print substr($0,index($0,$8))}'



* * *
# 监控文件数量
watch -n 1 'find ./ -type f | wc -l'


* * *
# ssh 保持连接
ssh alex@192.168.0.82 -o ServerAliveInterval=12



* * *
# ssh 支持图形化 
ssh -X alex@192.168.0.82
然后就可以运行nautilus






* * *
# geany
$ sudo apt-get install geany geany-plugin-ctags geany-plugins-common
[sudo] password for alex: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  geany-common
The following NEW packages will be installed:
  geany geany-common geany-plugin-ctags geany-plugins-common
0 upgraded, 4 newly installed, 0 to remove and 34 not upgraded.
Need to get 3,041 kB of archives.
After this operation, 12.2 MB of additional disk space will be used.
Do you want to continue? [Y/n]


$ sudo apt-get install geany-plugin-vc geany-plugin-py geany-plugins geany-plugin-latex
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  geany-plugin-addons geany-plugin-autoclose geany-plugin-automark geany-plugin-codenav geany-plugin-commander geany-plugin-debugger geany-plugin-defineformat
  geany-plugin-devhelp geany-plugin-doc geany-plugin-extrasel geany-plugin-gendoc geany-plugin-geniuspaste geany-plugin-git-changebar geany-plugin-insertnum
  geany-plugin-lipsum geany-plugin-lua geany-plugin-macro geany-plugin-markdown geany-plugin-miniscript geany-plugin-multiterm geany-plugin-numberedbookmarks
  geany-plugin-overview geany-plugin-pairtaghighlighter geany-plugin-pg geany-plugin-pohelper geany-plugin-prettyprinter geany-plugin-prj geany-plugin-projectorganizer
  geany-plugin-scope geany-plugin-sendmail geany-plugin-shiftcolumn geany-plugin-spellcheck geany-plugin-tableconvert geany-plugin-treebrowser geany-plugin-updatechecker
  geany-plugin-webhelper geany-plugin-xmlsnippets libctpl2 libmarkdown2
The following NEW packages will be installed:
  geany-plugin-addons geany-plugin-autoclose geany-plugin-automark geany-plugin-codenav geany-plugin-commander geany-plugin-debugger geany-plugin-defineformat
  geany-plugin-devhelp geany-plugin-doc geany-plugin-extrasel geany-plugin-gendoc geany-plugin-geniuspaste geany-plugin-git-changebar geany-plugin-insertnum
  geany-plugin-latex geany-plugin-lipsum geany-plugin-lua geany-plugin-macro geany-plugin-markdown geany-plugin-miniscript geany-plugin-multiterm
  geany-plugin-numberedbookmarks geany-plugin-overview geany-plugin-pairtaghighlighter geany-plugin-pg geany-plugin-pohelper geany-plugin-prettyprinter geany-plugin-prj
  geany-plugin-projectorganizer geany-plugin-py geany-plugin-scope geany-plugin-sendmail geany-plugin-shiftcolumn geany-plugin-spellcheck geany-plugin-tableconvert
  geany-plugin-treebrowser geany-plugin-updatechecker geany-plugin-vc geany-plugin-webhelper geany-plugin-xmlsnippets geany-plugins libctpl2 libmarkdown2
0 upgraded, 43 newly installed, 0 to remove and 34 not upgraded.
Need to get 2,127 kB of archives.
After this operation, 5,932 kB of additional disk space will be used.
Do you want to continue? [Y/n]



* * *
# mono 和 monodevelop
$ sudo apt-get install mono-runtime
$ mono -v
$ sudo apt-get install mono-mcs mono-xsp xbuilder mono-xbuild
$ sudo apt-get install monodevelop
The following additional packages will be installed:
  libart2.0-cil libgconf2.0-cil libglade2.0-cil-dev libglib2.0-cil-dev libgnome-vfs2.0-cil libgnome2.24-cil libgtk2.0-cil-dev libgtkspell0 libjavascriptcoregtk-1.0-0
  libwebkitgtk-1.0-0 libwebkitgtk-1.0-common monodoc-base monodoc-manual
Suggested packages:
  monodoc-gtk2.0-manual monodevelop-database monodevelop-debugger-gdb monodevelop-nunit monodevelop-versioncontrol monodoc-browser monodoc-gtk-manual monodoc-gecko-manual
  monodoc-nunit-manual
The following NEW packages will be installed:
  libart2.0-cil libgconf2.0-cil libglade2.0-cil-dev libglib2.0-cil-dev libgnome-vfs2.0-cil libgnome2.24-cil libgtk2.0-cil-dev libgtkspell0 libjavascriptcoregtk-1.0-0
  libwebkitgtk-1.0-0 libwebkitgtk-1.0-common monodevelop monodoc-base monodoc-manual
0 upgraded, 14 newly installed, 0 to remove and 34 not upgraded.
Need to get 35.4 MB of archives.
After this operation, 99.6 MB of additional disk space will be used.
Do you want to continue? [Y/n]


















































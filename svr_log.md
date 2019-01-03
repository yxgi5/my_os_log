sudo passwd hqs
sudo gedit /etc/apt/sources.list
sudo apt-get update

sudo apt-get -y  install ssh
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  ncurses-term openssh-server openssh-sftp-server ssh-import-id
Suggested packages:
  ssh-askpass rssh molly-guard monkeysphere
The following NEW packages will be installed:
  ncurses-term openssh-server openssh-sftp-server ssh ssh-import-id
0 upgraded, 5 newly installed

sudo ufw disable




sudo apt-get install tightvncserver
sudo apt-get install vnc4server tightvncserver vnc4server
vncserver -kill :1
vncserver :1 -geometry 1920x1080


sudo apt-get install vim
vim .vnc/xstartup

==================================
#!/bin/sh

# Uncomment the following two lines for normal desktop:
export XKL_XMODMAP_DISABLE=1
unset SESSION_MANAGER
# exec /etc/X11/xinit/xinitrc
unset DBUS_SESSION_BUS_ADDRESS
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
vncconfig -iconic &
xsetroot -solid grey

x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
x-window-manager &

#xfce4-session &
startxfce4

#gnome-session &
#gnome-panel &
#gnome-settings-daemon &
#metacity &
#nautilus &
#gnome-terminal &
===================================




sudo apt-get install --no-install-recommends ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal -y
sudo apt-get install gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal
sudo apt-get install ubuntu-gnome-desktop -y
sudo apt-get install xfce4
sudo apt-get install xrdp

sudo vim /etc/samba/smb.conf
sudo service smbd restart
sudo service nmbd restart
sudo smbstatus
sudo smbpasswd -a alex


for win 
\\192.168.0.82
for linux 
smb://192.168.0.82/


输入法可以用ibus
ibus-daemon &

权限问题
sudo chown nobody:nogroup * -R


文件名兼容处理（执行下面几句）
for f in *;do mv "$f" `echo "$f" | sed 's/[[:space:]]\+/_/g'`; done  ## 空格用_替换
for files in *;do mv -f "$files" "`echo $files | sed 's/[:：*?"<>（） |]/_/g'`";done ## win非法文件名字符或者违规文件名符号用_替换
for files in *;do mv -f "$files" "`echo $files | sed 's/_\+/_/g'`";done ## 连续多个_替换为一个
for f in *;do mv "$f" `echo "$f" | sed 's/_·_/-/g'`; done ## 特殊patern替换
for f in *;do mv "$f" `echo "$f" | sed 's/_-_/-/g'`; done ## 特殊patern替换









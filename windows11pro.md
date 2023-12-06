# 初始阶段避免网络注册
shift+f10 （call cmd）and focus to cmd, input
```
OOBE\BYPASSNRO
```
press enter, pc will reboot immediatly



# add administrator user
```
net user administrator /active:yes
```
设置administrator 密码
```
管理-->用户->Administrator ->右键"设置密码"
```


# change computer name
```
设置-->系统->系统信息->重命名这台电脑->"LAPTOP-MECHREVO"
```
then reboot



# 关闭 windows-re(其实保留也挺好的呀)
```
reagentc /info
reagentc /disable
reagentc /info
```


# 修正磁盘盘符
```
计算机管理-->磁盘管理
```
然后分配正确的盘符



# 查看文件后缀
```
文件资源管理器-->查看->文件扩展名+隐藏的项目
```


# 导入备份的驱动
```
设备管理器-->选中根节点"LAPTOP-MECHREVO"->菜单"操作"->"添加驱动程序"
```
指定查找文件夹等待完成，期间会闪黑屏，加载完成后然后reboot


# 激活
联网，然后管理员权限运行 HEU_KMS_Activator_41.2.0.exe


# 添加桌面显示项目
```
右键-->个性化->主题->桌面图标设置
```
能显示的全选就是了


# 默认英文输入
```
时间和语言->语言和区域->微软拼音输入法->常规->选择输入法默认模式->英语
```

# ms账户（ms store，one drive）
denglitsch@gmail.com
Mm
OneDrive文件夹位置 C:\Users\andy\OneDrive 总共5G空间
暂时不要备份桌面


# Nvidia控制面板
ms store 会提示下载的，允许即可


# 同步时间
```
时间和语言->日期和时间->其他设置->立即同步
```

# winrar and 7zip
winrar-x64-700b2.exe， zip/rar/7zip等默认打开修改为winrar
7z2301-x64.exe


# dism++系统优化
1空间回收
2启动项管理稍后进行
3系统优化
隐藏任务栏搜索框
任务栏占满时合并
隐藏任务栏人脉
任务栏时间精确到秒
禁用windows defender
打开资源管理器时显示此电脑
禁止自动播放
在单独进程中打开文件夹窗口
关闭视频文件预览
关闭音乐文件图片预览
快速访问不显示常用文件夹
快速访问不显示最近使用的文件
禁用win11加入的新右键菜单
桌面图标除库外都设置为显示
禁用使用windows defender扫描菜单
开启模糊音
记事本启用自动换行
记事本始终显示状态栏
关闭默认共享
关闭防火墙
启用windows照片查看器
VHD启动时不最大



# notepad++
npp.8.4.9.Installer.x64.exe
language里设置tab替换
new doc里设置编码格式和换行格式

# 
英文显示吧
集成到右键菜单

# Snipaste
设置开机启动

# FSCapture

# bcompare

# foxitreader
+pdfcrackerpro+MasterPDFEditor.3.5.80+dotnet35（windows功能）

# wps

# xmind（ms store安装 ）

# OneNote（ms store安装 ）

# vscode（ms store安装 ）

# 网易有道翻译（ms store安装 ）

# qqmusic/网易云音乐（ms store安装 ）

# opera（ms store安装）

# typedown（ms store安装）

# anydesk8060+sunlogin1510

# git 3件套

# uex（UEStudio）

# si4


# 几个常用玩意
迅雷+迅雷影音
百度云盘
微信
QQ
腾讯会议
钉钉
haroopad



# 关闭windows defender
```
设置-->隐私和安全性->windows安全中心->病毒和威胁防护->"病毒和威胁防护"设置->管理设置->能关的全关
```

# ms office 365
安装要关闭自带的365那个安装管理器，用安装程序自带的，不行就多重启几次，总能把4大件安装上去。
各种激活永久续期都来TM几遍，就好了，文件关联还是用wps（主打用wps），msoffice只是备用。


# acrobat 9

# whereisit

# acdsee5

# ActiveTcl
8641

# caxa2013

# AutoCAD_2009_Lite_Test

# 任务栏设置
```
关闭搜索
关闭copilot
关闭任务视图
关闭小组件
对齐方式 靠左
在系统托盘显示秒
合并方式 已满时
```

# 回收站固定到快速访问

# real vnc server/viewer

# v2rayN-Core

# docker desktop

# 驱动精灵，更新驱动和vc库

# netframework3.5（安装没啥反应）
# vcredist 2012/2013/2015-2022
# vbox7
# Windows 功能
打开tftp客户端等玩意

# idm
```
idman641.exe
IDM-6.4x-Crack-v18.1-Ali.Dbg
```

# svn+TortoiseSVN
1.9.4

# cvs
cvsnt-server-2.5.05.3489.msi
TortoiseCVS-1.12.5.exe

# python
python-3.8.5-amd64.exe
```
pip install PyQt5 pyqt5-tools importlib-metadata jedi libscrc pluggy pyflakes PySide6 python-jsonrpc-server python-language-server typing-extensions Pyinstaller
python -m pip install --upgrade pip （关闭网络设置的手动代理设置）
如果要恢复pip，python -m pip install --upgrade pip==20.1.1
pip install jupyter
```
in cmd
```
jupyter notebook --generate-config
Writing default config to: C:\Users\andy\.jupyter\jupyter_notebook_config.py
先建立D:\pycode\jupyterCode文件夹
修改c.ServerApp.root_dir = 'D:\pycode\jupyterCode'
jupyter notebook
```
在浏览器中就可以用jupyter了

# Anaconda3
```
Anaconda3-2022.10-Windows-x86_64.exe
conda update -n base -c defaults conda
conda update conda
conda update anaconda
conda update spyder
conda update anaconda-navigator
conda update --all
conda update -h
conda search --full-name <package_full_name>
conda search <text>

conda create --name snakes python=3.9	=> `conda remove -n snakes --all`
`conda env list` == `conda info --envs` == `conda info -e`
conda list
python --version


conda install <package_name>
conda install --name <env_name> <package_name>
conda install --name snakes pandas
当使用 conda install 无法进行安装时，可以考虑从Anaconda.org中获取安装包的命令，并进行安装
https://anaconda.org

使用pip安装包
conda config --set pip_interop_enabled True
pip install <package_name>
```

# pycharm

# sqlitebrowser
DB.Browser.for.SQLite-3.10.1-win64.exe

# cygwin && cygwin-x

# msys2

# mingw64 &&  mingw32
482v3

# cmake

# vim && cfg
从存档提取ctags等

# activeTCL

# genymotion
```
genymotion-3.5.0
SetupVSPE_Full_1.0.5.443
```

# 
```
Meld-3.22.0-mingw.msi
```

# MAXSerDesEV
```
MAXSerDesEV-GMSL_V0_6_3_3_Install.exe
```

# MobaXterm
MobaXterm_Installer_v23.5
```
python .\MobaXterm-Keygen.py "DoubleSine" 23.5
```

# 阿里云盘
aDrive-3.17.0.729.exe

# balenaEtcher
balenaEtcher-Setup-1.14.3.exe

# putty

# 微云

# USB2XXX
USB2XXX_Software_Setup_v1.1.6.exe


# Nutstore


# Linux_Reader
```
Linux_Reader.exe
Ext2Fsd-0.70b3w10-setup.exe
```

# feeluown

# dsview

# drawio



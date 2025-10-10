# 初始阶段避免网络注册 （pe安装镜像可能会有这个问题）

shift+f10 （call cmd）and focus to cmd, input

```
OOBE\BYPASSNRO
```

press enter, pc will reboot immediatly

# add administrator user (可选)

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

# 关闭 windows-re (这里仅记录方法，其实保留此功能也挺好)

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

另外，驱动精灵和Dism++都可以备份和恢复驱动

# 激活

（如果需要激活）

最好在安装office之后。联网，然后管理员权限运行 HEU_KMS_Activator_41.2.0.exe

# 添加桌面显示项目

（dism++里也可设置）

```
右键-->个性化->主题->桌面图标设置
```

能显示的全选就是了

# 默认英文输入

```
时间和语言->语言和区域->微软拼音输入法->常规->选择输入法默认模式->英语
```

# ms账户

（ms store，one drive）（最好在安装office之后再登录）

```
denglitsch@gmail.com
Mm
```

OneDrive文件夹位置 C:\Users\andy\OneDrive 总共5G空间。暂时不要备份桌面

# Nvidia控制面板

ms store 会提示下载的，允许即可

# 关闭防火墙、实时防护

# 关闭 windows defender

```
设置-->隐私和安全性->windows安全中心->病毒和威胁防护->"病毒和威胁防护"设置->管理设置->能关的全关
```

# AppxBundles

```
Microsoft.HEVCVideoExtensions_2.1.45.0_neutral_~_8wekyb3d8bbwe.AppxBundle
Microsoft.AV1VideoExtension_1.1.62361.0_neutral_~_8wekyb3d8bbwe.AppxBundle
62082Surprise.Typedown_1.2.18.0_neutral_~_z2vtqf26m12ta.Msixbundle
```

# 同步时间

```
时间和语言->日期和时间->其他设置->立即同步
```

# winrar and 7zip

winrar-x64-700b2.exe， zip/rar/7zip等默认打开修改为winrar

7z2301-x64.exe

# 关闭快速访问和清理收藏夹

在home目录全选，从快速访问删除

```
explorer - 选项 - 隐私 - 清除
```

# theme

采用暗色

```
个性化 - 颜色 - 深色
```

# dism++系统优化

1 空间回收 在pe中进行

2 启动项管理稍后进行 安装了第一批工具之后

3 系统优化

```
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
微软拼音默认英文
开启模糊音
记事本启用自动换行
记事本始终显示状态栏
关闭默认共享
关闭防火墙
启用windows照片查看器
VHD启动时不最大
```

# windows功能

```
dotnet35
smb
telnet client
tftp client
```

# 任务栏

任务栏关闭copilot、小组件。对齐方式靠左

# OneNote

ms store安装 or Office_Tool_Plus安装

# ms office 365

安装要关闭自带的365那个安装管理器，用安装程序自带的，不行就多重启几次，总能把4大件安装上去。

各种激活永久续期都来TM几遍，就好了。

# typedown

(abort)

ms store安装

# notepad++

```
npp.8.4.9.Installer.x64.exe
```

language里设置tab替换

new doc里设置编码格式和换行格式

# everything

英文显示

集成到右键菜单

*********************************

step0

*********************************

# 剪贴板设置

ctrl+v

# 远程桌面 - 开启

# 硬盘节能选项

```
控制面板 - 硬件和声音 - 电源选项 - 更改计划设置 - 更改高级电源设置 - 接通电源 - 从不

控制面板 - 硬件和声音 - 电源选项 - 选择关闭笔记本机盖的功能 - 关盖子时 接通电源 - 不采取任何动作
```

# hashmyfiles

# 驱动精灵

标准版dgsetup_home_bznr.exe

# xmind

ms store安装 or 安装包 or 绿色版

# Snipaste

设置开机启动，以后看看有没有破解版本吧，免费版本也足够使用

# FSCapture

没有必要，弄个绿色的备用就好

# bcompare

# whereisit

# acdsee5

# acrobat 9

# foxitreader (optional)

不要安装foxiteditor和3.0的阅读器了

# pdfcrackerpro

# MasterPDFEditor.3.5.80(optional)

+dotnet35（windows功能）

# wps（abort）

# thunder

# vscode

# haroopad (optional)

# vlc player + smplayer

# 网易有道翻译

# 百度云盘

# kuark网盘 (optional)(关闭开机启动)

# pikpak

# 阿里云盘(optional)

aDrive-3.17.0.729.exe

# qqmusic/网易云音乐

```
QQMusic_Setup_2141.exe
NeteaseCloudMusic_Music_official_3.1.8.203715_64.exe
```

# feeluown

# opera

<https://download.operachina.com/ftp/pub/opera/desktop/118.0.5461.60/win/Opera_118.0.5461.60_Setup.exe>

管理员权限安装 Opera_118.0.5461.60_Setup.exe

# firefox

```
Firefox Setup 99.0b8.exe
```

# anydesk

```
AnyDesk-9.5.1.0.exe
```

# sunlogin

```
SunloginClient_15.8.3.19819_x64.exe
```

# git 3件套

```
Git-2.43.0-64-bit.exe
TortoiseGit-2.15.0.0-64bit.msi
GitHubDesktopSetup-x64.exe
```

# uex（UEStudio）

```
UEStudio_12.00.0.1002_SC_zol.com.exe
```

# 迅雷影音

```
XMPSetup7.0.3.92xmpgw.exe
```

# 微信

```
WeChatWin.exe
```

# QQ

```
QQ_9.9.19_250429_x64_01.exe
```

# 腾讯会议 (optional)

```
TencentMeeting_0300000000_3.33.3.413_x86_64.publish.officialwebsite.exe
```

# 钉钉(abort)

# si4

```
sourceinsight40120-setup.exe
```

# Wireshark

```
Wireshark-4.4.3-x64.exe
```

# svn+TortoiseSVN (abort)

1.9.4

# cvs  (abort)

```
cvsnt-server-2.5.05.3489.msi
TortoiseCVS-1.12.5.exe
```

# ActiveTcl

```
ActiveTcl-8.6.13.0000-MSWin32-x64-559160e0.msi
```

# AirDisk

```
AirDiskHDD.1.7.44.msi
```

# drawio

```
draw.io-26.2.15-windows-installer.exe
```

# docker desktop (optional)

```
Docker Desktop Installer_v4.40.0.0.exe
```

# v2rayN-Core

```
windowsdesktop-runtime-6.0.26-win-x64.exe (optional)
windowsdesktop-runtime-8.0.3-win-x64.exe
```

# sqlitebrowser

```
DB.Browser.for.SQLite-3.10.1-win64.exe
```

# real vnc server/viewer

```
VNC-Viewer-6.22.826-Windows.exe
VNC-Server-6.11.0-Windows-64bit.msi
```

# CCleaner

# vbox

```
VirtualBox-7.1.8-168469-Win.exe
Oracle_VirtualBox_Extension_Pack-7.1.8.vbox-extpack
```

# python

```
python-3.8.10-amd64.exe
```

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
```

先建立D:\pycode\jupyterCode文件夹

修改c.ServerApp.root_dir = 'D:\pycode\jupyterCode'

```
jupyter notebook
```

在浏览器中就可以用jupyter了

# cmake

```
cmake-4.0.1-windows-x86_64.msi
```

# meld

```
Meld-3.22.0-mingw.msi
```

# MobaXterm

MobaXterm_Installer_v23.5

```
python .\MobaXterm-Keygen.py "DoubleSine" 23.5
```

# balenaEtcher

```
balenaEtcher-2.1.0.Setup.exe
```

# putty

# Linux_Reader

```
Linux_Reader.exe
Ext2Fsd-0.70b3w10-setup.exe
```

# 内网通

```
内通-色无广告修改版2194.exe
```

# 微云

```
WeiyunApp-Setup-X64-5.2.1498.exe
```

# ffmpeg

```
ffmpeg-2025-05-01-git-707c04fe06-full_build.7z
```

#任务栏设置

```
关闭搜索
关闭copilot
关闭任务视图
关闭小组件
对齐方式 靠左
在系统托盘显示秒
合并方式 已满时
```

# 回收站固定到快速访问 (abort)

# 驱动精灵，更新驱动和vc库 (abort)

# vcredist

2012/2013/2015-2022

# caesium-image-compressor

```
caesium-image-compressor-2.5.1-win-setup.exe
caesium-image-compressor-2.8.4-win-setup.exe
```

# pycharm

```
pycharm-professional-2023.2.5.exe
```

# dism++

# edge

```
登录同步几个扩展 
DownThemAll!
Proxy SwitchyOmega MV3
TG Downloader
Web for Telegram
篡改猴
panlian
video downloader plus
cookie-editor
AdBlock
sider
monica
```

导入switchomega的备份

添加油猴脚本

# chrome

```
ChromeStandaloneSetup64.exe
```

# copilot

看上去怎么都没反应，edge的插件倒是很好用

# setacl studio

# Anaconda3

```
Anaconda3-2024.10-1-Windows-x86_64.exe
```

安装为just me

```
C:\Users\andy\AppData\Roaming\Microsoft\Windows\Start Menu\Programs
```

把快捷方式复制到

```
C:\ProgramData\Microsoft\Windows\Start Menu\Programs\
```

```
conda update -n base -c defaults conda
conda update conda
conda update anaconda
conda update spyder
conda update anaconda-navigator
conda update --all
conda update -h
conda search --full-name <package_full_name>
conda search <text>
```

```
conda create --name snakes python=3.9    => `conda remove -n snakes --all`
`conda env list` == `conda info --envs` == `conda info -e`
conda list
python --version
```

```
conda install <package_name>
conda install --name <env_name> <package_name>
conda install --name snakes pandas
```

当使用 conda install 无法进行安装时，可以考虑从Anaconda.org中获取安装包的命令，并进行安装

<https://anaconda.org>

使用pip安装包

```
conda config --set pip_interop_enabled True
pip install <package_name>
```

# cygwin && cygwin-x

# msys2 && MinGW

# mingw64 &&  mingw32

# vim && cfg

从存档提取ctags等

# 修复git图标

```
计算机\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellIconOverlayIdentifiers
```

# vcxsrv

```
vcxsrv-64.1.20.14.0.installer.exe
```

runx 给 cygwin



# Steram

```

```



************

# AutoCAD_2009_Lite_Test

# caxa2013

# idm(abort)

```
idman641.exe
IDM-6.4x-Crack-v18.1-Ali.Dbg
```

# genymotion

```
genymotion-3.5.0
SetupVSPE_Full_1.0.5.443
```

# MAXSerDesEV

```
MAXSerDesEV-GMSL_V0_6_3_3_Install.exe
```

# USB2XXX

```
USB2XXX_Software_Setup_v1.1.6.exe
```

# Nutstore

# dsview

# nvidia

driver + cuda + cudnn


in cmd

nvidia-smi

```
Microsoft Windows [版本 10.0.22631.5189]
(c) Microsoft Corporation。保留所有权利。

C:\Users\andy>nvidia-smi
Fri Oct 10 20:53:51 2025
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 576.57                 Driver Version: 576.57         CUDA Version: 12.9     |
|-----------------------------------------+------------------------+----------------------+
| GPU  Name                  Driver-Model | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GeForce RTX 4080 ...  WDDM  |   00000000:01:00.0 Off |                  N/A |
| N/A   44C    P0             28W /  150W |       0MiB /  12282MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+

+-----------------------------------------------------------------------------------------+
| Processes:                                                                              |
|  GPU   GI   CI              PID   Type   Process name                        GPU Memory |
|        ID   ID                                                               Usage      |
|=========================================================================================|
|  No running processes found                                                             |
+-----------------------------------------------------------------------------------------+
```

nvcc -V
```
C:\Users\andy>nvcc -V
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2025 NVIDIA Corporation
Built on Tue_May_27_02:24:01_Pacific_Daylight_Time_2025
Cuda compilation tools, release 12.9, V12.9.86
Build cuda_12.9.r12.9/compiler.36037853_0
```



# 安装预编译的 支持 cuda 的 cv2 

要先安装 cuda toolkit


```
(base) C:\Users\andy>conda create -y -n py37 python=3.7

(base) C:\Users\andy>conda activate py37

(py37) C:\Users\andy>pip install C:\Users\andy\Downloads\opencv_contrib_python-4.11.0-cp37-abi3-win_amd64.whl
Processing c:\users\andy\downloads\opencv_contrib_python-4.11.0-cp37-abi3-win_amd64.whl
Collecting numpy>=1.17.0
  Downloading numpy-1.21.6-cp37-cp37m-win_amd64.whl (14.0 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 14.0/14.0 MB 6.1 MB/s eta 0:00:00
Installing collected packages: numpy, opencv-contrib-python
Successfully installed numpy-1.21.6 opencv-contrib-python-4.11.0


>>> import cv2
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "D:\anaconda3\envs\py37\lib\site-packages\cv2\__init__.py", line 181, in <module>
    bootstrap()
  File "D:\anaconda3\envs\py37\lib\site-packages\cv2\__init__.py", line 115, in bootstrap
    ], True)
  File "D:\anaconda3\envs\py37\lib\site-packages\cv2\__init__.py", line 109, in load_first_config
    raise ImportError('OpenCV loader: missing configuration file: {}. Check OpenCV installation.'.format(fnames))
ImportError: OpenCV loader: missing configuration file: ['config-3.7.py', 'config-3.py']. Check OpenCV installation.


pip install opencv-python
pip install opencv-python==4.11.0.86
pip install opencv-python==4.5.1.48

pip install opencv-contrib-python


import cv2

# 显示一个简单的图像查看窗口
image = cv2.imread('your_image_path.jpg')  # 替换为你的图片路径
cv2.imshow('Image window', image)
cv2.waitKey(0)
cv2.destroyAllWindows()


python3 -m venv myenv
source myenv/bin/activate  # 在Unix或MacOS上
myenv\Scripts\activate  # 在Windows上
pip install opencv-python







conda remove -n py37 --all
conda create -y -n py37 python=3.7
conda activate py37
pip install opencv-python-headless opencv-contrib-python-headless
python -c "import cv2; print(cv2.__version__); print(cv2.cuda.getCudaEnabledDeviceCount())"


pip cache purge
pip install --force-reinstall opencv-python-headless opencv-contrib-python-headless




安装预编译的 支持 cuda 的 cv2 没有成功

https://www.jamesbowley.co.uk/nbs/ImportError_dll_load_failed_while_importing_cv2.html

为啥？

要先安装 cuda toolkit

这样就可以了


(base) C:\Users\andy>conda activate py37

(py37) C:\Users\andy>pip list
Package      Version
------------ ---------
certifi      2022.12.7
numpy        1.21.6
pip          22.3.1
setuptools   65.6.3
wheel        0.38.4
wincertstore 0.2

(py37) C:\Users\andy>pip install C:\Users\andy\Downloads\opencv_contrib_python-4.12.0.88-cp37-abi3-win_amd64.whl
Processing c:\users\andy\downloads\opencv_contrib_python-4.12.0.88-cp37-abi3-win_amd64.whl
Requirement already satisfied: numpy<2.0 in d:\anaconda3\envs\py37\lib\site-packages (from opencv-contrib-python==4.12.0.88) (1.21.6)
Installing collected packages: opencv-contrib-python
Successfully installed opencv-contrib-python-4.12.0.88

(py37) C:\Users\andy>python -c "import cv2; print(cv2.__version__); print(cv2.cuda.getCudaEnabledDeviceCount())"
4.12.0
1

(py37) C:\Users\andy>











https://github.com/opencv/opencv/releases
https://github.com/cudawarped/opencv_contrib/releases

https://www.jamesbowley.co.uk/qmd/downloads.html

https://github.com/cudawarped/opencv-python-cuda-wheels/releases
https://github.com/shekyc/opencv-python-cuda-windows-wheels/releases

https://www.jamesbowley.co.uk/qmd/opencv_cuda_python_windows.html
https://blog.csdn.net/REAL_liudebai/article/details/119356958

https://developer.nvidia.com/cudnn
https://docs.nvidia.com/deeplearning/cudnn/backend/v9.14.0/release-notes.html#cudnn-9-10-2
https://docs.nvidia.com/deeplearning/cudnn/latest/
```

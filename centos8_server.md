***
# sudoers
```
su
chmod +w /etc/sudoers
vi /etc/sudoers    == visudo
chmod +w /etc/sudoers
```
add this line
```
andy	ALL=(ALL:ALL) ALL
```


***
# 初步网络设置
现在还没有ifconfig

`ip link show` 显示网络接口状态信息。
`ip addr` 查看网络接口IP地址相关，发现网络接口enp0s3没有分配IP地址
```
vi /etc/sysconfig/network-scripts/ifcfg-enp0s3
```
修改`ONBOOT=yes`
```
service network restart
```
`ip addr` 应该能看到dhcp分配的ip地址
DHCP状态下查看网关地址：
```
netstat -rn
route -n
ip route show
```
ping一下外网


如果要设置静态ip，`/etc/sysconfig/network-scripts/ifcfg-enp0s3`应该这样设置
```
BOOTPROTO="static" #dhcp改为static   
ONBOOT="yes" #开机启用本配置  
IPADDR=192.168.7.106 #静态IP  
GATEWAY=192.168.7.1 #默认网关  
NETMASK=255.255.255.0 #子网掩码  
DNS1=192.168.7.1 #DNS 配置
```
```
sudo service network restart
```

退出su


***
# update repo
一开始update很重要，免得出错
```
sudo yum update yum
```


***
# 基本安装
```
yum provides ifconfig
sudo yum install net-tools #for ifconfig
sudo yum install vim gedit
sudo yum update
sudo yum clean all
sudo yum makecache
reboot
sudo yum update
reboot
```
`yum search ifconfig`现在不对
```
sudo yum update bzip2
```

解决fwupdate-efi 同grub2-common冲突
[一开始update可避免]
```
sudo yum update grub2-common
```


***
# 加快yum速度
```
sudo yum -y install yum-plugin-fastestmirror
```

***
# 自动补全的功能
按TAB没有了自动补全的功能，主要是因为Centos7在使用最小化安装的时候，没有安装自动补全的包，需要自己手动安装
```
sudo yum install -y  bash-completion
```
## CentOS 7 需要再安装一个扩展
```
sudo yum -y install bash-completion-extras
```
使配置生效
```
source /etc/profile.d/bash_completion.sh 
```


***
# 安装X视窗(abort)
```
sudo yum grouplist
//sudo yum install Xorg -y
sudo yum -y groupinstall "X Window System"
//sudo yum -y groupinstall X11
```


***
# 安装xfce桌面环境
```
sudo yum install epel-release
sudo yum --enablerepo=epel -y groups install "Xfce"
sudo yum --enablerepo=epel grouplist
```
安装中文字体
```
sudo yum install cjkuni-ukai-fonts
sudo yum install google-noto-sans-simplified-chinese-fonts.noarch
```
```
sudo echo "exec /usr/bin/xfce4-session" >> ~/.xinitrc
```
现在startx成功


***
# 设置开启启动桌面环境
```
sudo systemctl set-default graphical.target
```
[！！光盘安装之后立即update就可以避免启动失效]

centos7启动时显示Oh no! Something has gone wrong

virtualbox 发送 ctrl alt fn组合键的方法：使用热键（默认右ctrl）+fn即可
```
Check /var/log/messages & Xorg logs. /var/log/Xorg.0.log
```
暂时先用
```
sudo systemctl set-default multi-user.target    这个startx可以
sudo ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target
```
[！用graphical.target！光盘安装之后立即update就可以避免启动失效]


***
# 安装gnome
```
sudo yum groupinstall "GNOME Desktop" "Graphical Administration Tools"
sudo yum groupinstall "X Window System"
sudo ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target
```
centos7启动时显示Oh no! Something has gone wrong
```
sudo systemctl set-default graphical.target
```
centos7启动时显示Oh no! Something has gone wrong
```
sudo systemctl set-default multi-user.target
```
也是不行，应该还是一开始没有update

```
rpm -qa|grep xorg
cat /var/log/Xorg.0.log
```
参考
```
sudo yum groupinstall GNOME Desktop Environment -y
sudo yum install Xorg -y
sudo reboot
startx
ls /usr/src/kernels/3.10.0-862.11.6.el7.x86_64/
sudo yum update kernel
sudo rpm -qa | grep kernel-devel
sudo yum install -y kernel-devel-3.10.0-862.el7.x86_64
sudo yum -y upgrade kernel kernel-devel
startx
```

***
# 安装vbox增强工具5.2.26-->5.2.38
```
sudo yum -y install gcc-c++
sudo yum install make
sudo yum --enablerepo=elrepo-kernel install kernel-ml-devel
sudo yum install -y "kernel-devel-uname-r == $(uname -r)"
sudo yum -y install kernel kernel-devel kernel-headers
sudo reboot
```
```
sudo mkdir --p /media/cdrom
sudo mount -t auto /dev/cdrom /media/cdrom/
cd /media/cdrom/
sudo sh VBoxLinuxAdditions.run # 出错
//sudo ln -s /usr/src/kernels/3.xx /usr/src/linux
sudo sh VBoxLinuxAdditions.run # 出错
sudo reboot
```
```
#sudo sbin/rcvboxadd quicksetup KERN_DIR=/usr/src/kernels/xxx
#vim /etc/profile
#KERN_DIR=/usr/src/kernels/<内核版本号>
#export KERN_DIR
```

反正这两个报错不影响共享目录和双向剪贴板

`mem_global_ref`

`bo_global_ref`

```
lsmod | grep vboxsf
sudo modprobe vboxsf
```
ref
```
sudo yum -y install dkms gcc
sudo ./VBoxLinuxAdditions.run 
cat /var/log/VBoxGuestAdditions.log
cat /var/log/vboxadd-install.log
rpm -qa | grep kernel | sort
ls /usr/src/kernels/
sudo yum -y install kernel-devel-3.10.0-862.11.6.el7.x86_64
/etc/init.d/vboxdrv
sudo ./VBoxLinuxAdditions.run KERN_DIR=/usr/src/kernels/3.10.0-862.11.6.el7.x86_64
sudo ./autorun.sh 
sudo ./autorun.sh KERN_DIR=/usr/src/kernels/3.10.0-862.11.6.el7.x86_64
sudo reboot
startx
sudo ./VBoxLinuxAdditions.run 
sudo ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target
sudo reboot
sudo mkdir -p /mnt/share/
sudo mount -t vboxsf share /mnt/share/
```


##总结
kernel-devel-3.10.0-862.el7.x86_64 vbox的5.2.26iso可以，3.10.0-1062.12.1.el7.x86_64得用5.2.38的iso增强

模块在
```
/usr/lib/modules/3.10.0-1062.12.1.el7.x86_64/misc/
```
`/etc/fstab`中添加一项
```
share /mnt/share vboxsf rw,gid=100,uid=1000,auto 0 0
```
也可以
```
#vi /etc/rc.d/rc.local
```
在文件的最后加入上面手动挂接的命令，比如：
```
mount -t vboxsf sharefolder /share
```


***
# mlocate
```
sudo yum install mlocate
sudo updatedb
```


***
# dkms
```
sudo yum -y install dkms gcc
rpm -qa kernel\*
yum list installed | grep kernel
yum check-update|grep kernel
```


***
# 安装下载工具
```
sudo yum install curl axel
```
yum provides wget


***
# 替换更新源
```
$ sudo mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
$ sudo wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
或者
$ sudo curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
//sudo yum makecache
```
清除缓存
```
$ sudo yum clean all     # 清除系统所有的yum缓存 /var/cache/yum
$ sudo yum makecache     # 生成yum缓存
```


***
# epel源 安装和配置

查看可用的epel源
```
$ yum list | grep epel-release
epel-release.noarch                         7-11                       extras
$ sudo yum install -y epel-release
```
epel源安装成功，比原来多了一个epel.repo和epel-testing.repo文件

添加阿里镜像提供的epel源
```
$ sudo wget -O /etc/yum.repos.d/epel-7.repo  http://mirrors.aliyun.com/repo/epel-7.repo
## 又多出一个epel-7.repo
//sudo yum clean all     # 清除系统所有的yum缓存
$ sudo yum makecache     # 生成yum缓存
```

查看所有的yum源
```
$ yum repolist all
```
查看可用的yum源
```
$ yum repolist enabled
```

***
# 使能CentOSPlus repository
```
$ sudo gedit /etc/yum.repos.d/CentOS-Base.repo
```
`CentOSPlus repository`字段

修改`enabled=0`为`enabled=1`

```
sudo yum makecache
```

关于yum配置的说明
```
$ man yum.conf
```


***
# docker

## 确保删除旧版docker
```
$ sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
```

## 设置docker所需的依赖
```
$ sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
```

## 添加docker的repository
```
$ sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```
公钥安装
```
$ wget https://download.docker.com/linux/centos/gpg
或者
$ wget https://get.docker.com/gpg
$ sudo rpmkeys --import ./gpg
```
```
sudo yum makecache
```


## 脚本安装docker
```
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh
```
中间出问题要运行
```
$ sudo yum-complete-transaction --cleanup-only
$ sudo yum history redo last
```

## 添加当前用户到docker组
```
$ sudo usermod -aG docker $USER
$ newgrp docker
$ groups
```

## 运行docker服务
```
//$ sudo gedit /etc/sysctl.conf
//user.max_user_namespaces=28633
//$ sudo sysctl --system
$ sudo systemctl enable docker
$ sudo systemctl start docker
$ sudo chkconfig docker on
$ docker run hello-world
```

## 阿里云镜像加速docker
<https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors>

修改daemon配置文件`/etc/docker/daemon.json`来使用加速器
```
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://3m45wpca.mirror.aliyuncs.com"]
}
EOF

sudo systemctl daemon-reload
sudo systemctl restart docker
```

验证
```
docker info
```


***
# docker 安装 mysql+gitlab+jenkins+jira
```
$ docker pull mysql:5.7

$ docker search gitlab
$ docker pull gitlab/gitlab-ce
## 也可以安装gitlab/gitlab-ee:latest或者gitlab/gitlab-ce:rc

$ docker search jenkins
$ docker pull jenkins
## 或者jenkinsci/blueocean

$ docker search jira
$ docker pull atlassian/jira-software
```

***
# 规划映射目录
这样分布映射目录
```
/home/docker/gitlab         权限root:root
/home/docker/jenkins_home   权限$USER:$USER
/home/docker/jira
```

***
# 运行gitlab镜像
```
$ docker run -d -p 443:443 -p 80:80 -p 222:22 --name gitlab --restart always -v /home/docker/gitlab/config:/etc/gitlab -v /home/docker/gitlab/logs:/var/log/gitlab -v /home/docker/gitlab/data:/var/opt/gitlab gitlab/gitlab-ce
```
```
# -d：后台运行，在后台启动
# -p：将容器内部端口向外映射， 外部宿主机端口：容器内部应用端口
# --name：命名容器名称，容器启动之后的名字
# --restart 重启配置，可以是unless-stopped等
# -v：将容器内数据文件夹或者日志、配置等文件夹映射到宿主机指定目录
```

宿主服务器上默认的 SSH 服务也是使用的 22 端口，因此默认会产生端口冲突

//一种办法是修改宿主 SSH 端口

//其中的 Port 22 改为其它端口号，然后 service sshd restart 。这种方式比较推荐，因为管理用的宿主 SSH 端口改成别的其实更安全

另一种是修改容器的 SSH 端口

修改容器的端口映射关系，比如将 -p 22:22 改为 -p 2222:22 ，这样 GitLab 的 SSH 服务端口将是 2222。

这样做会让使用 GitLab 的 SSH 克隆、提交代码有些障碍。这种情况要改变用户使用Git 的链接方式

要从之前的：
```
git clone git@gitlab.example.com:myuser/awesome-project.git
```
改为明确使用 ssh:// 的 URL 方式
```
git clone ssh://git@gitlab.example.com:2222/myuser/awesome-project.git
```

等待一会, 访问http://localhost

设置root密码，至少8字符

然后用root登录

创建一个测试仓库项目，组/用户root，权限private

看到生成项目的URL访问地址是按容器的hostname来生成的，也就是容器的id
```
git@ac89efcb8f82:root/gitlab_test.git
```
需要一个固定的URL访问地址，于是需要配置gitlab.rb，宿主机路径`/home/gitlab/config/gitlab.rb`
```
$ sudo gedit /home/docker/gitlab/config/gitlab.rb
```
```
external_url 'http://192.168.5.177'
gitlab_rails['gitlab_ssh_host'] = '192.168.5.177'
gitlab_rails['gitlab_shell_ssh_port'] = 222 # 此端口是run时22端口映射的222端口
```
## 重启gitlab容器（容器外重启）
```
$ docker restart gitlab
```

## 进入gitlab容器命令行
```
sudo docker exec -it gitlab bash
```
## gitlab容器中应用配置
```
sudo gitlab-ctl reconfigure
```
## gitlab容器中重启服务
```
sudo gitlab-ctl restart
```


## 客户访问
比如，这里服务器运行docker，客户机器可以访问服务器
```
git clone http://192.168.5.177/root/gitlab_test.git
```
http方式需要用户名和密码


打开客户机本地git bash,使用如下命令生成ssh公钥和私钥对
```
$ ssh-keygen -t rsa -C 'xxx@xxx.com'
cat $HOME/.ssh/id_rsa.pub
```
添加这个公钥到gitlab

客户也可以登录BS网页管理，root登录。。。

在最右上管理里的settings，然后再左边条里（目前是root账户 ，那么这个公钥就是root的公钥）

添加客户机公钥之后，就可以免密码拉取和提交了
```
$ git clone ssh://git@192.168.5.177:222/root/gitlab_test.git
```


***
# docker 运行 jenkins
```
$ docker run -d --name jenkins -p 8081:8080 -p 50000:50000 -p 322:22 --restart always -v /home/docker/jenkins_home:/var/jenkins_home jenkins
```
docker logs <容器ID> 检查报错，有目录权限问题，要把owner从root修改成当前用户
```
sudo chown -R 1000:1000 /home/docker/jenkins_home
docker stop jenkins
docker container rm --force jenkins
```
再运行

访问
```
http://192.168.5.177:8080
```
第一次启动的时候正在加载jenkins大概会等待3-10分钟

## 然后解锁jenkins
```
//$ docker exec -it 7f485bd95c3b  /bin/bash           //进入jenkins容器 
//$ cat /var/jenkins_home/secrets/initialAdminPassword
$ cat /home/docker/jenkins_home/secrets/initialAdminPassword
```
有类似于 ca93a1c9b11d4bb39266a85558d4ec0a 的字符串

用这串字符解锁

## 安装默认插件

要等很长时间

以后要替换插件源
```
sudo gedit /var/lib/jenkins/hudson.model.UpdateCenter.xml
```
原内容
```
<?xml version='1.0' encoding='UTF-8'?>
<sites>
  <site>
    <id>default</id>
    <url>https://updates.jenkins.io/update-center.json</url>
  </site>
</sites>
```
修改镜像源为国内源
<https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json>

出问题重新来过
```
ERROR: : input contained no data
docker stop jenkins
docker container rm --force jenkins
rm /home/jenkins_home/* -rf
```

## 创建admin用户，设置密码


后台没有启动怎么办

手动运行容器
```
$ docker restart jenkins
```


## 修改端口映射
```
$ docker run -d --name jenkins -p 8081:8080 -p 50000:50000 --restart always -v /home/docker/jenkins_home:/var/jenkins_home jenkins
```
如果有tomcat端口也要加上去`-p 6080:6080`


***
# 运行jira (abort)
```
//docker run -d -p 8090:8080 \
    --name jira-software \
　　 -v /etc/localtime:/etc/localtime:ro \
    cptactionhank/atlassian-jira-software:8.1.0
//docker run -d -it -p  8080:8080  --privileged  -m 4096M -v /data/jira-data:/var/atlassian/application-data/jira  -v /etc/localtime:/etc/localtime --name jira dchevell/jira-software:7.13.0
```

***
# 运行jira

## 启动mysql docker实例
```
docker run --name atlassian-mysql \
    --restart always \
    -p 3306:3306 \
    -v /opt/mysql_data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7
```
根据实际替换passwd

## 获得mysql容器ip
```
docker run -ti --link atlassian-mysql:mysql --rm mysql:5.7 sh
```
获得 `MYSQL_PORT_3306_TCP_ADDR` 是172.17.0.2
```
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' atlassian-mysql
```
也可以获得ip

## 连接mysql
```
docker run -it --link atlassian-mysql:mysql \
    --rm mysql:5.7 sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
```
## 创建jira数据库,并添加jira用户
```
//mysql> create database jira default character set utf8 collate utf8_bin;
//mysql> CREATE USER `jira`@`%` IDENTIFIED BY 'jira';GRANT ALL ON *.* TO `jira`@`%` WITH GRANT OPTION;
//mysql> alter user 'jira'@'%' identified with mysql_native_password by 'jira';
修改mysql事物隔离级别
//mysql> set global transaction isolation level read committed;
//mysql> set session transaction isolation level read committed;
//mysql> quit
```
```
CREATE DATABASE jiradb CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

MySQL 5.7.0 - 5.7.5:
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER,INDEX on <JIRADB>.* TO '<USERNAME>'@'<JIRA_SERVER_HOSTNAME>' IDENTIFIED BY '<PASSWORD>';
flush privileges;

MySQL 5.7.6 and later (must also include the REFERENCES permission):
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,REFERENCES,ALTER,INDEX on <JIRADB>.* TO '<USERNAME>'@'<JIRA_SERVER_HOSTNAME>' IDENTIFIED BY '<PASSWORD>';
flush privileges;


//create database jira default character set utf8 collate utf8_bin;
//CREATE USER `jira`@`%` IDENTIFIED BY 'jira';GRANT ALL ON *.* TO `jira`@`%` WITH GRANT OPTION;
//alter user 'jira'@'%' identified with mysql_native_password by 'jira';
//flush privileges;

//CREATE DATABASE jiradb CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
//GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,REFERENCES,ALTER,INDEX on jiradb.* TO 'root'@'%' IDENTIFIED BY '123456';
//flush privileges;


CREATE DATABASE jira CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER `jira`@`%` IDENTIFIED BY 'jira';GRANT ALL ON *.* TO `jira`@`%` WITH GRANT OPTION;
alter user 'jira'@'%' identified with mysql_native_password by 'jira';
```


## 列出正在运行的容器
```
docker ps
```
## 进入mysql容器
```
docker exec -it 4c3bb58c08a9 /bin/bash
```
## 查看配置文件my.cnf
```
cat /etc/mysql/mysql.conf.d/mysqld.cnf
cat /etc/mysql/my.cnf
```
复制出来
```
docker cp  atlassian-mysql:/etc/mysql/mysql.cnf .
```
添加这么一段
```
[mysqld]
default-storage-engine=INNODB
character_set_server=utf8mb4
innodb_default_row_format=DYNAMIC
innodb_large_prefix=ON
innodb_file_format=Barracuda
innodb_log_file_size=2G
```
复制回容器
```
docker cp mysql.cnf 4c3bb58c08a9:/etc/mysql/mysql.cnf
```
重启容器
```
docker restart 4c3bb58c08a9
```

## 启动jira实例
```
docker run -d -p 8090:8080 \
    --detach --restart always \
    --name jira \
    -v /home/docker/jira/:/var/atlassian/application-data/jira \
    -v /etc/localtime:/etc/localtime \
    atlassian/jira-software
```

拷贝atlassian-extras到容器内
```
sudo mount -t vboxsf share /mnt/share/
$ docker cp atlassian-extras-3.2.jar jira:/opt/atlassian/jira/atlassian-jira/WEB-INF/lib/
//$ docker cp mysql-connector-java-5.1.39-bin.jar jira:/opt/atlassian/jira/atlassian-jira/WEB-INF/lib/
$ docker cp mysql-connector-java-5.1.48-bin.jar jira:/opt/atlassian/jira/atlassian-jira/WEB-INF/lib/
```
进入容器设置atlassian-extras的权限
```
$ docker exec -it jira bash
  chmod 755 /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/atlassian-extras-3.2.jar
  chmod 755 /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/mysql-connector-java-5.1.39-bin.jar
```
重启容器
```
$ docker restart jira
```

## 设置数据库
hostname填这个容器ip，而不是服务器ip

MYSQL_PORT_3306_TCP_ADDR是172.17.0.2 (可以在  `sudo vim /home/docker/jira/dbconfig.xml`  里修改)
```
docker run -ti --link atlassian-mysql:mysql --rm mysql:5.7 sh
```
命令env可以查看

也可以用jira安装目录里的config.sh来测试数据库连接


复制ID

比如是BM95-7DHR-TP1E-EHM7
```
java -jar atlassian-agent.jar -d -m denglitscg@gmail.com -n BAT -p jira -o http://192.168.5.177 -s BM95-7DHR-TP1E-EHM7
```
产生的注册码好像失效了，不管了，在线生成吧


***
# 利用docker安装中文版GitLab
```
//docker network create gitlab-net
```
--network gitlab-net
docker network (一): 命令
<https://www.jianshu.com/p/263274f27a7d>


停止并删除容器
```
docker stop e1066fe2db35
docker rm e1066fe2db35
```

```
show databases;
create database <数据库名>
drop database <数据库名>
```
查看mysql的sql_mode
```
SELECT @@GLOBAL.sql_mode;
use <数据库名>;
show tables;
create table <表名> ( <字段名1> <类型1> [,..<字段名n> <类型n>]);
drop table <表名> 
insert into <表名> [( <字段名1>[,..<字段名n > ])] values ( 值1 )[, ( 值n )]
select <字段1，字段2，...> from < 表名 > where < 表达式 >
delete from 表名 where 表达式
update 表名 set 字段=新值,… where 条件
alter table 表名 add字段 类型 其他;
rename table 原表名 to 新表名;
mysqldump -u 用户名 -p<密码> 数据库名 > 导出的文件名
mysqldump -u 用户名 -p<密码> 数据库名 表名> 导出的文件名
mysqldump -u 用户名 -p<密码> -d –add-drop-table database_name > outfile_name.sql
```

```
[andy@localhost Desktop]$ docker container ls
CONTAINER ID        IMAGE                     COMMAND                  CREATED             STATUS                 PORTS                                                                   NAMES
f06349dd3557        atlassian/jira-software   "/tini -- /entrypoin…"   22 hours ago        Up 16 minutes          0.0.0.0:8090->8080/tcp                                                  jira
32f45d4d9921        jenkins                   "/bin/tini -- /usr/l…"   22 hours ago        Up 3 hours             0.0.0.0:50000->50000/tcp, 0.0.0.0:322->22/tcp, 0.0.0.0:8081->8080/tcp   jenkins
00a690834def        gitlab/gitlab-ce          "/assets/wrapper"        22 hours ago        Up 3 hours (healthy)   0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp, 0.0.0.0:222->22/tcp           gitlab
cc6058ab98ac        mysql:5.7                 "docker-entrypoint.s…"   22 hours ago        Up 3 hours             0.0.0.0:3306->3306/tcp, 33060/tcp                                       atlassian-mysql
[andy@localhost Desktop]$ docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' f06349dd3557
172.17.0.4
[andy@localhost Desktop]$ docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' 32f45d4d9921
172.17.0.5
[andy@localhost Desktop]$ docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' 00a690834def
172.17.0.2
[andy@localhost Desktop]$ docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cc6058ab98ac
172.17.0.3
```

***
# 磁盘管理
```
sudo yum -y install ntfs-3g
sudo gedit /etc/fstab
```
```
/dev/mapper/cl-root     /                       xfs     defaults        0 0
UUID=91ff8b62-fee3-4424-97a6-b1b4b9d1f880 /boot                   xfs     defaults        0 0
UUID=ad758cc5-cf96-49fa-bb6e-7015ae597d78 /media/ssddata  ext4 defaults 0 1
UUID=d3c5651c-00cc-4570-be8d-024d8368aacd /media/hhddata  ext4 defaults 0 1
/dev/mapper/cl-home     /home                   xfs     defaults        0 0
```
```
sudo mkdir -p /media/ssddata
sudo mkdir -p /media/hhddata
```
```
sudo yum -y install git nethogs
sudo service firewalld stop
```

***
# 防火墙设置

## 查询端口是否开放
```
sudo firewall-cmd --query-port=8080/tcp
```
## 开放80端口
```
sudo firewall-cmd --permanent --add-port=80/tcp
```
## 移除端口
```
sudo firewall-cmd --permanent --remove-port=8080/tcp
```
## 重启防火墙(修改配置后要重启防火墙)
```
sudo firewall-cmd --reload
```
## 查看状态
```
firewall-cmd --state
```
不行啊

## 换成iptables
```
sudo yum update iptables
sudo systemctl   disable  firewalld.service
sudo systemctl   mask firewalld.service
sudo yum install iptables-services
```
```
sudo iptables -L -n #查看iptables现有规则 
iptables -P INPUT ACCEPT  #先允许所有,不然有可能会杯具  
iptables -F  #清空所有默认规则  
iptables -X  #清空所有自定义规则  
iptables -Z  #所有计数器归0  
iptables -A INPUT -i lo -j ACCEPT  #允许来自于lo接口的数据包(本地访问)  
iptables -A INPUT -p tcp --dport 22 -j ACCEPT  #开放22端口  
iptables -A INPUT -p tcp --dport 21 -j ACCEPT  #开放21端口(FTP)  
iptables -A INPUT -p tcp --dport 80 -j ACCEPT #开放80端口(HTTP)   
iptables -A INPUT -p tcp --dport 443 -j ACCEPT  #开放443端口(HTTPS)  
iptables -A INPUT -p icmp --icmp-type 8 -j ACCEPT  #允许ping  
iptables -A INPUT -m state --state  RELATED,ESTABLISHED -j ACCEPT  #允许接受本机请求之后的返回数据 RELATED,是为FTP设置的  
iptables -P INPUT DROP  #其他入站一律丢弃  
iptables -P OUTPUT ACCEPT  #所有出站一律绿灯  
iptables -P FORWARD DROP  #所有转发一律丢弃  
service iptables save  #保存上述规则  
```
```
systemctl restart iptables.service 
systemctl enable iptables.service  #注册iptables服务  相当于以前的chkconfig iptables on  
systemctl start iptables.service  #开启服务  
systemctl status iptables.service  #查看状态  
```
`/etc/sysconfig/iptables-config`中修改或者添加以下内容
#添加以下内容,注意顺序不能调换  
```
IPTABLES_MODULES="ip_conntrack_ftp"  
IPTABLES_MODULES="ip_nat_ftp"  
```
```
iptables -A INPUT -m state --state  RELATED,ESTABLISHED -j ACCEPT  
iptables -P INPUT ACCEPT 
iptables -F 
iptables -X 
iptables -Z 
iptables -A INPUT -i lo -j ACCEPT 
iptables -A INPUT -p tcp --dport 22 -j ACCEPT 
iptables -A INPUT -p tcp --dport 21 -j ACCEPT 
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 81 -j ACCEPT
iptables -A INPUT -p tcp --dport 82 -j ACCEPT
iptables -A INPUT -p tcp --dport 81 -j ACCEPT 
iptables -A INPUT -p tcp --dport 82 -j ACCEPT 
iptables -A INPUT -p tcp --dport 139 -j ACCEPT
iptables -A INPUT -p tcp --dport 445 -j ACCEPT
iptables -I INPUT -p tcp --dport 139 -j ACCEPT
iptables -I INPUT -p tcp --dport 445 -j ACCEPT
iptables -I INPUT -p udp --dport 137 -j ACCEPT
iptables -I INPUT -p udp --dport 138 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 222 -j ACCEPT 
iptables -A INPUT -p tcp --dport 322 -j ACCEPT 
iptables -A INPUT -p tcp --dport 5901 -j ACCEPT 
iptables -A INPUT -p tcp --dport 5902 -j ACCEPT
iptables -A INPUT -p tcp --dport 3680 -j ACCEPT
iptables -A INPUT -p tcp --dport 3690 -j ACCEPT
iptables -A INPUT -p tcp --dport 3306 -j ACCEPT 
iptables -A INPUT -p tcp --dport 8081 -j ACCEPT 
iptables -A INPUT -p tcp --dport 8090 -j ACCEPT 
iptables -A INPUT -p tcp --dport 10000 -j ACCEPT
iptables -A INPUT -p tcp --dport 50000 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type 8 -j ACCEPT 
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT 
iptables -P INPUT DROP 
iptables -P OUTPUT ACCEPT 
iptables -P FORWARD DROP 
service iptables save
```
会更新`/etc/sysconfig/iptables`
```
systemctl restart iptables.service 
systemctl enable iptables.service
systemctl restart  docker	# 更换防火墙之后要重启docker
```



***
# 使用container模式运行mysql和jira更合适
```
--net container:atlassian-mysql
```
这样理论上
```
sudo vim /home/docker/jira/dbconfig.xml
```
可以填写127.0.0.1

//启动jira实例, [直接这样不行]
```
docker run -d -p 8090:8080 \
    --detach --restart always \
    --name jira1 \
    --net container:atlassian-mysql \
    -v /home/docker/jira/:/var/atlassian/application-data/jira \
    -v /etc/localtime:/etc/localtime \
    atlassian/jira-software

docker: Error response from daemon: conflicting options: port publishing and the container type network mode.
```
解决办法
```
docker run --name atlassian-mysql1 \
    --restart always \
    -p 3306:3306 \
    -p 8090:8080 \
    -v /opt/mysql_data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7
```
根据实际替换passwd
```
docker cp atlassian-mysql1:/etc/mysql/mysql.cnf .
```
添加这么一段
```
[mysqld]
default-storage-engine=INNODB
character_set_server=utf8mb4
innodb_default_row_format=DYNAMIC
innodb_large_prefix=ON
innodb_file_format=Barracuda
innodb_log_file_size=2G
```
```
docker cp mysql.cnf atlassian-mysql1:/etc/mysql/mysql.cnf
docker restart atlassian-mysql1
```

连接mysql
```
docker run -it --link atlassian-mysql1:mysql \
    --rm mysql:5.7 sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
```
```
CREATE DATABASE jira CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER `jira`@`%` IDENTIFIED BY 'jira';GRANT ALL ON *.* TO `jira`@`%` WITH GRANT OPTION;
alter user 'jira'@'%' identified with mysql_native_password by 'jira';
quit
```


启动jira实例
```
docker run -d \
    --detach --restart always \
    --name jira1 \
    --net container:atlassian-mysql1 \
    -v /home/docker/jira/:/var/atlassian/application-data/jira \
    -v /etc/localtime:/etc/localtime \
    atlassian/jira-software
```
```
docker cp atlassian-extras-3.2.jar jira1:/opt/atlassian/jira/atlassian-jira/WEB-INF/lib/
docker cp mysql-connector-java-5.1.48-bin.jar jira1:/opt/atlassian/jira/atlassian-jira/WEB-INF/lib/
docker restart jira1
```
这样就可以了!
database的备份在`/opt/mysql_data`

## docker操作
```
docker rename 原容器名  新容器名

docker rm jira
docker rm atlassian-mysql
docker stop jira1
docker stop atlassian-mysql1
docker rename jira1  jira
docker rename atlassian-mysql1  atlassian-mysql
docker start atlassian-mysql
docker start jira

docker network ls
```


***
# xfce锁屏
xflock4  没有效果啊
```
//sudo yum -y install xfce4-utils
sudo yum -y install light-locker
light-locker
//xfconf-query -c xfce4-keyboard-shortcuts -p '/xfwm4/custom/<Primary><Alt>Down+Right' -n -t string -s "tile_window_down_right"
sudo yum -y install vncserver
light-locker-command -l
light-locker-command --lock
```
但是现在有点错误, 失败,无法锁屏
```
xfconf-query -c xfce4-session -p /general/LockCommand -s "xscreensaver-command -lock" --create -t string
```
ctl+alt+del,待验证
```
sudo yum -y install xscreensaver
xscreensaver
xscreensaver-command -prefs
xscreensaver-command -lock
```
这样就锁屏了


***
# htop
```
sudo yum -y install htop
```


***
# docker 安装 nextcloud
```
docker pull nextcloud
sudo mkdir -p /home/docker/nextcloud
docker run -d --restart=always --name nextcloud -p 81:80 -v /home/docker/nextcloud:/var/www/html/data nextcloud
```
app目录应该映射出来，似乎这样更好
```
docker run -d --restart=always --name nextcloud -p 81:80 -v /home/docker/nextcloud:/var/www/html nextcloud
````
离线添加app
比如下载`files_accesscontrol-1.8.1.tar.gz`
<https://apps.nextcloud.com/apps/files_accesscontrol>
在服务器解压之后
```
docker cp files_accesscontrol nextcloud:/var/www/html/apps
docker exec -it nextcloud bash
cd apps/
chown -R www-data:root files_accesscontrol
docker restart nextcloud
```

关于防火墙添加
```
iptables -A INPUT -p tcp --dport 81 -j ACCEPT
```


***
# mediawiki
```
docker pull mediawiki
sudo mkdir -p /home/docker/mediawiki/data
docker run -d --name mediawiki -p 82:80 -v /home/docker/mediawiki:/var/www/html/images -v /home/docker/mediawiki/data:/var/www/data mediawiki
```
设置sqlite数据库最简单
```
docker stop mediawiki
docker rm mediawiki
docker run -d --restart=always --name mediawiki -p 82:80 -v /home/docker/mediawiki/LocalSettings.php:/var/www/html/LocalSettings.php  -v /home/docker/mediawiki:/var/www/html/images -v /home/docker/mediawiki/data:/var/www/data mediawiki
```
更换了ip的话，nextcloud要修改
```
docker cp nextcloud:/var/www/html/config/config.php .
```
修改后
```
docker cp config.php nextcloud:/var/www/html/config/config.php
docker exec -it nextcloud bash
chown www-data:root config.php
```


***
# 排查ssh不能访问
首先看ip是否有冲突
```
sudo nbtscan -v -s : 192.168.1.0/24
arp -a
```
再查防火墙等

最后查配置


***
# docker安装samba
```
docker pull dperson/samba:latest
mkdir -p /media/hhddata/Sambashare
mkdir -p /media/hhddata/Sambashare/public
mkdir -p /media/hhddata/Sambashare/rdc
mkdir -p /media/hhddata/Sambashare/rde
docker run -d --restart=always --name samba \
    -it -p 139:139 -p 445:445 \
    -d dperson/samba:latest -p \
    -u "xx0;a" \
    -u "xx1;xx1" \
    -u "xx2;xx2" \
    -u "xx3;xx3" \
    -u "xx4;xx4" \
    -s "public;/media/hhddata/Sambashare/public;yes;yes;no;all;xx0;xx0;公共共享文件夹" \
    -s "rde;/media/hhddata/Sambashare/rde;yes;yes;no;all;xx1,xx2;xx0;电子共享文件夹" \
    -s "rde;/media/hhddata/Sambashare/rde;yes;yes;no;all;xx3,xx4;xx0;机械共享文件夹"
```
```
cd ~/Desktop/
docker cp samba:/etc/samba/smb.conf .
docker cp samba:/etc/group .
docker cp samba:/etc/passwd .
docker stop samba
docker cp smb.conf samba:/etc/samba/smb.conf
docker cp group samba:/etc/group
docker cp passwd samba:/etc/passwd
docker restart samba
```

```
sudo docker run -it --name samba -p 139:139 -p 445:445 \
            -v /media/hhddata/Sambashare/public:/mount \
            -d dperson/samba -p \
            -u "www;thisispasswd" \
            -s "technofiend;/mount;yes;no;no;all;none"
```
```
docker run --name samba \
	-it -p 139:139 -p 445:445 \
	-v /home/technofiend:/home/technofiend \
	-d dperson/samba \
	-u "www;thisispasswd" \
	-s "technofiend;/home/technofiend/;yes;no;no;all;none"
```
```
docker run --name samba \
-it -p 139:139 -p 445:445 \
-v /home/andy:/home/andy \
-d dperson/samba \
-u "andy;a" \
-s "andy-home;/home/andy/;yes;no;no;all;none"
```
```
docker exec -it samba sed -i 's/force user = smbuser/force user = andy/g' /etc/samba/smb.conf
docker exec -it samba sed -i 's/force group = users/force group = andy/g' /etc/samba/smb.conf
docker restart samba
```

```
docker run -it -p 139:139 -p 445:445 --name samba -d --rm  \
 -v /home/andy/:/mount \
 dperson/samba \
 -u "andy;a" \
 -s "andy-share;/mount/;yes;no;yes;all;all;all" \
 -w "WORKGROUP" \
 -g "force user= andy" \
 -g "guest account= andy" 
```

好像没啥卵用，不用docker安装samba了
```
docker stop samba
docker rm samba
```


***
# tree
```
yum -y install tree
```


***
# 本地 samba
```
yum -y install samba
```
samba管理tips

新建系统用户

新建系统组

分配用户属组，一个用户可以属于多个组

新建samba用户

新建samba共享目录(一个共享对应一个共享根目录)，目录只有一个属主和属组

共享根目录属性,一般设置2770

samba config 一般设置这样
```
create mask = 2770
directory mask = 2770
force create mode = 2770
force directory mode = 2770
```

关于权限，属性
<https://help.ubuntu.com/community/FilePermissions>


chmod 4777 temp是设sid，setuid标志只对文件有效， 等效于 chmod u+s temp

chmod 2777 tempdir是设置gid， setgid标志对目录和文件有效， 等效于 chmod g+s tempdir

chmod 1777 temp是设sticky，sticky标志只对文件有效， 等效于 chmod o+t temp

ls -l 来查看
```
rwsrw-r-- 表示有setuid标志
rwxrwsrw- 表示有setgid标志
rwxrw-rwt 表示有sticky标志
```
找出所有危险的目录（设置目录所有人可读写却没有设置sticky位的目录）
```
find / -perm -0007 -type d
```
找出所有设置了suid的文件
```
find / -perm -4000 -type f
```

chmod有关字母
```
chmod [-R] [ugoa] [+-=] [rwx] filename/filelist
```
```
-R： Recursive，递归模式，修改该文件夹及其下所有文件和文件夹
u、g、o表示用户、组、others，a = ugo =all users （user + group + others）
r、w、x对于文件表示读、写、执行权限
+ add permission
- remove permission
= set permission
```
比如
```
chmod u-x file
chmod u+x file
chmod -R go+rwx file
```

对于目录权限，如果允许samba访问至少要给x权限，不然目录都进不去的
```
r、w、x
r表示 view contents: i.e., ls command
w表示 create or remove files from dir
x表示 access for directories = cd into directory
```
```
cd：a.语法 cd 目录名（进入目录）      b.所需权限x
touch：a.语法 touch 文件名（创建文件）      b.所需权限wx
ls：a.语法 ls （显示当前目录下的所有文件）      b.所需权限rx
rm：a.语法 rm 文件名（删除文件）      b.所需权限wx
mv：a.语法 mv 文件名1  文件名2（把文件名1修改为文件名2）      b.所需权限wx
```


测试samba，如下展示进行根目录级权限管理的简单例子

修改/etc/shells，在shell列表中添加一行/usr/sbin/nologin
```
sudo useradd test -d /media/hhddata/Sambashare/home/test -s /usr/sbin/nologin
sudo passwd test
sudo useradd test2 -d /media/hhddata/Sambashare/home/test2 -s /usr/sbin/nologin
sudo passwd test2
sudo groupadd testgroup1
sudo groupadd testgroup2
sudo usermod -aG testgroup1 test
sudo usermod -aG testgroup2 test2
sudo usermod -aG testgroup1 andy
sudo usermod -aG testgroup2 andy
sudo smbpasswd -a test
sudo smbpasswd -a test2
sudo smbpasswd -a andy
sudo gedit /etc/samba/smb.conf

sudo chown andy:testgroup2  xx-dir
```
如果想删除samba用户
```
smbpasswd -x test
```
```
# --------------------------- Logging Options -----------------------------
#
# Log File let you specify where to put logs and how to split them up.

log file = /var/log/samba/log.%m                  
                                                          
# ----------------------- Standalone Server Options ------------------------
#
# Scurity can be set to user, share(deprecated) or server(deprecated)

security = user 
map to guest = Bad User                                 

#============================ Share Definitions ==============================

[public]
   path = /media/hhddata/Sambashare/public
   browsable = yes
   read only = yes
   guest ok = no
   veto files = /._*/.apdisk/.AppleDouble/.DS_Store/.TemporaryItems/.Trashes/desktop.ini/ehthumbs.db/Network Trash Folder/Temporary Items/Thumbs.db/
   delete veto files = yes
   admin users = xx0
   write list = xx0
   comment = 公共共享文件夹

[rde]
   path = /media/hhddata/Sambashare/rde
   browsable = yes
   read only = yes
   guest ok = no
   admin users = andy
   write list = andy
   valid users = @testgroup1
   comment = 机械共享文件夹

[rdc]
   path = /media/hhddata/Sambashare/rde
   browsable = yes
   read only = yes
   guest ok = no
   admin users = andy
   write list = andy
   valid users = @testgroup2
   comment = 机械共享文件夹

```

```
groupadd 部门1
groupadd 部门2

sudo groupadd testgroup1
sudo usermod -aG testgroup1 test
sudo groupadd testgroup2
sudo usermod -aG testgroup2 test2

sudo chown andy:testgroup1 share

sudo usermod -aG testgroup1 andy
sudo usermod -aG testgroup2 andy
```


samba server
```
192.168.1.110
```
```
普通用户有test，test2
密码都是a

群组(对应部门或项目)：testgroup1，testgroup2

testgroup1成员：test
testgroup2成员：test2

全局共享目录： public
普通用户可读不可写，不可修改


群组共享目录：rde，rdc

testgroup1共享目录：rde
普通用户test可访问，不可修改
普通用户test2不可访问

testgroup2共享目录：rdc
普通用户test2可访问，不可修改
普通用户test不可访问


个人目录
不可见
普通用户可读写、修改这个个人目录的内容


TODO
公共目录提交区，和定时移动到公共目录
```

## 为了更简化的管理samba等，可以用webmin
```
yum -y install unzip
yum -y install perl
yum -y install perl-Net-SSLeay
yum -y install perl-Encode-Detect
rpm -ivh webmin-1.941-1.noarch.rpm
sudo /usr/libexec/webmin/changepass.pl /etc/webmin root [密码]
```
## webmin管理samba简要
```
system->建立用户和组，特别是组，对于权限管理很重要，比如组也要有层次
Server->Samba建立分享的根目录，根目录的组是最高层次的组，意思是权限低，比较多的人能访问
Others->Filemanager管理分享的根目录下文件和目录的权限，一般是子目录给不同的低层的组，权限更高

tips: 
Filemanager目录属性一般设置2770，子目录属组继承，可以列表。  如果设置成2660, 通过samba的授权用户(同一属组)，也没法打开了，见前面关于目录权限。
https://xxx.xxx.xxx.xxx:10000

```


```
sudo systemctl start smb
sudo systemctl enable smb
sudo systemctl restart smb
sudo systemctl status smb
```

***
# docker 安装 svn
```
docker search svn
docker pull elleflorio/svn-server
docker images
docker run --restart always --name svn-server -d -v /home/svn:/home/svn -p 3680:80 -p 3690:3690 -e SVN_REPONAME=repository elleflorio/svn-server

#docker run --restart always --name svn-server -d -v /home/svn:/var/opt/svn -p 3680:80 -p 3690:3690 -e SVN_REPONAME=repository elleflorio/svn-server
#docker run -v /opt/data/svn/repo:/var/opt/svn --name svn-server -p 3690:3690 -e SVN_REPONAME=repository -d svn_configed

docker exec -t svn-server htpasswd -b /etc/subversion/passwd admin 123456

#docker exec -it svn-server /bin/sh
#svnadmin create svn
#cd svn/conf
#vi svnserve.conf
#vi passwd
#vi authz
#cd /etc/apache2
#vi httpd.conf
#cd /var/opt/svn

#exit
#chmod -R o+rw /home/svn
#cd svn/conf

#docker restart svn-server



#docker run --name svn-server -d -v /home/andy/Downloads/tmp/svn:/home/svn -p 3680:80 -p 3690:3690 -e SVN_REPONAME=repository elleflorio/svn-server
#docker exec -t svn-server htpasswd -b /etc/subversion/passwd admin 123456
#docker exec -it svn-server /bin/sh
#chmod -R 777 /home/svn
#cd /home/svn/
#cd svn/conf
#vi svnserve.conf
```

管理界面
<http://192.168.1.110:3680/svnadmin>
填入
```
/etc/subversion/subversion-access-control
/etc/subversion/passwd
/home/svn
/usr/bin/svn
/usr/bin/svnadmin
```
然后

创建repo设置用户和组

```
svn co http://192.168.1.110:3680/svn/svn-repo
#svn co svn://192.168.1.110:3690/svn/svn-repo
```


***
# 查看系统版本
```
cat /etc/redhat-release
```

***
# VNC
```
sudo yum install tigervnc-server
$ vncpasswd
123456
```
```
iptables -A INPUT -p tcp --dport 5901 -j ACCEPT #放行TCP 5901端口
iptables -A INPUT -p tcp --dport 5902 -j ACCEPT #放行TCP 5902端口
service iptables save # 保存规则
service iptables restart #重启规则
```

vim .vnc/xstartup
```
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
#ibus-daemon &
```

```
vncserver -kill :1
vncserver :1 -geometry 1920x1080
```


***
# 输入法用 ibus
```
sudo yum install ibus-libpinyin
```

***
# 升级rpm包软件
```
sudo rpm -Uvh ***.rpm
```

***
# 杂项
```
sudo yum install yum-axelget htop gnome-system-monitor gitk

sudo yum install xdg-user-dirs
xdg-user-dirs-update
```

***
# 修复grub引导
启动光盘/U盘进入抢救模式，实际上就是带挂载的chroot
```
grub2-install /dev/sdx
grub2-mkconfig -o /boot/grub/grub.cfg
```

***
# 浏览器
```
yum install httpd
sudo rpm -ivh opera-stable_70.0.3728.178_amd64.rpm

rpm --import https://rpm.opera.com/rpmrepo.key
rpm -qa gpg-pubkey*
rpm -qi gpg-pubkey-c105b9de-4e0fd3a3

sudo yum install opera-stable_60.0.3255.27_amd64.rpm
```


***
# v2ray
```
v2ray-linux-64.zip
go_mod.sh
```
```
sudo ./go_mod.sh
sudo systemctl enable v2ray
sudo systemctl start v2ray
sudo systemctl status v2ray
```
```
sudo vim /etc/v2ray/config.json
```
```
sudo yum install bzip2
```

***
# virtualbox
```
sudo rpm --import https://www.virtualbox.org/download/oracle_vbox.asc
wget https://download.virtualbox.org/virtualbox/6.1.14/VirtualBox-6.1-6.1.14_140239_el7-1.x86_64.rpm
sudo yum install VirtualBox-6.1-6.1.14_140239_el7-1.x86_64.rpm
```

<https://wiki.centos.org/HowTos/Virtualization/VirtualBox>
```
yum --enablerepo=epel install dkms
yum groupinstall "Development Tools"
yum install kernel-devel
usermod -a -G vboxusers username
```

```
sudo yum install cmake cmake-gui python3
```

```
sudo /sbin/vboxconfig
```


















































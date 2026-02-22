## 基本使用

```bash
# ... # cd path of Vagrantfile
vagrant up	      # 启动/创建虚拟机 (需在Vagrantfile目录下)
vagrant ssh       # 连接到虚拟机
cd /vagrant
```

## 更多备注

```bash
wsl --help
wsl --version # or -v
wsl --status
wsl --list # or -l

# ... # cd path of Vagrantfile
vgarant --help
vagrant up	      # 启动/创建虚拟机 (需在Vagrantfile目录下)
vagrant ssh       # 连接到虚拟机

vgarant box
vagrant box list  # 基础镜像
vagrant global-status # 查看所有 Vagrant 环境。不管你在哪个目录下，这个命令都能列出这台电脑上所有由 Vagrant 管理的虚拟机及其状态
```
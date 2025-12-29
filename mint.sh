### Linux Mint 22.x 설치 후 개인 설정 자동화 작업 ###
### 맥북으로 설하는 경우에는 bcmwl-kernel 소스 설치 및 fusuma 설치
### mint-sh 폴더에서 작업

#!/bin/bash
apt update
apt remove rhythmbox celluloid thunderbird -y
apt install clementine moc gparted boot-repair ssh vsftpd ranger tilda mpv -y
apt dist-upgrade -y

### bcmwl-kernel-source for intel macbook
#wget http://security.ubuntu.com/ubuntu/pool/restricted/b/broadcom-sta/bcmwl-kernel-source_6.30.223.271+bdcom-23ubuntu1.1_amd64.deb
#apt deb bcmwl-kernel-source_6.30.223.271+bdcom-23ubuntu1.1_amd64.deb
#apt install -f -y
#apt install bcmwl-kernel-source -y;apt install -f -y

### fusuma
#sudo gpasswd -a $USER input
#apt install libinput-tools ruby xdotool -y
#sudo gem install fusuma
#mkdir -p ~/.config/fusuma
#mv config.yml ~/.config/fusuma

### kime
wget https://github.com/Riey/kime/releases/download/v3.1.1/kime_ubuntu-22.04_v3.1.1_amd64.deb
apt deb kime_ubuntu-22.04_v3.1.1_amd64.deb
sudo mkdir /etc/xdg/kime
sudo mv config.yaml /etc/xdg/kime
im-config -n kime

### ssh & ftp & ranger setting
sudo mv sshd_config /etc/ssh
sudo mv vsftpd.conf /etc
sudo mv rc.conf /etc/ranger/config
sudo mv rifle.conf /lib/python3/dist-packages/ranger/config
sudo service ssh start
sudo service vsftpd start

### moc setting
mkdir -p ~/.moc
sh -c 'echo "Theme=/usr/share/moc/themes/transparent-background" >> ~/.moc/config'
sudo chmod 755 ~/.moc/config

### Affecting Linux Mint 22.x Cinnamon's Korean translation patch
sudo mv *.mo /usr/share/locale/ko/LC_MESSAGES/

### Delete files & reboot
rm *.*
apt autoremove --purge -y
apt autoclean clean -y
sudo reboot

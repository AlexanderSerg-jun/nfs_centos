yum install nfs-utils -y

systemctl enable firewalld --now
systemctl status firewalld
mkdir -p /mnt/srv_exchange

echo "192.168.50.10:/nfs/upload_srv/ /mnt/srv_exchange nfs vers=3,proto=udp,noauto,x-systemd.automount 0 0" >> /etc/fstab

systemctl daemon-reload
systemctl restart remote-fs.target

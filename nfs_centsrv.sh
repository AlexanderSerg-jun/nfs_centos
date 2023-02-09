#!/bin/bash

yum install nfs-utils -y

systemctl enable firewalld --now
systemctl status firewalld

firewall-cmd --add-service="nfs3" \
--add-service="rpc-bind" \
--add-service="mountd" \
--permanent
firewall-cmd --reload

systemctl enable nfs --now

mkdir -p /nfs/upload_srv
chown -R nfsnobody:nfsnobody /nfs/upload_srv
chmod 0777 /nfs/upload_srv

cat << EOF > /etc/exports
/nfs/upload_srv 192.168.50.11/32(rw,sync,root_squash)
EOF

exportfs -r

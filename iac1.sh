OX#!/bin/bash

echo "Creating dir..."
mkdir /public
mkdir /adm
mkdir /ven
mkdir /sec

echo "Creating groups..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Creating users..."

useradd carlos -m -c "Carlos" -s /bin/bash -p $(openssl passwd -crypt a1b2c3d4) -G GRP_ADM
useradd maria  -m  -c "Maria" -s /bin/bash -p $(openssl passwd -crypt pass123) -G GRP_ADM
useradd john -m -c "John" -s /bin/bash -p $(openssl passwd -crypt changeit12) -G GRP_ADM

useradd debora -m -c "Debora" -s /bin/bash -p $(openssl passwd -crypt plschange33) -G GRP_VEN
useradd sebastian -m -c "Sebastian" -s /bin/bash -p $(openssl passwd -crypt newpassword) -G GRP_VEN
useradd robert -m -c "Robert" -s /bin/bash  -p $(openssl passwd -crypt ichanged) -G GRP_VEN

useradd josefine -m -c "Josefine" -s /bin/bash -p $(openssl passwd -6 mypass) -G GRP_SEC
useradd usersec -m -c "Usersec" -s /bin/bash -p $(openssl passwd -6 what) -G GRP_SEC
useradd roger -m -c "Roger" -s /bin/bash -p $(openssl passwd -6 iforgot) -G GRP_SEC

echo "Creating dir permissions..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /public

echo "End..."


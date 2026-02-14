#!/bin/bash
set -e

# Si les variables existent, on configure le fichier odoo.conf
if [ -n "$HOST" ]; then
    echo "admin_passwd = admin" > /etc/odoo/odoo.conf
    echo "db_host = $HOST" >> /etc/odoo/odoo.conf
    echo "db_port = $PORT" >> /etc/odoo/odoo.conf
    echo "db_user = $USER" >> /etc/odoo/odoo.conf
    echo "db_password = $PASSWORD" >> /etc/odoo/odoo.conf
    echo "addons_path = /mnt/extra-addons" >> /etc/odoo/odoo.conf
fi

exec odoo "$@"

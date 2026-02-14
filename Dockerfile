FROM odoo:18.0
USER root
# On supprime la config par défaut qui contient le mot "db"
RUN rm -f /etc/odoo/odoo.conf
USER odoo

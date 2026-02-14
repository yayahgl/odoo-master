# Utiliser l'image officielle Odoo 18
FROM odoo:18.0

USER root

# Installer des outils utiles pour la migration
RUN apt-get update && apt-get install -y \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Copier une configuration personnalisée si besoin
# COPY ./odoo.conf /etc/odoo/odoo.conf

USER odoo

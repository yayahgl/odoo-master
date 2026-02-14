FROM odoo:18.0

USER root
RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*

USER odoo

# On annule l'ENTRYPOINT de l'image officielle
ENTRYPOINT []

# On définit NOTRE commande avec les variables Railway
CMD ["/bin/bash", "-c", "exec /usr/bin/python3 /usr/bin/odoo --db_host=${PGHOST} --db_port=${PGPORT} --db_user=${PGUSER} --db_password=${PGPASSWORD} --database=odoo_master --db_template=template0"]

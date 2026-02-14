FROM odoo:18.0

USER root
RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*

USER odoo

# On annule l'ENTRYPOINT de l'image officielle
ENTRYPOINT []

# On utilise les variables manuelles (HOST, PORT, USER, PASSWORD)
CMD ["/bin/bash", "-c", "exec /usr/bin/python3 /usr/bin/odoo --db_host=${HOST} --db_port=${PORT} --db_user=${USER} --db_password=${PASSWORD} --database=odoo_master --db_template=template0 --without-demo=all --init=base"]

FROM odoo:18.0

USER root
# On installe juste le client postgres au cas où
RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*

USER odoo

# On force l'ENTRYPOINT à vide
ENTRYPOINT []

# On lance Odoo avec TES variables manuelles, sans l'option template qui bloque
CMD ["/bin/bash", "-c", "exec /usr/bin/python3 /usr/bin/odoo --db_host=${HOST} --db_port=${PORT} --db_user=${USER} --db_password=${PASSWORD} --database=odoo_master --without-demo=all --init=base"]

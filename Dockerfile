FROM odoo:18.0

USER root
RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*

USER odoo
ENTRYPOINT []

# CORRECTIF : On force le port 5432 pour la BDD, car la variable $PORT de Railway est souvent 8080 (le port web)
CMD ["/bin/bash", "-c", "exec /usr/bin/python3 /usr/bin/odoo --db_host=${HOST} --db_port=5432 --db_user=${USER} --db_password=${PASSWORD} --database=odoo_master --without-demo=all --init=base"]

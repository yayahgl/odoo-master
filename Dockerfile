FROM odoo:18.0

USER root
# On installe le client postgres pour tester la connexion si besoin
RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*

USER odoo

# On annule l'ENTRYPOINT pour prendre le contrôle total
ENTRYPOINT []

# COMMANDE "SNIPER" : On met l'adresse et le mot de passe EN DUR.
# Plus aucune variable d'environnement capricieuse !
CMD ["/bin/bash", "-c", "exec /usr/bin/python3 /usr/bin/odoo --db_host=postgres.railway.internal --db_port=5432 --db_user=postgres --db_password=ERFLAGKKcFKOSlXkwiusIJSkMltsATWp --database=odoo_master --without-demo=all --init=base"]

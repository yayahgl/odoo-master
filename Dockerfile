FROM odoo:18.0

USER root
# On installe le client Postgres pour pouvoir créer le nouvel utilisateur
RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*

# On copie le script de démarrage
COPY start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh

# On ne touche pas à l'USER dans Dockerfile, on laisse le script gérer
ENTRYPOINT []

# On lance Odoo via notre script intelligent
CMD ["/usr/bin/start.sh"]

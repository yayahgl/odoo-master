FROM odoo:18.0

USER root

# On installe les outils
RUN apt-get update && apt-get install -y postgresql-client

# On copie notre script perso
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

USER odoo

# On force Odoo à utiliser notre script
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["odoo"]

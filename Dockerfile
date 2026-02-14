FROM odoo:18.0
USER root
RUN apt-get update && apt-get install -y postgresql-client
USER odoo

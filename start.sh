#!/bin/bash
set -e

# ==========================================
# FIX "SECURITY RISK" ODOO
# ==========================================
# Odoo refuse de se lancer avec l'user 'postgres'.
# On va donc créer un user 'odoo_railway' à la volée.

export PGPASSWORD=ERFLAGKKcFKOSlXkwiusIJSkMltsATWp
DB_HOST=postgres.railway.internal

echo "🔧 Connexion à Postgres pour créer l'utilisateur 'odoo_railway'..."

# On essaie de créer l'utilisateur. Si il existe déjà, la commande échoue mais le "|| true" permet de continuer.
psql -h $DB_HOST -U postgres -d railway -c "CREATE ROLE odoo_railway WITH LOGIN SUPERUSER CREATEDB CREATEROLE PASSWORD 'odoo_secure_pass';" || true

echo "✅ Utilisateur 'odoo_railway' prêt."

# ==========================================
# LANCEMENT DE ODOO
# ==========================================
echo "🚀 Démarrage de Odoo avec le nouvel utilisateur..."

exec /usr/bin/python3 /usr/bin/odoo \
    --db_host=$DB_HOST \
    --db_port=5432 \
    --db_user=odoo_railway \
    --db_password=odoo_secure_pass \
    --database=odoo_master \
    --without-demo=all \
    --init=base

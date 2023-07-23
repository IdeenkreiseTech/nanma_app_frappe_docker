# Restore Backup
site_name=hybrid.localhost
db_backup=20230723_000417-hybrid_localhost-database.sql.gz

cd ../
docker cp hybrid_90plus_scripts/backup/$db_backup $(docker compose ps -q backend):/tmp
docker compose exec backend bench --site $site_name restore /tmp/$db_backup --mariadb-root-password 123
docker compose exec backend bench --site $site_name migrate
docker compose restart backend

# Restore Backup
db_password=123
site_name=15.207.121.10
db_backup=20230922_000037-3_108_85_75-database.sql.gz

cd ../
sudo docker cp nanma_apps_scripts/backup/$db_backup $(sudo docker compose ps -q backend):/tmp
sudo docker compose exec backend bench --site $site_name restore /tmp/$db_backup --mariadb-root-password $db_password
sudo docker compose exec backend bench --site $site_name migrate
sudo docker compose restart backend

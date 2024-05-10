# Restore Backup
db_password=123
site_name=13.235.60.186

cd ../
sudo docker compose exec backend bench --site $site_name backup
sudo docker cp $(sudo docker compose ps -q backend):/home/frappe/frappe-bench/sites/$site_name/private/backups/ nanma_app_scripts/


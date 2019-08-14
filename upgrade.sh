echo "Upgrading ERP_ONE"
echo "----------------"
cd $(dirname $0)
echo -e "Getting Updating....."
#git pull
echo -e "Upgrading......"
dir=$(ls -l apps/ |awk '/^d/ {print $NF}')
for i in $dir
  do
    python manage.py makemigrations $i
  done
python manage.py migrate
python manage.py makemigrations rbac
python manage.py makemigrations cmdb
python manage.py makemigrations deployment
python manage.py migrate
python manage.py loaddata init_data/*.json
echo -e "completed! please remember to update your password."
